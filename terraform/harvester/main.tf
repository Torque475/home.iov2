resource "harvester_virtualmachine" "rancher_server" {
  
  name = "rancher-server"
  namespace = "rancher"
  hostname = "rancher-server"

  description = "Ubuntu VM hosting the rancher server controller"
  tags = {
    ssh-user = "torque"
  }

  cpu = 4
  memory = "8Gi"

  efi = torque
  secure_boot = false
  runstratagy = "RerunOnFailure"
  restart_after_update = true

  network_interface {
    name = "nic-1"
    mac_address = "4b:b6:21:34:e4:5d"
  }

  disk{
    name = "cdrom-disk"
    type = "cd-rom"
    size = "5Gi"
    bus = "sata"
    boot_order = 2

    image = harvester_image.images["ubuntu-22.04"].id
    auto_delete = true
  }

  disk{
    name = "rootdisk"
    type = "disk"
    size = "40Gi"
    bus = "virtio"
    boot_order = 1
    auto_delete = true
  }

  ssh_keys = [
    harvester_ssh_key.torque_ssh.id
  ]


}


resource "harvester_ssh_key" "torque_ssh" {
  name = "torque-sshkey"
  namespace = "default" 

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYjmlSd0iE+QyWQReb0kZk2C4s/682CpuT1PNDBP9+YQ8nmTSXrPvse4uptpORNXRdQZC4JK7Xi2WQVzur5dVMxRDgr0RoBv6CuskhIIfe0iKnNk7coldcVPGY+Ff7vJX86c2rzzaq7+C3uRO+TDiWSJ/7DtdTeyV7pHOcoYs49aa/d6vS6uN6i5RW+3X+CmE4t5Mnm4ZCFv1KwsMC0PVjH4FIVmynU7qZ7a2LaTEgiNFgtOlLk2Ccnbu+n2OOHkUysvZR4SejzOAsuckFFMH06c6OIqEa5YKlTQlqqGIJGndeh4+jiS2N1TEWa3ZylJk2kbKCriSgiwOzfeC5or9AlS19w1hmX8a3RG2twdJfovfQUcnxcQ+E3kM2hbGAC2QvqONnI/6mrjT6UK7FM2afFY7wQKQmE6Wi0J6Yb71ue0hzz6ggVHtANFMkXH15bTboScjSQgrTvqRwhSKajV1/Gla51+le8KsjBmq05lG6L0cHtt9acm9qCkyIWpRBhuX1kWlf0V9vEsHcDBZ5sVlWvXMyTTWm2GHJAV5SpRJdRNwRi3ScffMUDLrx8HSAMKnaCp+ejcEsUbIWIQaOQLduGiaVQ+Npt4NkO0l1uvwjPPGKlCEcQOygjhOMVxlKECdU+MsApi/by5p8f0K+6PFkTFGNqKidDK6fmhI97FYVwQ=="
}