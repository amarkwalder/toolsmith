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
	-rm -f cacerts
	-rm -f *.key
	-rm -f *.csr
	-rm -f *.crt

build: .build
.build:
	$(call colorecho,"Create certificates")
	./create-certs

copy: build
	$(call colorecho,"Copy certificates to '${PROJECT_ROOT_DIR}/certs/'")
	mkdir -p ${PROJECT_ROOT_DIR}/certs/
	cp cacerts ${PROJECT_ROOT_DIR}/certs/
	cp *.key ${PROJECT_ROOT_DIR}/certs/
	cp *.csr ${PROJECT_ROOT_DIR}/certs/
	cp *.crt ${PROJECT_ROOT_DIR}/certs/
