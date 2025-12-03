# Client  DHCP
# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF

cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF