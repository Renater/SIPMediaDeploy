variable "external_network" {
  type        = string
  description = "The name of the external network."
}

variable "internal_network_cidr" {
  type        = string
  description = "The CIDR of the internal network."
}

variable "internal_network_gateway" {
  type        = string
  description = "The IP address of the gateway of the internal network."
}

variable "internal_network_ip_version" {
  type        = string
  description = "The IP version used in the internal network."
}

data "openstack_networking_network_v2" "external" {
  name = var.external_network
}

resource "openstack_networking_network_v2" "internal" {
  name                  = "internal"
  admin_state_up        = "true"
  port_security_enabled = true
}

resource "openstack_networking_subnet_v2" "internal_v4" {
  name            = "internal_v4"
  network_id      = openstack_networking_network_v2.internal.id
  cidr            = var.internal_network_cidr
  gateway_ip      = var.internal_network_gateway
  ip_version      = var.internal_network_ip_version
  dns_nameservers = ["1.1.1.1", "8.8.8.8"]
  enable_dhcp     = true
}

resource "openstack_networking_router_v2" "main" {
  name                = "main"
  admin_state_up      = true
  external_network_id = data.openstack_networking_network_v2.external.id
}

resource "openstack_networking_router_interface_v2" "internal" {
  router_id = openstack_networking_router_v2.main.id
  subnet_id = openstack_networking_subnet_v2.internal_v4.id
}
