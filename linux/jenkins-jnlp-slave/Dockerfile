FROM jenkins/jnlp-slave:latest-jdk11
USER root

ARG CERT_01=mydummycert.crt
ARG CERT_PATH=/usr/local/share/ca-certificates/
ARG KEYSTORE=$JAVA_HOME/lib/security/cacerts
ARG KEYTOOL=$JAVA_HOME/bin/keytool
ARG PROXY=http://proxy.intra:8080

# configure http proxy to use apt if no direct internet access
#ENV http_proxy "$PROXY"
#ENV https_proxy "$PROXY"
#ENV no_proxy "*.intra,jenkins.intra,scm.intra"

# change apt mirror in case you use an internal repo
#RUN sed -i 's|http://deb.debian.org/debian|https://articatory.intra/repository/debian/|g' /etc/apt/sources.list

# add self-signed certificates to certificates location and update ca-certificates
# ADD $CERT_01 $CERT_PATH$CERT_01
# RUN update-ca-certificates

# install git and docker
RUN apt-get install apt-transport-https
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git maven nano sudo openjdk-8-jdk docker.io

# add self-signed certificates to java certs (valid for all java versions)
# RUN $KEYTOOL -import -trustcacerts -alias $CERT_01 -keystore $KEYSTORE -file $CERT_PATH$CERT_01 -storepass changeit -noprompt

# configure docker registry
#ADD daemon.json /etc/docker/daemon.json

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
# comment above, uncomment lines below, 
# then add helm-install.sh to this repo and modify so that it is working
#COPY helm-install.sh ./
#RUN chmod +x ./helm-install.sh
#RUN /bin/bash -c "./helm-install.sh -v $HELM_VERSION"

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
RUN chmod +x ./kubectl
RUN sudo mv ./kubectl /usr/local/bin/kubectl

# configure git
RUN git config --global user.email "ci@wyssmann.com"
RUN git config --global user.name "CI User"

# Configure maven to work in your environment
# you should provide settings.xml and security-settings.xlm
#COPY settings.xml /etc/maven/settings.xml
#COPY security-settings.xml /etc/maven/security-settings.xml
#ENV MAVEN_OPTS -"Xmx512m -Duser.language=en -Duser.country=US -Duser.variant=US -Dsettings.security=/etc/maven/security-settings.xml"
# Copy custom jenkins start script
COPY slave-create.sh /usr/local/bin/jenkins-slave
RUN chmod +x /usr/local/bin/jenkins-slave
ENTRYPOINT [ "jenkins-slave" ]