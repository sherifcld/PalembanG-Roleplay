#!/usr/bin/env bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y nginx php-fpm php-mysql mysql-server curl unzip ufw screen ca-certificates libstdc++6

mkdir -p /var/www/ucp
rsync -a ./ucp/ /var/www/ucp/
chown -R www-data:www-data /var/www/ucp

UCP_PORT="${UCP_PORT:-8080}"
PHP_FPM_SOCK="$(ls /run/php/php*-fpm.sock 2>/dev/null | head -n1)"
if [ -z "$PHP_FPM_SOCK" ]; then
  PHP_FPM_SOCK="/run/php/php-fpm.sock"
fi
sed -e "s#__UCP_PORT__#${UCP_PORT}#g" -e "s#__PHP_FPM_SOCK__#${PHP_FPM_SOCK}#g" ./scripts/nginx-ucp.conf > /etc/nginx/sites-available/palembang-rp.conf
ln -sf /etc/nginx/sites-available/palembang-rp.conf /etc/nginx/sites-enabled/palembang-rp.conf
rm -f /etc/nginx/sites-enabled/default
nginx -t
systemctl restart nginx

mkdir -p /opt/samp
cp -f ./server.cfg /opt/samp/server.cfg
mkdir -p /opt/samp/gamemodes
cp -f ./gamemodes/*.amx /opt/samp/gamemodes/ || true
mkdir -p /opt/samp/plugins
cp -f ./plugins/*.so /opt/samp/plugins/ || true
mkdir -p /opt/samp/scriptfiles
rsync -a ./scriptfiles/ /opt/samp/scriptfiles/ || true

if [ ! -f /opt/samp/samp03svr ]; then
  tmpdir="$(mktemp -d)"
  cd "$tmpdir"
  curl -L -o samp.tar.gz https://files.sa-mp.com/samp037svr_R2-1.tar.gz || true
  if [ -f samp.tar.gz ]; then
    tar -xzf samp.tar.gz
    cp -f samp03svr /opt/samp/samp03svr
    cp -f announce /opt/samp/announce || true
    cp -f server /opt/samp/server || true
  fi
  cd /
  rm -rf "$tmpdir"
fi

chmod +x /opt/samp/samp03svr || true

cp -f ./scripts/samp.service /etc/systemd/system/samp.service
systemctl daemon-reload
systemctl enable samp || true
systemctl restart samp || true

ufw allow ${UCP_PORT}/tcp || true
ufw allow 7777/udp || true

echo "OK"

# MySQL Setup
systemctl enable mysql
systemctl start mysql

DB_NAME="${DB_NAME:-bersamaroleplay}"
DB_USER="${DB_USER:-palembangrp}"
DB_PASS="${DB_PASS:-$(openssl rand -base64 18 | tr -d '=+/')}}"

mysql -u root <<SQL
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
SQL

if [ -f "./database/dbv3.sql" ]; then
  mysql -u root "${DB_NAME}" < "./database/dbv3.sql" || true
fi

mkdir -p /opt/samp/scriptfiles
cat > /opt/samp/scriptfiles/mysql_settings.ini <<CFG
HOST = 127.0.0.1
USERNAME = ${DB_USER}
PASSWORD = ${DB_PASS}
DATABASE = ${DB_NAME}
CFG

cat > /var/www/ucp/config.php <<PHP
<?php
$db_host = '127.0.0.1';
$db_user = '${DB_USER}';
$db_pass = '${DB_PASS}';
$db_name = '${DB_NAME}';
$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);
if (\$conn->connect_error) { die("Connection failed: " . \$conn->connect_error); }
?>
PHP
