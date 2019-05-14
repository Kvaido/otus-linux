#!/bin/bash

echo -e '0.0.0.0 via 192.168.0.1\n192.168.1.0/26 via 192.168.0.1\n192.168.2.0/26 via 192.168.0.1' > /etc/sysconfig/network-scripts/route-eth1
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0 
echo "GATEWAY=192.168.0.1" >> /etc/sysconfig/network-scripts/ifcfg-eth1
systemctl restart network