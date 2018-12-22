#!/bin/bash
IMAGE_SRC=jenkins/jnlp-slave
TAG=jenkins/jnlp-slave
VERSION=latest
sudo docker build .  --no-cache --tag $REPO/$TAG:$VERSION --build-arg APP_IMAGE=$IMAGE_SRC:$VERSION
sudo docker push $REPO/$TAG
VERSION=latest-jdk11
sudo docker build .  --no-cache --tag $REPO/$TAG:$VERSION --build-arg APP_IMAGE=$IMAGE_SRC:$VERSION
sudo docker push $REPO/$TAG
