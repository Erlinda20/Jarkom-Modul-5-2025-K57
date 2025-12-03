# Router 

# Konfigurasi IP static/DHCP 
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.9
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.13
    netmask 255.255.255.252

auto eth3
iface eth3 inet static
    address 10.92.0.17
    netmask 255.255.255.252
EOF



# Misi 1 no 3
# Aktifkan IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
# Lewat Moria (arah barat)
route add -net 10.92.0.0 netmask 255.255.255.252 gw 10.92.0.10   # A1
route add -net 10.92.0.4 netmask 255.255.255.252 gw 10.92.0.10   # A2
route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.10  # A3
route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.10  # A4

# Lewat Rivendell
route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.14  # A7

# Lewat Minastir (arah timur)
route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.18  # A9
route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.18  # A10
route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.18  # A11
route add -net 10.92.0.28 netmask 255.255.255.252 gw 10.92.0.18  # A12
route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.18 # A13

# Misi 2 no 1
# Enable IP Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Izinkan forward internal -> internet (via eth2 ke NAT1)
iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -i eth3 -o eth2 -j ACCEPT

# Izinkan return traffic
iptables -A FORWARD -i eth2 -m state --state ESTABLISHED,RELATED -j ACCEPT

# SNAT (NO MASQUERADE) dari jaringan Aliansi ke internet
iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 192.168.122.10



