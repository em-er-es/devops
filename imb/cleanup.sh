#!/bin/bash
IMAGES=("imb-git" "imb-git-runtime")
for IMAGE in "${IMAGES[@]}"; do
	docker image rm "${IMAGE}"
	docker container prune -f
	docker image prune -f
done
