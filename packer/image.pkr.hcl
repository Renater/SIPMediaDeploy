source "openstack" "gateway" {
  image_name     = "Gateway"
  ssh_username   = "debian"
  source_image   = var.SOURCE_ID
  flavor         = var.FLAVOR_ID
  ssh_ip_version = "4"
  networks       = [var.NETWORK_ID]
}

build {
  sources = ["source.openstack.gateway"]
  provisioner "ansible" {
    command       = "./ansible.sh"
    playbook_file = "../ansible/playbooks/gateway.yml"
  }
}
