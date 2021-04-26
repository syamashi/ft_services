# https://qiita.com/rspepe/items/c0c0119032ccc79ff7a1

FROM basecamp

# doc root
RUN mkdir -p app

COPY app /app
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /tmp/start.sh

RUN	chmod -R 755 /app /tmp /etc

# port
EXPOSE 80 443 22

CMD [ "/tmp/start.sh" ]
