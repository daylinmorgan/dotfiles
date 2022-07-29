.PHONY: lint

lint:
	shfmt -s -w $(shell shfmt -f .)
	black $(shell find -type f -name "*.py")

