include ../../includes/Makefile.inc

NAME = ${DOCKER_REGISTRY}/${DOCKER_NAMESPACE}/${DOCKER_REV_PROXY_IMAGE_NAME}
VERSION = ${DOCKER_REV_PROXY_IMAGE_VERSION}

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-docker rmi $(NAME):$(VERSION)
	-rm -f .configure
	-rm -f .build
	-rm -f .push
	-rm -f Dockerfile
	-rm -f environment/gitlab.conf
	-rm -f environment/jenkins.conf
	-rm -f environment/ldap-admin.conf
	-rm -f environment/mattermost.conf
	-rm -f environment/nexus.conf
	-rm -f environment/registry.conf
	-rm -f environment/selenium.conf
	-rm -f environment/sonar.conf
	-rm -rf ${PROJECT_ROOT_DIR}/volumes/reverse-proxy

run: .build
	$(call colorecho,"Run docker image [$(NAME):$(VERSION)]")
	docker run --name reverse-proxy --rm \
		--link ldap-admin:ldap-admin \
		--link gitlab:gitlab \
		--link jenkins:jenkins \
		--link sonar:sonar \
		--link nexus:nexus \
		--link selenium-hub:selenium-hub \
		--publish 80:80 \
		--publish 443:443 \
		--publish 50000:50000 \
		--env-file ${PROJECT_ROOT_DIR}/conf/.env-runtime \
		--volume ${PROJECT_ROOT_DIR}/certs:/certs \
		$(NAME):$(VERSION)
