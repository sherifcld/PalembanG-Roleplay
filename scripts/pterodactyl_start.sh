#!/usr/bin/env bash
set -e

cd /home/container 2>/dev/null || cd "$(pwd)"

PORT="${SERVER_PORT:-${SAMP_PORT:-7777}}"
DB_HOST="${DB_HOST:-127.0.0.1}"
DB_USER="${DB_USER:-palembangrp}"
DB_PASS="${DB_PASS:-change_me}"
DB_NAME="${DB_NAME:-bersamaroleplay}"

if [ -f server.cfg ]; then
  sed -i "s/^port .*/port ${PORT}/" server.cfg
fi

mkdir -p scriptfiles
cat > scriptfiles/mysql_settings.ini <<CFG
HOST = ${DB_HOST}
USERNAME = ${DB_USER}
PASSWORD = ${DB_PASS}
DATABASE = ${DB_NAME}
CFG

mkdir -p plugins gamemodes

if [ ! -f samp03svr ]; then
  tmpdir="$(mktemp -d)"
  cd "$tmpdir"
  curl -L -o samp.tar.gz https://files.sa-mp.com/samp037svr_R2-1.tar.gz || true
  tar -xzf samp.tar.gz || true
  cp -f samp03svr /home/container/samp03svr || true
  cp -f announce /home/container/announce || true
  cd /home/container
  rm -rf "$tmpdir"
fi

chmod +x ./samp03svr || true
exec ./samp03svr
