ifndef PROJECT_ROOT_DIR
    $(error PROJECT_ROOT_DIR is undefined)
endif

include $(PROJECT_ROOT_DIR)/conf/.env-config
include $(PROJECT_ROOT_DIR)/.env

define colorecho
	@echo ""
	@echo "\033[92m$1\033[0m"
endef

.PHONY: all

all: build

configure: .configure
.configure:
	$(call colorecho,"Configure")
	./configure
	@touch .configure

build: .build
.build: .configure
	$(call colorecho,"Build docker image [$(NAME):$(VERSION)]")
	docker build -t $(NAME):$(VERSION) --rm --no-cache .
	@touch .build

push: .push
.push: .build
	$(call colorecho,"Push docker image [$(NAME):$(VERSION)]")
	docker login ${DOCKER_REGISTRY}
	docker push $(NAME):$(VERSION)
	@touch .push
