#! /bin/bash

# R-Cabang
enable
configure terminal
interface Serial0/1/0
 ip address 10.0.4.66 255.255.255.252
 clock rate 128000
 no shutdown
 exit
interface GigabitEthernet0/0/0
 ip address 10.0.3.193 255.255.255.192
 no shutdown
 exit
ip dhcp excluded-address 10.0.3.193 10.0.3.200
ip dhcp pool cabang
 network 10.0.3.192 255.255.255.192
 default-router 10.0.3.193
 dns-server 8.8.8.8
 exit
end
write memory

# SW-Cabang

enable
configure terminal
hostname SW-Cabang
interface GigabitEthernet0/1
 switchport mode access
 switchport access vlan 100
 no shutdown
 exit
interface FastEthernet0/1
 switchport mode access
 switchport access vlan 100
 no shutdown
 exit
vlan 100
 name LAN-Cabang
exit
end
write memory

# cek di switch
SW-Utama# show vlan brief