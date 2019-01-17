# Docker 

This project contains self-made docker images

## Useful commands

Below some useful commands

### Cleanup

```bash
# delete ALL dangling data (i.e. In order: containers stopped, volumes without containers and images with no containers). Even unused data, with -a option.
docker system prune will

# delete ALL dangling data of a specific type
docker container prune
docker image prune
docker network prune
docker volume prune

# removes all "dangling" docker images
docker image rm $(docker images -f "dangling=true" -q)

# remove all exited containers
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

# Delete all containers
docker rm $(docker ps -a -q)

# delete all images
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