! -*- zebra -*-
!
! Zebra configuration saved from vty
!   2019/05/25 14:40:53
!
log file /var/log/quagga/guagga.log
!
interface eth0
 ipv6 nd suppress-ra
!
interface eth1
 ip address 192.168.70.11/24
 ipv6 nd suppress-ra
!
interface eth2
 ip address 192.168.50.11/24
 ipv6 nd suppress-ra
!
interface lo
!
ip forwarding
!
!
!line vty
!
end