#!/bin/sh

COTURN_IP=${coturn_ip}
COTURN_DOMAIN=${coturn_domain}
COTURN_PORT=${coturn_port}
STUN_USER=${stun_user}
STUN_PASS=${stun_pass}

sed -i -E "s/listening-port=[0-9]{1,5}/listening-port=$COTURN_PORT/" /etc/turnserver.conf
sed -i -E "s/external-ip=([0-9]{1,3}\.){3}[0-9]{1,3}/external-ip=$COTURN_IP/" /etc/turnserver.conf
sed -i -E "s/realm=.*$/realm=$COTURN_DOMAIN/" /etc/turnserver.conf
sed -i -E "s/user=[^:]*:[^\"]*$/user=$STUN_USER:$STUN_PASS/" /etc/turnserver.conf

systemctl restart coturn.service
