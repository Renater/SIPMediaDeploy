variable "GW_HOST_SOURCE" {
  type        = string
  description = "The name of the image to be used for the Gateway host build"
}

variable "GW_HOST_FLAVOR" {
  type        = string
  description = "The name of the flavor to be used for the Gateway host image"
}

variable "GW_HOST_NETWORK_ID" {
  type        = string
  description = "The ID of the network to be used for the Gateway host server"
}

variable "GW_HOST_SSH_USERNAME" {
  type        = string
  description = "The username to be used to SSH to the Gateway host server"
}

source "openstack" "gateway-host" {
  image_name        = "Gateway Host"
  ssh_username      = var.GW_HOST_SSH_USERNAME
  source_image_name = var.GW_HOST_SOURCE
  flavor            = var.GW_HOST_FLAVOR
  ssh_ip_version    = "4"
  networks          = [var.GW_HOST_NETWORK_ID]
}

build {
  sources = ["source.openstack.gateway-host"]
  provisioner "ansible" {
    command       = "./ansible.sh"
    playbook_file = "../ansible/playbooks/gateway-host.yml"
  }
}
