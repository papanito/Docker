tag=jenkins:0.3
docker build -t $tag .
docker tag $tag papanito/jenkins
docker push papanito/jenkins
