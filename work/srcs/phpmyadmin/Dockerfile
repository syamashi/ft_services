# origin
# https://wiki.alpinelinux.org/wiki/PhpMyAdmin

FROM basecamp

# php-mysql (no such package):
RUN apk add php7-fpm php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom &&\
	apk add mysql mysql-client &&\
	rm -f /var/cache/apk/*

WORKDIR /tmp/

RUN set -ex; \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz; \
	tar -xvzf phpMyAdmin-5.0.2-all-languages.tar.gz; \
	rm phpMyAdmin-5.0.2-all-languages.tar.gz; \
	mv phpMyAdmin-5.0.2-all-languages phpmyadmin; \
	mkdir -p /var/www; \
	mv phpmyadmin/ /var/www

WORKDIR /
COPY start.sh /tmp/start.sh

# doc root
COPY default.conf /etc/nginx/conf.d/default.conf
COPY config.inc.php /var/www/phpmyadmin

# php config (ps aux)
# 12 nobody    0:00 {php-fpm7} php-fpm: pool www
# -> nginx     0:00 {php-fpm7} php-fpm: pool www
COPY www.conf /etc/php7/php-fpm.d

# etcはサーバー系が全部入ってるから755微妙
RUN	chmod -R 755 /var /etc /tmp

# tmpは書き込み権限が必要。phpmyadminにアクセスしたときに、tmpに書き込みがなされるため
# 権限がないとpermission denied発生
# w権限がないと、access.logも書き込みされないかも
RUN	chmod -R 777 /tmp /var/log/nginx
RUN chown -R nginx:nginx /etc/nginx

# port
EXPOSE 5000

CMD [ "/tmp/start.sh" ]
