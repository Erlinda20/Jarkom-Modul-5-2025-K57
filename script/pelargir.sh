# Router 

# Konfigurasi IP static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.25
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.22
    netmask 255.255.255.252

auto eth2
iface eth2 inet static
    address 10.92.0.29
    netmask 255.255.255.252
EOF


# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Default route ke Minastir
ip route add default via 10.92.0.21
