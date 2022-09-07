## lint | lint.*
.PHONY: lint
lint: lint.py lint.sh

## lint.py | lint python files
.PHONY: lint.py
lint.py:
	black $(shell find -type f -name "*.py")

## lint.sh | lint shell files
.PHONY: lint.sh
lint.sh:
	shfmt -s -w $(shell shfmt -f .)

## db, d-build | build docker image
.PHONY: db d-build
db d-build:
	docker build -f docker/Dockerfile -t dots .

## dr, d-run | run docker image
.PHONY: dr d-run
dr d-run:
	docker run --rm -it dots

.PHONY: dr-keep
dr-keep:
	docker run -it dots

.DEFAULT_GOAL = help
GOAL_COLOR = b_magenta
HELP_SEP = ->>
-include .task.mk
$(if $(wildcard .task.mk),,.task.mk: ; curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/main/task.mk -o .task.mk)
