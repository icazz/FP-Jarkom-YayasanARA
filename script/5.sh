#! /bin/bash

# R-GedungUtama
en
conf ter
router ospf 1 
network 10.10.10.0 0.0.0.3 area 0
network 10.10.30.0 0.0.0.3 area 0
network 10.10.20.0 0.0.0.3 area 0
network 10.1.99.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-ARATech
en
conf ter
router ospf 2
network 10.10.30.0 0.0.0.3 area 0
network 10.2.99.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# R-Cabang
en
conf ter
router ospf 3
network 10.10.20.0 0.0.0.3 area 0
network 10.1.200.0 0.0.0.255 area 3
end
Router# copy running-config startup-config

# Router Internal

# R-SDM
en
conf ter
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.10.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-Kurikulum
en
conf ter
hostname R-Kurikulum
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.20.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-Sarpras
en
conf ter
hostname R-Sarpras
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.30.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-Pengawasan
en
conf ter
hostname R-Pengawasan
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.40.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-LayananOps
en
conf ter
hostname R-LayananOps
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.50.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-ServerIT
en
conf ter
hostname R-ServerIT
router ospf 10
network 10.1.99.0 0.0.0.255 area 1
network 10.1.60.0 0.0.0.255 area 1 
end
Router# copy running-config startup-config

# R-LT1
en
conf ter
router ospf 20
network 10.2.99.0 0.0.0.255 area 2
network 10.2.1.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# R-LT2
en
conf ter
hostname R-LT2
router ospf 20
network 10.2.99.0 0.0.0.255 area 2
network 10.2.2.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# R-LT3
en
conf ter
hostname R-LT3
router ospf 20
network 10.2.99.0 0.0.0.255 area 2
network 10.2.3.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# R-LT4
en
conf ter
hostname R-LT4
router ospf 20
network 10.2.99.0 0.0.0.255 area 2
network 10.2.4.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# R-LT5
en
conf ter
hostname R-LT5
router ospf 20
network 10.2.99.0 0.0.0.255 area 2
network 10.2.5.0 0.0.0.255 area 2
end
Router# copy running-config startup-config

# cek di router inti
show ip ospf neighbor
show ip route
# test
ping ip