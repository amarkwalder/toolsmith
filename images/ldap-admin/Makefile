include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_LDAP_ADMIN_IMAGE_NAME}
VERSION = ${DOCKER_LDAP_ADMIN_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -rf environment
	-rm -rf bootstrap
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/ldap-admin

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name ldap-admin --rm \
		--link ldap:ldap \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		$(NAME):$(VERSION)
