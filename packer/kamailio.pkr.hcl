variable "KAMAILIO_SOURCE" {
  type        = string
  description = "The name of the image to be used for the Kamailio build"
}

variable "KAMAILIO_FLAVOR" {
  type        = string
  description = "The name of the flavor to be used for the Kamailio image"
}

variable "KAMAILIO_NETWORK_ID" {
  type        = string
  description = "The ID of the network to be used for the Kamailio server"
}

variable "KAMAILIO_SSH_USERNAME" {
  type        = string
  description = "The username to be used to SSH to the Kamailio server"
}

source "openstack" "kamailio" {
  image_name        = "Kamailio"
  ssh_username      = var.KAMAILIO_SSH_USERNAME
  source_image_name = var.KAMAILIO_SOURCE
  flavor            = var.KAMAILIO_FLAVOR
  ssh_ip_version    = "4"
  networks          = [var.KAMAILIO_NETWORK_ID]
}

build {
  sources = ["source.openstack.kamailio"]
  provisioner "ansible" {
    command       = "./ansible.sh"
    playbook_file = "../ansible/playbooks/kamailio.yml"
  }
}
