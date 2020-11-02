FROM ubuntu:18.04

#firefox https://charon.sandia.gov/ &

### Install prerequistes
RUN apt update --fix-missing
RUN apt update && apt upgrade -y 
RUN apt install -y build-essential cmake gfortran git flex bison \
	wget curl python python-sip-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev hdf5-tools linux-headers-generic \
	libhdf5-dev netcdf-bin cdftools libnetcdf-dev cmake libopenblas-dev libblas-dev libboost-all-dev
RUN apt install -y git-lfs vim-scripts

RUN git clone https://github.com/tribitspub/tribits
RUN mkdir tribits/build
WORKDIR tribits/build
RUN cmake ..
RUN make
RUN make install
ENV TRIBITS_BASE_DIR=/tribits

WORKDIR /
RUN wget https://charon.sandia.gov/downloads/charon-distrib-v2_1.tar.gz
RUN tar xvzf charon-distrib-v2_1.tar.gz
WORKDIR tcad-charon

RUN git clone https://github.com/trilinos/Trilinos 
WORKDIR Trilinos
RUN git checkout charon-release-v2.1-06.may.2020
RUN mkdir build
WORKDIR build
RUN apt install -y libmatio-dev
RUN cmake -DTrilinos_ENABLE_ALL_PACKAGES=ON -DCMAKE_INSTALL_PREFIX=/usr/local/ ..
RUN cmake -DTPL_ENABLE_Matio=OFF -DCMAKE_INSTALL_PREFIX=/usr/local/ .
RUN make
RUN make install

COPY FixedCMakeLists.txt /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt.new
RUN cp /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt.new /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt
WORKDIR /tcad-charon/scripts/build/all
RUN ./build_charon.py
RUN make
