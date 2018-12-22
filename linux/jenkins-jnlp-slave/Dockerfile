ARG APP_IMAGE=jenkins/jnlp-slave:latest
FROM $APP_IMAGE
USER root

# install git and docker
RUN apt-get update
RUN apt-get upgrade --assume-yes
RUN apt-get install --assume-yes git
RUN apt-get install --assume-yes maven
RUN apt-get install --assume-yes nano

# Copy custom jenkins start script
COPY slave-create.sh /usr/local/bin/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave
ENTRYPOINT [ "jenkins-slave" ]
