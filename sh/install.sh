#!/bin/sh

cd "$(cd `dirname $0`; pwd)"

# 下载ossec的软件源
sh ./atomic.sh
if [ "$?" != "0" ]; then
    echo "Failed: sh ./atomic.sh"
    exit 1
fi

server_ip=$1
server_authd_port=$2

yum update -y
yum install -y openssl-devel ossec-hids ossec-hids-client

# 填写配置文件中的server IP
sed -i -e '/<client>/,/<\/client>/ s|<server-ip>[0-9.:]*<\/server-ip>|<server-ip>'$server_ip'<\/server-ip>|g' /var/ossec/etc/ossec.conf

cd /var/ossec/

# 注册agent
bin/agent-auth -m $server_ip -p $server_authd_port
# 重启agent
bin/ossec-control restart
