# Client  DHCP
# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp
EOF

ip addr add 10.92.0.130/25 dev eth0
ip route add default via 10.92.0.129

cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF