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

variable "scaler_os_auth_url" {
  type        = string
  description = "The URL of the Openstack endpoint."
}

variable "scaler_os_username" {
  type        = string
  description = "The name of the Openstack user."
}

variable "scaler_os_password" {
  type        = string
  description = "The password of the Openstack user."
}

variable "scaler_os_region_name" {
  type        = string
  description = "The name of the Openstack region."
}

variable "scaler_os_project_domain_id" {
  type        = string
  description = "The ID of the Openstack project domain."
}

variable "scaler_os_user_domain_name" {
  type        = string
  description = "The name of the Openstack project domain."
}

variable "scaler_os_project_id" {
  type        = string
  description = "The ID of the Openstack project."
}

variable "scaler_os_project_name" {
  type        = string
  description = "The name of the Openstack project."
}

variable "scaler_os_interface" {
  type        = string
  description = "The Openstack interface."
}

variable "scaler_os_identity_api_version" {
  type        = string
  description = "The version of the Openstack API."
}

variable "scaler_openstack_flavor" {
  type        = string
  description = "The name of the flavor to use for the virtual machines."
}

variable "scaler_openstack_image" {
  type        = string
  description = "The name of the image to use for the virtual machines."
}

variable "scaler_openstack_ip_version" {
  type        = string
  description = "The IP version to use for virtual machines."
}

variable "scaler_openstack_network" {
  type        = string
  description = "The name of the network to use for the virtual machines."
}

variable "scaler_openstack_metadata_key" {
  type        = string
  description = "The metadata key to identify the scaled server pool."
}

variable "scaler_openstack_metadata_value" {
  type        = string
  description = "The metadata value to identify the scaled server pool."
}

variable "scaler_openstack_keypair" {
  type        = string
  description = "The name of the keypair that is provisioned on the virtual machines."
}

resource "openstack_compute_instance_v2" "scaler" {
  name        = var.scaler_name
  image_name  = var.scaler_image
  flavor_name = var.scaler_flavor
  key_pair    = var.key_pair
  user_data = templatefile("${path.module}/scaler.cloud-init.sh", {
    os_auth_url              = var.scaler_os_auth_url
    os_username              = var.scaler_os_username
    os_password              = var.scaler_os_password
    os_region_name           = var.scaler_os_region_name
    os_project_domain_id     = var.scaler_os_project_domain_id
    os_user_domain_name      = var.scaler_os_user_domain_name
    os_project_id            = var.scaler_os_project_id
    os_project_name          = var.scaler_os_project_name
    os_interface             = var.scaler_os_interface
    os_identity_api_version  = var.scaler_os_identity_api_version
    openstack_flavor         = var.scaler_openstack_flavor
    openstack_image          = var.scaler_openstack_image
    openstack_ip_version     = var.scaler_openstack_ip_version
    openstack_network        = var.scaler_openstack_network
    openstack_metadata_key   = var.scaler_openstack_metadata_key
    openstack_metadata_value = var.scaler_openstack_metadata_value
    openstack_keypair        = var.scaler_openstack_keypair
  })

  network {
    name = var.scaler_network
  }

  metadata = {
    "sipmediagw.group" = "scaler"
  }
}
