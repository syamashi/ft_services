# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1

FROM alpine

RUN apk update &&\
	apk add nginx openssl wget curl &&\
	rm -rf /var/cache/apk/*

# doc root
COPY app /app
COPY default.conf /etc/nginx/conf.d/default.conf

# port
EXPOSE 80 443

RUN mkdir -p /run/nginx
ENTRYPOINT [ "tail", "-f", "/dev/null"]
