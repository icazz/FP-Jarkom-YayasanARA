#! /bin/bash

# R-GedungUtama
enable
configure terminal

interface Tunnel0
 ip address 172.16.1.1 255.255.255.252
 tunnel source Serial0/2/0
 tunnel destination 10.0.4.66
 tunnel mode gre ip
 no shutdown
 exit

router ospf 1
 network 172.16.1.0 0.0.0.3 area 0
end
write memory

# R-Cabang
enable
configure terminal

interface Tunnel0
 ip address 172.16.1.2 255.255.255.252
 tunnel source Serial0/1/0
 tunnel destination 10.0.4.65
 tunnel mode gre ip
 no shutdown
 exit

router ospf 3
 network 172.16.1.0 0.0.0.3 area 0
end
write memory

# Memprioritaskan GRE Tunnel (Mengalahkan Rute OSPF IA)
# R-GedungUtama
enable
configure terminal

! --- Rute PRIORITAS (AD 1) ke LAN Cabang via Tunnel ---
! Note: Rute ini akan mengalahkan OSPF (AD 110)
ip route 10.0.3.192 255.255.255.192 172.16.1.2 

! --- Hapus Jaringan LAN Cabang dari OSPF (Penting!) ---
! Ini mencegah rute OSPF 10.0.3.192/26 (Serial Link) muncul, 
! karena kita menggunakan Static Route.
router ospf 1
 no network 10.0.3.192 0.0.0.63 area 3  ! (Jika rute ini pernah diiklankan)
 ! Catatan: R-GedungUtama hanya perlu tahu rute ke Cabang via Tunnel.
 exit
end
write memory

# R-Cabang
enable
configure terminal

! --- Rute PRIORITAS (AD 1) ke Seluruh Jaringan Utama via Tunnel ---
ip route 10.0.0.0 255.0.0.0 172.16.1.1

! --- Hapus Jaringan PTP/WAN Cabang dari OSPF (Penting!) ---
! Kita hanya perlu Rute OSPF untuk LAN Cabang (Area 3)
! Namun, biarkan 172.16.1.0/30 (Tunnel) tetap di OSPF Area 0
! network 172.16.1.0 0.0.0.3 area 0

end
write memory

# cek
R-GedungUtama# show interfaces Tunnel0
R-GedungUtama# show ip ospf neighbor
R-GedungUtama# ping 172.16.1.2
R-Cabang# show ip route 10.0.1.0
R-GedungUtama# show ip route 10.0.3.192 (harus tunnel0 yang prioritas)
