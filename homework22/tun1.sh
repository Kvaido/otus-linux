#!/bin/bash

ip tunnel add tun0 mode gre local 192.168.255.1 remote 192.168.255.2
ip link set up tun0
ip a a dev tun0 192.168.20.1 peer 192.168.20.2/32