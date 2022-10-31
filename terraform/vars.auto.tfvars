#global vars
nameserver  = "1.1.1.1 8.8.8.8"
gateway     = "192.168.1.1"
vm_template = "ubuntu-server-20.04-template"
target_node = "proxmox"

nimbus_nodes = {
  "pm-flux-nimbus-0" = {
    hostname   = "pm-flux-nimbus-0"
    vmid       = "120"
    ip_address = "192.168.1.20"
    storage    = "VM-SSD-0"
    macaddr    = "56:C4:11:75:6A:32"
  },
}

pihole = {
  # "pihole-primary" = {
  #   hostname     = "pihole-primary"
  #   vmid         = "105"
  #   ip_address   = "10.0.0.5"
  #   storage      = "VM-SSD"
  #   macaddr      = "66:2A:D1:74:0A:F2"
  # },
  # "pihole-secondary" = {
  #   hostname     = "pihole-secondary"
  #   vmid         = "106"
  #   ip_address   = "10.0.0.6"
  #   storage      = "VM-SSD"
  #   macaddr      = "EA:D8:C9:FD:FA:AD"
  # }
}

container-host = {
  # "container-host" = {
  #   hostname     = "container-host"
  #   vmid         = "107"
  #   ip_address   = "10.0.0.7"
  #   storage      = "VM-SSD"
  #   macaddr      = "06:74:60:C0:37:F6"
  # }
}

vpn-host = {
  "vpn-host" = {
    hostname   = "vpn-host"
    vmid       = "118"
    ip_address = "192.168.1.18"
    storage    = "VM-SSD-0"
  }
}


casaOS = {
  # "casaOS" = {
  #   hostname    = "casaOS"
  #   vmid        = "119"
  #   ip_address  = "192.168.1.19"
  #   storage     = "VM-SSD-0"
  #   macaddr     = "06:77:60:C0:37:F9"
  #   vm_template = "ubuntu-server-22.04-template"
  # }
}
