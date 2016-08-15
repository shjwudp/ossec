#!/bin/sh

cd "$(cd `dirname $0`; pwd)"

./atomic.sh

server_ip=$1
server_authd_port=$2

yum update -y

yum install -y openssl-devel ossec-hids ossec-hids-client

sed -i -e '/<client>/,/<\/client>/ s|<server-ip>[0-9.:]*<\/server-ip>|<server-ip>'$server_ip'<\/server-ip>|g' /var/ossec/etc/ossec.conf

cd /var/ossec/

bin/agent-auth -m $server_ip -p $server_authd_port
bin/ossec-control restart
