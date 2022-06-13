variable "coturn_name" {
  type        = string
  description = "The name of the Coturn instance."
  default     = "coturn"
}

variable "coturn_image_id" {
  type        = string
  description = "The ID of the image of the Coturn instance."
}

variable "coturn_flavor_id" {
  type        = string
  description = "The ID of the flavor of the Coturn instance."
}

variable "coturn_network_id" {
  type        = string
  description = "The ID of the network of the Coturn instance."
}

resource "openstack_compute_instance_v2" "coturn" {
  name      = var.coturn_name
  image_id  = var.coturn_image_id
  flavor_id = var.coturn_flavor_id

  network {
    uuid = var.coturn_network_id
  }
}
