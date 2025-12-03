# DHCP Server

# Konfigurasi IP Static/DHCP
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.42
    netmask 255.255.255.248
EOF


cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y isc-dhcp-server bind9 dnsutils

cat << EOF > /etc/default/isc-dhcp-server
INTERFACESv4="eth0"
INTERFACESv6=""
EOF

cat << 'EOF' > /etc/dhcp/dhcpd.conf
authoritative;
default-lease-time 600;
max-lease-time 7200;
option domain-name-servers 10.92.0.42;

subnet 10.92.0.40 netmask 255.255.255.248 {
    option routers 10.92.0.41;
    option broadcast-address 10.92.0.47;
}

subnet 10.92.0.64 netmask 255.255.255.192 {
    range 10.92.0.66 10.92.0.126;
    option routers 10.92.0.65;
    option broadcast-address 10.92.0.127;
}

subnet 10.92.0.32 netmask 255.255.255.248 {
    range 10.92.0.34 10.92.0.38;
    option routers 10.92.0.33;
    option broadcast-address 10.92.0.39;
}

subnet 10.92.1.0 netmask 255.255.255.0 {
    range 10.92.1.2 10.92.1.254;
    option routers 10.92.1.1;
    option broadcast-address 10.92.1.255;
}

subnet 10.92.0.128 netmask 255.255.255.128 {
    range 10.92.0.130 10.92.0.254;
    option routers 10.92.0.129;
    option broadcast-address 10.92.0.255;
}
EOF

service isc-dhcp-server restart

# Konfigurasi BIND sebagai resolver internal yang meneruskan kueri ke Narya
cat << EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";
    recursion yes;
    allow-recursion { any; };
    allow-query { any; };
    forwarders { 10.92.0.43; };
    listen-on { 10.92.0.42; 127.0.0.1; };
    listen-on-v6 { none; };
    dnssec-validation auto;
};
EOF

service bind9 restart

# Blokir ping dari perangkat lain ke Vilya (Mission 2.2)
iptables -A INPUT -p icmp --icmp-type echo-request ! -s 10.92.0.42 -j DROP
