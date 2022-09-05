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

.DEFAULT_GOAL := help
# ## h, help | show this help
# .PHONY: help h
# help h: Makefile
# 	@awk -v fill=$(shell sed -n 's/^## \(.*\) | .*/\1/p' $< | wc -L)\
#     'match($$0,/^## (.*) \|/,name) && match($$0,/\| (.*)$$/,help)\
#     {printf "\033[1;93m%*s\033[0m | \033[30m%s\033[0m\n",\
#     fill,name[1],help[1];} match($$0,/^### (.*)/,str) \
#     {printf "%*s   \033[30m%s\033[0m\n",fill," ",str[1];}' $<
GOAL_COLOR=b_magenta
HELP_SEP= ->>
-include .task.mk
$(if $(filter help,$(MAKECMDGOALS)),.task.mk: ; curl -fsSL https://raw.githubusercontent.com/daylinmorgan/task.mk/v22.9.5/task.mk -o .task.mk)
