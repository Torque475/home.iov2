resource "harvester_ssh_key" "torque_ssh" {
  name = "torque-sshkey"
  namespace = "harvester-vms" 

  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDYjmlSd0iE+QyWQReb0kZk2C4s/682CpuT1PNDBP9+YQ8nmTSXrPvse4uptpORNXRdQZC4JK7Xi2WQVzur5dVMxRDgr0RoBv6CuskhIIfe0iKnNk7coldcVPGY+Ff7vJX86c2rzzaq7+C3uRO+TDiWSJ/7DtdTeyV7pHOcoYs49aa/d6vS6uN6i5RW+3X+CmE4t5Mnm4ZCFv1KwsMC0PVjH4FIVmynU7qZ7a2LaTEgiNFgtOlLk2Ccnbu+n2OOHkUysvZR4SejzOAsuckFFMH06c6OIqEa5YKlTQlqqGIJGndeh4+jiS2N1TEWa3ZylJk2kbKCriSgiwOzfeC5or9AlS19w1hmX8a3RG2twdJfovfQUcnxcQ+E3kM2hbGAC2QvqONnI/6mrjT6UK7FM2afFY7wQKQmE6Wi0J6Yb71ue0hzz6ggVHtANFMkXH15bTboScjSQgrTvqRwhSKajV1/Gla51+le8KsjBmq05lG6L0cHtt9acm9qCkyIWpRBhuX1kWlf0V9vEsHcDBZ5sVlWvXMyTTWm2GHJAV5SpRJdRNwRi3ScffMUDLrx8HSAMKnaCp+ejcEsUbIWIQaOQLduGiaVQ+Npt4NkO0l1uvwjPPGKlCEcQOygjhOMVxlKECdU+MsApi/by5p8f0K+6PFkTFGNqKidDK6fmhI97FYVwQ=="
}

resource "harvester_ssh_key" "homelab_ssh" {
    name = "homelab-sshkey"
    namespace = "default"

    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCfWUBUugEKe8wcxCmzQocJL9l6T0y+e5sR1jt4LJENXIiZVPO79D7y8fc2w3X+AAxJePJVDDaaghbIoTL2q4EiX72wkuLdAnfCpMPFB7tUm2zupSq3169pPzeFCtgOrqqr6Stu2Ukj+yvnS/LiHDExoUDPBLRGYOs9POZDPcNH+Lj9z4fLSu/hl3mD0NSLm1ie7z2bMCsbKy9pqc7Tltizs1G9IMu049p/2GYNxEBeohExGjVcCjWdjZsVBUV1/D72dVLKZ3A6W4OkqZjbtff9wkmrlX9yqSpnHZQelrLmknX9WjfZs8sScF3TdOm+gaEepeVfvgN0OzDKnwRt5blX34TagvWc401PJRLYtmOLgz2QbHpLWxvo7eQlBPe4Q/RyzQgZp5e3J1V6GLazTPPnGtJdGnp/z5eygz0O5SdrjlJUgo2w2xv9b8NUvDP3rYouDQEIIkTw0Uy4G87eGMPFRZ4oSX0eTWABXDOLAJ4G5uJn5oxI3YeYSM13+pSkYZPEk13ZxCOiJ1rnixhJW+I8GpUHq3Pd6gFZ9e3ulnB4JylADCxVYRC17ZjyjtGIQKOAtsosA1YkGo7Jn3aIFUceq9uGdEz9srHY5FRRCuy6Fly1oeB8zfKDXTHZQvqNgzQv21TjPEcBRNCCRK4prPPmSaDZnM8QrbX4bx1GFTEEQ== homelab"  
}

resource "harvester_cloudinit_secret" "cloud-config-ubuntu" {
  name = "cloud-config-ubuntu"
  namespace = "harvester-vms"

  depends_on = [ harvester_ssh_key.torque_ssh ]

  user_data = <<-EOF
    #Cloud Config
    ssh_pwauth: false
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
          dhcp4: true
    EOF
}


