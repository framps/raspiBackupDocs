.PHONY: src
src:
	@../zgo.sh

.PHONY: all
all:
	@../zgo.sh -all

.PHONY: build
build:
	mdbook build

.PHONY: serve
serve:
	mdbook serve
