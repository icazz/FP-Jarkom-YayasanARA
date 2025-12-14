#! /bin/bash

# R-ARATech
enable
configure terminal

interface Serial0/2/0
 ip address 10.0.4.74 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/0
 no shutdown
 exit
interface GigabitEthernet0/0/0.6
 encapsulation dot1Q 6
 ip address 10.0.1.1 255.255.255.252
 exit
interface GigabitEthernet0/0/0.7
 encapsulation dot1Q 7
 ip address 10.0.2.1 255.255.255.252
 exit
interface GigabitEthernet0/0/0.8
 encapsulation dot1Q 8
 ip address 10.0.6.1 255.255.255.252
 exit
interface GigabitEthernet0/0/0.9
 encapsulation dot1Q 9
 ip address 10.0.5.1 255.255.255.252
 exit
interface GigabitEthernet0/0/0.10
 encapsulation dot1Q 10
 ip address 10.0.8.65 255.255.255.252
 exit

end
write memory

# SW-ARA-Utama
enable
configure terminal

vlan 6
 name Link-LT1
vlan 7
 name Link-LT2
vlan 8
 name Link-LT3
vlan 9
 name Link-LT4
vlan 10
 name Link-LT5
exit

interface GigabitEthernet0/1
 switchport mode trunk
 no shutdown
 exit

interface FastEthernet0/2
 switchport mode access
 switchport access vlan 6
 no shutdown
 exit
interface FastEthernet0/3
 switchport mode access
 switchport access vlan 7
 no shutdown
 exit
interface FastEthernet0/4
 switchport mode access
 switchport access vlan 8
 no shutdown
 exit
interface FastEthernet0/5
 switchport mode access
 switchport access vlan 9
 no shutdown
 exit
interface FastEthernet0/6
 switchport mode access
 switchport access vlan 10
 no shutdown
 exit

end
write memory

# optional di switch 
interface FastEthernet0/1
 switchport mode access
 switchport access vlan 1
 no shutdown
 exit

# R-LT1
enable
configure terminal
interface GigabitEthernet0/0/0
 ip address 10.0.1.2 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.0.1 255.255.255.128
 no shutdown
 exit
ip dhcp excluded-address 10.0.0.1 10.0.0.10
ip dhcp pool lantai1
 network 10.0.0.0 255.255.255.128
 default-router 10.0.0.1
 dns-server 8.8.8.8
 exit
end
write memory

# R-LT2
enable
configure terminal
interface GigabitEthernet0/0/1
 ip address 10.0.2.2 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/0
 ip address 10.0.0.129 255.255.255.128
 no shutdown
 exit
ip dhcp excluded-address 10.0.0.129 10.0.0.139
ip dhcp pool lantai2
 network 10.0.0.128 255.255.255.128
 default-router 10.0.0.129
 dns-server 8.8.8.8
 exit
end
write memory

# R-LT3
enable
configure terminal
interface GigabitEthernet0/0/0
 ip address 10.0.6.2 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.4.1 255.255.255.128
 no shutdown
 exit
ip dhcp excluded-address 10.0.4.1 10.0.4.10
ip dhcp pool lantai3
 network 10.0.4.0 255.255.255.128
 default-router 10.0.4.1
 dns-server 8.8.8.8
 exit
end
write memory

# R-LT4
enable
configure terminal
interface GigabitEthernet0/0/1
 ip address 10.0.5.2 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/0
 ip address 10.0.4.129 255.255.255.128
 no shutdown
 exit
ip dhcp excluded-address 10.0.4.129 10.0.4.139
ip dhcp pool lantai4
 network 10.0.4.128 255.255.255.128
 default-router 10.0.4.129
 dns-server 8.8.8.8
 exit
end
write memory

# R-LT5
enable
configure terminal
interface GigabitEthernet0/0/1
 ip address 10.0.8.66 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/0
 ip address 10.0.8.1 255.255.255.192
 no shutdown
 exit
ip dhcp excluded-address 10.0.8.1 10.0.8.10
ip dhcp pool lantai5
 network 10.0.8.0 255.255.255.192
 default-router 10.0.8.1
 dns-server 8.8.8.8
 exit
end
write memory

# cek di switch
SW-Utama# show vlan brief