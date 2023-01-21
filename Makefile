lint: lint.py lint.sh ## lint.*

msg = $(if tprint,$(call tprint,{a.b_magenta}==>{a.end}{a.bold} $(1){a.end}),@echo '==> $(1)')

lint.py: info ## lint python files
	$(call msg,Linting Python Files)
	@black $(shell find -type f -name "*.py")

.PHONY: lint.sh
lint.sh: ## lint shell files
	$(call msg,Linting Shell Files)
	@shfmt -s -w $(shell shfmt -f .)

completions: ## generate completion scripts
	$(call msg,Generating Completions)
	@./lib/completions/update.sh

.PHONY: fzf
fzf: lib/.fzf/completion.zsh lib/.fzf/key-bindings.zsh ## update fzf shell scripts

# update fzf shell scripts
lib/.fzf/%.zsh: FORCE
	wget -O $@ \
		https://raw.githubusercontent.com/junegunn/fzf/master/shell/$*.zsh

.PHONY: db d-build
db d-build: ## build docker image
	$(call msg,Building Docker Image)
	@DOCKER_BUILDKIT=1 docker build \
		--secret id=GITHUB_TOKEN \
		--progress=plain \
		-f docker/Dockerfile \
		-t dots .

.PHONY: dr d-run
dr d-run: ## run docker image
	$(call msg,Running Docker Image)
	docker run --rm -it dots

.PHONY: dr-keep
dr-keep:
	docker run -it dots

FORCE:

.DEFAULT_GOAL = help
-include .task.cfg.mk .task.mk
$(if $(wildcard .task.mk),,.task.mk: ; @curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/main/task.mk -o .task.mk 2>/dev/null || echo "no curl, skipping task.mk download")
