include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_SONAR_IMAGE_NAME}
VERSION = ${DOCKER_SONAR_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -f service/run
	-rm -rf bootstrap
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/sonar

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name sonar --rm \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--link sonar-db:sonar-db \
		--volume ${PROJECT_ROOT_DIR}/certs/cacerts:/etc/ssl/certs/java/cacerts:ro \
		--volume ${PROJECT_ROOT_DIR}/volumes/sonar/data:/var/opt/sonarqube \
		$(NAME):$(VERSION)
