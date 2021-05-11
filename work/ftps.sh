#!/bin/ls

kubectl delete -f srcs/ftps/ftps.yaml

docker build -t myftps srcs/ftps/.

kubectl apply -f srcs/ftps/ftps.yaml
