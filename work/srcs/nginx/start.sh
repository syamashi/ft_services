#!/bin/sh

nginx
echo "mynginx start"
tail -f /var/log/nginx/access.log
