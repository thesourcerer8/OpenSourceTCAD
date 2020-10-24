FROM ubuntu:18.04

#firefox https://github.com/devsim/devsim &

### Install prerequistes
RUN apt update --fix-missing
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y && apt install -y git

RUN git clone --depth 1 https://github.com/devsim/devsim
WORKDIR devsim
RUN git submodule init
RUN git submodule update
RUN bash scripts/install_ubuntu_depend.sh
RUN bash scripts/build_ubuntu_18.04.sh devsim_ubuntu_18.04

