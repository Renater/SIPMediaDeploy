variable "kamailio_name" {
  type        = string
  description = "The name of the Kamailio instance."
  default     = "kamailio"
}

variable "kamailio_image" {
  type        = string
  description = "The name of the image of the Kamailio instance."
}

variable "kamailio_flavor" {
  type        = string
  description = "The name of the flavor of the Kamailio instance."
}

variable "kamailio_replicas" {
  type        = number
  description = "The minimum number of available Kamailio at any time."
}

variable "kamailio_sip_secret" {
  type        = string
  description = "The secret shared by the instances using the SIP protocol."
}

variable "kamailio_domain_name" {
  type        = string
  description = "The domain name linked to the Kamailio's IP address."
}

resource "openstack_networking_port_v2" "kamailio" {
  name           = "kamailio"
  network_id     = openstack_networking_network_v2.internal.id
  admin_state_up = "true"

  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.internal_v4.id
  }
}

resource "openstack_networking_floatingip_v2" "kamailio" {
  pool        = var.external_network
  description = "kamailio"
}

resource "openstack_networking_floatingip_associate_v2" "kamailio" {
  floating_ip = openstack_networking_floatingip_v2.kamailio.address
  port_id     = openstack_networking_port_v2.kamailio.id
}

resource "openstack_compute_instance_v2" "kamailio" {
  name        = var.kamailio_name
  image_name  = var.kamailio_image
  flavor_name = var.kamailio_flavor
  key_pair    = var.key_pair
  user_data = templatefile("${path.module}/kamailio.cloud-init.sh", {
    sip_secret      = var.kamailio_sip_secret
    kamailio_domain = var.kamailio_domain_name
    kamailio_ip     = openstack_networking_floatingip_v2.kamailio.address
  })

  network {
    port = openstack_networking_port_v2.kamailio.id
  }

  metadata = {
    "sipmediagw.group" = "kamailio"
  }
}
