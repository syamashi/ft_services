#!/bin/sh

kubectl delete -f srcs/grafana/grafana.yaml

docker build -t mygrafana srcs/grafana/.

kubectl apply -f srcs/grafana/grafana.yaml
