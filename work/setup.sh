#デフォルトではVirtualBoxのVMを作成してその上にkubernetes環境が構築される。
#--vm-driver=none オプションを付けることで、minikubeを実行しているホスト上にkubernetesを構築されるようにできる。

#sudo sysctl fs.protected_regular=0
#sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
#sudo chown -R $USER $HOME/.minikube; chmod -R 755 $HOME/.minikube

docker build -t basecamp srcs/basecamp/.
docker build -t mynginx srcs/nginx/.
docker build -t mymysql srcs/mysql/.
docker build -t mypma srcs/phpmyadmin/.

kubectl delete -f srcs/nginx/nginx.yaml
kubectl delete -f srcs/mysql/mysql-deployment.yaml
kubectl delete -f srcs/mysql/mysql-pv.yaml
kubectl delete -f srcs/phpmyadmin/phpmyadmin.yaml

kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/mysql/mysql-pv.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# -d = is directory?
if [ ! -d "/metallb" ]; then
  mkdir -p metallb
fi

cd metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

cd ..
kubectl apply -f srcs/metallb-config.yaml

#minikube dashboard