#global vars
nameserver    = "10.1.2.1"
gateway       = "10.1.2.1"
searchdomain  = "home.io"
vm_template   = "ubuntu-server-22.04-template"
target_node   = "nodebox"
storage       = "VM-SSD-1"
#username      = "torque"
ssh_public_keys= "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYjmlSd0iE+QyWQReb0kZk2C4s/682CpuT1PNDBP9+YQ8nmTSXrPvse4uptpORNXRdQZC4JK7Xi2WQVzur5dVMxRDgr0RoBv6CuskhIIfe0iKnNk7coldcVPGY+Ff7vJX86c2rzzaq7+C3uRO+TDiWSJ/7DtdTeyV7pHOcoYs49aa/d6vS6uN6i5RW+3X+CmE4t5Mnm4ZCFv1KwsMC0PVjH4FIVmynU7qZ7a2LaTEgiNFgtOlLk2Ccnbu+n2OOHkUysvZR4SejzOAsuckFFMH06c6OIqEa5YKlTQlqqGIJGndeh4+jiS2N1TEWa3ZylJk2kbKCriSgiwOzfeC5or9AlS19w1hmX8a3RG2twdJfovfQUcnxcQ+E3kM2hbGAC2QvqONnI/6mrjT6UK7FM2afFY7wQKQmE6Wi0J6Yb71ue0hzz6ggVHtANFMkXH15bTboScjSQgrTvqRwhSKajV1/Gla51+le8KsjBmq05lG6L0cHtt9acm9qCkyIWpRBhuX1kWlf0V9vEsHcDBZ5sVlWvXMyTTWm2GHJAV5SpRJdRNwRi3ScffMUDLrx8HSAMKnaCp+ejcEsUbIWIQaOQLduGiaVQ+Npt4NkO0l1uvwjPPGKlCEcQOygjhOMVxlKECdU+MsApi/by5p8f0K+6PFkTFGNqKidDK6fmhI97FYVwQ=="
# Use to create privileged containers
# pm_user = "root@pam"


#To create VM's, Agent must be 0. To destroy them, agent must be 1: Github Issue #922
agent         = 0

nimbus_nodes = {
  #"pm-flux-nimbus-0" = {
  #  hostname    = "pm-flux-nimbus-0"
  #  vmid        = "120"
  #  ip_address  = "10.0.20.20"
  #  storage     = "VM-SSD-1"
  #  macaddr     = "56:C4:11:75:6A:32"
  #  vm_template = "ubuntu-server-20.04-template"
  #},
  #"pm-flux-nimbus-1" = {
  #  hostname    = "pm-flux-nimbus-1"
  #  vmid        = "121"
  #  ip_address  = "10.0.20.21"
  #  storage     = "VM-SSD-2"
  #  macaddr     = "56:C4:11:75:6A:33"
  #  vm_template = "ubuntu-server-20.04-template"
  #},
  #"pm-flux-nimbus-2" = {
  #  hostname    = "pm-flux-nimbus-2"
  #  vmid        = "122"
  #  ip_address  = "10.0.20.22"
  #  storage     = "VM-SSD-0"
  #  macaddr     = "56:C4:11:75:6A:34"
  #  vm_template = "ubuntu-server-22.04-template"
  #},
}
cumulus_nodes = {
  "josh-cumulus-1" = {
    hostname   = "josh-cumulus-1"
    vmid       = "121"
    ip_address = "10.1.2.21"
    storage    = "VM-SSD-1"
    username   = "josh"
    macaddr    = "56:C4:11:75:6B:11"
    vm_template = "ubuntu-server-22.04-template"
  },
  "josh-cumulus-2" = {
    hostname   = "josh-cumulus-2"
    vmid       = "122"
    ip_address = "10.1.2.22"
    storage    = "VM-SSD-1"
    username   = "josh"
    macaddr    = "56:C4:11:75:6B:12"
    vm_template = "ubuntu-server-22.04-template"
  },
  "josh-cumulus-3" = {
    hostname   = "josh-cumulus-3"
    vmid       = "123"
    ip_address = "10.1.2.23"
    storage    = "VM-SSD-1"
    username   = "josh"
    macaddr    = "56:C4:11:75:6B:13"
    vm_template = "ubuntu-server-22.04-template"
  },
  "josh-cumulus-4" = {
    hostname   = "josh-cumulus-4"
    vmid       = "124"
    ip_address = "10.1.2.24"
    storage    = "VM-SSD-1"
    username   = "josh"
    macaddr    = "56:C4:11:75:6B:14"
    vm_template = "ubuntu-server-22.04-template"
  },
  "torque-cumulus-1" = {
    hostname   = "torque-cumulus-1"
    vmid       = "125"
    ip_address = "10.1.2.25"
    storage    = "VM-SSD-1"
    username   = "torque"
    macaddr    = "56:C4:11:75:6B:15"
    vm_template = "ubuntu-server-22.04-template"
  },
  "torque-cumulus-2" = {
    hostname   = "torque-cumulus-2"
    vmid       = "126"
    ip_address = "10.1.2.26"
    storage    = "VM-SSD-1"
    username   = "torque"
    macaddr    = "56:C4:11:75:6B:16"
    vm_template = "ubuntu-server-22.04-template"
  },
  "torque-cumulus-3" = {
    hostname   = "torque-cumulus-3"
    vmid       = "127"
    ip_address = "10.1.2.27"
    storage    = "VM-SSD-1"
    username   = "torque"
    macaddr    = "56:C4:11:75:6B:17"
    vm_template = "ubuntu-server-22.04-template"
  },
  "torque-cumulus-4" = {
    hostname   = "torque-cumulus-4"
    vmid       = "128"
    ip_address = "10.1.2.28"
    storage    = "VM-SSD-1"
    username   = "torque"
    macaddr    = "56:C4:11:75:6B:18"
    vm_template = "ubuntu-server-22.04-template"
  }
}