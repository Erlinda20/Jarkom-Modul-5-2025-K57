# Router 

# Konfigurasi IP static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.18
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.92.0.25
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.92.0.21
    netmask 255.255.255.252
EOF


cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF

# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Default route ke osgiliath
# Lewat Osgiliath
route add -net 10.92.0.0  netmask 255.255.255.252 gw 10.92.0.17 # A1
route add -net 10.92.0.4  netmask 255.255.255.252 gw 10.92.0.17 # A2
route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.17 # A3
route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.17 # A4
route add -net 10.92.0.8  netmask 255.255.255.252 gw 10.92.0.17 # A5
route add -net 10.92.0.12 netmask 255.255.255.252 gw 10.92.0.17 # A6
route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.17 # A7
route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.17 # A8

# Lewat Pelargir
route add -net 10.92.0.28  netmask 255.255.255.252 gw 10.92.0.22 # A12
route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.22 # A13

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-relay

cat << EOF > /etc/default/isc-dhcp-relay
SERVERS="10.92.0.42"
INTERFACES="eth1 eth0 eth3 eth2"
OPTIONS=""
EOF

service isc-dhcp-relay restart
