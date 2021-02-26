#!/bin/sh

#注意换行符改为LF
#dependencies
yum install -y gcc
yum install -y pcre pcre-devel
yum install -y zlib zlib-devel
yum install -y openssl openssl-devel

#nginx1.9.9
cd /tmp
wget http://nginx.org/download/nginx-1.9.9.tar.gz
tar -zxvf  nginx-1.9.9.tar.gz 
cd nginx-1.9.9
./configure
make
make install
cd /usr/local/nginx/conf
cp nginx.conf.default nginx.conf

#open 80 port
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=80/udp --permanent
firewall-cmd --reload
firewall-cmd --zone=public --list-ports

#startup nginx
/usr/local/nginx/sbin/nginx

