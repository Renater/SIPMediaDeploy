source "openstack" "gateway" {
  image_name   = "Gateway"
  ssh_username = "root"
  source_image = "${var.SOURCE_ID}"
  flavor     = "${var.FLAVOR_ID}"
  ssh_ip_version = "4"
  networks     =  ["${var.NETWORK_ID}"]
}
build {
  sources = ["source.openstack.gateway"]
}

