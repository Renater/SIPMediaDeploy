variable "COTURN_SOURCE" {
  type        = string
  description = "The name of the image to be used for the Coturn build"
}

variable "COTURN_FLAVOR" {
  type        = string
  description = "The name of the flavor to be used for the Coturn image"
}

variable "COTURN_NETWORK_ID" {
  type        = string
  description = "The ID of the network to be used for the Coturn server"
}

variable "COTURN_SSH_USERNAME" {
  type        = string
  description = "The username to be used to SSH to the Coturn server"
}

source "openstack" "coturn" {
  image_name        = "Coturn"
  ssh_username      = var.COTURN_SSH_USERNAME
  source_image_name = var.COTURN_SOURCE
  flavor            = var.COTURN_FLAVOR
  ssh_ip_version    = "4"
  networks          = [var.COTURN_NETWORK_ID]
}

build {
  sources = ["source.openstack.coturn"]
  provisioner "ansible" {
    command       = "./ansible.sh"
    playbook_file = "../ansible/playbooks/coturn.yml"
  }
}
