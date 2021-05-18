#!/bin/sh

#デフォルトではVirtualBoxのVMを作成してその上にkubernetes環境が構築される。
#--vm-driver=none オプションを付けることで、minikubeを実行しているホスト上にkubernetesを構築されるようにできる。

# protected_regular : 書き込み制限 0:制限なし
# https://access.redhat.com/documentation/ja-jp/red_hat_enterprise_linux/8/html/8.3_release_notes/kernel_parameters_changes

sudo sysctl fs.protected_regular=0
sudo minikube start --vm-driver=none --extra-config=apiserver.service-node-port-range=1-65535
sudo chown -R $USER $HOME/.minikube; chmod -R 755 $HOME/.minikube
# for ftps-pv make
sudo chown -R $USER /data; chmod -R 755 /data

# --vm-driver=dockerの場合は、imageの展開先がローカルじゃなくなって、docker imagesで表示されなくなる。 evalをすると、ローカルに展開されるようになる。
# eval $(minikube docker-env)

#minikube dashboard