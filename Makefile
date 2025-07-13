# This is just a little helper Makefile. Not really sophisticated...
#
# Note: WEBSERVER and WEBSERVER_ROOTDIR are set as shell environment variables
#       outside of this Makefile for privacy.

SHELL = /usr/bin/bash

.PHONY: help all build serveDe serveEn push upload check

help:
	@echo "This Makefile has the following targets:"
	@echo ""
	@echo "  - push   : build locally to check and if successful push to GitHub for deployment"
	@echo "  - all    : build locally and then upload to webserver"
	@echo ""
	@echo "  - build  : build the docs locally"
	@echo "  - upload : upload the locally built docs to webserver"
	@echo ""
	@echo "  - check  : check if files are synced and in SUMMARY.md"
	@echo ""
	@echo "  - serveDe: build locally; and serve 'de' version via browser"
	@echo "  - serveEn: build locally; and serve 'en' version via browser"
	@echo ""
	@echo ""
	@echo "Note: Better do not run a 'mdbook serve ...' in parallel!"


all: build push upload check checklinks

build:
	@echo -e "# Version of this documentation\n\n" > en/src/doc-version-info-automatically-generated.md
	@echo -e "# Version dieser Dokumentation\n\n"  > de/src/doc-version-info-automatically-generated.md
	@( echo -e "## Last commit\n\n\`\`\`" ; git log -n 1 ; echo '```' ; UNCOMMITED=$$(git status --porcelain) ; [ -n "$$UNCOMMITED" ] && { echo -e "\n\n## Plus yet uncommited changes\n\n\`\`\`\n$$UNCOMMITED\n\`\`\`"; } ; echo -e "\nBuild: $$(date --iso-8601=minutes)" ) | tee -a  en/src/doc-version-info-automatically-generated.md  de/src/doc-version-info-automatically-generated.md


	mdbook build en
	mdbook build de

serveDe: build
	mdbook serve --open de

serveEn: build
	mdbook serve --open en

push:
	mdbook build en
	mdbook build de
	git push

upload:
	@[ -d en/book -a -d de/book ] || { echo "Missing directory(ies) 'book/'! Build them first!" ; exit 1; }
	@[ -n "$(WEBSERVER)" -a -n "$(WEBSERVER_ROOTDIR)" ] || { echo "Environment variables WEBSERVER and WEBSERVER_ROOTDIR need to be set!"; exit 2; }
	lftp sftp://$(WEBSERVER) -e "cd $(WEBSERVER_ROOTDIR) ; rm -r raspiBackupDoc; mirror -R en/book raspiBackupDoc; cd raspiBackupDoc ; mirror -R de/book de ; put data/htaccess -o .htaccess ; dir ; quit"

check: checklinks
	@bin/check_files.sh

checklinks:
	@if ! command -v mdlinkcheck.py >/dev/null; then echo "!!! For additional checking of Markdown links install 'mdlinkcheck.py' from https://github.com/rpi-simonz/mdlinkcheck" ; fi
	@if command -v mdlinkcheck.py >/dev/null; then mdlinkcheck.py --raspiBackupDoc de/src en/src ; fi
