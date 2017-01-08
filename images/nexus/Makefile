include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_NEXUS_IMAGE_NAME}
VERSION = ${DOCKER_NEXUS_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/nexus

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name nexus --rm \
		--link ldap:ldap \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROJECT_ROOT_DIR}/certs/cacerts:/etc/ssl/certs/java/cacerts:ro \
		--volume ${PROJECT_ROOT_DIR}/volumes/nexus/data:/nexus-data \
		$(NAME):$(VERSION)
