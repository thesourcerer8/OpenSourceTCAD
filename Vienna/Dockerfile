FROM ubuntu:18.04
ENV TZ=Europe/Vienna
ENV LANG=C.UTF-8

### Install prerequistes
RUN apt update && apt upgrade -y

ENV TZ=Europe/Vienna
ENV LANG=C.UTF-8
RUN apt install -y tzdata

RUN apt update && apt install -y git wget g++ vim cmake libboost-all-dev
RUN apt install -y libqt4-dev

RUN ln -s /usr/lib/python2.7/dist-packages/vtk/libvtkRenderingPythonTkWidgets.x86_64-linux-gnu.so /usr/lib/x86_64-linux-gnu/libvtkRenderingPythonTkWidgets.so

#RUN apt update && apt install -y build-essential cmake gfortran git flex bison \
#	wget curl python python-sip-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev hdf5-tools linux-headers-generic \
#	lvtk-dev lvtk-tools vtkdata libhdf5-dev libboost-dev

#RUN apt install -y libqt4-dev libvtk6-dev


RUN git clone https://github.com/thesourcerer8/viennamos-dev

WORKDIR /viennamos-dev
#RUN cmake .
#RUN make
#RUN make install
#

