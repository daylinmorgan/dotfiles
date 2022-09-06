.PHONY: lint lint.py lint.sh

## lint | lint.*
lint: lint.py lint.sh

## lint.python | lint python files
lint.python:
	black $(shell find -type f -name "*.py")

## lint.sh | lint shell files
lint.sh:
	shfmt -s -w $(shell shfmt -f .)

.PHONY: $(addprefix d-,b r build run)

## db, d-build | build docker image
db d-build:
	docker build -f docker/Dockerfile -t dots .

## dr, d-run | run docker image
dr d-run:
	docker run --rm -it dots

.PHONY: dr-keep
dr-keep:
	docker run -it dots

.DEFAULT_GOAL = help
GOAL_COLOR = b_magenta
HELP_SEP = ->>
-include .task.mk
$(if $(wildcard .task.mk),,.task.mk: ; curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/v22.9.5/task.mk -o .task.mk)
