include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_GITLAB_IMAGE_NAME}
VERSION = ${DOCKER_GITLAB_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-docker rmi $(NAME):$(VERSION)
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -rf environment
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/gitlab

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name gitlab --rm \
		--privileged \
		--link ldap:ldap \
		--publish 22:22 \
		--env-file ${PROECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROECT_ROOT_DIR}/volumes/gitlab/config:/etc/gitlab \
		--volume ${PROECT_ROOT_DIR}/volumes/gitlab/logs:/var/log/gitlab \
		--volume ${PROECT_ROOT_DIR}/volumes/gitlab/data:/var/opt/gitlab \
		$(NAME):$(VERSION)
