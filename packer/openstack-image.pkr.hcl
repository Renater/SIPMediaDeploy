source "openstack" "gateway" {
  username     = "$OS_USERNAME"
  password     = "$OS_PASSWORD"
  identity_endpoint = "$OS_AUTH_URL"
  region       = "$OS_REGION_NAME"
  tenant_id   =  "$OS_TENANT_ID"
  image_name   = "Gateway"
  ssh_username = "root"
  source_image = "$SOURCE_ID"
  flavor       = "$FLAVOR_ID"
  ssh_ip_version = "4"
  networks     =  ["$NETWORK_ID"]
}
build {
  sources = ["source.openstack.gateway"]
}

