#! /bin/bash

echo "ubuntu determine whether the software is installed. input package name:"
read package

if [ `dpkg -s $package 2>&1 >/dev/null |wc -l` -eq 0 ];then
   echo $package "is installed."
else
   echo $package "No installed."
fi
