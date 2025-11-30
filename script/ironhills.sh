# Konfigurasi IP static/DHCP  
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.2
    netmask 255.255.255.252
EOF
