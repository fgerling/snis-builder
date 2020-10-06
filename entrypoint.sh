#!/bin/bash
set -euxo pipefail

CONCOURSE_REPO="space-nerds-in-space-repo"

function build_snis {
	if [ ! -d "${CONCOURSE_REPO}" ]
	then
		>&2 echo "[ERROR] No ${CONCOURSE_REPO} repo found"
		    echo "[DEBUG] pwd: $(pwd)"
			exit 1
	fi

	cd "${CONCOURSE_REPO}"
	make clean
	make
	make update-assets
}

if [ $# -eq 0 ]
then
	build_snis 
else
	exec "$@"
fi
