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

variable "coturn_domain_name" {
  type        = string
  description = "The domain name for the Coturn instance"
}

variable "coturn_port" {
  type        = number
  description = "The port on which the Coturn server shall be contacted"
}

variable "coturn_stun_user" {
  type        = string
  description = "The username of the stun server of the Coturn instance."
}

variable "coturn_stun_pass" {
  type        = string
  description = "The password of the stun server of the Coturn instance."
}

resource "openstack_compute_instance_v2" "coturn" {
  name        = var.coturn_name
  image_name  = var.coturn_image
  flavor_name = var.coturn_flavor
  key_pair    = var.key_pair
  user_data = templatefile("${path.module}/coturn.cloud-init.sh", {
    coturn_port   = var.coturn_port,
    coturn_domain = var.coturn_domain_name,
    stun_user     = var.coturn_stun_user,
    stun_pass     = var.coturn_stun_pass,
  })

  network {
    name = var.coturn_network
  }

  metadata = {
    "sipmediagw.group" = "coturn"
  }
}
