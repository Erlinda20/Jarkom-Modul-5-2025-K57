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
route add -net 10.92.0.0  netmask 255.255.255.252 gw 10.92.0.13 # A1
route add -net 10.92.0.4  netmask 255.255.255.252 gw 10.92.0.13 # A2
route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.13 # A3
route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.13 # A4
route add -net 10.92.0.8  netmask 255.255.255.252 gw 10.92.0.13 # A5
route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.13 # A8
route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.13 # A9
route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.13 # A10
route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.13 # A11
route add -net 10.92.0.28 netmask 255.255.255.252 gw 10.92.0.13 # A12
route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.13 # A13

