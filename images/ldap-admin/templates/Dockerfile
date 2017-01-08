FROM        osixia/phpldapadmin:0.6.12
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_LDAP_ADMIN_LABEL_APP_GROUP}
LABEL       ${DOCKER_LDAP_ADMIN_LABEL_APP_NAME}

RUN apt-get upgrade -y && \
    apt-get update

ADD environment /container/environment
