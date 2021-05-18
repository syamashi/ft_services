
# stop services
kubectl delete -f srcs/nginx/nginx.yaml

docker build -t mynginx srcs/nginx/.
kubectl apply -f srcs/nginx/nginx.yaml
