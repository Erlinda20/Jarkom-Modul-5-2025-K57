# Router 

# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.14
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.41
    netmask 255.255.255.248
EOF

# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Default route ke osgiliath
ip route add default via 10.92.0.13
