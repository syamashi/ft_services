#!/bin/ls

# ftps pv
if [ ! -d "/data/ftp-user" ]; then
  mkdir -p /data/ftp-user
  chmod 777 /data/ftp-user
  echo "[run.sh] /data/ftp-user made."
else
  echo "[run.sh] /data/ftp-user already exist."
fi

# stop services
kubectl delete -f srcs/metallb/metallb-config.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
# kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl delete -f srcs/wordpress/wordpress.yaml
kubectl delete -f srcs/ftps/ftps.yaml
# kubectl delete -f srcs/ftps/ftps-pv.yaml
kubectl delete -f srcs/grafana/grafana.yaml
kubectl delete -f srcs/influxdb/influxdb.yaml
# kubectl delete -f srcs/influxdb/influxdb-pv.yaml

docker build -t basecamp srcs/basecamp/.
docker build -t mynginx srcs/nginx/.
docker build -t mymysql srcs/mysql/.
docker build -t mypma srcs/phpmyadmin/.
docker build -t mywordpress srcs/wordpress/.
docker build -t myftps srcs/ftps/.
docker build -t mygrafana srcs/grafana/.
docker build -t myinfluxdb srcs/influxdb/.

# metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-config.yaml

kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/influxdb/influxdb-pv.yaml
kubectl apply -f srcs/mysql/mysql-pv.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/ftps/ftps-pv.yaml
kubectl apply -f srcs/grafana/grafana.yaml
