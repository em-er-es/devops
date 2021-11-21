#!/bin/bash
IMAGE="imb-git"
CONTAINERSHARE="/home/builder/output"
HOSTSHARE="${PWD}/output"
LOG="output.log"

mkdir -p "${HOSTSHARE}"
{
	date
	docker container run -v "${HOSTSHARE}":"${CONTAINERSHARE}" -it "${IMAGE}"
	find "${HOSTSHARE##*/}"
} >> "${LOG}"
