#! /bin/bash

# R-GedungUtama
en
conf t
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
interface GigabitEthernet0/0/0
ip nat inside
exit

ip nat inside source list 1 interface Serial0/1/0 overload

ip route 0.0.0.0 0.0.0.0 10.10.10.2

router ospf 1
default-information originate
end

# R-Core
hostname R-Core
interface loopback 0
ip address 8.8.8.8 255.255.255.255
no shut
exit

ip route 10.10.10.1 255.255.255.255 10.10.10.1 
end