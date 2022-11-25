#!/bin/bash

set -e

export DATABASE="verse-hadith-${PWD##*/}.db"

[[ -f "${DATABASE}" ]] && rm "${DATABASE}"
[[ -f "schema.sql" ]] || exit 1

sqlite3 "${DATABASE}" < "schema.sql"

for file in $(find "." -name "*.json") ; do
    export ELEMENTS=()
    while IFS="" read -r line ; do
        ELEMENTS+=("${line}")
    done <<< "$(jq -r "values[]" "${file}")"

    if [[ "${#ELEMENTS[@]}" -eq 4 ]] ; then
        case "${ELEMENTS[0],,}" in
            "ayet"|"verse")
                sqlite3 "${DATABASE}" "INSERT INTO verse VALUES (\"${ELEMENTS[1]}\",\"${ELEMENTS[2]}\",\"${ELEMENTS[3]}\");"
            ;;
            "hadis"|"hadith")
                sqlite3 "${DATABASE}" "INSERT INTO hadith VALUES (\"${ELEMENTS[1]}\",\"${ELEMENTS[2]}\",\"${ELEMENTS[3]}\");"
            ;;
            *)
                echo "wrong type: (${file##*/})"
            ;;
        esac
    else
        echo "this json file is not set properly: (${file})"
    fi
done

echo "==> ${DATABASE}"