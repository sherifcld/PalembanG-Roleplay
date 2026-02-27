# PalembanG Roleplay — Panduan Deploy (VPS & Pterodactyl)

## VPS Ubuntu (20.04/22.04/24.04)
- Prasyarat:
  - Akses root/sudo
  - Port 8080/tcp terbuka untuk UCP, 7777/udp untuk SA‑MP
- Langkah cepat (satu command):
  - Upload repo ini ke VPS (misal `/root/PalembangRP`)
  - Jalankan:
    - `sudo bash scripts/install.sh`
- Variabel opsional:
  - `UCP_PORT` default 8080
  - `DB_NAME` default bersamaroleplay
  - `DB_USER` default palembangrp
  - `DB_PASS` default random (bisa override)
  - Contoh:
    - `sudo UCP_PORT=8080 DB_NAME=bersamaroleplay DB_USER=palembangrp DB_PASS=kuatbanget bash scripts/install.sh`
- Yang dilakukan installer:
  - Instal nginx, php-fpm, php-mysql, mysql-server dan dependensi
  - Deploy UCP ke `/var/www/ucp` dan aktifkan site Nginx port 8080
    - Konfigurasi: [scripts/nginx-ucp.conf](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/scripts/nginx-ucp.conf)
  - Setup SA‑MP ke `/opt/samp` dan buat service systemd
    - Service: [scripts/samp.service](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/scripts/samp.service)
  - Setup MySQL lokal:
    - Buat DB/user, impor schema dari [database/dbv3.sql](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/database/dbv3.sql)
    - Tulis kredensial otomatis ke:
      - GM: [scriptfiles/mysql_settings.ini](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/scriptfiles/mysql_settings.ini)
      - UCP: [ucp/config.php](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/ucp/config.php)
- Akses setelah install:
  - UCP: `http://IP_VPS:8080/`
  - SA‑MP: `IP_VPS:7777` (UDP)
- Perintah kontrol:
  - `sudo systemctl status samp`
  - `sudo systemctl restart samp`
  - `sudo systemctl restart nginx`
- Catatan:
  - Untuk HTTPS dan domain, tambahkan sertifikat (Certbot) lalu arahkan server_name Nginx ke domain Anda.

## Pterodactyl Panel (Egg SA‑MP Linux)
- Struktur berkas di server Pterodactyl:
  - Letakkan `server.cfg`, folder `plugins`, folder `gamemodes`, folder `scriptfiles` di `/home/container`
  - Gamemode: [gamemodes/GM.amx](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/gamemodes/GM.amx)
  - Konfigurasi server: [server.cfg](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/server.cfg)
- Start Command:
  - `bash scripts/pterodactyl_start.sh`
  - Skrip: [scripts/pterodactyl_start.sh](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/scripts/pterodactyl_start.sh)
- Variabel Environment panel:
  - `SERVER_PORT` atau `SERVER_PORT/SAMP_PORT` (contoh 7777)
  - `DB_HOST` (contoh 127.0.0.1 atau host DB Anda)
  - `DB_USER` (default palembangrp)
  - `DB_PASS` (isi sesuai DB)
  - `DB_NAME` (default bersamaroleplay)
- Perilaku skrip:
  - Menulis port ke `server.cfg`
  - Membuat `scriptfiles/mysql_settings.ini` berdasarkan env DB
  - Mengunduh `samp03svr` Linux jika belum ada, lalu menjalankan server
- Akses:
  - SA‑MP: `IP_NODE:SERVER_PORT` (UDP)
- Catatan:
  - UCP web dianjurkan dijalankan di server terpisah (egg PHP/Nginx) atau di VPS via installer
  - Jika DB panel berbeda, set `DB_HOST` ke host DB eksternal (contoh: IP VPS)

## Troubleshooting
- SA‑MP tidak start di Pterodactyl:
  - Pastikan `plugins/*.so` sudah ada di `/home/container/plugins`
  - Cek `server.cfg` sesuai: gamemode0 GM, port sesuai env
  - Log panel menunjukkan error plugin hilang atau hak akses
- UCP tidak bisa konek DB:
  - Periksa kredensial di [ucp/config.php](file:///d:/ALL%20PROJECT/A%20GAMEMODE%20SAMP/GM%20INFERNO%20NEW%20;%20WINDOWS%20+LINUX/GM%203.9%20HOSTING%20NEW%20(SFILE.MOBI)/ucp/config.php)
  - Pastikan MySQL berjalan dan user punya hak ke schema

# PalembanG-Roleplay
