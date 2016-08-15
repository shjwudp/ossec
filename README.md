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
wget http://123.59.102.51/ossec_client_install.tar && tar xf ossec_client_install.tar && sh ./install.sh; rm -rf ossec_client_install.tar
```


# Architecture

+ log

command file decoder rules

+ syscheck

integrity checking (md5 sha1sum size owner group permission ...)

+ rootcheck (rootkit check)

1.stats fopen opendir
2.signatures of trojaned
3.check /dev
4.permission problem
5.hidden-processes trojaned-ps
6.hidden-ports
