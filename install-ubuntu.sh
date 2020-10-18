echo Installation routine for Ubuntu:

sudo apt-get install docker.io

cd Charon
sudo bash build.sh
cd ..
cd Genius
sudo bash build.sh
cd ..
cd DevSim
sudo bash build.sh
cd ..


echo "All Docker images have been built."
