# OpenSourceTCAD
Easy access to OpenSource TCAD Tools

The repository contains Docker scripts to get various TCAD Tools running:
* Charon
* DevSim
* Genius

To be added:
* ViennaMOS
* FastHenry
...

# Installation and Usage:

If you have Debian/Ubuntu Linux you can use the install-ubuntu.sh script, which installs docker and builds the TCAD tools:

    ./install-ubuntu.sh

On other Linux distributions, please install Docker.io and afterwards run sudo bash build.sh in each tool directory you want.

# Genius

    cd Genius
    sudo bash bash.sh
    bin/genius.LINUX -i <inputfile>
    bin/genius.LINUX -i examples/MOS/2D/nmos1_quad.inp 

# DevSim

    cd DevSim
    sudo bash bash.sh
    python3 <inputfile>
    cd testing
    python3 mos_2d.py
