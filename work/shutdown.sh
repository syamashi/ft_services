kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f srcs/metallb/metallb-config.yaml
kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
#kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl delete -f srcs/wordpress/wordpress.yaml
#kubectl delete -f srcs/ftps/ftps-pv.yaml
kubectl delete -f srcs/grafana/grafana.yaml
kubectl delete -f srcs/influxdb/influxdb.yaml
#kubectl delete -f srcs/influxdb/influxdb-pv.yaml

docker ps -aq | xargs docker stop
docker ps -aq | xargs docker rm
docker images -aq | xargs docker rmi

minikube delete

#なんかimageのこってる
docker images -aq | xargs docker rmi

# https://qiita.com/Ikumi/items/b319a12d7e2c9f7b904d
docker volume rm "$(docker volume ls -qf dangling=true)"

# pv消す
rm -rf /data/mysql
rm -fr /data/ftp-user
