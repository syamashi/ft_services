#デフォルトではVirtualBoxのVMを作成してその上にkubernetes環境が構築される。
#--vm-driver=none オプションを付けることで、minikubeを実行しているホスト上にkubernetesを構築されるようにできる。

sudo minikube start --vm-driver=none
sudo chown -R $USER $HOME/.minikube; chmod -R u+wrx $HOME/.minikube

# mkdir metallb ; cd metallb
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

minikube dashboard
