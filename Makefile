.PHONY: src
src:
	@../zgo.sh

.PHONY: build
build:
	mdbook build

.PHONY: serve
serve:
	mdbook serve
