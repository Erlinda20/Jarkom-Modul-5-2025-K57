# Router 

# Konfigurasi IP static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.30
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.129
    netmask 255.255.255.128
EOF


cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF
# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Default route ke Pelargir
route add -net 10.92.0.0  netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.0.4  netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.29
route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.29
route add -net 10.92.0.8  netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.0.12 netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.29
route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.29
route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.29
route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.29

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-relay

cat << EOF > /etc/default/isc-dhcp-relay
SERVERS="10.92.0.42"
INTERFACES="eth1 eth0"
OPTIONS=""
EOF

service isc-dhcp-relay restart
