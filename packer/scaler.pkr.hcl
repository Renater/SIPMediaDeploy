variable "SCALER_SOURCE" {
  type        = string
  description = "The name of the image to be used for the Scaler build"
}

variable "SCALER_FLAVOR" {
  type        = string
  description = "The name of the flavor to be used for the Scaler image"
}

variable "SCALER_NETWORK_ID" {
  type        = string
  description = "The ID of the network to be used for the Scaler server"
}

variable "SCALER_SSH_USERNAME" {
  type        = string
  description = "The username to be used to SSH to the Scaler server"
}

source "openstack" "scaler" {
  image_name        = "Scaler"
  ssh_username      = var.SCALER_SSH_USERNAME
  source_image_name = var.SCALER_SOURCE
  flavor            = var.SCALER_FLAVOR
  ssh_ip_version    = "4"
  networks          = [var.SCALER_NETWORK_ID]
}

build {
  sources = ["source.openstack.scaler"]
  provisioner "ansible" {
    command       = "./ansible.sh"
    playbook_file = "../ansible/playbooks/scaler.yml"
  }
}
