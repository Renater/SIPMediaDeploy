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

resource "openstack_compute_instance_v2" "kamailio" {
  name        = var.kamailio_name
  image_name  = var.kamailio_image
  flavor_name = var.kamailio_flavor
  user_data = templatefile("${path.module}/kamailio.cloud-init.sh", {
    coturn_ip = openstack_compute_instance_v2.coturn.access_ip_v4
  })

  network {
    name = var.kamailio_network
  }
}
