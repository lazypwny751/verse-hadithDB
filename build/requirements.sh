#!/bin/sh

set -e

# Check the requirements:
for chk in "rm" "jq" "find" "bash" "sqlite3" ; do
    if ! command -v "${chk}" > /dev/null ; then
        echo "\t\033[0;31m${0##*/}\033[0m: \"${chk}\" not found.."
        export status="false"
    fi
done

# Result
if ! ${status} ; then
    exit 1
fi