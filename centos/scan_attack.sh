#!/bin/bash

# centos 

cat /var/log/secure|awk '/Failed/{print $(NF-3)}'|sort|uniq -c|awk '{print $2"="$1;}' > /root/black.txt

# 配置白名单
ALLOW_LIST=('124.65.128.10')
# 判断是否存在
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

# 定义攻击次数,3次密码输错就视为攻击
DEFINE="3"

for i in `cat /root/black.txt`
do
IP=`echo ${i}|awk -F= '{print $1}'`
NUM=`echo ${i}|awk -F= '{print $2}'`
   if [ `is_exists $IP` -gt 0 ];then
      continue
   fi
   if [ ${NUM} -gt ${DEFINE} ];then
      sed -i '/'${IP}'/d' /etc/hosts.deny
      if [ $? > 0 ];then
         echo "sshd:$IP:deny" >> /etc/hosts.deny
      fi
   fi
done
