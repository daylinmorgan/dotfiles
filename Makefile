.PHONY: lint
lint:
	shfmt -s -w $(shell shfmt -f .)
