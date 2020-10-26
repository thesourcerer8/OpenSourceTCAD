FROM ubuntu:18.04

#firefox https://github.com/devsim/devsim &

### Install prerequistes
ENV TZ=Europe/Vienna
ENV LANG=C.UTF-8

RUN apt update --fix-missing
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y && apt install -y git vim python3-numpy

### Install
RUN git clone --depth 1 https://github.com/devsim/devsim
WORKDIR devsim
RUN git submodule init
RUN git submodule update
RUN bash scripts/install_ubuntu_depend.sh
RUN bash scripts/build_ubuntu_18.04.sh devsim_ubuntu_18.04
ENV PYTHONPATH=/devsim/dist/devsim_ubuntu_18.04/lib

