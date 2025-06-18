#!/usr/bin/env bash

if ! command -pv rg >/dev/null; then
    echo "Required tool 'ripgrep'/'rg' not found!"
    exit 9
fi

if command -pv fdfind >/dev/null; then FD=fdfind ; fi
if command -pv fd >/dev/null; then FD=fd ; fi
if [ -z "$FD" ] ; then
    echo "Required tool 'fdfind'/'fd' not found!"
    exit 9
fi

check_files_are_synced() {
    echo -e "Check file existence in de/src <-> en/src"
    echo -e "(Files only in de/src are listed left aligned. Files only in en/src are indented.)\n"
    comm --nocheck-order -3 <($FD --base-directory de/src) <($FD --base-directory en/src)
}

check_files_are_in_summary() {
    pushd "$1"/src > /dev/null || exit
    for f in *.md ; do
        [ "$f" == SUMMARY.md ] && continue
        if rg --files-without-match "\[.*\]\($f\)" SUMMARY.md > /dev/null ; then
            echo "Missing in $1/src/SUMMARY.md: $f"
        fi

    done
    popd > /dev/null || exit
}

check_files_are_synced
echo -e "\nCheck if files from <lang>/src are in <lang>/src/SUMMARY.md\n"
check_files_are_in_summary de
check_files_are_in_summary en
