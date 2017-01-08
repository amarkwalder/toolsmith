include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_LDAP_IMAGE_NAME}
VERSION = ${DOCKER_LDAP_IMAGE_VERSION}

.PHONY: clean run run-info run-debug run-trace

clean:
	$(call colorecho,"Cleanup directory")
	-docker rmi $(NAME):$(VERSION)
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -rf environment
	-rm -rf bootstrap
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/ldap

run: run-info
run-%: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)] - $*")
	docker run --name ldap --rm \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROJECT_ROOT_DIR}/volumes/ldap/data:/var/lib/ldap \
		--volume ${PROJECT_ROOT_DIR}/volumes/ldap/config:/etc/ldap/slapd.d \
		$(NAME):$(VERSION) --loglevel $*
