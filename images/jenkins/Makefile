include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_JENKINS_IMAGE_NAME}
VERSION = ${DOCKER_JENKINS_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -f bootstrap/setup-gitlab-oauth.groovy.done
	-rm -f bootstrap/setup-admin.groovy
	-rm -f bootstrap/setup-gitlab-oauth.groovy
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/jenkins

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name jenkins --rm \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROJECT_ROOT_DIR}/certs/cacerts:/etc/ssl/certs/java/cacerts:ro \
		--volume ${PROJECT_ROOT_DIR}/volumes/jenkins:/var/jenkins_home \
		$(NAME):$(VERSION)
