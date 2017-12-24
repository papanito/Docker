# Docker 

This project contains self-made docker images

## Useful commands

Below some useful commands

remove all images that are not tagged

```
docker image rm $(docker images -f "dangling=true" -q)
```

remove all exited containers

```
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
```

push docker images
https://docs.docker.com/docker-cloud/builds/push-images/
do not forget to login via docker login

```
IMAGETAG = "jenkins:0.1"
export DOCKER_ID_USER="username"
docker tag $IMAGETAG $DOCKER_ID_USER/$IMAGETAG
docker push $DOCKER_ID_USER/$IMAGETAG
```