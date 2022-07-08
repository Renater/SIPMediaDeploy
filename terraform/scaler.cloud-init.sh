#!/bin/sh

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
OPENSTACK_IP_VERSION=${openstack_ip_version}
OPENSTACK_EXTERNAL_NETWORK=${openstack_external_network}
OPENSTACK_INTERNAL_NETWORK=${openstack_internal_network}
OPENSTACK_METADATA_KEY=${openstack_metadata_key}
OPENSTACK_KEYPAIR=${openstack_keypair}
GATEWAY_HOST_OPENSTACK_NAME=${gateway_host_openstack_name}
GATEWAY_HOST_OPENSTACK_IMAGE=${gateway_host_openstack_image}
GATEWAY_HOST_OPENSTACK_FLAVOR=${gateway_host_openstack_flavor}
GATEWAY_HOST_REPLICAS=${gateway_host_replicas}
KAMAILIO_OPENSTACK_NAME=${kamailio_openstack_name}
KAMAILIO_OPENSTACK_IMAGE=${kamailio_openstack_image}
KAMAILIO_OPENSTACK_FLAVOR=${kamailio_openstack_flavor}
KAMAILIO_REPLICAS=${kamailio_replicas}
COTURN_OPENSTACK_NAME=${coturn_openstack_name}
COTURN_OPENSTACK_IMAGE=${coturn_openstack_image}
COTURN_OPENSTACK_FLAVOR=${coturn_openstack_flavor}
COTURN_REPLICAS=${coturn_replicas}
GATEWAY_HOST_CAPACITY=${gateway_host_capacity}
COTURN_IP=${coturn_ip}
COTURN_PORT=${coturn_port}
COTURN_DOMAIN=${coturn_domain}
STUN_USER=${stun_user}
STUN_PASS=${stun_pass}
KAMAILIO_IP=${kamailio_ip}
KAMAILIO_DOMAIN_NAME=${kamailio_domain_name}
SIP_SECRET=${sip_secret}
WEBRTC_DOMAIN=${webrtc_domain}


######################################################################################################
#################################### Gateway Scaler configuration ####################################
######################################################################################################

cd /var/scaler/gateway

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
sed -i -E "s/^OPENSTACK_SCALED_NAME=.*$/OPENSTACK_SCALED_NAME=$GATEWAY_HOST_OPENSTACK_NAME/" .env
sed -i -E "s/^OPENSTACK_SCALED_FLAVOR=.*$/OPENSTACK_SCALED_FLAVOR=$GATEWAY_HOST_OPENSTACK_FLAVOR/" .env
sed -i -E "s/^OPENSTACK_SCALED_IMAGE=.*$/OPENSTACK_SCALED_IMAGE=$GATEWAY_HOST_OPENSTACK_IMAGE/" .env
sed -i -E "s/^OPENSTACK_IP_VERSION=.*$/OPENSTACK_IP_VERSION=$OPENSTACK_IP_VERSION/" .env
sed -i -E "s/^OPENSTACK_SCALED_NETWORK=.*$/OPENSTACK_SCALED_NETWORK=$OPENSTACK_EXTERNAL_NETWORK/" .env
sed -i -E "s/^OPENSTACK_METADATA_KEY=.*$/OPENSTACK_METADATA_KEY=$OPENSTACK_METADATA_KEY/" .env
sed -i -E "s/^OPENSTACK_METADATA_SCALED_VALUE=.*$/OPENSTACK_METADATA_SCALED_VALUE=gateway/" .env
sed -i -E "s/^OPENSTACK_KEYPAIR=.*$/OPENSTACK_KEYPAIR=$OPENSTACK_KEYPAIR/" .env
sed -i -E "s/^REPLICA_CAPACITY=[0-9]*$/REPLICA_CAPACITY=$GATEWAY_HOST_CAPACITY/" .env
sed -i -E "s/^REPLICA_MIN_AVAILABLE_RESOURCES=[0-9]*$/REPLICA_MIN_AVAILABLE_RESOURCES=$GATEWAY_HOST_REPLICAS/" .env

sed -i -E "s/^KAMAILIO_IP=.*$/KAMAILIO_IP=$KAMAILIO_IP/" cloud-init.sh
sed -i -E "s/^SIP_SECRET=.*$/SIP_SECRET=$SIP_SECRET/" cloud-init.sh
sed -i -E "s/^COTURN_IP=.*$/COTURN_IP=$COTURN_IP/" cloud-init.sh
sed -i -E "s/^COTURN_PORT=.*$/COTURN_PORT=$COTURN_PORT/" cloud-init.sh
sed -i -E "s/^STUN_USER=.*$/STUN_USER=$STUN_USER/" cloud-init.sh
sed -i -E "s/^STUN_PASS=.*$/STUN_PASS=$STUN_PASS/" cloud-init.sh
sed -i -E "s/^WEBRTC_DOMAIN=.*$/WEBRTC_DOMAIN=$WEBRTC_DOMAIN/" cloud-init.sh

cp $0 scaler.cloud-init.sh
chown scaler:scaler scaler.cloud-init.sh
chmod 644 scaler.cloud-init.sh

sudo -u scaler docker-compose up -d


######################################################################################################
#################################### Kamailio Scaler configuration ###################################
######################################################################################################

