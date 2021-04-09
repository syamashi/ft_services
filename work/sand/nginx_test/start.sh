#! /bin/sh

TAG=test
NAME=$TAG

docker container prune -f
docker container rm -f ${TAG}
docker build -t $TAG .
docker run -d --name $NAME -p 8080:80 -p 443:443 $TAG
open "http://localhost:8080/"
docker exec -it ${NAME} sh
