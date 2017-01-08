FROM        sonarqube:6.2-alpine
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_SONAR_LABEL_APP_GROUP}
LABEL       ${DOCKER_SONAR_LABEL_APP_NAME}

RUN apk add --update \
      bash \
      postgresql-client && \
    rm -rf /var/cache/apk/*

ADD bootstrap /container/bootstrap
ADD service   /container/service

RUN ln -s /container/service/sonar-auth-gitlab-plugin-1.0.0.jar /opt/sonarqube/extensions/plugins/sonar-auth-gitlab-plugin-1.0.0.jar

ENTRYPOINT ["/container/service/run"]
