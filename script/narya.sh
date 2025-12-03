# DNS Server

# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.43
    netmask 255.255.255.248
EOF


cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 dnsutils

cat << EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";
    recursion yes;
    allow-query { 10.92.0.42; 127.0.0.1; };
    allow-recursion { 10.92.0.42; 127.0.0.1; };
    forwarders { 192.168.122.1; };
    listen-on { 10.92.0.43; 127.0.0.1; };
    listen-on-v6 { none; };
    dnssec-validation auto;
};
EOF

service bind9 restart

# Hanya Vilya yang boleh mengakses DNS (Mission 2.3)
iptables -A INPUT -p udp --dport 53 ! -s 10.92.0.42 -j DROP
iptables -A INPUT -p tcp --dport 53 ! -s 10.92.0.42 -j DROP
