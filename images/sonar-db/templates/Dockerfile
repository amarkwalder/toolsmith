FROM        postgres:9.6.1-alpine
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_SONAR_DB_LABEL_APP_GROUP}
LABEL       ${DOCKER_SONAR_DB_LABEL_APP_NAME}

ADD bootstrap /docker-entrypoint-initdb.d
