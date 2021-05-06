#!/bin/sh

kubectl delete -f srcs/mysql/mysql-deployment.yaml
kubectl delete -f srcs/mysql/mysql-pv.yaml

docker build -t mymysql srcs/mysql/.

kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/mysql/mysql-pv.yaml
