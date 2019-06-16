#!/bin/bash

ip link add tap0 type gretap local 192.168.254.2 remote 192.168.254.1
ip link set up tap0
ip a a 192.168.10.2/30 dev tap0