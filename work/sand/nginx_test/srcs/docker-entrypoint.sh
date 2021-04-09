#!/bin/sh

mkdir -p /run/nginx
mkdir /etc/nginx/ssl

openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/wordpress.pem -keyout /etc/nginx/ssl/wordpress.key -subj "/C=JA/ST=Japan/L=Tokyo/O=42 School/OU=rchallie/CN=worpress"

chown -R nginx:nginx /var/www/
chmod -R 755 /var/www/

exec "$@"
