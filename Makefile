msg = $(if tprint,$(call tprint,{a.b_magenta}==>{a.end}{a.bold} $(1){a.end}),@echo '==> $(1)')

lint: ## lint python files
	$(call msg,Linting Python Files)
	@black $(shell find -type f -name "*.py")

completions: ## generate completion scripts
	$(call msg,Generating Completions)
	@./lib/completions/update.sh

db d-build: ## build docker image
	$(call msg,Building Docker Image)
	@DOCKER_BUILDKIT=1 docker build \
		--secret id=GITHUB_TOKEN \
		$(if DOCKER_ARGS,$(DOCKER_ARGS),)\
		-f docker/Dockerfile \
		-t dots .

dr d-run: ## run docker image
	$(call msg,Running Docker Image)
	docker run --rm -it dots

dr-keep:
	docker run -it dots

FORCE:

.DEFAULT_GOAL = help
-include .task.cfg.mk
