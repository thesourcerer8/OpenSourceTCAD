FROM ubuntu:18.04

#firefox https://charon.sandia.gov/ &

### Install prerequistes
RUN apt update --fix-missing
RUN apt update && apt upgrade -y && apt install -y build-essential cmake gfortran git flex bison \
	wget curl python python-sip-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev hdf5-tools linux-headers-generic \
	libhdf5-dev netcdf-bin cdftools libnetcdf-dev cmake libopenblas-dev libblas-dev libboost-all-dev

RUN git clone https://github.com/tribitspub/tribits
RUN mkdir tribits/build
WORKDIR tribits/build
RUN cmake ..
RUN make
RUN make install

WORKDIR /
RUN git clone https://github.com/trilinos/Trilinos 
RUN mkdir Trilinos/build
WORKDIR Trilinos/build
RUN apt install -y libmatio-dev
RUN cmake -DTrilinos_ENABLE_ALL_PACKAGES=ON -DCMAKE_INSTALL_PREFIX=/usr/local/ ..
RUN cmake -DTPL_ENABLE_Matio=OFF -DCMAKE_INSTALL_PREFIX=/usr/local/ .
RUN make
RUN make install

WORKDIR /
RUN wget https://charon.sandia.gov/downloads/charon-distrib-v2_1.tar.gz
RUN tar xvzf charon-distrib-v2_1.tar.gz
WORKDIR tcad-charon

RUN apt install -y git-lfs vim-scripts

