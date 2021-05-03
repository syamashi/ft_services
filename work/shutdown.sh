kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f srcs/metallb/metallb-config.yaml
kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml

docker ps -aq | xargs docker stop
docker ps -aq | xargs docker rm
docker images -aq | xargs docker rmi

#minikube delete
