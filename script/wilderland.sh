# Router 

# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.6
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.65
    netmask 255.255.255.192

auto eth2
iface eth2 inet static
    address 10.92.0.33
    netmask 255.255.255.248
EOF


cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF


# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Default route ke moria
# Ke A1 IronHills
route add -net 10.92.0.0 netmask 255.255.255.252 gw 10.92.0.5

# Lewat Moria ke seluruh timur
route add -net 10.92.0.8  netmask 255.255.255.252 gw 10.92.0.5   # A5
route add -net 10.92.0.12 netmask 255.255.255.252 gw 10.92.0.5   # A6
route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.5   # A7
route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.5   # A8
route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.5   # A9
route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.5   # A10
route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.5   # A11
route add -net 10.92.0.28 netmask 255.255.255.252 gw 10.92.0.5   # A12
route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.5  # A13

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-relay

cat << EOF > /etc/default/isc-dhcp-relay
SERVERS="10.92.0.42"
INTERFACES="eth1 eth2 eth0"
OPTIONS=""
EOF

service isc-dhcp-relay restart

# Sihir hitam: semua paket dari Vilya ke jaringan Khamul diarahkan ke IronHills
iptables -t nat -A PREROUTING -s 10.92.0.42 -d 10.92.0.32/29 -j DNAT --to-destination 10.92.0.2
