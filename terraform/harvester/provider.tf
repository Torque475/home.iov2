terraform {
    required_version = ">=0.13"
  required_providers {
    harvester = {
      source = "harvester/harvester"
      version = "0.6.4"
    }
  }
}

provider "harvester" {
  kubeconfig = var.kubeconfig_path  
}

variable "kubeconfig_path" {
    description = "value"
    type = string

    default = "harvester-kubeconfig.yaml"
}