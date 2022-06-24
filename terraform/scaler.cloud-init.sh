#!/bin/sh

cd /var/scaler

OS_AUTH_URL=${os_auth_url}
OS_USERNAME=${os_username}
OS_PASSWORD=${os_password}
OS_REGION_NAME=${os_region_name}
OS_PROJECT_DOMAIN_ID=${os_project_domain_id}
OS_USER_DOMAIN_NAME=${os_user_domain_name}
OS_PROJECT_ID=${os_project_id}
OS_PROJECT_NAME=${os_project_name}
OS_INTERFACE=${os_interface}
OS_IDENTITY_API_VERSION=${os_identity_api_version}
OPENSTACK_FLAVOR=${openstack_flavor}
OPENSTACK_IMAGE=${openstack_image}
OPENSTACK_IP_VERSION=${openstack_ip_version}
OPENSTACK_NETWORK=${openstack_network}
OPENSTACK_METADATA_KEY=${openstack_metadata_key}
OPENSTACK_METADATA_VALUE=${openstack_metadata_value}
OPENSTACK_KEYPAIR=${openstack_keypair}

COTURN_IP=${coturn_ip}
COTURN_PORT=${coturn_port}
STUN_USER=${stun_user}
STUN_PASS=${stun_pass}
KAMAILIO_IP=${kamailio_ip}
SIP_SECRET=${sip_secret}

sed -i -E "s/^OS_AUTH_URL=.*$/OS_AUTH_URL=$OS_AUTH_URL/" .env
sed -i -E "s/^OS_USERNAME=.*$/OS_USERNAME=$OS_USERNAME/" .env
sed -i -E "s/^OS_PASSWORD=.*$/OS_PASSWORD=$OS_PASSWORD/" .env
sed -i -E "s/^OS_REGION_NAME=.*$/OS_REGION_NAME=$OS_REGION_NAME/" .env
sed -i -E "s/^OS_PROJECT_DOMAIN_ID=.*$/OS_PROJECT_DOMAIN_ID=$OS_PROJECT_DOMAIN_ID/" .env
sed -i -E "s/^OS_USER_DOMAIN_NAME=.*$/OS_USER_DOMAIN_NAME=$OS_USER_DOMAIN_NAME/" .env
sed -i -E "s/^OS_PROJECT_ID=.*$/OS_PROJECT_ID=$OS_PROJECT_ID/" .env
sed -i -E "s/^OS_PROJECT_NAME=.*$/OS_PROJECT_NAME=$OS_PROJECT_NAME/" .env
sed -i -E "s/^OS_INTERFACE=.*$/OS_INTERFACE=$OS_INTERFACE/" .env
sed -i -E "s/^OS_IDENTITY_API_VERSION=.*$/OS_IDENTITY_API_VERSION=$OS_IDENTITY_API_VERSION/" .env
sed -i -E "s/^OPENSTACK_FLAVOR=.*$/OPENSTACK_FLAVOR=$OPENSTACK_FLAVOR/" .env
sed -i -E "s/^OPENSTACK_IMAGE=.*$/OPENSTACK_IMAGE=$OPENSTACK_IMAGE/" .env
sed -i -E "s/^OPENSTACK_IP_VERSION=.*$/OPENSTACK_IP_VERSION=$OPENSTACK_IP_VERSION/" .env
sed -i -E "s/^OPENSTACK_NETWORK=.*$/OPENSTACK_NETWORK=$OPENSTACK_NETWORK/" .env
sed -i -E "s/^OPENSTACK_METADATA_KEY=.*$/OPENSTACK_METADATA_KEY=$OPENSTACK_METADATA_KEY/" .env
sed -i -E "s/^OPENSTACK_METADATA_VALUE=.*$/OPENSTACK_METADATA_VALUE=$OPENSTACK_METADATA_VALUE/" .env
sed -i -E "s/^OPENSTACK_KEYPAIR=.*$/OPENSTACK_KEYPAIR=$OPENSTACK_KEYPAIR/" .env

echo '#!/bin/sh

GATEWAY_HOST_IP=$(hostname -I | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | cut -d" " -f1)

sed -i -E "s/sipSrv=\"([0-9]{1,3}\.){3}[0-9]{1,3}\"/sipSrv=\"'"$KAMAILIO_IP"'\"/" /var/launcher/sipmediagw.cfg
sed -i -E "s/sipSecret=\"[^\"]*\"/sipSecret=\"'"$SIP_SECRET"'\"/" /var/launcher/sipmediagw.cfg
sed -i -E "s/turnConfig=\"turn:([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5};stunuser=[^;]*;stunpass=[^\"]*\"/turnConfig=\"turn:'"$COTURN_IP"':'"$COTURN_PORT"';stunuser='"$STUN_USER"';stunpass='"$STUN_PASS"'\"/" /var/launcher/sipmediagw.cfg
sed -i -E "s/sipUaNamePart=\"[^\"]*\"/sipUaNamePart=\"mediagw.$GATEWAY_HOST_IP\"/" /var/launcher/sipmediagw.cfg
sed -i -E "s;launcherAPIPath=\"http://([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5}/[^\"]*\";launcherAPIPath=\"http://'"$GW_LAUNCHER_IP"':'"$GW_LAUNCHER_PORT$GW_LAUNCHER_API_ROUTE"'\";" /var/launcher/sipmediagw.cfg

curl "http://localhost:8080/sipmediagw"

' > cloud-init.sh

sudo -u scaler docker-compose up -d
