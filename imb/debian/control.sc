Source: imb
Section: graphics
Priority: optional
Maintainer: Ernest Skrzypczyk <emeres.code@onet.eu>
Build-Depends: cmake (>= 2.8.3),
               libopencv-dev _LIBOPCVVER_,
Standards-Version: 3.9.2
Homepage: https://github.com/em-er-es/cv/imb
Vcs-Git: https://github.com/em-er-es/cv/imb.git
Vcs-Browser: https://github.com/em-er-es/cv/imb

Package: imb
Architecture: any-amd64 any-arm64
Depends: _LIBOPENCV_ _LIBOPCVVER_, ${shlibs:Depends}, ${misc:Depends}
Description: Image processing modular blocks
 An image processing minimalist framework with modularity and flexibility in mind.
