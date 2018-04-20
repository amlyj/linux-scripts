#! /bin/bash

# 使用信息
memTotal=`free -m | awk -F '[ :]+' 'NR==2{print $2}'`
memUsed=`free -m | awk -F '[ :]+' 'NR==2{print $3}'`
# 统计内存使用率
memUsedPersent=`awk 'BEGIN{printf "%.2f%%\n",('$memUsed'/'$memTotal')*100}'`

# 弹框告警
# not root user
notify-send ["警告"] "内存使用率达到: $memUsedPersent！"

# print info
echo -e "\033[31m#############################################################\033[0m"
echo -e "\033[31m##   内存总量: $memTotal, 内存使用: $memUsed, 内存使用率: $memUsedPersent    ##\033[0m"
echo -e "\033[31m#############################################################\033[0m"
