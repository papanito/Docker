# Jenkins JNLP Agent Docker image

This image is based on the [jenkins/jnlp-slave](https://hub.docker.com/r/jenkins/jnlp-slave/) with some modifications.

The image requires an url, a user name and an api token and will automatically create a node in the Jenkins master and connect to it

- create node via REST interface, the name is taken from the hostname of the container
- get secret of the recently created node
- connect to the node using the secret

TODO: more docu