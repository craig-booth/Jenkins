FROM jenkins/jenkins:alpine

USER root

RUN apk -U add docker

USER jenkins

RUN jenkins-plugin-cli --plugins \
reverse-proxy-auth-plugin \
workflow-aggregator \
pipeline-stage-view \
docker-workflow \
xunit \
http_request \
github \
ws-cleanup

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER root
