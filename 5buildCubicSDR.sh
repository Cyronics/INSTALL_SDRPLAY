#!/bin/sh
# Script to download, build and install the Widgets for CubicSDR

# clear the terminal
clear
# say what we are doing
echo "Download and build CubicSDR"
# make the ~/Dev folder (but only if it doesn't already exist)
mkdir -p ~/Dev
# change to the Dev folder
cd ~/Dev
# download and install hamlib and alsa sound libraries
sudo apt install libhamlib-dev libasound2-dev -y
# remove CubicSDR folder (if it previously exists)
rm -rf CubicSDR
# download CubicSDR code
git clone https://github.com/cjcliffe/CubicSDR
# change to the CubicSDR folder
cd CubicSDR
# create the build folder
mkdir build
# change to the build folder
cd build
# create the build files
cmake .. -DCMAKE_BUILD_TYPE=Release -DUSE_HAMLIB=1 -DOTHER_LIBRARIES="-latomic" -DUSE_AUDIO_PULSE=0 -DUSE_AUDIO_OSS=0 -DUSE_AUDIO_ALSA=1 -DwxWidgets_CONFIG_EXECUTABLE=~/Dev/wxWidgets-staticlib/bin/wx-config
# start the compiler
make
# install the CubicSDR files
sudo make install
# ask the user to press any key to continue
read -n 1 -s -r -p "Press any key to reboot"
# reboot the machine
sudo reboot