#!/bin/bash

ALLOW_LIST=('192.168.1.1' '192.168.1.2')
IP=192.168.1.2


is_exists() {
    _res=0
    for lib in ${ALLOW_LIST[*]} 
    do
        if [ "$lib" == "$1" ]
        then
             _res=1
             break
        fi
    done
    echo $_res
}

if [ `is_exists $IP` -gt 0 ]
then
   echo $IP in ${ALLOW_LIST[*]}
else
   echo $IP not in ${ALLOW_LIST[*]}
fi
