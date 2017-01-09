ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

define sep
	@echo ""
	@echo ""
endef

define colorecho
	@echo "\033[97m$1\033[0m"
endef

.PHONY: clean certs images

#-------------------------------------------------------------------------------

clean-all:
	$(call sep)
	$(call colorecho,"= Cleanup Toolsmith")
	$(call colorecho,"===================")
	@exec $(MAKE) -C certs clean
	@exec $(MAKE) -C images clean

#-------------------------------------------------------------------------------

project:
	$(call sep)
	$(call colorecho,"= Setup Project")
	$(call colorecho,"===============")
	@exec $(MAKE) -C project-template project
#-------------------------------------------------------------------------------

clean-certs:
	$(call sep)
	$(call colorecho,"= Cleanup Toolsmith (Certificates)")
	$(call colorecho,"==================================")
	@exec $(MAKE) -C certs clean

certs:
	$(call sep)
	$(call colorecho,"= Create Certificates for Toolsmith")
	$(call colorecho,"===================================")
	@exec $(MAKE) -C certs build
	@exec $(MAKE) -C certs copy

#-------------------------------------------------------------------------------

clean-images:
	$(call sep)
	$(call colorecho,"= Cleanup Toolsmith (Docker Images)")
	$(call colorecho,"===================================")
	@exec $(MAKE) -C images clean

images:
	$(call sep)
	$(call colorecho,"= Create Docker Images")
	$(call colorecho,"======================")
	@exec $(MAKE) -C images build
	@exec docker images

#-------------------------------------------------------------------------------
