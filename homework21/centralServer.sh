#!/bin/bash
yum install epel-release -y
yum install nginx -y
yum install nmap -y
systemctl start nginx
systemctl enable nginx
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload
echo -e '0.0.0.0 via 192.168.0.1\n192.168.1.0/26 via 192.168.0.1\n192.168.255.0/26 via 192.168.0.1\n192.168.254.0/26 via 192.168.0.1' > /etc/sysconfig/network-scripts/route-eth1
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
echo "GATEWAY=192.168.0.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl restart network