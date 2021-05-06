#!/bin/sh

#デフォルトではVirtualBoxのVMを作成してその上にkubernetes環境が構築される。
#--vm-driver=none オプションを付けることで、minikubeを実行しているホスト上にkubernetesを構築されるようにできる。

# protected_regular : 書き込み制限 0:制限なし
# https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/8/html/8.3_release_notes/kernel_parameters_changes

#sudo sysctl fs.protected_regular=0
#sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
#sudo chown -R $USER $HOME/.minikube; chmod -R 755 $HOME/.minikube

# --vm-driver=dockerの場合は、imageの展開先がローカルじゃなくなって、docker imagesで表示されなくなる。 evalをすると、ローカルに展開されるようになる。
# eval $(minikube docker-env)

# stop services
kubectl delete -f srcs/metallb/metallb-config.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
#kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl delete -f srcs/wordpress/wordpress.yaml

docker build -t basecamp srcs/basecamp/.
docker build -t mynginx srcs/nginx/.
docker build -t mymysql srcs/mysql/.
docker build -t mypma srcs/phpmyadmin/.
docker build -t mywordpress srcs/wordpress/.

# metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb-config.yaml

kubectl apply -f srcs/nginx/nginx.yaml
#kubectl apply -f srcs/mysql/mysql-pv.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

#minikube dashboard