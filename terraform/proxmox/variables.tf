variable "cumulus_nodes" {
  description = "The number of Cumulus nodes to create and their values"
  type        = map(any)
  default     = {}
}

variable "cumulus_nodes_test" {
  description = "The number of Cumulus nodes to create and their values"
  type        = map(any)
  default     = {}
}

variable "nimbus_nodes" {
  description = "The number of Nimbus nodes to create and their values"
  type        = map(any)
  default     = {}
}

variable "stratus_nodes" {
  description = "The number of Stratus nodes to create and their values"
  type        = map(any)
  default     = {}
}

variable "rancher" {
  description = "Map of rancher server nodes"
  type        = map(any)
  default     = {}
}

variable "k8s_master" {
  description = "Map of k8s master nodes"
  type        = map(any)
  default     = {}
}

variable "k8s_nodes" {
  description = "Map of k8s worker nodes"
  type        = map(any)
  default     = {}
}

variable "fedora_workstation" {
  description = "The number of Fedora Workstations create and their values"
  type        = map(any)
  default     = {}
}

variable "wazuh_manager" {
  description = "The number of wazuh manager VMs to create and their values"
  type        = map(any)
  default     = {}
}

variable "pihole" {
  description = "Provide base pihole config"
  type        = map(any)
  default     = {}
}

variable "container-host" {
  description = "Provide base container-host config"
  type        = map(any)
  default     = {}
}

variable "vpn-host" {
  description = "Provide base vpn-host config"
  type        = map(any)
  default     = {}
}

variable "casaOS" {
  description = "Provide base casaOS config"
  type        = map(any)
  default     = {}
}

variable "fileserver" {
  description = "Set of LXC containers for fileserver"
  type        = map(any)
  default     = {}
}

variable "gateway" {
  description = "Gateway of the node."
  type        = string
}

variable "nameserver" {
  description = "Nameserver of the node."
  type        = string
}

variable "vlan_tag" {
  description = "VLAN tag of the node."
  type        = number
  default     = -1
}

variable "net_model" {
  description = "Network model of the node."
  type        = string
  default     = "virtio"
}

variable "net_bridge" {
  description = "Network bridge of the node."
  type        = string
  default     = "vmbr0"
}

variable "target_node" {
  description = "Target ProxMox node to host the node."
  type        = string
  default     = "pve"
}

variable "cpu_cores" {
  description = "Number of CPU cores of the node."
  type        = number
  default     = 2
}

variable "cpu_sockets" {
  description = "Number of CPU sockets of the node."
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory of the node."
  type        = number
  default     = 7200
}

variable "hdd_type" {
  description = "Type of the HDD of the node."
  type        = string
  default     = "scsi"
}

variable "storage" {
  description = "Storage of the node."
  type        = string
  default     = "local-lvm"
}

variable "scsihw" {
  description = "SCSI hardware of the node."
  type        = string
  default     = "virtio-scsi-pci"
}

variable "bootdisk" {
  description = "Boot disk of the node."
  type        = string
  default     = "scsi0"
}

variable "vm_template" {
  description = "Template to clone for the node."
  type        = string
  default     = "ubuntu-server-20.04-template"
}

variable "username" {
  description = "Username of the node"
  type        = string
  default     = "torque"
}

variable "searchdomain" {
  description = "Search domain of the node"  
  type        = string
  default     = "home.io"
}

variable "agent" {
  description = "QEMU UserAgent for Proxmox"
  type        = number
  default     = 0
}

variable "ssh_public_keys" {
  description = "Default Public SSH key for access"
  type        = string
  #Torque's pub ssh key
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYjmlSd0iE+QyWQReb0kZk2C4s/682CpuT1PNDBP9+YQ8nmTSXrPvse4uptpORNXRdQZC4JK7Xi2WQVzur5dVMxRDgr0RoBv6CuskhIIfe0iKnNk7coldcVPGY+Ff7vJX86c2rzzaq7+C3uRO+TDiWSJ/7DtdTeyV7pHOcoYs49aa/d6vS6uN6i5RW+3X+CmE4t5Mnm4ZCFv1KwsMC0PVjH4FIVmynU7qZ7a2LaTEgiNFgtOlLk2Ccnbu+n2OOHkUysvZR4SejzOAsuckFFMH06c6OIqEa5YKlTQlqqGIJGndeh4+jiS2N1TEWa3ZylJk2kbKCriSgiwOzfeC5or9AlS19w1hmX8a3RG2twdJfovfQUcnxcQ+E3kM2hbGAC2QvqONnI/6mrjT6UK7FM2afFY7wQKQmE6Wi0J6Yb71ue0hzz6ggVHtANFMkXH15bTboScjSQgrTvqRwhSKajV1/Gla51+le8KsjBmq05lG6L0cHtt9acm9qCkyIWpRBhuX1kWlf0V9vEsHcDBZ5sVlWvXMyTTWm2GHJAV5SpRJdRNwRi3ScffMUDLrx8HSAMKnaCp+ejcEsUbIWIQaOQLduGiaVQ+Npt4NkO0l1uvwjPPGKlCEcQOygjhOMVxlKECdU+MsApi/by5p8f0K+6PFkTFGNqKidDK6fmhI97FYVwQ=="
}

variable "qemu_os" {
  description = "OS of the k8s node."
  type        = string
  default     = "ubuntu"
}

variable "flux_cumulus_requirements" {
  description   = "Requirements for flux Cumulus node"
  type          = object({
    cpu_cores   = number
    memory      = number
    hdd_size    = number
    mbps_rd     = number
    mbps_rd_max = number
    mbps_wr     = number
    mbps_wr_max = number
    rate        = number
  })
  default = {
    cpu_cores   = 2
    memory      = 7400
    hdd_size    = 230
    mbps_rd     = 180
    mbps_rd_max = 185
    mbps_wr     = 180
    mbps_wr_max = 185
    rate        = 3
  }
}

variable "flux_nimbus_requirements" {
  description   = "Requirements for a flux Nimbus Node"
  type          = object({
    cpu_cores   = number
    memory      = number
    hdd_size    = number
    mbps_rd     = number
    mbps_rd_max = number
    mbps_wr     = number
    mbps_wr_max = number
    rate        = number
  })
  default = {
    cpu_cores   = 4
    memory      = 32000
    hdd_size    = 450
    mbps_rd     = 0
    mbps_rd_max = 0
    mbps_wr     = 0
    mbps_wr_max = 0
    rate        = 6
  }
}

variable "flux_stratus_requirements" {
  description   = "Requirements for a flux Nimbus Node"
  type          = object({
    cpu_cores   = number
    memory      = number
    hdd_size    = number
    mbps_rd     = number
    mbps_rd_max = number
    mbps_wr     = number
    mbps_wr_max = number
    rate        = number
  })
  default = {
    cpu_cores   = 8
    memory      = 64000
    hdd_size    = 890
    mbps_rd     = 400
    mbps_rd_max = 410
    mbps_wr     = 400
    mbps_wr_max = 410
    rate        = 14
  }
}

