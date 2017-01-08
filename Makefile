ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

include $(PROJECT_ROOT_DIR)/conf/.env-config

define sep
	@echo ""
	@echo ""
endef

define colorecho
	@echo "\033[97m$1\033[0m"
endef

.PHONY: clean certs images

clean:
	$(call sep)
	$(call colorecho,"= Cleanup Toolsmith")
	$(call colorecho,"===================")
	@exec $(MAKE) -C certs clean
	@exec $(MAKE) -C images clean

certs:
	$(call sep)
	$(call colorecho,"= Create Certificates for Toolsmith")
	$(call colorecho,"===================================")
	@exec $(MAKE) -C certs build

images:
	$(call sep)
	$(call colorecho,"= Create Docker Images")
	$(call colorecho,"======================")
	@exec $(MAKE) -C images build
	@exec docker images -f label=$(DOCKER_LABEL_GROUP)
