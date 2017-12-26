FROM jenkins/jenkins
USER root
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] http://httpredir.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list'
RUN sh -c 'echo "deb [arch=amd64] http://httpredir.debian.org/debian oldstable main" > /etc/apt/sources.list.d/jessiestable.list'
RUN sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/debian/8/prod jessie main" > /etc/apt/sources.list.d/dotnetdev.list'
#RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN apt-get update

# Downgrading of libcurl is a required workaround to avoid segmentation fault when using dotnet build/run/...
# https://github.com/dotnet/core/issues/963
RUN apt-get --assume-yes --allow-downgrades install dotnet-runtime-2.0.0 dotnet-sdk-2.0.0 nuget libcurl3=7.38.0-4+deb8u8

# drop back to the regular jenkins user - good practice
USER jenkins 
#COPY plugins.txt /usr/share/jenkins/ref/
#RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
