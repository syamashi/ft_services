FROM basecamp

WORKDIR /app
VOLUME /app

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

# These lines moved to the end allow us to rebuild image quickly after only these files were modified.
COPY start.sh /start.sh
COPY mariadb-server.cnf /etc/my.cnf.d

RUN chmod -R 777 /tmp

EXPOSE 3306
CMD ["/start.sh"]
#CMD tail -f /dev/null