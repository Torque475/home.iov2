#             ▄▄                                                       ▄▄
# ▀███▀▀▀███▀███                          ▀███▄   ▀███▀              ▀███
#   ██    ▀█  ██                            ███▄    █                  ██
#   ██   █    ██ ▀███  ▀███ ▀██▀   ▀██▀     █ ███   █   ▄██▀██▄   ▄█▀▀███   ▄▄█▀██ ▄██▀███
#   ██▀▀██    ██   ██    ██   ▀██ ▄█▀       █  ▀██▄ █  ██▀   ▀██▄██    ██  ▄█▀   ████   ▀▀
#   ██   █    ██   ██    ██     ███         █   ▀██▄█  ██     █████    ██  ██▀▀▀▀▀▀▀█████▄
#   ██        ██   ██    ██   ▄█▀ ██▄       █     ███  ██▄   ▄██▀██    ██  ██▄    ▄█▄   ██
# ▄████▄    ▄████▄ ▀████▀███▄██▄   ▄██▄   ▄███▄    ██   ▀█████▀  ▀████▀███▄ ▀█████▀██████▀

module "flux_cumulus" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.cumulus_nodes
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
#  searchdomain    = var.searchdomain
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = each.value.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.flux_cumulus_requirements.cpu_cores
  memory          = var.flux_cumulus_requirements.memory
  hdd_size        = var.flux_cumulus_requirements.hdd_size
  mbps_rd         = var.flux_cumulus_requirements.mbps_rd
  mbps_rd_max     = var.flux_cumulus_requirements.mbps_rd_max
  mbps_wr         = var.flux_cumulus_requirements.mbps_wr
  mbps_wr_max     = var.flux_cumulus_requirements.mbps_wr_max
  rate            = var.flux_cumulus_requirements.rate
}
module "flux_cumulus_test" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.cumulus_nodes_test
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.flux_cumulus_requirements.cpu_cores
  memory          = var.flux_cumulus_requirements.memory
  hdd_size        = var.flux_cumulus_requirements.hdd_size
  mbps_rd         = var.flux_cumulus_requirements.mbps_rd
  mbps_rd_max     = var.flux_cumulus_requirements.mbps_rd_max
  mbps_wr         = var.flux_cumulus_requirements.mbps_wr
  mbps_wr_max     = var.flux_cumulus_requirements.mbps_wr_max
  rate            = var.flux_cumulus_requirements.rate
}
module "flux_nimbus" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.nimbus_nodes
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.flux_nimbus_requirements.cpu_cores
  memory          = var.flux_nimbus_requirements.memory
  hdd_size        = var.flux_nimbus_requirements.hdd_size
  mbps_rd         = var.flux_nimbus_requirements.mbps_rd
  mbps_rd_max     = var.flux_nimbus_requirements.mbps_rd_max
  mbps_wr         = var.flux_nimbus_requirements.mbps_wr
  mbps_wr_max     = var.flux_nimbus_requirements.mbps_wr_max
  rate            = var.flux_nimbus_requirements.rate
}
module "flux_stratus" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.stratus_nodes
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
  cpu_cores       = var.flux_stratus_requirements.cpu_cores
  memory          = var.flux_stratus_requirements.memory
  hdd_size        = var.flux_stratus_requirements.hdd_size
  mbps_rd         = var.flux_stratus_requirements.mbps_rd
  mbps_rd_max     = var.flux_stratus_requirements.mbps_rd_max
  mbps_wr         = var.flux_stratus_requirements.mbps_wr
  mbps_wr_max     = var.flux_stratus_requirements.mbps_wr_max
  rate            = var.flux_stratus_requirements.rate
  
}

#             ▄▄                                  ▄▄
# ▀███▀▀▀██▄  ██        ▀████▀  ▀████▀▀         ▀███
#   ██   ▀██▄             ██      ██              ██
#   ██   ▄██▀███          ██      ██    ▄██▀██▄   ██   ▄▄█▀██
#   ███████   ██          ██████████   ██▀   ▀██  ██  ▄█▀   ██
#   ██        ██   █████  ██      ██   ██     ██  ██  ██▀▀▀▀▀▀
#   ██        ██          ██      ██   ██▄   ▄██  ██  ██▄    ▄
# ▄████▄    ▄████▄      ▄████▄  ▄████▄▄ ▀█████▀ ▄████▄ ▀█████▀

module "pihole" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.pihole
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = var.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

#                                               ▄▄
#   ▄▄█▀▀▀█▄█                     ██            ██                                   ▀████▀  ▀████▀▀                 ██
# ▄██▀     ▀█                     ██                                                   ██      ██                    ██
# ██▀       ▀ ▄██▀██▄▀████████▄ ██████ ▄█▀██▄ ▀███ ▀████████▄   ▄▄█▀██▀███▄███         ██      ██    ▄██▀██▄ ▄██▀████████
# ██         ██▀   ▀██ ██    ██   ██  ██   ██   ██   ██    ██  ▄█▀   ██ ██▀ ▀▀         ██████████   ██▀   ▀████   ▀▀ ██
# ██▄        ██     ██ ██    ██   ██   ▄█████   ██   ██    ██  ██▀▀▀▀▀▀ ██      █████  ██      ██   ██     ██▀█████▄ ██
# ▀██▄     ▄▀██▄   ▄██ ██    ██   ██  ██   ██   ██   ██    ██  ██▄    ▄ ██             ██      ██   ██▄   ▄███▄   ██ ██
#   ▀▀█████▀  ▀█████▀▄████  ████▄ ▀████████▀██▄████▄████  ████▄ ▀█████▀████▄         ▄████▄  ▄████▄▄ ▀█████▀ ██████▀ ▀████

