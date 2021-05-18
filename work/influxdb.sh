#!/bin/sh

kubectl delete -f srcs/influxdb/influxdb.yaml
#kubectl delete -f srcs/influxdb/influxdb-pv.yaml

docker build -t myinfluxdb srcs/influxdb/.

kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/influxdb/influxdb-pv.yaml