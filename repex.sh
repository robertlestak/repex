#!/bin/bash

function display_repex_usage () {
cat << EOF
repex -f [file] -s [search] -r [replace] -d [delimiter]
EOF
	exit 0
}

# Usage repex -f [file] -s [search] -r [replace] -d [delimiter]
# Can supply multiple search parameters to all be replaced by a common
# replacement parameter
# Delimiter defaults to ","
function repex () {
	FILE=""
	FILE_CONTENTS=""
	SEARCHES=()
	REPLACE=""
	DELIM=${DELIM:-,}
	while getopts ":f:s:r:d:" opt; do
		case $opt in
		f)
			FILE="$OPTARG"
			FILE_CONTENTS=$(<$FILE)
			;;
		s)
			SEARCHES+=("$OPTARG")
			;;
		r)
			REPLACE="$OPTARG"
			;;
		d)
			DELIM="$OPTARG"
			;;
		\? )
			display_repex_usage
			;;
		esac
	done

	for S in ${SEARCHES[*]}; do
		FILE_CONTENTS=$(str_replace "$FILE_CONTENTS" "$S" "$REPLACE" "$DELIM")
	done
	eval "$FILE_CONTENTS"
}

# Usage: str_replace "[string]" "[search]" "[replace]" "[delimiter]"
# Delimiter defaults to ","
function str_replace () {
	D=${4:-,}
	echo "$1" | sed s"$D$2$D$3$D"g
}
