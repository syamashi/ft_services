# origin
# https://wiki.alpinelinux.org/wiki/PhpMyAdmin

FROM basecamp

# php-mysql (no such package):
RUN apk add php7-common php7-session php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom &&\
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
COPY startup.sh /tmp/startup.sh

# doc root
COPY default.conf /etc/nginx/conf.d/default.conf

# port
EXPOSE 5000

CMD [ "/tmp/start.sh" ]
