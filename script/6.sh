#! /bin/bash

# R-GedungUtama
enable
configure terminal
access-list 1 permit 10.0.0.0 0.255.255.255
interface Serial0/1/0
 ip nat outside
 exit
interface Serial0/1/1
 ip nat inside
 exit
interface Serial0/2/0
 ip nat inside
 exit
interface GigabitEthernet0/0/0.18
 ip nat inside
 exit
interface GigabitEthernet0/0/0.19
 ip nat inside
 exit
interface GigabitEthernet0/0/0.20
 ip nat inside
 exit
interface GigabitEthernet0/0/0.21
 ip nat inside
 exit
interface GigabitEthernet0/0/0.22
 ip nat inside
 exit
interface GigabitEthernet0/0/0.23
 ip nat inside
 exit
ip nat inside source list 1 interface Serial0/1/0 overload
ip route 0.0.0.0 0.0.0.0 10.0.4.70
router ospf 1
 default-information originate
end
write memory

# R-Core
enable
configure terminal
ip route 10.0.0.0 255.0.0.0 10.0.4.69
end
write memory


# test
ping 10.0.0.141
ping 10.0.4.11
ping 10.0.3.201
ping 8.8.8.8

# cek
R-GedungUtama# show ip nat translations