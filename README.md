# OpenSourceTCAD
Easy access to OpenSource TCAD Tools

The repository contains Docker scripts to get various TCAD Tools running:
* Charon  (6.5 GB)
* DevSim  (800 MB)
* Genius  (1.8 GB)

To be added:
* ViennaMOS
* FastHenry
...

# Installation and Usage:

If you have Debian/Ubuntu Linux you can use the install-ubuntu.sh script, which installs docker and builds all the TCAD tools:
Warning: The build process takes approximately 10 hours.

    ./install-ubuntu.sh

If you want to install just one of the tools, install the docker.io package, and then go to the directory of the tool and run "sudo bash build.sh".
On other Linux distributions, please install Docker.io and afterwards run sudo bash build.sh in each tool directory you want.



# Genius

    cd Genius
    sudo bash bash.sh
    #bin/genius.LINUX -i <inputfile>
    bin/genius.LINUX -i examples/MOS/2D/nmos1_quad.inp 
    paraview nmos_quad.vtu
    # Now click on the Apply button on the left and then click on the Combobox in the upper left area and select electrical_field
Genius User Manual: https://www.i-vis.co.jp/pdf/cogenda/User_Guide.pdf

# DevSim

    cd DevSim
    sudo bash bash.sh
    #python3 <inputfile>
    cd testing
    python3 mos_2d.py
DevSim User Manual: https://devsim.com/devsim_papers/devsim.pdf

# Charon 
    cd Charon
    sudo bash bash.sh
    #charon_mp.exe --i=<inputfile>
    cd /tcad-charon/test/nightlyTests/bjt1dbasebc
    charon_mp.exe --i=2c2907.dd.equ.xml

Charon User Manual: https://charon.sandia.gov/documentation/Charon_UserManual.pdf
