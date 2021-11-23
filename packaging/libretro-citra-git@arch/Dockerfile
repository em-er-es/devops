FROM archlinux:base-devel AS build-stage
RUN pacman -Syu --noconfirm && pacman -S --noconfirm cmake git

# Adapt 1000 to your user/group id
ENV USER=builder
RUN export uid=1000 gid=1000 && \
    mkdir -p "/home/${USER}" && \
    echo "${USER}:x:${uid}:${gid}:${USER},,,:/home/${USER}:/bin/bash" >> /etc/passwd && \
    echo "${USER}:x:${uid}:" >> /etc/group && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" && \
    chmod 0440 "/etc/sudoers.d/${USER}" && \
    chown ${uid}:${gid} -R "/home/${USER}"

ENV HOME="/home/${USER}"
ENV PKGA="libretro-core-info-git"
ENV PKGB="libretro-citra-git"

USER "${USER}"
WORKDIR "${HOME}"
RUN git clone "https://aur.archlinux.org/${PKGA}.git" && git clone "https://aur.archlinux.org/${PKGB}.git" && \
cd "${PKGA}" && makepkg -c

USER root
WORKDIR "${HOME}/${PKGA}"
RUN pacman -U --noconfirm *.pkg.tar.*

USER "${USER}"
WORKDIR "${HOME}/${PKGB}"
RUN makepkg -c && echo Build completed

USER root
ENV TARGET="${HOME}/output"
CMD cp -v "${HOME}/${PKGB}/"*.pkg.tar.* "${TARGET}"
