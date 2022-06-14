variable "coturn_name" {
  type        = string
  description = "The name of the Coturn instance."
  default     = "coturn"
}

variable "coturn_image" {
  type        = string
  description = "The name of the image of the Coturn instance."
}

variable "coturn_flavor" {
  type        = string
  description = "The name of the flavor of the Coturn instance."
}

variable "coturn_network" {
  type        = string
  description = "The name of the network of the Coturn instance."
}

resource "openstack_compute_instance_v2" "coturn" {
  name        = var.coturn_name
  image_name  = var.coturn_image
  flavor_name = var.coturn_flavor

  network {
    name = var.coturn_network
  }
}
