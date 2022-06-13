variable "kamailio_name" {
  type        = string
  description = "The name of the Kamailio instance."
  default     = "kamailio"
}

variable "kamailio_image_id" {
  type        = string
  description = "The ID of the image of the Kamailio instance."
}

variable "kamailio_flavor_id" {
  type        = string
  description = "The ID of the flavor of the Kamailio instance."
}

variable "kamailio_network_id" {
  type        = string
  description = "The ID of the network of the Kamailio instance."
}

resource "openstack_compute_instance_v2" "kamailio" {
  name      = var.kamailio_name
  image_id  = var.kamailio_image_id
  flavor_id = var.kamailio_flavor_id
  user_data = templatefile("${path.module}/kamailio.cloud-init.sh", {
    coturn_ip = openstack_compute_instance_v2.coturn.access_ip_v4
  })

  network {
    uuid = var.kamailio_network_id
  }
}