module "container-host" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.container-host
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  vm_template     = each.value.vm_template
  macaddr         = try(each.value.macaddr, "0")
  target_node     = var.target_node
  storage         = var.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

module "vpn-host" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.vpn-host
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}


module "casaOS" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.casaOS
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template != null ? each.value.vm_template : var.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

 # ▄▄▄▄▄▄            █                             ▄     ▄               █               ▄             ▄      ▀
 # █       ▄▄▄    ▄▄▄█   ▄▄▄    ▄ ▄▄   ▄▄▄         █  █  █  ▄▄▄    ▄ ▄▄  █   ▄   ▄▄▄   ▄▄█▄▄   ▄▄▄   ▄▄█▄▄  ▄▄▄     ▄▄▄   ▄ ▄▄
 # █▄▄▄▄▄ █▀  █  █▀ ▀█  █▀ ▀█   █▀  ▀ ▀   █        ▀ █▀█ █ █▀ ▀█   █▀  ▀ █ ▄▀   █   ▀    █    ▀   █    █      █    █▀ ▀█  █▀  █
 # █      █▀▀▀▀  █   █  █   █   █     ▄▀▀▀█         ██ ██▀ █   █   █     █▀█     ▀▀▀▄    █    ▄▀▀▀█    █      █    █   █  █   █
 # █      ▀█▄▄▀  ▀█▄██  ▀█▄█▀   █     ▀▄▄▀█         █   █  ▀█▄█▀   █     █  ▀▄  ▀▄▄▄▀    ▀▄▄  ▀▄▄▀█    ▀▄▄  ▄▄█▄▄  ▀█▄█▀  █   █

module "fedora_workstation" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.fedora_workstation
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = "fedora-workstation-37-template"
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

# ▄     ▄                      █             ▄    ▄
# █  █  █  ▄▄▄   ▄▄▄▄▄  ▄   ▄  █ ▄▄          ██  ██  ▄▄▄   ▄ ▄▄    ▄▄▄    ▄▄▄▄   ▄▄▄    ▄ ▄▄
# ▀ █▀█ █ ▀   █     ▄▀  █   █  █▀  █         █ ██ █ ▀   █  █▀  █  ▀   █  █▀ ▀█  █▀  █   █▀  ▀
#  ██ ██▀ ▄▀▀▀█   ▄▀    █   █  █   █         █ ▀▀ █ ▄▀▀▀█  █   █  ▄▀▀▀█  █   █  █▀▀▀▀   █
#  █   █  ▀▄▄▀█  █▄▄▄▄  ▀▄▄▀█  █   █         █    █ ▀▄▄▀█  █   █  ▀▄▄▀█  ▀█▄▀█  ▀█▄▄▀   █
#                                                                         ▄  █
#                                                                          ▀▀

module "wazuh_manager" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.wazuh_manager
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = var.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}
# ░█░█░█░█░█▀▄░█▀▀░█▀▄░█▀█░█▀▀░▀█▀░█▀▀░█▀▀░░░█▄█░█▀█░█▀▀░▀█▀░█▀▀░█▀▄
# ░█▀▄░█░█░█▀▄░█▀▀░█▀▄░█░█░█▀▀░░█░░█▀▀░▀▀█░░░█░█░█▀█░▀▀█░░█░░█▀▀░█▀▄
# ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀░▀
module "k8s_master" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.k8s_master
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

# ░█░█░█░█░█▀▄░█▀▀░█▀▄░█▀█░█▀▀░▀█▀░█▀▀░█▀▀░░░█▀█░█▀█░█▀▄░█▀▀
# ░█▀▄░█░█░█▀▄░█▀▀░█▀▄░█░█░█▀▀░░█░░█▀▀░▀▀█░░░█░█░█░█░█░█░█▀▀
# ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀
module "k8s_node" {
  source          = "../proxmox/modules/proxmox_vm"
  for_each        = var.k8s_nodes
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  vm_template     = each.value.vm_template
  target_node     = var.target_node
  storage         = each.value.storage
  memory          = each.value.memory
  username        = var.username
  agent           = var.agent
  ssh_public_keys = var.ssh_public_keys
}

#
# Container Time!
# FileShare Container
module "fileserver" {
  source          = "../proxmox/modules/proxmox_lxc"
  for_each        = var.fileserver
  hostname        = each.value.hostname
  vmid            = each.value.vmid
  nameserver      = var.nameserver
  ip_address      = "${each.value.ip_address}"
  gateway         = var.gateway
  macaddr         = try(each.value.macaddr, "0")
  os_template     = each.value.os_template
  target_node     = var.target_node
  cpu_cores       = each.value.cpu_cores
  storage         = each.value.storage
  memory          = each.value.memory
  swap            = each.value.swap
  ssh_public_keys = var.ssh_public_keys
  unprivileged    = each.value.unprivileged

  # Mountpoint is dynamic for 0-many extra mounts
  # all the work is done in the tfvars file
  mountpoints     = try(each.value.mountpoints, {})
}
