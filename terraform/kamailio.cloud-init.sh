#!/bin/sh

KAMAILIO_INTERNAL_IP=$(hostname -I | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}")
KAMAILIO_EXTERNAL_IP=${kamailio_ip}
KAMAILIO_DOMAIN=${kamailio_domain}
SIP_SECRET=${sip_secret}

sed -i -E "s/sipSrv=\"([0-9]{1,3}\.){3}[0-9]{1,3}\"/sipSrv=\"$KAMAILIO_EXTERNAL_IP\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s/sipSecret=\"[^\"]*\"/sipSecret=\"$SIP_SECRET\"/" /etc/kamailio/sipmediagw.cfg

if [ -z "$KAMAILIO_DOMAIN" ]
then
    sed -i -E "s/alias=\"[^\"]*\"/alias=\"$KAMAILIO_EXTERNAL_IP\"/" /etc/kamailio/kamailio.cfg
else
    sed -i -E "s/alias=\"[^\"]*\"/alias=\"$KAMAILIO_EXTERNAL_IP\"\nalias=\"$KAMAILIO_DOMAIN\"/" /etc/kamailio/kamailio.cfg
fi

sed -i -E "s/^listen=tcp:.*$/listen=tcp:$KAMAILIO_INTERNAL_IP:5060 advertise $KAMAILIO_EXTERNAL_IP:5060/" /etc/kamailio/kamailio.cfg
sed -i -E "s/^listen=tls:.*$/listen=tls:$KAMAILIO_INTERNAL_IP:5061 advertise $KAMAILIO_EXTERNAL_IP:5061/" /etc/kamailio/kamailio.cfg

sed -i -E "s/SIP_DOMAIN=[^\"]*/SIP_DOMAIN=$KAMAILIO_EXTERNAL_IP/" /etc/kamailio/kamctlrc
sed -i -E "s/DBACCESSHOST=[^\"]*/DBACCESSHOST=$KAMAILIO_INTERNAL_IP/" /etc/kamailio/kamctlrc

systemctl restart kamailio.service
