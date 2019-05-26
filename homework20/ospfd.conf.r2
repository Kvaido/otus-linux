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
 ip ospf cost 1000
!
interface lo
!
router ospf
 ospf router-id 0.0.0.2
 network 192.168.60.0/24 area 0.0.0.0
 network 192.168.70.0/24 area 0.0.0.0
