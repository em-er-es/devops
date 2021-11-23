#!/bin/bash
PACKAGE="libretro-citra-git"
docker image rm "${PACKAGE}"
docker container prune -f
docker image prune -f
