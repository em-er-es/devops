FROM ubuntu:18.04
ENV TERM=linux
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN sed -i 's/# deb-src/deb-src/g' /etc/apt/sources.list && apt-get update && apt-get install -y python-argcomplete python-matplotlib python-numpy python-opencv && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/input /tmp/output
WORKDIR "/tmp/"

ADD docker-run.sh mask.py "/tmp/"
CMD bash docker-run.sh
