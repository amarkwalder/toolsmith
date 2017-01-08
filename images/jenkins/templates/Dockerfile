FROM        jenkins:2.32.1-alpine
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_JENKINS_LABEL_APP_GROUP}
LABEL       ${DOCKER_JENKINS_LABEL_APP_NAME}

USER root

ADD bootstrap /container/bootstrap

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

RUN mv /container/bootstrap/setup-*.groovy* /usr/share/jenkins/ref/init.groovy.d/

RUN chown -R jenkins:root /container && \
    chown jenkins:root /usr/share/jenkins/ref/init.groovy.d/* && \
    chmod g+w /usr/share/jenkins/ref/init.groovy.d/*

USER jenkins

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
