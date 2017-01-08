FROM        gitlab/gitlab-ce:8.15.2-ce.0
MAINTAINER  ${DOCKER_MAINTAINER}

LABEL       ${DOCKER_LABEL_GROUP}
LABEL       ${DOCKER_GITLAB_LABEL_APP_GROUP}
LABEL       ${DOCKER_GITLAB_LABEL_APP_NAME}

RUN apt-get upgrade -y && \
    apt-get update && \
    apt-get install -y \
      jq

ADD bootstrap   /container/bootstrap
ADD environment /container/environment
ADD service     /container/service

RUN ln -s /container/environment/gitlab.rb /etc/gitlab/gitlab.rb
RUN ln -s /container/service/gitlab-mattermost /usr/bin/gitlab-mattermost

CMD ["/container/service/run"]
