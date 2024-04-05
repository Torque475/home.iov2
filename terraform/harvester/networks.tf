#Prexisting mgmt cluster network
data "harvester_clusternetwork" "mgmt" {
    name = "mgmt"
}

# Will add additional Cluster networks once new NIC is installed 


#Will add additional Networks as needed
#Will need to create more VLANs and do more configuration on router side first.
resource "harvester_network" "cluster-net-static" {
    cluster_network_name = data.harvester_clusternetwork.mgmt.name
    name = "cluster-net-static"
    namespace = "default"
    vlan_id = 1

    route_mode = "manual"
    route_cidr = "10.1.5.1/24"
    route_gateway = "10.1.5.1"
}

resource "harvester_network" "cluster-net-dhcp" {
    cluster_network_name = data.harvester_clusternetwork.mgmt.name
    name = "cluster-net-dhcp"
    namespace = "default"
    vlan_id = 1

    route_mode = "auto"
    route_dhcp_server_ip = "10.1.5.1"
}
