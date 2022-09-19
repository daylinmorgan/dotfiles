## lint | lint.*
.PHONY: lint
lint: lint.py lint.sh

msg = $(call tprint,{a.b_magenta}==>{a.end}{a.bold} $(1){a.end})

## lint.py | lint python files
.PHONY: lint.py
lint.py: info
	$(call msg,Linting Python Files)
	@black $(shell find -type f -name "*.py")

## lint.sh | lint shell files
.PHONY: lint.sh
lint.sh:
	$(call msg,Linting Shell Files)
	@shfmt -s -w $(shell shfmt -f .)

## db, d-build | build docker image
.PHONY: db d-build
db d-build:
	$(call msg,Building Docker Image)
	@docker build -f docker/Dockerfile -t dots .

## dr, d-run | run docker image
.PHONY: dr d-run
dr d-run:
	$(call msg,Running Docker Image)
	docker run --rm -it dots

.PHONY: dr-keep
dr-keep:
	docker run -it dots

.DEFAULT_GOAL = help
GOAL_STYLE = b_magenta
HELP_SEP = {a.b_green}->>{a.end}
USAGE = {a.italic}{a.b_cyan}Best Dots Around{a.end}\n
-include .task.mk
$(if $(wildcard .task.mk),,.task.mk: ; @curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/main/task.mk -o .task.mk 2>/dev/null || echo "no curl, skipping task.mk download")
