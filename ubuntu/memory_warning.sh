#! /bin/bash

memTotal=`free -m | awk -F '[ :]+' 'NR==2{print $2}'`
memUsed=`free -m | awk -F '[ :]+' 'NR==2{print $3}'`
# 统计内存使用率
memUsedPersent=`awk 'BEGIN{printf "%.2f%%\n",('$memUsed'/'$memTotal')*100}'`

# 弹框告警
notify-send ["警告"] "内存使用率达到: $memUsedPersent！"

echo 
echo "##############################################################"
echo "##   内存总量: $memTotal, 内存使用: $memUsed, 内存使用率: $memUsedPersent     ##"
echo "##############################################################"
echo 
