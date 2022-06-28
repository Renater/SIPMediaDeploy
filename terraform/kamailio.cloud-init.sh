#!/bin/sh

KAMAILIO_IP=$(hostname -I | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}")
KAMAILIO_DOMAIN=${kamailio_domain}
SIP_SECRET=${sip_secret}

sed -i -E "s/sipSrv=\"([0-9]{1,3}\.){3}[0-9]{1,3}\"/sipSrv=\"$KAMAILIO_IP\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s/sipSecret=\"[^\"]*\"/sipSecret=\"$SIP_SECRET\"/" /etc/kamailio/sipmediagw.cfg

sed -i -E "s/alias=\"[^\"]*\"/alias=\"$KAMAILIO_DOMAIN\"/" /etc/kamailio/kamailio.cfg

sed -i -E "s/SIP_DOMAIN=[^\"]*/SIP_DOMAIN=$KAMAILIO_IP/" /etc/kamailio/kamctlrc
sed -i -E "s/DBACCESSHOST=[^\"]*/DBACCESSHOST=$KAMAILIO_IP/" /etc/kamailio/kamctlrc

systemctl restart kamailio.service
