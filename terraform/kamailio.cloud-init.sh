#!/bin/sh

KAMAILIO_INTERNAL_IP=$(hostname -I | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}")
KAMAILIO_EXTERNAL_IP=${kamailio_ip}
KAMAILIO_DOMAIN=${kamailio_domain}
SIP_SECRET=${sip_secret}

# If the Kamailio domain is empty, rewrite it with the IP address
[ -z "$KAMAILIO_DOMAIN" ] && KAMAILIO_DOMAIN=$KAMAILIO_EXTERNAL_IP

sed -i -E "s/sipSrv=\"([0-9]{1,3}\.){3}[0-9]{1,3}\"/sipSrv=\"$KAMAILIO_EXTERNAL_IP\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s/sipSecret=\"[^\"]*\"/sipSecret=\"$SIP_SECRET\"/" /etc/kamailio/sipmediagw.cfg

sed -i -E "s/alias=\"[^\"]*\"/alias=\"$KAMAILIO_DOMAIN\"/" /etc/kamailio/kamailio.cfg
sed -i -E "s/^listen=udp:.*$/listen=udp:$KAMAILIO_INTERNAL_IP:5060 advertise $KAMAILIO_EXTERNAL_IP:5060/" /etc/kamailio/kamailio.cfg
sed -i -E "s/^listen=tcp:.*$/listen=tcp:$KAMAILIO_INTERNAL_IP:5060 advertise $KAMAILIO_EXTERNAL_IP:5060/" /etc/kamailio/kamailio.cfg

sed -i -E "s/SIP_DOMAIN=[^\"]*/SIP_DOMAIN=$KAMAILIO_EXTERNAL_IP/" /etc/kamailio/kamctlrc
sed -i -E "s/DBACCESSHOST=[^\"]*/DBACCESSHOST=$KAMAILIO_INTERNAL_IP/" /etc/kamailio/kamctlrc

systemctl restart kamailio.service
