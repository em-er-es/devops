#!/bin/bash
IMAGE="imb-git-runtime"
CONTAINERSHAREA="/tmp/input"
CONTAINERSHAREB="/tmp/output"
HOSTSHAREA="${PWD}/input"
HOSTSHAREB="${PWD}/output"
LOG="runtime.log"
DFILE="Dockerfile.runtime"

docker build -t "${IMAGE}" -f "${DFILE}" .

mkdir -p "${HOSTSHAREA}" "${HOSTSHAREB}"
{
	date
	docker container run -v "${HOSTSHAREA}":"${CONTAINERSHAREA}" -v "${HOSTSHAREB}":"${CONTAINERSHAREB}" -it "${IMAGE}"
	find "${HOSTSHAREB##*/}"
} >> "${LOG}"
