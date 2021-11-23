#!/bin/bash
PACKAGE="libretro-citra-git"
CONTAINERSHARE="/home/builder/output"
HOSTSHARE="${PWD}/output"
LOG="${0%.*}.log"

mkdir -p "${HOSTSHARE}"
{
	date
	docker container run -v "${HOSTSHARE}":"${CONTAINERSHARE}" -it "${PACKAGE}"
	find "${HOSTSHARE##*/}"
} >> "${LOG}"
