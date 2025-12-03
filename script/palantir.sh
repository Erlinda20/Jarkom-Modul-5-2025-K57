# Konfigurasi IP static/DHCP  
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.26
    netmask 255.255.255.252
    gateway 10.92.0.25
EOF

cat << EOF > /etc/resolv.conf
nameserver 10.92.0.42
nameserver 192.168.122.1
EOF

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y apache2

HOSTNAME=$(hostname)
cat << EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>$HOSTNAME</title>
</head>
<body>
    <h1>Welcome to $HOSTNAME</h1>
</body>
</html>
EOF

service apache2 restart

# Firewall Mission 2.5 & 2.6 (tanpa chain tambahan, mengikuti modul)
# Bersihkan aturan lama agar tidak ganda
iptables -D INPUT -m recent --name PALANTIR_BLACKLIST --rcheck --seconds 600 -j DROP 2>/dev/null || true
iptables -D INPUT -p tcp --dport 1:100 -m recent --name PALANTIR_SCANNER --update --seconds 20 --hitcount 15 -j LOG_PORT_SCAN 2>/dev/null || true
iptables -D INPUT -p tcp --dport 1:100 -m recent --name PALANTIR_SCANNER --set 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -m recent --name PALANTIR_BLACKLIST --rcheck --seconds 600 -j DROP 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -s 10.92.0.128/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -s 10.92.1.0/24  -m time --timestart 17:00 --timestop 23:00 -j ACCEPT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -j REJECT 2>/dev/null || true

# Rantai logging untuk mendeteksi port scan
iptables -F LOG_PORT_SCAN 2>/dev/null || true
iptables -X LOG_PORT_SCAN 2>/dev/null || true
iptables -N LOG_PORT_SCAN
iptables -A LOG_PORT_SCAN -j LOG --log-prefix "PORT_SCAN_DETECTED "
iptables -A LOG_PORT_SCAN -m recent --name PALANTIR_BLACKLIST --set
iptables -A LOG_PORT_SCAN -j DROP

# Tolak semua paket dari penyerang yang sudah diblokir
iptables -I INPUT 1 -m recent --name PALANTIR_BLACKLIST --rcheck --seconds 600 -j DROP

# Deteksi pemindaian port 1-100 lebih dari 15 kali dalam 20 detik
iptables -A INPUT -p tcp --dport 1:100 -m recent --name PALANTIR_SCANNER --update --seconds 20 --hitcount 15 -j LOG_PORT_SCAN
iptables -A INPUT -p tcp --dport 1:100 -m recent --name PALANTIR_SCANNER --set

# Batasi akses HTTP berdasarkan ras dan jam
iptables -A INPUT -p tcp --dport 80 -m recent --name PALANTIR_BLACKLIST --rcheck --seconds 600 -j DROP
iptables -A INPUT -p tcp --dport 80 -s 10.92.0.128/25 -m time --timestart 07:00 --timestop 15:00 -j ACCEPT   # Elf (Gilgalad & Cirdan)
iptables -A INPUT -p tcp --dport 80 -s 10.92.1.0/24  -m time --timestart 17:00 --timestop 23:00 -j ACCEPT   # Manusia (Elendil & Isildur)
iptables -A INPUT -p tcp --dport 80 -j REJECT
