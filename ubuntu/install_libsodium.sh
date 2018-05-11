#! /bin/bash

mkdir /tmp/libsodium-temp
cd /tmp/libsodium-temp
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar xvf LATEST.tar.gz && cd libsodium-stable/
sudo ./configure && sudo make -j4 && sudo make install && sudo ldconfig
cd /tmp
rm -rf /tmp/libsodium-temp
