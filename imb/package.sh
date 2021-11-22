#!/bin/bash
IMAGE="imb-git"
CONTAINERSHARE="/home/builder/output"
HOSTSHARE="${PWD}/output"
LOG="output.log"
CONTROLFILE="debian/control"

if [[ ! -f "${CONTROLFILE}" ]]; then
	bash preprocess.sh || { echo "${CONTROLFILE} could not be generated"; exit 2; }
fi

mkdir -p "${HOSTSHARE}"
{
	date
	docker container run -v "${HOSTSHARE}":"${CONTAINERSHARE}" -it "${IMAGE}"
	find "${HOSTSHARE##*/}"
} >> "${LOG}"
