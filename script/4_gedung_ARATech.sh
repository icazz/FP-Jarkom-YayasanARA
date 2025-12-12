#! /bin/bash

# R-ARATech
en
conf ter
interface Serial0/2/0
ip address 10.10.30.1 255.255.255.252
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.2.99.1 255.255.255.0
no shut
exit

R-ARATech# copy running-config startup-config

# R-LT1
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.2.99.11 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.2.1.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.2.1.1 10.2.1.10
ip dhcp pool lantai1
network 10.2.1.0 255.255.255.0
default-router 10.2.1.1
dns-server 8.8.8.8
exit

R-LT1# copy running-config startup-config

# R-LT2
en
conf ter
interface GigabitEthernet0/0/1
ip address 10.2.99.12 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.2.2.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.2.2.1 10.2.2.10
ip dhcp pool lantai2
network 10.2.2.0 255.255.255.0
default-router 10.2.2.1
dns-server 8.8.8.8
exit

R-LT2# copy running-config startup-config

# R-LT3
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.2.99.13 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.2.3.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.2.3.1 10.2.3.10
ip dhcp pool lantai3
network 10.2.3.0 255.255.255.0
default-router 10.2.3.1
dns-server 8.8.8.8
exit

R-LT3# copy running-config startup-config

# R-LT4
en
conf ter
interface GigabitEthernet0/0/1
ip address 10.2.99.14 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.2.4.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.2.4.1 10.2.4.10
ip dhcp pool lantai4
network 10.2.4.0 255.255.255.0
default-router 10.2.4.1
dns-server 8.8.8.8
exit

R-LT4# copy running-config startup-config

# R-LT5
en
conf ter
interface GigabitEthernet0/0/1
ip address 10.2.99.15 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.2.5.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.2.5.1 10.2.5.10
ip dhcp pool lantai5
network 10.2.5.0 255.255.255.0
default-router 10.2.5.1
dns-server 8.8.8.8
exit

R-LT5# copy running-config startup-config