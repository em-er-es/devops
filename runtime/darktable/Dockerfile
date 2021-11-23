FROM ubuntu:20.04
ENV TERM=linux
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sed -i 's/# deb-src/deb-src/g' /etc/apt/sources.list && apt-get update && apt-get install -y darktable && rm -rf /var/lib/apt/lists/*

# Adapt 1000 to your user/group id
ENV USER=darktable
RUN export uid=1000 gid=1000 && \
    mkdir -p "/home/${USER}" && \
    echo "${USER}:x:${uid}:${gid}:${USER},,,:/home/${USER}:/bin/bash" >> /etc/passwd && \
    echo "${USER}:x:${uid}:" >> /etc/group && \
    mkdir /etc/sudoers.d && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" && \
    chmod 0440 /etc/sudoers.d/${USER} && \
    chown ${uid}:${gid} -R "/home/${USER}"

USER ${USER}
ENV HOME="/home/${USER}"
CMD /usr/bin/darktable
