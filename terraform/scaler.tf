variable "scaler_name" {
  type        = string
  description = "The name of the scaler instance."
  default     = "scaler"
}

variable "scaler_image" {
  type        = string
  description = "The name of the image of the scaler instance."
}

variable "scaler_flavor" {
  type        = string
  description = "The name of the flavor of the scaler instance."
}

variable "scaler_network" {
  type        = string
  description = "The name of the network of the scaler instance."
}

resource "openstack_compute_instance_v2" "scaler" {
  name        = var.scaler_name
  image_name  = var.scaler_image
  flavor_name = var.scaler_flavor
  key_pair    = var.key_pair

  network {
    name = var.scaler_network
  }

  metadata = {
    "sipmediagw.group" = "scaler"
  }
}
