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

variable "kamailio_network" {
  type        = string
  description = "The name of the network of the Kamailio instance."
}

variable "kamailio_sip_secret" {
  type        = string
  description = "The secret shared by the instances using the SIP protocol."
}

resource "openstack_compute_instance_v2" "kamailio" {
  name        = var.kamailio_name
  image_name  = var.kamailio_image
  flavor_name = var.kamailio_flavor
  key_pair    = var.key_pair
  user_data = templatefile("${path.module}/kamailio.cloud-init.sh", {
    coturn_ip   = openstack_compute_instance_v2.coturn.access_ip_v4,
    coturn_port = var.coturn_port,
    stun_user   = var.coturn_stun_user,
    stun_pass   = var.coturn_stun_pass,
    sip_secret  = var.kamailio_sip_secret
  })

  network {
    name = var.kamailio_network
  }

  metadata = {
    "sipmediagw.group" = "kamailio"
  }
}
