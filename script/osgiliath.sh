# Router 

# Konfigurasi IP static/DHCP 
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.92.0.13
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.92.0.9
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.92.0.17
    netmask 255.255.255.252
EOF

# Misi 1 no 3
# Aktifkan IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# Subnet yang melalui moria
ip route add 10.92.0.0/30 via 10.92.0.10   # A1 
ip route add 10.92.0.4/30 via 10.92.0.10   # A2 
ip route add 10.92.0.64/26 via 10.92.0.10  # A3 
ip route add 10.92.0.32/29 via 10.92.0.10  # A4 
# Subnet yang melalui rivendell
ip route add 10.92.0.40/29 via 10.92.0.14   # A7
# Subnet yang melalui minastir
ip route add 10.92.1.0/24 via 10.92.0.18     # A9 
ip route add 10.92.0.20/30 via 10.92.0.18    # A10 
ip route add 10.92.0.24/30 via 10.92.0.18    # A11 
ip route add 10.92.0.28/30 via 10.92.0.18    # A12 
ip route add 10.92.0.128/25 via 10.92.0.18   # A13 

