#!/bin/bash
PACKAGE=darktable-pkg
OUTPUT=/tmp/darktable
mkdir -p "${OUTPUT}"
#xhost local:docker
docker container run --rm -e DISPLAY -v "${OUTPUT}":"${OUTPUT}" -v /tmp/.X11-unix:/tmp/.X11-unix --user="1000:1000" -it "${PACKAGE}"
