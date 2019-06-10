#!/bin/bash

echo -e 'net.ipv4.conf.all.forwarding=1\nnet.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
systemctl start firewalld
systemctl enable firewalld
firewall-cmd --permanent --zone=public --add-masquerade
firewall-cmd --permanent --zone=public --add-forward-port=port=8080:proto=tcp:toport=80:toaddr=192.168.0.2
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --reload
ip r add 192.168.0.0/28 via 192.168.254.1