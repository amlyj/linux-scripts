#! /bin/bash

DL=/tmp/bootstrap.pypa.io
mkdir -p $DL && cd $DL
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
hash -r
cd ~
rm -rf $DL
pip --version
