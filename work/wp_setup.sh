#!/bin/sh

kubectl delete -f srcs/wordpress/wordpress.yaml
docker build -t mywordpress srcs/wordpress/.
kubectl apply -f srcs/wordpress/wordpress.yaml
