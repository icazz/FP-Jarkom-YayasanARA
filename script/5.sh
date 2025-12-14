#! /bin/bash

# R-GedungUtama
enable
configure terminal
router ospf 1 
 router-id 1.1.1.1 
network 10.0.4.68 0.0.0.3 area 0
network 10.0.4.72 0.0.0.3 area 0
network 10.0.4.64 0.0.0.3 area 0
network 10.0.4.40 0.0.0.3 area 1
network 10.0.4.44 0.0.0.3 area 1
network 10.0.4.48 0.0.0.3 area 1
network 10.0.4.52 0.0.0.3 area 1
network 10.0.4.56 0.0.0.3 area 1
network 10.0.4.60 0.0.0.3 area 1
end
write memory

# R-ARATech
enable
configure terminal
router ospf 2
 router-id 2.2.2.2
network 10.0.4.72 0.0.0.3 area 0
network 10.0.1.0 0.0.0.3 area 2
network 10.0.2.0 0.0.0.3 area 2
network 10.0.6.0 0.0.0.3 area 2
network 10.0.5.0 0.0.0.3 area 2
network 10.0.8.64 0.0.0.3 area 2
end
write memory

# R-Cabang
enable
configure terminal
router ospf 3
 router-id 3.3.3.3
network 10.0.4.64 0.0.0.3 area 0
network 10.0.3.192 0.0.0.63 area 3
end
write memory

# Router Internal

# R-SDM
enable
configure terminal
router ospf 10
 router-id 10.10.10.1
network 10.0.4.40 0.0.0.3 area 1
network 10.0.3.0 0.0.0.127 area 1 
end
write memory

# R-Kurikulum
enable
configure terminal
router ospf 10
 router-id 10.10.10.2
network 10.0.4.44 0.0.0.3 area 1
network 10.0.2.0 0.0.0.255 area 1 
end
write memory

# R-Sarpras
enable
configure terminal
router ospf 10
 router-id 10.10.10.3
network 10.0.4.48 0.0.0.3 area 1
network 10.0.3.128 0.0.0.63 area 1 
end
write memory

# R-Pengawasan
enable
configure terminal
router ospf 10
 router-id 10.10.10.4
network 10.0.4.52 0.0.0.3 area 1
network 10.0.4.0 0.0.0.31 area 1 
end
write memory

# R-LayananOps
enable
configure terminal
router ospf 10
 router-id 10.10.10.5
network 10.0.4.56 0.0.0.3 area 1
network 10.0.0.0 0.0.1.255 area 1 
end
write memory

# R-ServerIT
enable
configure terminal
router ospf 10
 router-id 10.10.10.6
network 10.0.4.60 0.0.0.3 area 1
network 10.0.4.32 0.0.0.7 area 1 
end
write memory

# R-LT1
enable
configure terminal
router ospf 20
 router-id 20.20.20.1
network 10.0.1.0 0.0.0.3 area 2
network 10.0.0.0 0.0.0.127 area 2
end
write memory

# R-LT2
enable
configure terminal
router ospf 20
 router-id 20.20.20.2
network 10.0.2.0 0.0.0.3 area 2
network 10.0.0.128 0.0.0.127 area 2
end
write memory

# R-LT3
enable
configure terminal
router ospf 20
 router-id 20.20.20.3
network 10.0.6.0 0.0.0.3 area 2
network 10.0.4.0 0.0.0.127 area 2
end
write memory

# R-LT4
enable
configure terminal
router ospf 20
 router-id 20.20.20.4
network 10.0.5.0 0.0.0.3 area 2
network 10.0.4.128 0.0.0.127 area 2
end
write memory

# R-LT5
enable
configure terminal
router ospf 20
 router-id 20.20.20.5
network 10.0.8.64 0.0.0.3 area 2
network 10.0.8.0 0.0.0.63 area 2
end
write memory

# cek di router inti
# R-GedungUtama
show ip ospf neighbor
# R-Cabang
show ip route
# test
ping ip