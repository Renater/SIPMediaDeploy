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

variable "coturn_replicas" {
  type        = number
  description = "The minimum number of available coturn at any time."
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

resource "openstack_networking_port_v2" "coturn" {
  name           = "coturn"
  network_id     = openstack_networking_network_v2.internal.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.internal_v4.id
  }
}

resource "openstack_networking_floatingip_v2" "coturn" {
  pool        = var.external_network
  description = "coturn"
}

resource "openstack_networking_floatingip_associate_v2" "coturn" {
  floating_ip = openstack_networking_floatingip_v2.coturn.address
  port_id     = openstack_networking_port_v2.coturn.id
}

resource "openstack_compute_instance_v2" "coturn" {
  name        = var.coturn_name
  image_name  = var.coturn_image
  flavor_name = var.coturn_flavor
  key_pair    = var.key_pair
  user_data = templatefile("${path.module}/coturn.cloud-init.sh", {
    coturn_ip     = openstack_networking_floatingip_v2.coturn.address
    coturn_port   = var.coturn_port,
    coturn_domain = var.coturn_domain_name,
    stun_user     = var.coturn_stun_user,
    stun_pass     = var.coturn_stun_pass,
  })

  network {
    port = openstack_networking_port_v2.coturn.id
  }

  metadata = {
    "sipmediagw.group" = "coturn"
  }
}
