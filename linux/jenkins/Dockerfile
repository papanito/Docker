FROM jenkins
USER root
RUN sudo apt-get install dotnet-sdk-2.0.0
USER jenkins # drop back to the regular jenkins user - good practice
#COPY plugins.txt /usr/share/jenkins/ref/
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt