#!/bin/bash
set -euxo pipefail
function build_snis {
	if [ ! -d "space-nerds-in-space" ]
	then
		git clone https://github.com/smcameron/space-nerds-in-space.git
	fi

	cd space-nerds-in-space
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
