#!/bin/bash
[[ ${UID} -ne 0 ]] && { echo Root privilleges required; exit 1; }

#if command -v tee &>/dev/null; then
#	for F in *.sh; do
#		sed 's/} #?>> "${LOG}"/} | tee -a "${LOG}"/' -i "${F}";
#	done
#fi

SCRIPTS=(preprocess build package cleanup extract install-package)
for SCRIPT in "${SCRIPTS[@]}"; do
	SCRIPT="${SCRIPT}.sh"
	[[ -x "${SCRIPT}" ]] && bash "${SCRIPT}"
done
