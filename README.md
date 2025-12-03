# Jarkom-Modul-5-2025-K57

| No | Nama Lengkap         | NRP        |
|----|----------------------|------------|
| 1  | Prabaswara Febrian   | 5027241069 |
| 2  | Erlinda Annisa Zahra | 5027241108 |

### Topologi

![topologi](images/modul5.png)


### Tabel Rute
| Nama Subnet | Rute                                                     | Jumlah IP | Netmask |
|-------------|-----------------------------------------------------------|-----------|---------|
| A1          | Osgiliath > Moria > Switch2 > IronHills                  | 2         | /30     |
| A2          | Osgiliath > Moria > Wilderland                           | 2         | /30     |
| A3          | Osgiliath > Moria > Wilderland > Durin                   | 51        | /26     |
| A4          | Osgiliath > Moria > Wilderland > Switch3 > Khamul        | 6         | /29     |
| A5          | Osgiliath > Moria                                        | 2         | /30     |
| A6          | Osgiliath > Rivendell                                    | 2         | /30     |
| A7          | Osgiliath > Rivendell > Switch1 > Vilya, Narya           | 3         | /29     |
| A8          | Osgiliath > Minastir                                     | 2         | /30     |
| A9          | Osgiliath > Minastir > Switch4 > Elendil                 | 231       | /24     |
| A10         | Osgiliath > Minastir > Pelargir                          | 2         | /30     |
| A11         | Osgiliath > Minastir > Pelargir > Palantir               | 2         | /30     |
| A12         | Osgiliath > Minastir > AnduinBanks                       | 2         | /30     |
| A13         | Osgiliath > Minastir > AnduinBanks > Switch5 > Gilgalad, Cirdan | 121 | /25     |
| **Total**   | —                                                         | **428**   | **/23** |


### VLSM Tree

![tree](images/tree.png)


### Tabel Networking (VLSM)

| Subnet | Network ID  | Netmask           | Broadcast   | Range IP                     | CIDR |
|--------|-------------|-------------------|-------------|------------------------------|------|
| A1     | 10.92.0.0   | 255.255.255.252   | 10.92.0.3   | 10.92.0.1 – 10.92.0.2        | /30  |
| A2     | 10.92.0.4   | 255.255.255.252   | 10.92.0.7   | 10.92.0.5 – 10.92.0.6        | /30  |
| A3     | 10.92.0.64  | 255.255.255.192   | 10.92.0.127 | 10.92.0.65 – 10.92.0.126     | /26  |
| A4     | 10.92.0.32  | 255.255.255.248   | 10.92.0.39  | 10.92.0.33 – 10.92.0.38      | /29  |
| A5     | 10.92.0.8   | 255.255.255.252   | 10.92.0.11  | 10.92.0.9 – 10.92.0.10       | /30  |
| A6     | 10.92.0.12  | 255.255.255.252   | 10.92.0.15  | 10.92.0.13 – 10.92.0.14      | /30  |
| A7     | 10.92.0.40  | 255.255.255.248   | 10.92.0.47  | 10.92.0.41 – 10.92.0.46      | /29  |
| A8     | 10.92.0.16  | 255.255.255.252   | 10.92.0.19  | 10.92.0.17 – 10.92.0.18      | /30  |
| A9     | 10.92.0.0   | 255.255.255.0     | 10.92.1.255 | 10.92.1.0 – 10.92.1.254      | /24  |
| A10    | 10.92.0.20  | 255.255.255.252   | 10.92.0.23  | 10.92.0.21 – 10.92.0.22      | /30  |
| A11    | 10.92.0.24  | 255.255.255.252   | 10.92.0.27  | 10.92.0.25 – 10.92.0.26      | /30  |
| A12    | 10.92.0.28  | 255.255.255.252   | 10.92.0.31  | 10.92.0.29 – 10.92.0.30      | /30  |
| A13    | 10.92.0.128 | 255.255.255.128   | 10.92.0.255 | 10.92.0.129 – 10.92.0.254    | /25  |


### Tabel IP Address

