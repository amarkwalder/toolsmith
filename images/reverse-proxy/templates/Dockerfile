FROM        nginx:1.10.2-alpine
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_REV_PROXY_LABEL_APP_GROUP}
LABEL       ${DOCKER_REV_PROXY_LABEL_APP_NAME}

ADD html /usr/share/nginx/html
ADD environment /etc/nginx/conf.d
