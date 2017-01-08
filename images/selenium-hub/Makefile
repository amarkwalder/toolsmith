include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_SELENIUM_HUB_IMAGE_NAME}
VERSION = ${DOCKER_SELENIUM_HUB_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-docker rmi $(NAME):$(VERSION)
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name selenium-hub --rm \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		$(NAME):$(VERSION)
