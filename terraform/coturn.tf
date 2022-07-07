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

resource "openstack_networking_floatingip_v2" "coturn" {
  pool        = var.external_network
  description = "coturn"
}
