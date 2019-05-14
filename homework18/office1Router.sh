#!/bin/bash

echo -e 'net.ipv4.conf.all.forwarding=1\nnet.ipv4.ip_forward=1' >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
echo -e '192.168.254.0/30 via 192.168.254.2\n192.168.255.0/30 via 192.168.254.1' > /etc/sysconfig/network-scripts/route-eth1
echo -e '192.168.1.0/26 via 192.168.1.1' > /etc/sysconfig/network-scripts/route-eth2
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
echo "GATEWAY=192.168.254.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl restart network