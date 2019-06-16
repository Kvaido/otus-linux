#!/bin/bash

yum install epel-release -y
yum install openvpn easy-rsa -y
sed -i '65s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
cp /vagrant/openvpn-server-ca.crt /etc/openvpn/
cp /vagrant/openvpn-server.key /etc/openvpn/
cp /vagrant/openvpn-server.crt /etc/openvpn/
cp /vagrant/openvpn-server-dh.pem /etc/openvpn/
cp /vagrant/server.conf /etc/openvpn/
systemctl enable openvpn@server
systemctl start openvpn@server