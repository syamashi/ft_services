# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1

FROM alpine

RUN apk update &&\
	apk add nginx openssl wget curl &&\
	rm -rf /var/cache/apk/*

# SSL[.crt]を作る
# https://linuxize.com/post/creating-a-self-signed-ssl-certificate/
# .key:秘密鍵
# cirtificate signing request = 証明書署名要求 「証明書を発行してもらうために必要なもの」
# "/C=CountryName/ST=StateName/L=CityName/O=OrganizaitonName/OU=OrganizationalUnit/CN=DomainName"

RUN mkdir /etc/nginx/ssl
WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out ft_service.crt -keyout ft_service.key \
	-subj "/C=JP/ST=Tokyo/L=hoge/O=fuga/OU=foo/CN=localhost"

RUN	chmod -R 755 /tmp /etc
