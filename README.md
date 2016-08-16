BaishanCloud

# install

server:

```
wget -q -O – https://www.atomicorp.com/installers/atomic | sh
yum update -y
yum install -y mysql-devel openssl-devel ossec-hids ossec-hids-server

cd /var/ossec
# 开启ossec-agent注册服务器（用完关掉
./bin/ossec-authd
```

client:

```
sh ./sh/install.sh SERVER_IP SERVER_PORT(1515)
```


# Features

+ log

    command file decoder rules

+ syscheck

    integrity checking (md5 sha1sum size owner group permission ...)

+ rootcheck (rootkit check)

    1.  stats fopen opendir
    1.  signatures of trojaned
    1.  check /dev
    1.  permission problem
    1.  hidden-processes trojaned-ps
    1.  hidden-ports

# HELP

默认ossec根目录：
$OSSEC_HOME=/var/ossec

配置文件：
$OSSEC_HOME/etc/ossec.conf

ossec启动停止命令：
$OSSEC_HOME/bin/ossec-control

ossec-server注册agent命令（执行后开始接受注册）：
$OSSEC_HOME/bin/ossec-authd

ossec-agent注册命令：
$OSSEC_HOME/bin/agent-auth