cd /var/scaler/kamailio

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
sed -i -E "s/^OPENSTACK_SCALED_NAME=.*$/OPENSTACK_SCALED_NAME=$KAMAILIO_OPENSTACK_NAME/" .env
sed -i -E "s/^OPENSTACK_SCALED_FLAVOR=.*$/OPENSTACK_SCALED_FLAVOR=$KAMAILIO_OPENSTACK_FLAVOR/" .env
sed -i -E "s/^OPENSTACK_SCALED_IMAGE=.*$/OPENSTACK_SCALED_IMAGE=$KAMAILIO_OPENSTACK_IMAGE/" .env
sed -i -E "s/^OPENSTACK_IP_VERSION=.*$/OPENSTACK_IP_VERSION=$OPENSTACK_IP_VERSION/" .env
sed -i -E "s/^OPENSTACK_SCALED_NETWORK=.*$/OPENSTACK_SCALED_NETWORK=$OPENSTACK_INTERNAL_NETWORK/" .env
sed -i -E "s/^OPENSTACK_METADATA_KEY=.*$/OPENSTACK_METADATA_KEY=$OPENSTACK_METADATA_KEY/" .env
sed -i -E "s/^OPENSTACK_METADATA_SCALED_VALUE=.*$/OPENSTACK_METADATA_SCALED_VALUE=kamailio/" .env
sed -i -E "s/^OPENSTACK_KEYPAIR=.*$/OPENSTACK_KEYPAIR=$OPENSTACK_KEYPAIR/" .env
sed -i -E "s/^REPLICA_CAPACITY=[0-9]*$/REPLICA_CAPACITY=1/" .env
sed -i -E "s/^REPLICA_MIN_AVAILABLE_RESOURCES=[0-9]*$/REPLICA_MIN_AVAILABLE_RESOURCES=$KAMAILIO_REPLICAS/" .env

sed -i -E "s/^KAMAILIO_EXTERNAL_IP=.*$/KAMAILIO_EXTERNAL_IP=$KAMAILIO_IP/" cloud-init.sh
sed -i -E "s/^KAMAILIO_DOMAIN=.*$/KAMAILIO_DOMAIN=$KAMAILIO_DOMAIN_NAME/" cloud-init.sh
sed -i -E "s/^SIP_SECRET=.*$/SIP_SECRET=$SIP_SECRET/" cloud-init.sh

cp $0 scaler.cloud-init.sh
chown scaler:scaler scaler.cloud-init.sh
chmod 644 scaler.cloud-init.sh

sudo -u scaler docker-compose up -d


######################################################################################################
#################################### Coturn Scaler configuration #####################################
######################################################################################################

cd /var/scaler/coturn

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
sed -i -E "s/^OPENSTACK_SCALED_NAME=.*$/OPENSTACK_SCALED_NAME=$COTURN_OPENSTACK_NAME/" .env
sed -i -E "s/^OPENSTACK_SCALED_FLAVOR=.*$/OPENSTACK_SCALED_FLAVOR=$COTURN_OPENSTACK_FLAVOR/" .env
sed -i -E "s/^OPENSTACK_SCALED_IMAGE=.*$/OPENSTACK_SCALED_IMAGE=$COTURN_OPENSTACK_IMAGE/" .env
sed -i -E "s/^OPENSTACK_IP_VERSION=.*$/OPENSTACK_IP_VERSION=$OPENSTACK_IP_VERSION/" .env
sed -i -E "s/^OPENSTACK_SCALED_NETWORK=.*$/OPENSTACK_SCALED_NETWORK=$OPENSTACK_INTERNAL_NETWORK/" .env
sed -i -E "s/^OPENSTACK_METADATA_KEY=.*$/OPENSTACK_METADATA_KEY=$OPENSTACK_METADATA_KEY/" .env
sed -i -E "s/^OPENSTACK_METADATA_SCALED_VALUE=.*$/OPENSTACK_METADATA_SCALED_VALUE=coturn/" .env
sed -i -E "s/^OPENSTACK_KEYPAIR=.*$/OPENSTACK_KEYPAIR=$OPENSTACK_KEYPAIR/" .env
sed -i -E "s/^REPLICA_CAPACITY=[0-9]*$/REPLICA_CAPACITY=1/" .env
sed -i -E "s/^REPLICA_MIN_AVAILABLE_RESOURCES=[0-9]*$/REPLICA_MIN_AVAILABLE_RESOURCES=$COTURN_REPLICAS/" .env

sed -i -E "s/^COTURN_IP=.*$/COTURN_IP=$COTURN_IP/" cloud-init.sh
sed -i -E "s/^COTURN_DOMAIN=.*$/COTURN_DOMAIN=$COTURN_DOMAIN/" cloud-init.sh
sed -i -E "s/^COTURN_PORT=.*$/COTURN_PORT=$COTURN_PORT/" cloud-init.sh
sed -i -E "s/^STUN_USER=.*$/STUN_USER=$STUN_USER/" cloud-init.sh
sed -i -E "s/^STUN_PASS=.*$/STUN_PASS=$STUN_PASS/" cloud-init.sh

cp $0 scaler.cloud-init.sh
chown scaler:scaler scaler.cloud-init.sh
chmod 644 scaler.cloud-init.sh

sudo -u scaler docker-compose up -d
