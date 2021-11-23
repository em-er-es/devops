#!/bin/bash
[[ ${UID} -ne 0 ]] && { echo Root privilleges required; exit 1; }

SCRIPTS=(build run extract cleanup)
for SCRIPT in "${SCRIPTS[@]}"; do
	SCRIPT="${SCRIPT}.sh"
	[[ -x "${SCRIPT}" ]] && bash "${SCRIPT}"
done
