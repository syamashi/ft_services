FROM basecamp

COPY start.sh /start.sh
COPY custom.ini /grafana/custom.ini
COPY telegraf.conf /etc/telegraf.conf
# /grafanaをTOPに配置
COPY dashboards /grafana/conf/provisioning/dashboards
COPY datasources /grafana/conf/provisioning/datasources
COPY livenessprobe.sh /livenessprobe.sh

RUN chmod 755 /grafana/conf
EXPOSE 3000
CMD ["/start.sh"]