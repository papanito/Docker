#!/usr/bin/env sh

# The MIT License
#
#  Copyright (c) 2015, CloudBees, Inc.
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

# Usage jenkins-slave.sh [options] -url http://jenkins [JENKINS_API_TOKEN] [JENKINS_USER]
# Optional environment variables :
# * JENKINS_TUNNEL : HOST:PORT for a tunnel to route TCP traffic to jenkins host, when jenkins can't be directly accessed over network
# * JENKINS_URL : alternate jenkins URL
# * JENKINS_USER : jenkins user with access to rest api
# * JENKINS_API_TOKEN : api token of jenkins user which uses the rest api
# * JENKINS_AGENT_WORKDIR : agent work directory, if not set by optional parameter -workDir

export JENKINS_USER=xxxxx
# https://stackoverflow.com/questions/45466090/how-to-get-the-api-token-for-jenkins
export JENKINS_API_TOKEN=xxxx

#Define cleanup procedure
cleanup() {
    echo "Container stopped, performing cleanup..."
	RESULT=$(curl -k -L -s -o /dev/null -v -k -w "%{http_code}" -u "${OPT_JENKINS_USER}:${OPT_JENKINS_API_TOKEN}" -H "Content-Type:application/x-www-form-urlencoded" -X POST -d "" "${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/doDelete")
}

#Trap SIGTERM (use without prefix SIG for sh)
trap 'cleanup' 1 2 9

