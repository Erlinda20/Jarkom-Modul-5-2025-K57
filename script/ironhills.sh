# Konfigurasi IP static/DHCP  
cat << EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.92.0.2
    netmask 255.255.255.252
    gateway 10.92.0.1
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

# Firewall sesuai modul (Mission 2.4 & 2.7)
# Bersihkan aturan lama terkait port 80
iptables -D INPUT -p tcp --dport 80 -m time --weekdays Sat -m connlimit --connlimit-above 3 --connlimit-mask 32 -j REJECT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -s 10.92.0.64/26 -m time --weekdays Sat,Sun -j ACCEPT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -s 10.92.0.32/29 -m time --weekdays Sat,Sun -j ACCEPT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -s 10.92.1.0/24  -m time --weekdays Sat,Sun -j ACCEPT 2>/dev/null || true
iptables -D INPUT -p tcp --dport 80 -j REJECT 2>/dev/null || true

# Batasi koneksi aktif maksimum 3 per IP pada hari Sabtu
iptables -A INPUT -p tcp --dport 80 -m time --weekdays Sat -m connlimit --connlimit-above 3 --connlimit-mask 32 -j REJECT

# Izin akses hanya untuk faksi Durin, Khamul, Elendil, Isildur di akhir pekan
iptables -A INPUT -p tcp --dport 80 -s 10.92.0.64/26 -m time --weekdays Sat,Sun -j ACCEPT   # Durin
iptables -A INPUT -p tcp --dport 80 -s 10.92.0.32/29 -m time --weekdays Sat,Sun -j ACCEPT   # Khamul
iptables -A INPUT -p tcp --dport 80 -s 10.92.1.0/24  -m time --weekdays Sat,Sun -j ACCEPT   # Elendil & Isildur

# Tolak akses selain ketentuan modul
iptables -A INPUT -p tcp --dport 80 -j REJECT
