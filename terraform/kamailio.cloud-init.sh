#!/bin/sh

KAMAILIO_IP=$(hostname -I | grep -o -E "([0-9]{1,3}\.){3}[0-9]{1,3}")

GW_LAUNCHER_IP=1.2.3.4 # TODO: CHANGE THIS ADDRESS WITH THE SCALER IP LATER WHEN IMPLEMENTED
GW_LAUNCHER_PORT=6789 # TODO: CHANGE THIS PORT WITH THE SCALER PORT LATER WHEN IMPLEMENTED
GW_LAUNCHER_API_ROUTE=/a/b/c # TODO: CHANGE THIS ROUTE WITH THE SCALER ROUTE LATER WHEN IMPLEMENTED

COTURN_IP=${coturn_ip}
COTURN_PORT=${coturn_port}
STUN_USER=${stun_user}
STUN_PASS=${stun_pass}

SIP_SECRET=${sip_secret}

sed -i -E "s/sipSrv=\"([0-9]{1,3}\.){3}[0-9]{1,3}\"/sipSrv=\"$KAMAILIO_IP\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s/sipSecret=\"[^\"]*\"/sipSecret=\"$SIP_SECRET\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s/turnConfig=\"turn:([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5};stunuser=[^;]*;stunpass=[^\"]*\"/turnConfig=\"turn:$COTURN_IP:$COTURN_PORT;stunuser=$STUN_USER;stunpass=$STUN_PASS\"/" /etc/kamailio/sipmediagw.cfg
sed -i -E "s;launcherAPIPath=\"http://([0-9]{1,3}\.){3}[0-9]{1,3}:[0-9]{1,5}/[^\"]*\";launcherAPIPath=\"http://$GW_LAUNCHER_IP:$GW_LAUNCHER_PORT$GW_LAUNCHER_API_ROUTE\";" /etc/kamailio/sipmediagw.cfg

sed -i -E "s/alias=\"[^\"]*\"/alias=\"$KAMAILIO_IP\"/" /etc/kamailio/kamailio.cfg

sed -i -E "s/SIP_DOMAIN=[^\"]*/SIP_DOMAIN=$KAMAILIO_IP/" /etc/kamailio/kamctlrc
sed -i -E "s/DBACCESSHOST=[^\"]*/DBACCESSHOST=$KAMAILIO_IP/" /etc/kamailio/kamctlrc
