FROM ubuntu:18.04

#firefox https://charon.sandia.gov/ &

### Install prerequistes
RUN apt update --fix-missing
RUN apt update && apt upgrade -y
RUN apt install -y build-essential cmake gfortran git flex bison \
    wget curl python python-sip-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev hdf5-tools linux-headers-generic \
    libhdf5-dev netcdf-bin cdftools libnetcdf-dev cmake libopenblas-dev libblas-dev libboost-all-dev screen htop
RUN apt install -y git-lfs vim-scripts build-essential libssl-dev

WORKDIR /
RUN wget https://github.com/Kitware/CMake/releases/download/v3.20.2/cmake-3.20.2.tar.gz
RUN tar -zxvf cmake-3.20.2.tar.gz
WORKDIR cmake-3.20.2
RUN ./bootstrap
RUN make -j24
RUN make install



WORKDIR /
RUN git clone https://github.com/TriBITSPub/TriBITS.git
WORKDIR TriBITS
RUN git checkout -f 8d696d0bb0
WORKDIR /
RUN mv TriBITS tribits
RUN mkdir tribits/build
WORKDIR tribits/build
RUN cmake ..
RUN make -j24
RUN make install
ENV TRIBITS_BASE_DIR='/tribits'

WORKDIR /
RUN wget https://www.sandia.gov/app/uploads/sites/106/2022/06/charon-distrib-v2_2.tar.gz
RUN mv charon-distrib-v2_2.tar.gz charon-distrib.tar.gz
RUN tar hxvzf charon-distrib.tar.gz
WORKDIR tcad-charon
RUN cd scripts/charonInterpreter/parseGenerator && python3 generateInterpreter.py
RUN ls scripts/build/all
RUN /bin/bash


RUN git clone https://github.com/trilinos/Trilinos.git Trilinos
WORKDIR Trilinos
RUN git checkout 81e9581a3c5
RUN mkdir build
WORKDIR build
RUN apt install -y libmatio-dev
RUN cmake -DTrilinos_ENABLE_ALL_PACKAGES=ON -DCMAKE_INSTALL_PREFIX=/usr/local/ ..
RUN cmake -DTPL_ENABLE_Matio=OFF -DCMAKE_INSTALL_PREFIX=/usr/local/ .
RUN make -j24
RUN make install

COPY FixedCMakeLists.txt /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt.new
RUN cp /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt.new /tcad-charon/test/nightlyTests/particleStrike/CMakeLists.txt
WORKDIR /tcad-charon/scripts/build/all
RUN mkdir src
RUN mkdir src/interpreter
RUN cp -r /tcad-charon/scripts/charonInterpreter /tcad-charon/scripts/build/all/src/interpreter/
RUN ls src/interpreter/charonInterpreter
RUN pwd
RUN ls /
RUN pwd && python3 build_charon.py --debug-level=1
RUN make -j24
RUN make install