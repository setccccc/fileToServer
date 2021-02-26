#!/bin/sh

#注意换行符改为LF
#jdk
yum -y install java-1.8.0-openjdk* 
#tomcat
wget https://mirrors.cnnic.cn/apache/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz
tar -zxvf apache-tomcat-9.0.43.tar.gz
mv apache-tomcat-9.0.43 /usr/local
cd /usr/local/apache-tomcat-9.0.43/bin
#firewall
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=80/udp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=8080/udp --permanent
firewall-cmd --reload
firewall-cmd --zone=public --list-ports