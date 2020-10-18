FROM ubuntu:18.04

#firefox https://github.com/devsim/devsim &

### Install prerequistes
RUN apt update --fix-missing
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -y && apt install -y build-essential cmake gfortran git flex bison \
	wget curl python python-sip-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev hdf5-tools linux-headers-generic \
	libhdf5-dev netcdf-bin cdftools libnetcdf-dev cmake libopenblas-dev libblas-dev libboost-all-dev \
	liblapack-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.9.0 /usr/lib/liblapack.so.3
RUN ln -s /usr/lib/x86_64-linux-gnu/blas/libblas.so.3 /usr/lib/libblas.so.3

RUN git clone https://github.com/devsim/devsim
WORKDIR devsim
RUN sh scripts/setup_ubuntu_16.04.sh 
RUN git submodule init
RUN git submodule update
WORKDIR external/symdiff
RUN bash scripts/setup_ubuntu_18.sh
WORKDIR ../
RUN tar xvzf superlu_4.3.tar.gz
WORKDIR SuperLU_4.3
RUN cmake .
RUN make
WORKDIR ../../
RUN cp external/SuperLU_4.3/libsuperlu.a external/SuperLU_4.3/lib/libsuperlu_4.3.a
RUN mkdir external/getrf/build
RUN ln -s external/getrf/libgetrf.a external/getrf/build/libgetrf.a
ENV DEVSIM_CONFIG=ubuntu_16.04
RUN cmake .

