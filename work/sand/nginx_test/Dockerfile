FROM alpine:3.12

RUN apk update &&\
 	apk add\
	openssl\
	nginx

COPY ./srcs/ /tmp/

RUN mv /tmp/docker-entrypoint.sh /usr/local/bin; \
    chmod +x /usr/local/bin/docker-entrypoint.sh;

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
