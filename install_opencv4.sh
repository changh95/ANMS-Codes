# Dependencies
sudo apt-get -y install build-essential cmake wget unzip ffmpeg libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev ninja-build
sudo rm -rf ./opencv

mkdir opencv
cd opencv 

# Download source (OpenCV 4.4.0)
wget -O ./opencv.zip https://github.com/opencv/opencv/archive/4.4.0.zip
unzip ./opencv.zip -d .

# Build release
mkdir -p ./build/Release
mkdir -p ./install/Release
cd ./build/Release

cmake  -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../../install/Release ../../opencv-4.4.0

ninja

ninja install

# Build Debug
cd ../../

mkdir -p ./build/Debug
mkdir -p ./install/Debug
cd ./build/Debug

cmake  -GNinja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../../install/Debug ../../opencv-4.4.0

ninja

ninja install

# Cleanup
cd ../../
sudo rm -rf ./build