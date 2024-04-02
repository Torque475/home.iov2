#List of images needed for harvester to be happy

images = {
  ubuntu-20.04 = {
    name = "ubuntu-20.04"
    namespace = harvester_vm
    display_name = "Ubuntu 20.04"
    source_type = "download"
    url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  },
  ubuntu-22.04 = {
    name = "ubuntu-22.04"
    namespace = harvester_vm
    display_name = "Ubuntu 22.04"
    source_type = "download"
    url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  },
  ubuntu-24.04 = {
    name = "ubuntu-24.04"
    namespace = harvester_vm
    display_name = "Ubuntu 24.04"
    source_type = "download"
    url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  },
  truenas-core-13.0-u6.1 = {
    name = "truenas-core-13.0-u6.1"
    namespace = nas
    display_name = "TrueNAS CORE 13.0-U6.1"
    source_type = "download"
    url = "https://download-core.sys.truenas.net/13.0/STABLE/U6.1/x64/TrueNAS-13.0-U6.1.iso"
  }
}

