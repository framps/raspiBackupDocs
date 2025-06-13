# This is just a little helper Makefile. Not really sophisticated...
#
# Note: WEBSERVER and WEBSERVER_ROOTDIR are set as shell environment variables
#       outside of this Makefile for privacy.

SHELL = /usr/bin/bash

.PHONY: help all build upload

help:
	@echo "This Makefile has the following targets:"
	@echo ""
	@echo "  - all    : build locally and then upload"
	@echo ""
	@echo "  - build  : build the docs locally"
	@echo "  - upload : upload the locally built docs to webserver"
	@echo ""
	@echo ""
	@echo "Note: Better do not run a 'mdbook serve ...' in parallel!"


all: build upload

build:
	@echo -e "# Version of this documentation\n\n" > en/src/doc-version-info-automatically-generated.md
	@echo -e "# Version dieser Dokumentation\n\n"  > de/src/doc-version-info-automatically-generated.md
	@( echo -e "## Last commit\n\n\`\`\`" ; git log -n 1 ; echo '```' ; UNCOMMITED=$$(git status --porcelain '*.md*') ; [ -n "$$UNCOMMITED" ] && { echo -e "\n\`\`\`\n## Plus yet uncommited changes\n\n$$UNCOMMITED\n\`\`\`"; } ; echo -e "\nBuild: $$(date --iso-8601=minutes)" ) | tee -a  en/src/doc-version-info-automatically-generated.md  de/src/doc-version-info-automatically-generated.md

	mdbook build en
	mdbook build de

upload:
	@[ -d en/book -a -d de/book ] || { echo "Missing directory(ies) 'book/'! Build them first!" ; exit 1; }
	lftp sftp://$(WEBSERVER) -e "cd $(WEBSERVER_ROOTDIR) ; rm -r raspiBackupDocs; mirror -R en/book raspiBackupDocs; cd raspiBackupDocs ; mirror -R de/book de ; put htaccess -o .htaccess ; dir ; quit"
