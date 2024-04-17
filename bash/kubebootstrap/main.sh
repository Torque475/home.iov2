#!/bin/bash

# This will setup Rancher server up on a VM in a single node k3s cluster
# 1. Install k3sup & helm
# 2. Use k3sup to create k3s on a server
# 3. Use the generated kubeconfig and helm to install Rancher


###############
## Variables ##
###############

# Json host files

# Preset install options 
rancher_hosts="rancher_hosts.json"
homelab_hosts="kube_hosts.json"
# Single master node, HA requires 3
rancher_servers=1
homelab_servers=1
# k config context names
rancher_context_name="rancher"
homelab_context_name="homelab"

# host file outside of my presets can be entered as first argument
unique_hosts_file=$1
unique_context_name=$2
unique_server_count=$3
unique_username=$4

# Standard variables 
config_path="~/.kube/config"
ssh_key_path="~/.ssh/torque"
user="torque"

# Rancher Server variables
cert_manager_version=v1.14.4
rancher_fqdn="rancher.homelab.lan"
rancher_password="HardcodedPasswords!"

###############
## Functions ##
###############

# Setup k3sup on the environment
# Remote hosts will need sudo with nopass setup
function k3sup_setup {
    echo "Installing k3sup"
    curl -sLS https://get.k3sup.dev | sh
    sudo install k3sup /usr/local/bin/
    k3sup --help
}

function helm_setup {
    echo "Installing helm"
    curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    sudo apt-get install apt-transport-https --yes
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
}

# Single generic function to install k3sup based on the arguments passed to it
function k3s_install {
    local hosts=$1
    local ssh_path=$2
    local context_name=$3
    local servers=$4
    local user=$5
    #Create the k3sup install script
    echo "Creating execution plan"
    k3sup plan \
        $hosts \
        --ssh-key $ssh_path \
        --context $context_name \
        --servers $servers \
        --user $user \
        > $hosts"_bootstrap.sh"
    
    #Run it to actually create the cluster
    chmod +x $hosts"_bootstrap.sh"
    ./$hosts"_bootstrap.sh"
    echo "Cluster setup"
    echo "Removing bootstrap script"
    rm $hosts"_bootstrap.sh" 

    #Merging kubeconfigs to primary
    export KUBECONFIG=~/.kube/config:$PWD/kubeconfig
    kubectl config view --merge --flatten > ~/.kube/merged_config
    mv ~/.kube/merged_config ~/.kube/config
    chmod 600 ~/.kube/config
    rm kubeconfig
}

function rancher_install {
    #Instructions sources from https://ranchermanager.docs.rancher.com/getting-started/installation-and-upgrade/install-upgrade-on-a-kubernetes-cluster#1-add-the-helm-chart-repository
    # 1 Add helm repo
    helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

    # 2 Create namespace
    kubectl config set-context $rancher_context_name
    kubectl create namespace cattle-system

    # 4 Install cert Manager
    # Add the Jetstack Helm repository
    helm repo add jetstack https://charts.jetstack.io

    # Update your local Helm chart repository cache
    helm repo update

    # Assumes cert-manager is not yet installed. Will fail if it is 
    # Install the cert-manager Helm chart
    echo "Installing cert-manager"
    helm install cert-manager jetstack/cert-manager \
        --namespace cert-manager \
        --create-namespace \
        --version $cert_manager_version \
        --set installCRDs=true


    # 5 Install Rancher with helm
    echo "Installing rancher"
    helm install rancher rancher-stable/rancher \
        --namespace cattle-system \
        # --set replicas -1 \
        --set hostname=$rancher_fqdn \
        --set bootstrapPassword=$rancher_password
    

    # 6 Wait for it to be deployed
    kubectl -n cattle-system rollout status deploy/rancher
}


### Need to configure menu
function show_menu {
    echo ""
    echo ""
    echo ""
    echo "Welcome to Torque's k3sup automation"
    echo "See the variables section to change any defaults"
    echo "Please choose an option:"
    echo "1) Install k3sup & Helm"
    echo "2) Create Rancher cluster"
    echo "3) Create homelab cluster"
    echo "4) User defined cluster - Requires appropriate host.json and context name"
    echo "5) Install Rancher server on rancher cluster"
    echo "9) Exit script"

    read -p "Enter choice [1-5, 9]: " choice
    case $choice in
        1)
          k3sup_setup
          helm_setup
          ;;
        2)
          #hosts = $1, ssh_path = $2, context_name = $3, server count = $4, user = $5
          k3s_install $rancher_hosts $ssh_key_path $rancher_context_name $rancher_servers $user
          ;;
        3)
          #hosts = $1, ssh_path = $2, context_name = $3, server count = $4 user = $5
          k3s_install $homelab_hosts $ssh_key_path $homelab_context_name $homelab_servers $user
          ;;
        4) 
          #hosts = $1, ssh_path = $2, context_name = $3, server count = $4 user = $5
          k3s_install $unique_hosts_file $ssh_key_path $unique_context_name $unique_server_count $unique_user
          ;;
        5)
          rancher_install
          ;;
        9)
          echo "Exiting..."
          exit 0
          ;;
        *)
          echo "Invalid option. Please try again."
          ;;
    esac
}

# Main loop
while true; do
    show_menu
done
