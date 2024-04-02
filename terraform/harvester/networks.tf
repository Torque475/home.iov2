#Prexisting mgmt cluster network
data "harvester_clusternetwork" "mgmt" {
    name = mgmt
}

# Will add additional Cluster networks once new NIC is installed 

data "harvester_network" "homelab-network" {
    name = "homelab-network"
    namespace = homelab
}

# Will add additional Networks as needed
# Will need to create more VLANs and do more configuration on router side first.
# resource "harvester_network" "cluster-net" {
#     name = "cluster-net"
#     namespace = ""
# }

