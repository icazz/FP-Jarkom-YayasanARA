#! /bin/bash

# R-Cabang
en
conf ter
interface Serial0/1/0
ip address 10.10.20.2 255.255.255.252
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.1.200.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.200.1 10.1.200.10
ip dhcp pool cabang
network 10.1.200.0 255.255.255.0
default-router 10.1.200.1
dns-server 8.8.8.8
exit

R-Cabang# copy running-config startup-config