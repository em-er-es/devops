#!/bin/bash
PACKAGE="libretro-citra-git"
HOSTSHARE="${PWD}/output"
LOG="${0%.*}.log"

mkdir -p "${PACKAGE}"
{
	cd "${PACKAGE}"
	date
	zstd -dk "${HOSTSHARE}/"*.pkg.tar.zst --output-dir-flat=.
	tar xvf *.pkg.tar && \
	rm -v *.pkg.tar
} >> "${LOG}"
