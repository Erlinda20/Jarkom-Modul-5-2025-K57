# Router 

# Konfigurasi IP static/DHCP 
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth2
iface eth2 inet static
    address 10.92.0.1
    netmask 255.255.255.252

auto eth1
iface eth1 inet static
    address 10.92.0.5
    netmask 255.255.255.252

auto eth0
iface eth0 inet static
    address 10.92.0.10
    netmask 255.255.255.252
EOF





# Misi 1 no 3
echo 1 > /proc/sys/net/ipv4/ip_forward
# Lewat Wilderland
route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.6   # A3
route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.6   # A4

# Lewat Osgiliath
route add -net 10.92.0.12 netmask 255.255.255.252 gw 10.92.0.9   # A6
route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.9   # A8
route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.9   # A7
route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.9   # A9
route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.9   # A10
route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.9   # A11
route add -net 10.92.0.28 netmask 255.255.255.252 gw 10.92.0.9   # A12
route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.9  # A13

