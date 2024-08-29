resource "harvester_virtualmachine" "rancher_server" {
  count = 1
  name = "rancher-server"
  namespace = "rancher"
  hostname = "rancher-server"

  description = "Ubuntu VM hosting the rancher server controller"
  tags = {
    ssh-user = "torque"
  }
  depends_on = [ harvester_image.images["ubuntu-22.04"], harvester_cloudinit_secret.rancher-server-cloud-config ]

  cpu = 2
  memory = "4Gi"

  #efi = true
  secure_boot = false
  run_strategy = "RerunOnFailure"
  restart_after_update = true

  network_interface {
    name = "eth0"
    #mac_address = "EE:4E:7C:E4:A6:62"
    type = "bridge"
    network_name = harvester_network.cluster-net-static.id
  }

  disk{
    name = "rootdisk"
    type = "disk"
    size = "10Gi"
    bus = "virtio"
    boot_order = 1

    image = harvester_image.images["ubuntu-22.04"].id
    auto_delete = true
  }

  disk{
    name = "extradisk"
    type = "disk"
    size = "40Gi"
    bus = "virtio"
    boot_order = 2
    auto_delete = true
  }

  ssh_keys = [
    harvester_ssh_key.homelab_ssh.id
  ]

  cloudinit {
    user_data = harvester_cloudinit_secret.rancher-server-cloud-config.user_data
    network_data = harvester_cloudinit_secret.rancher-server-cloud-config.network_data
  }
}

resource "harvester_cloudinit_secret" "rancher-server-cloud-config" {
  name = "rancher-server-network"
  namespace = "rancher"
  depends_on = [ harvester_ssh_key.homelab_ssh ]

  user_data = <<-EOF
    #Cloud Config
    #password: "$6$rounds=4096$w10iPTKZhGXGeKXt$3BvdXDU/VkqYUxGcDrJrvqKbvXS5R9sAaqtdGNBk5J4FQMLG6zg/DO.bjhlUV1bqzvUjpP.Ai4V5p/XgnszHZ/"
    ssh_pwauth: true
    package_update: true
    packages:
      - qemu-guest-agent
    runcmd:
      - - systemctl
        - enable
        - '--now'
        - qemu-guest-agent
    users:
    - name: torque
      groups: [ sudo ]
      lock_passwd: false
      password: "$6$rounds=4096$w10iPTKZhGXGeKXt$3BvdXDU/VkqYUxGcDrJrvqKbvXS5R9sAaqtdGNBk5J4FQMLG6zg/DO.bjhlUV1bqzvUjpP.Ai4V5p/XgnszHZ/"
    ssh_authorized_keys:
      - "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCfWUBUugEKe8wcxCmzQocJL9l6T0y+e5sR1jt4LJENXIiZVPO79D7y8fc2w3X+AAxJePJVDDaaghbIoTL2q4EiX72wkuLdAnfCpMPFB7tUm2zupSq3169pPzeFCtgOrqqr6Stu2Ukj+yvnS/LiHDExoUDPBLRGYOs9POZDPcNH+Lj9z4fLSu/hl3mD0NSLm1ie7z2bMCsbKy9pqc7Tltizs1G9IMu049p/2GYNxEBeohExGjVcCjWdjZsVBUV1/D72dVLKZ3A6W4OkqZjbtff9wkmrlX9yqSpnHZQelrLmknX9WjfZs8sScF3TdOm+gaEepeVfvgN0OzDKnwRt5blX34TagvWc401PJRLYtmOLgz2QbHpLWxvo7eQlBPe4Q/RyzQgZp5e3J1V6GLazTPPnGtJdGnp/z5eygz0O5SdrjlJUgo2w2xv9b8NUvDP3rYouDQEIIkTw0Uy4G87eGMPFRZ4oSX0eTWABXDOLAJ4G5uJn5oxI3YeYSM13+pSkYZPEk13ZxCOiJ1rnixhJW+I8GpUHq3Pd6gFZ9e3ulnB4JylADCxVYRC17ZjyjtGIQKOAtsosA1YkGo7Jn3aIFUceq9uGdEz9srHY5FRRCuy6Fly1oeB8zfKDXTHZQvqNgzQv21TjPEcBRNCCRK4prPPmSaDZnM8QrbX4bx1GFTEEQ== homelab"
    EOF

  network_data = <<-EOF
    #Network Config
    network:
      version: 2
      ethernets:
        eth0:
          match: {name: "enp*"}
          addresses:
            - 10.1.5.12/24
          nameservers: 
            addresses: [10.1.5.1, 8.8.8.8, 1.1.1.1]
          routes:
            - to: 0.0.0.0/0
              via: 10.1.5.1
    EOF

}