#!/bin/bash
IMAGE="imb-git"
DFILE="Dockerfile"
if [[ ! -f "${DFILE}" ]]; then
	echo -e 'Symlink/Copy the desired Ubuntu version as Dockerfile first.\n\t$ ln -sv Dockerfile.ubuntu1804 Dockerfile\n\t$ ln -sv Dockerfile.ubuntu2004 Dockerfile'
	exit 2;
fi

SYMLINK="$(readlink "${DFILE}")"

case "${SYMLINK}" in
	*.ubuntu1804)
		TARGET="debian/control.sc"
		sed 's/_LIBOPENCV_/libopencv-highgui3.2/g;s/_LIBOPCVVER_/(>= 3.2.0)/g' "${TARGET}" > "${TARGET%.*}"
	;;
	*.ubuntu2004)
		TARGET="debian/control.sc"
		sed 's/_LIBOPENCV_/libopencv-highgui4.2/g;s/_LIBOPCVVER_/(>= 4.2.0)/g' "${TARGET}" > "${TARGET%.*}"
	;;
	*)
		echo "Unrecognized symlink ${SYMLINK}. Proceeding anyway."
	;;
esac
