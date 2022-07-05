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

resource "openstack_networking_floatingip_v2" "kamailio" {
  pool        = var.external_network
  description = "kamailio"
}
