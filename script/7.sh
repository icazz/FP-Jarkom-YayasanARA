#! /bin/bash

# R-GedungUtama
en
conf t
interface Tunnel1
ip address 192.168.10.1 255.255.255.252
tunnel source Serial0/2/0    
tunnel destination 10.10.20.2
tunnel mode gre ip
no shut
exit

router ospf 1
network 192.168.10.0 0.0.0.3 area 0
end
copy running-config startup-config

# R-Cabang
en
conf t
interface Tunnel1
ip address 192.168.10.2 255.255.255.252
tunnel source Serial0/1/0 
tunnel destination 10.10.20.1
tunnel mode gre ip
no shut
exit

router ospf 3
network 192.168.10.0 0.0.0.3 area 0
end
copy running-config startup-config

# R-GedungUtama atau R-Cabang
show interface Tunnel 1

# R-GedungUtama: ping 192.168.10.2 (IP Tunnel R-Cabang)