if [ $# -eq 1 ]; then

	# if `docker run` only has one arguments, we assume user is running alternate command like `bash` to inspect the image
	exec "$@"

else

	# if -tunnel is not provided, try env vars
	case "$@" in
		*"-tunnel "*) ;;
		*)
		if [ ! -z "$JENKINS_TUNNEL" ]; then
			TUNNEL="-tunnel $JENKINS_TUNNEL"
		fi ;;
	esac

	# if -workDir is not provided, try env vars
	if [ ! -z "$JENKINS_AGENT_WORKDIR" ]; then
		case "$@" in
			*"-workDir"*) echo "Warning: Work directory is defined twice in command-line arguments and the environment variable" ;;
			*)
			WORKDIR="-workDir $JENKINS_AGENT_WORKDIR" ;;
		esac
	fi

	# if -tunnel is not provided, try env vars
	case "$@" in
		*"-url "*) 
			JENKINS_URL=$(echo "$@" | grep -oP "\-url\s+\Khttps?://[^ ]+")
		;;
		*)
		if [ ! -z "$JENKINS_URL" ]; then
			URL="-url $JENKINS_URL"
		fi
	esac


	# if [ -n "$JENKINS_URL" ]; then
	# 	URL="-url $JENKINS_URL"
	# fi
	echo JENKINS_URL is $JENKINS_URL
	echo URL is $URL

	JENKINS_AGENT_NAME=$(hostname)
	echo AGENT NAME is $JENKINS_AGENT_NAME
	# if [ -n "$JENKINS_NAME" ]; then
	# 	JENKINS_AGENT_NAME="$JENKINS_NAME"
	# fi  

	if [ -z "$JNLP_PROTOCOL_OPTS" ]; then
		echo "Warning: JnlpProtocol3 is disabled by default, use JNLP_PROTOCOL_OPTS to alter the behavior"
		JNLP_PROTOCOL_OPTS="-Dorg.jenkinsci.remoting.engine.JnlpProtocol3.disabled=true"
	fi
	
	# if java home is defined, use it
	JAVA_BIN="java"
	if [ "$JAVA_HOME" ]; then
		JAVA_BIN="$JAVA_HOME/bin/java"
	fi

	# # if both required options are defined, do not pass the parameters
	OPT_JENKINS_API_TOKEN=""
	if [ -n "$JENKINS_API_TOKEN" ]; then
		case "$@" in
			*"${JENKINS_API_TOKEN}"*) echo "Warning: JENKINS API TOKEN is defined twice in command-line arguments and the environment variable" ;;
			*)
			OPT_JENKINS_API_TOKEN="${JENKINS_API_TOKEN}" ;;
		esac
	fi

	# # if both required options are defined, do not pass the parameters
	OPT_JENKINS_AGENT_NAME=""
	if [ -n "$JENKINS_USER" ]; then
		case "$@" in
			*"${JENKINS_USER}"*) echo "Warning: JENKINS USER is defined twice in command-line arguments and the environment variable" ;;
			*)
			OPT_JENKINS_USER="${JENKINS_USER}" ;;
		esac
	fi	
	echo USER IS $OPT_JENKINS_USER
	#TODO: Handle the case when the command-line and Environment variable contain different values.
	#It is fine it blows up for now since it should lead to an error anyway.

    # create node
    # TODO: pass user and api token
    export JSON_OBJECT="{ 'name':+'${JENKINS_AGENT_NAME}',+'nodeDescription':+'Linux+slave',+'numExecutors':+'5',+'remoteFS':+'/home/jenkins/agent',+'labelString':+'DEVOPS-SLAVE-DOCKER+devops-linux',+'mode':+'EXCLUSIVE',+'':+['hudson.slaves.JNLPLauncher',+'hudson.slaves.RetentionStrategy\$Always'],+'launcher':+{'stapler-class':+'hudson.slaves.JNLPLauncher',+'\$class':+'hudson.slaves.JNLPLauncher',+'workDirSettings':+{'disabled':+true,+'workDirPath':+'',+'internalDir':+'remoting',+'failIfWorkDirIsMissing':+false},+'tunnel':+'',+'vmargs':+'-Xmx1024m'},+'retentionStrategy':+{'stapler-class':+'hudson.slaves.RetentionStrategy\$Always',+'\$class':+'hudson.slaves.RetentionStrategy\$Always'},+'nodeProperties':+{'stapler-class-bag':+'true',+'hudson-slaves-EnvironmentVariablesNodeProperty':+{'env':+[{'key':+'JAVA_HOME',+'value':+'/docker-java-home'},+{'key':+'JENKINS_HOME',+'value':+'/home/jenkins'}]},+'hudson-tools-ToolLocationNodeProperty':+{'locations':+[{'key':+'hudson.plugins.git.GitTool\$DescriptorImpl@Default',+'home':+'/usr/bin/git'},+{'key':+'hudson.model.JDK\$DescriptorImpl@JAVA-8',+'home':+'/usr/bin/java'},+{'key':+'hudson.tasks.Maven\$MavenInstallation\$DescriptorImpl@MAVEN-3.5.2',+'home':+'/usr/bin/mvn'}]}}}"	
    RESULT=$(curl -k -L -s -o /dev/null -v -k -w "%{http_code}" -u "${OPT_JENKINS_USER}:${OPT_JENKINS_API_TOKEN}" -H "Content-Type:application/x-www-form-urlencoded" -X POST -d "json=${JSON_OBJECT}" "${JENKINS_URL}/computer/doCreateItem?name=${JENKINS_AGENT_NAME}&type=hudson.slaves.DumbSlave")
	echo Jenkins Slave ${JENKINS_AGENT_NAME} created: $RESULT

	# get node secret
	JENKINS_SECRET=$(curl -L -s -u ${OPT_JENKINS_USER}:${OPT_JENKINS_API_TOKEN} -X GET ${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/slave-agent.jnlp | sed "s/.*<application-desc main-class=\"hudson.remoting.jnlp.Main\"><argument>\([a-z0-9]*\).*/\1/")
	echo SECRET is $JENKINS_SECRET

	# start agent
	$JAVA_BIN $JAVA_OPTS $JNLP_PROTOCOL_OPTS -cp /usr/share/jenkins/slave.jar hudson.remoting.jnlp.Main -headless $TUNNEL $URL $WORKDIR  $JENKINS_SECRET $JENKINS_AGENT_NAME  "$@" &
	PID=$!
	echo PID $PID
	wait $PID
fi
