.PHONY: lint lint.py lint.sh

lint: lint.py lint.sh

lint.python:
	black $(shell find -type f -name "*.py")
lint.sh:
	shfmt -s -w $(shell shfmt -f .)

