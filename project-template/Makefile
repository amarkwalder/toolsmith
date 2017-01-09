ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

define colorecho
	@echo ""
	@echo "\033[92m$1\033[0m"
endef

.PHONY: project

project:
	$(call colorecho,"Setup project")
	./setup-project
