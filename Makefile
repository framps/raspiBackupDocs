# This is just a littel helper Makefile. Not really sophisticated...
#
# Note: WEBSERVER and WEBSERVER_ROOTDIR are set as shell environment variables
#       outside of this Makefile for privacy.

.PHONY: help all build upload

help:
	@echo "This Makefile has the following targets:"
	@echo ""
	@echo "  - all    : build locally and then upload"
	@echo ""
	@echo "  - build  : build the docs locally"
	@echo "  - upload : upload the locally built docs to webserver"


all: build upload

build:
	mdbook build en
	mdbook build de

upload:
	@[ -d en/book -a -d de/book ] || { echo "Missing directory(ies) 'book/'! Build them first!" ; exit 1; }
	lftp sftp://$(WEBSERVER) -e "cd $(WEBSERVER_ROOTDIR) ; rm -r raspiBackupDocs; mirror -R en/book raspiBackupDocs; cd raspiBackupDocs ; mirror -R de/book de ; put htaccess -o .htaccess ; dir ; quit"
