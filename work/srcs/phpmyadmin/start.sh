#!/bin/sh

nginx && php-fpm7
echo "phpmyadmin_nginx start"
tail -f /var/log/nginx/access.log