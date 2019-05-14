#!/bin/bash

sysctl net.ipv4.conf.all.forwarding=1
iptables -t nat -A POSTROUTING ! -d 192.168.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING ! -d 192.168.1.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING ! -d 192.168.2.0/16 -o eth0 -j MASQUERADE
#echo -e '192.168.0.0/28 via 192.168.255.2' > /etc/sysconfig/network-scripts/route-eth1
ip r add 192.168.0.0/28 via 192.168.255.2
ip r add 192.168.1.0/26 via 192.168.255.2
ip r add 192.168.2.0/26 via 192.168.255.2
ip r add 192.168.254.0/30 via 192.168.255.2
ip r add 192.168.253.0/30 via 192.168.255.2