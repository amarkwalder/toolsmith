FROM        osixia/openldap:1.1.7
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_LDAP_LABEL_APP_GROUP}
LABEL       ${DOCKER_LDAP_LABEL_APP_NAME}

RUN apt-get upgrade -y && \
    apt-get update

ADD bootstrap   /container/service/slapd/assets/config/bootstrap
ADD environment /container/environment