| Unit        | IP           | Subnet |
|-------------|--------------|--------|
| Moria       | 10.92.0.1    | A1     |
| IronHills   | 10.92.0.2    | A1     |
| Moria       | 10.92.0.5    | A2     |
| Wilderland  | 10.92.0.6    | A2     |
| Wilderland  | 10.92.0.65   | A3     |
| Durin       | 10.92.0.66   | A3     |
| Wilderland  | 10.92.0.33   | A4     |
| Khamul      | 10.92.0.34   | A4     |
| Osgiliath   | 10.92.0.9    | A5     |
| Moria       | 10.92.0.10   | A5     |
| Osgiliath   | 10.92.0.13   | A6     |
| Rivendell   | 10.92.0.14   | A6     |
| Rivendell   | 10.92.0.41   | A7     |
| Vilya       | 10.92.0.42   | A7     |
| Narya       | 10.92.0.43   | A7     |
| Osgiliath   | 10.92.0.17   | A8     |
| Minastir    | 10.92.0.18   | A8     |
| Minastir    | 10.92.1.1    | A9     |
| Elendil     | 10.92.1.2    | A9     |
| Isildur     | 10.92.1.3    | A9     |
| Minastir    | 10.92.0.21   | A10    |
| Pelargir    | 10.92.0.22   | A10    |
| Pelargir    | 10.92.0.25   | A11    |
| Palantir    | 10.92.0.26   | A11    |
| Pelargir    | 10.92.0.29   | A12    |
| Palantir    | 10.92.0.30   | A12    |
| AnduinBanks | 10.92.0.129  | A13    |
| Gilgalad    | 10.92.0.130  | A13    |
| Cirdan      | 10.92.0.131  | A13    |


## Misi 1
Mengidentifikasi perangkat, setelah itu membagi IP menggunakan VLSM dengan tree lalu membuat konfigurasi rute agar terhubung.

#### Moria

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


#### Wilderland

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


#### Osgiliath

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


#### Rivendell


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


#### Vilya


        cat << EOF > /etc/network/interfaces
        auto lo
        iface lo inet loopback

        auto eth0
        iface eth0 inet static
            address 10.92.0.42
            netmask 255.255.255.248
        EOF


#### Narya

        cat << EOF > /etc/network/interfaces
        auto lo
        iface lo inet loopback

        auto eth0
        iface eth0 inet static
            address 10.92.0.43
            netmask 255.255.255.248
        EOF

#### Minastir


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

#### Pelargir

        cat << EOF > /etc/network/interfaces
        auto lo
        iface lo inet loopback

        auto eth0
        iface eth0 inet static
            address 10.92.0.22
            netmask 255.255.255.252

        auto eth1
        iface eth1 inet static
            address 10.92.0.29
            netmask 255.255.255.252
        EOF


#### Anduinbanks

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


#### Dynamic IP untuk client
Hanya untuk Durin,Khamul,Elendil,Isildur,Gilgalad dan Cirdan.

        cat << EOF > /etc/network/interfaces
        auto lo
        iface lo inet loopback

        auto eth0
        iface eth0 inet dhcp
        EOF


### Routing 

#### Moria

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


#### Wilderland

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


#### Osgiliath

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


#### Rivendell

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


#### Minastir

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


#### Pelargir

        # Lewat Minastir
        route add -net 10.92.0.0  netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.0.4  netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.0.64 netmask 255.255.255.192 gw 10.92.0.21
        route add -net 10.92.0.32 netmask 255.255.255.248 gw 10.92.0.21
        route add -net 10.92.0.8  netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.0.12 netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.0.40 netmask 255.255.255.248 gw 10.92.0.21
        route add -net 10.92.0.16 netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.1.0  netmask 255.255.255.0   gw 10.92.0.21
        route add -net 10.92.0.20 netmask 255.255.255.252 gw 10.92.0.21
        route add -net 10.92.0.24 netmask 255.255.255.252 gw 10.92.0.21

        # Lewat AnduinBanks
        route add -net 10.92.0.128 netmask 255.255.255.128 gw 10.92.0.30


#### Arduinbanks


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







