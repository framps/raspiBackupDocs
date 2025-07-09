#!/usr/bin/env bash

if ! command -pv rg >/dev/null; then
    echo "Required tool 'ripgrep'/'rg' not found!"
    exit 9
fi

unset FD
if command -pv fdfind >/dev/null; then
    FD=fdfind
else
    if command -pv fd >/dev/null; then
        if [[ ! -d /etc/fdclone ]] ; then
            FD=fd
        fi
    fi
fi

if [ -z "$FD" ] ; then
    echo "Required tool 'fd-find'/'fdfind'/'fd' not found!"
    exit 9
fi

check_files_are_synced() {
    echo -e "*** Check file existence in de/src <-> en/src ***"
    echo -e "(Files only in de/src are listed in the left column, files only in en/src in the right one.)\n"
    sdiff --suppress-common-lines  <($FD --base-directory de/src) <($FD --base-directory en/src)
    echo -e "\n*** Check file existence in de/theme <-> en/theme ***\n"
    sdiff --suppress-common-lines  <($FD --base-directory de/theme) <($FD --base-directory en/theme)
    #
    # echo -e "\n*** Check via rsync ***\n"
    # rsync -Pauc --dry-run de/theme en/ | grep -v "sending incremental file list"
    # rsync -Pauc --dry-run en/theme de/ | grep -v "sending incremental file list"
    #
    echo -e "\n*** Check via tree ***\n"
    pr -m -t <(tree --noreport de/theme) <(tree --noreport en/theme)
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
echo -e "\n*** Check if files from <lang>/src are in <lang>/src/SUMMARY.md ***\n"
check_files_are_in_summary de
check_files_are_in_summary en
