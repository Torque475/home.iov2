resource "harvester_image" "images" {
  #Create a block of images from a single variable
  for_each = var.images

  name = each.value.name
  namespace = each.value.namespace
  
  display_name = each.value.display_name
  url = each.value.url
  source_type = "each.value.source_type"
  tags = each.value.tags

  depends_on = [ var.images.namespace ]
}

variable "images" {
  description = "Map of Images to support VMs"
  type = map(object({
    name = string
    namespace = string
    display_name = string
    source_type = string
    url = string
    tags = map(string)
  }))
}