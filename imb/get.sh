#!/bin/bash
SCRIPT="${0%.*}"
MODE="${SCRIPT##*-}"
MODE="${1-${MODE}}"
SOURCE="/Programming/Projects/Image Processing/OpenCV/IMB"
TARGET="${PWD}"
BUNDLE="imb"
REPO="https://github.com/em-er-es/imb"
HEAD="HEAD"

case "${MODE}" in
	l|local)
		cd "${SOURCE}" && [[ -d .git ]] || { echo "${PWD} does not contain a Git repository. Aborting."; exit 2; }
		VERSION="$(git rev-list --count "${HEAD}").$(git rev-parse --short "${HEAD}")"
		BUNDLEARCHIVE="${BUNDLE}.${VERSION}.$(date '+%y%m%d.%H%M%S').git"
		git bundle create "${TARGET}/${BUNDLEARCHIVE}" --all && cd "${TARGET}" && ln -sf "${BUNDLEARCHIVE}" "${BUNDLE}.git"
	;;
	r|remote|repo*)
		git clone "${REPO}" "${BUNDLE}-git"
	;;
	u|unpack|unbundle)
		[[ -d "${BUNDLE}-git" ]] && rm -rIf "${BUNDLE}-git"
		git clone "${BUNDLE}.git" "${BUNDLE}-git"
#		git bundle unbundle "${BUNDLE}.git"
	;;
	*)
		echo "Unrecognized mode: ${MODE}"
		exit 1
	;;
esac
