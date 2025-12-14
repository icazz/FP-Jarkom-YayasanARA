#! /bin/bash

# R-GedungUtama
enable
configure terminal

interface Serial0/1/0
 ip address 10.0.4.69 255.255.255.252
 clock rate 128000
 no shutdown
 exit
interface Serial0/1/1
 ip address 10.0.4.73 255.255.255.252
 clock rate 128000
 no shutdown
 exit
interface Serial0/2/0
 ip address 10.0.4.65 255.255.255.252
 clock rate 128000
 no shutdown
 exit
interface GigabitEthernet0/0/0
 no shutdown
 exit
interface GigabitEthernet0/0/0.18
 encapsulation dot1Q 18
 ip address 10.0.4.41 255.255.255.252
 exit
interface GigabitEthernet0/0/0.19
 encapsulation dot1Q 19
 ip address 10.0.4.45 255.255.255.252
 exit
interface GigabitEthernet0/0/0.20
 encapsulation dot1Q 20
 ip address 10.0.4.49 255.255.255.252
 exit
interface GigabitEthernet0/0/0.21
 encapsulation dot1Q 21
 ip address 10.0.4.53 255.255.255.252
 exit
interface GigabitEthernet0/0/0.22
 encapsulation dot1Q 22
 ip address 10.0.4.57 255.255.255.252
 exit
interface GigabitEthernet0/0/0.23
 encapsulation dot1Q 23
 ip address 10.0.4.61 255.255.255.252
 exit

end
write memory

# Switch Distribution Gedung Utama
enable
configure terminal
hostname SW-Utama

vlan 18
 name Link-SDM
vlan 19
 name Link-Kurikulum
vlan 20
 name Link-Sarpras
vlan 21
 name Link-Pengawasan
vlan 22
 name Link-LayananOps
vlan 23
 name Link-ServerIT
exit

interface GigabitEthernet0/1
 switchport mode trunk
 no shutdown
 exit

interface FastEthernet0/1
 switchport mode access
 switchport access vlan 18
 no shutdown
 exit
interface FastEthernet0/2
 switchport mode access
 switchport access vlan 19
 no shutdown
 exit
interface FastEthernet0/3
 switchport mode access
 switchport access vlan 20
 no shutdown
 exit
interface FastEthernet0/4
 switchport mode access
 switchport access vlan 21
 no shutdown
 exit
interface FastEthernet0/5
 switchport mode access
 switchport access vlan 22
 no shutdown
 exit
interface FastEthernet0/6
 switchport mode access
 switchport access vlan 23
 no shutdown
 exit

end
write memory

# R-SDM
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.42 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.3.1 255.255.255.128
 no shutdown
 exit
ip dhcp excluded-address 10.0.3.1 10.0.3.10
ip dhcp pool SDM
 network 10.0.3.0 255.255.255.128
 default-router 10.0.3.1
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# R-Kurikulum
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.46 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.2.1 255.255.255.0
 no shutdown
 exit
ip dhcp excluded-address 10.0.2.1 10.0.2.10
ip dhcp pool KURIKULUM
 network 10.0.2.0 255.255.255.0
 default-router 10.0.2.1
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# R-Sarpras
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.50 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.3.129 255.255.255.192
 no shutdown
 exit
ip dhcp excluded-address 10.0.3.129 10.0.3.139
ip dhcp pool SARPRAS
 network 10.0.3.128 255.255.255.192
 default-router 10.0.3.129
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# R-Pengawasan
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.54 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.4.1 255.255.255.224
 no shutdown
 exit
ip dhcp excluded-address 10.0.4.1 10.0.4.10
ip dhcp pool PENGAWASAN
 network 10.0.4.0 255.255.255.224
 default-router 10.0.4.1
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# R-LayananOps
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.58 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.0.1 255.255.254.0
 no shutdown
 exit
ip dhcp excluded-address 10.0.0.1 10.0.0.10
ip dhcp pool LAYANAN-OPS
 network 10.0.0.0 255.255.254.0
 default-router 10.0.0.1
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# R-ServerIT
enable
configure terminal

interface GigabitEthernet0/0/0
 ip address 10.0.4.62 255.255.255.252
 no shutdown
 exit
interface GigabitEthernet0/0/1
 ip address 10.0.4.33 255.255.255.248
 no shutdown
 exit
ip dhcp excluded-address 10.0.4.33 10.0.4.34
ip dhcp pool SERVER-IT
 network 10.0.4.32 255.255.255.248
 default-router 10.0.4.33
 dns-server 8.8.8.8
 exit
end
copy running-config startup-config

# cek di switch
SW-Utama# show vlan brief