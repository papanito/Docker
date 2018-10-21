# Docker 

This project contains self-made docker images

## Useful commands

Below some useful commands

### remove all images that are not tagged

removes all "dangling" docker images

```
docker image rm $(docker images -f "dangling=true" -q)
```

### remove all exited containers

```
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm
```

### Delete all containers

```
docker rm $(docker ps -a -q)
```

### Delete all images

```
docker rmi $(docker images -q)
```

### push docker images

Reference: https://docs.docker.com/docker-cloud/builds/push-images/

Remark do not forget to login via docker login

```
IMAGETAG = "jenkins:0.1"
export DOCKER_ID_USER="papanito"
docker tag $IMAGETAG $DOCKER_ID_USER/$IMAGETAG
docker push $DOCKER_ID_USER/$IMAGETAG
```


### re-create container

```bash
docker-compose up -d --no-deps --force-recreate --build jenkins
```

### attach interactive terminal

```bash
# by ID
sudo docker exec -i -t 665b4a1e17b6 /bin/bash
#by name
sudo docker exec -i -t loving_heisenberg /bin/bash
```

## CI

Use travis: More docu to follow