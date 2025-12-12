#! /bin/bash

# R-GedungUtama
en
conf ter
interface Serial0/1/0
ip address 10.10.10.1 255.255.255.252
clock rate 128000
no shu

interface Serial0/1/1
ip address 10.10.30.1 255.255.255.252
clock rate 128000
no shut
exit

interface Serial0/2/0
ip address 10.10.20.1 255.255.255.252
clock rate 128000
no shut
exit

interface GigabitEthernet0/0/0
ip address 10.1.99.1 255.255.255.0
no shut
exit

R-GedungUtama# copy running-config startup-config

# R-SDM
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.11 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.10.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.10.1 10.1.10.10
ip dhcp pool SDM
network 10.1.10.0 255.255.255.0
default-router 10.1.10.1
dns-server 8.8.8.8
exit

R-SDM# copy running-config startup-config

# R-Kurikulum
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.12 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.20.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.20.1 10.1.20.10
ip dhcp pool SDM
network 10.1.20.0 255.255.255.0
default-router 10.1.20.1
dns-server 8.8.8.8
exit

R-Kurikulum# copy running-config startup-config

# R-Sarpras
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.13 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.30.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.30.1 10.1.30.10
ip dhcp pool SDM
network 10.1.30.0 255.255.255.0
default-router 10.1.30.1
dns-server 8.8.8.8
exit

R-Sarpras# copy running-config startup-config

# R-Pengawasan
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.14 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.40.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.40.1 10.1.40.10
ip dhcp pool SDM
network 10.1.40.0 255.255.255.0
default-router 10.1.40.1
dns-server 8.8.8.8
exit

R-Pengawasan# copy running-config startup-config

# R-Layanan Ops
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.15 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.50.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.50.1 10.1.50.10
ip dhcp pool SDM
network 10.1.50.0 255.255.255.0
default-router 10.1.50.1
dns-server 8.8.8.8
exit

R-LayananOps# copy running-config startup-config

# R-Server IT
en
conf ter
interface GigabitEthernet0/0/0
ip address 10.1.99.16 255.255.255.0
no shut
exit

interface GigabitEthernet0/0/1
ip address 10.1.60.1 255.255.255.0
no shut
exit

ip dhcp excluded-address 10.1.60.1 10.1.60.10
ip dhcp pool SDM
network 10.1.60.0 255.255.255.0
default-router 10.1.60.1
dns-server 8.8.8.8
exit

R-ServerIT# copy running-config startup-config