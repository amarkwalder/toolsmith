ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

define colorecho
	@echo ""
	@echo ""
	@echo "\033[96m$1\033[0m"
endef

SUBDIRS = gitlab jenkins ldap ldap-admin nexus reverse-proxy selenium-hub selenium-node-chrome selenium-node-firefox sonar sonar-db

.PHONY: $(SUBDIRS) recurse

$(MAKECMDGOALS) recurse: $(SUBDIRS)

$(SUBDIRS):
	$(call colorecho,"Execute: make -C $@ $(MAKECMDGOALS)")
	@exec $(MAKE) -C $@ $(MAKECMDGOALS)
