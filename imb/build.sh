#!/bin/bash
IMAGE="imb-git"
if [[ ! -f "Dockerfile" ]]; then
	echo -e 'Symlink/Copy the desired Ubuntu version as Dockerfile first.\n\t$ ln -sv Dockerfile.ubuntu1804 Dockerfile\n\t$ ln -sv Dockerfile.ubuntu2004 Dockerfile'
	exit 2;
fi
docker build -t "${IMAGE}" .
