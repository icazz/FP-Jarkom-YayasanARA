#! /bin/bash

enable
configure terminal
interface Serial0/1/0
 ip address 10.0.4.70 255.255.255.252
 clock rate 128000
 no shutdown
 exit
interface Loopback0
 ip address 8.8.8.8 255.255.255.255
 no shutdown
 exit
router ospf 4
 router-id 4.4.4.4
network 10.0.4.68 0.0.0.3 area 0
network 8.8.8.8 0.0.0.0 area 0
ip route 10.0.0.0 255.0.0.0 10.0.4.69
end
write memory