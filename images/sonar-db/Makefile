include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_SONAR_DB_IMAGE_NAME}
VERSION = ${DOCKER_SONAR_DB_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-docker rmi $(NAME):$(VERSION)
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -rf bootstrap
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/sonar-db

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name sonar-db --rm \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROJECT_ROOT_DIR}/volumes/sonar-db/data:/var/lib/postgresql/data \
		$(NAME):$(VERSION)
