#! /bin/bash

# install GCC
yum -y groupinstall "Development Tools"
mkdir /tmp/libsodium-temp
cd /tmp/libsodium-temp

wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar xvf LATEST.tar.gz && cd libsodium-stable/
./configure && make -j4 && make install
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig

cd /tmp
rm -rf /tmp/libsodium-temp
