# Jenkins JNLP Agent Docker image


Base Jenkins-Slave image ([jenkins/jnlp-slave:jdk11-latest](https://hub.docker.com/r/jenkins/jnlp-slave/)) with some modifications.

The image requires an url to jenkins master, a user name and an api token for a jenkins user with permissions to create nodes on the jenkins master with the REAST API. The node is configured in a way to automatically create a node in the Jenkins master and connect to it

- create node via REST interface, the name is taken from the hostname of the container
- get secret of the recently created node
- connect to the jenkins master using the secret

Here is the complete list of possible parameters

- `JENKINS_TUNNEL`: HOST:PORT for a tunnel to route TCP traffic to jenkins host, when jenkins can't be directly accessed over network
- `JENKINS_URL`: jenkins URL of jenkins master
- `JENKINS_USER`: jenkins user with access to rest api, has to be defined as otherwise the script will exit
- `JENKINS_API_TOKEN`: api token of jenkins user which uses the rest api, has to be defined as otherwise the script will fail
- `JENKINS_AGENT_WORKDIR`: agent work directory, if not set by optional parameter -workDir
- `JENKINS_AGENT_LABELS`: labels for the jenkins node
- `ENVRIONMENT_VARS`: Define node specific environment variables in the form
   ```{'key':+'JAVA_HOME',+'value':+'/docker-java-home'},+{'key':+'JENKINS_HOME',+'value':+'/home/jenkins'}"```
- `LOCATIONS`: Define node specific locations in the form
  ```{'key':+'hudson.plugins.git.GitTool\\$DescriptorImpl@Default',+'home':+'/usr/bin/git'},+{'key':+'hudson.model.JDK\\$DescriptorImpl@JAVA-8',+'home':+'/usr/bin/java'}```

## Tooling / Image content

We installed several tools as part of the container in order to be usable for us

- OpenJDK 8 (as an addtion to the OpenJDK11 which is already included in the base image)
- maven 3.5
- git
- helm
- kubectl
- docker

## Docker in Docker

In order to be able to build docker images on these slaves, docker has to be running. In order to not have a priviledged container we shall not use socket-mapping but rather deploy it with a dind sidecar. As an example we provide some k8s yml files as examples

- TBD

## Reference

- [StackOverflow: How to add a SSL self-signed cert to Jenkins for LDAPS within Dockerfile?](https://stackoverflow.com/questions/35304680/how-to-add-a-ssl-self-signed-cert-to-jenkins-for-ldaps-within-dockerfile/35304873#35304873)
- [StackOverflow: How to run docker from inside docker](https://stackoverflow.com/questions/27879713/is-it-ok-to-run-docker-from-inside-docker)
- [Do not user docker in docker for ci](https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/)