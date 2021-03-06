! -*- ospf -*-
!
hostname ospfd
password zebra
!
interface eth0
!
interface eth1
 ip ospf cost 50
!
interface eth2
 ip ospf cost 50
!
interface lo
!
router ospf
 ospf router-id 0.0.0.3
 network 192.168.50.0/24 area 0.0.0.0
 network 192.168.70.0/24 area 0.0.0.0
