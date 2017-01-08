ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

include $(PROJECT_ROOT_DIR)/conf/.env-config
include $(PROJECT_ROOT_DIR)/.env

define colorecho
	@echo ""
	@echo "\033[92m$1\033[0m"
endef

.PHONY: clean run

clean:
	$(call colorecho,"Cleanup directory")
	-rm -f *.key
	-rm -f *.csr
	-rm -f *.crt

build: .build
.build:
	$(call colorecho,"Create Certificates")
	./create-certs
