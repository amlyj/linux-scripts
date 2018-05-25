# 取消java虚拟机使用random安全策略，提高java应用启动速度 
> `/dev/random` 设备可能导致java程序启动慢或者操作耗时不正常

* 关闭random安全策略：`sudo sed -i "s#securerandom.source=file:/dev/random#securerandom.source=file:/dev/urandom#g" $JAVA_HOME/jre/lib/security/java.security`
* 测试脚本`random-delay.sh`:
``` shell
#! /bin/bash
#
# cat $JAVA_HOME/jre/lib/security/java.security |grep securerandom.source 
# 
# 修改配置：$JAVA_HOME/jre/lib/security/java.security
# securerandom.source=file:/dev/random --> securerandom.source=file:/dev/urandom  
#
# sudo sed -i "s#securerandom.source=file:/dev/random#securerandom.source=file:/dev/urandom#g" $JAVA_HOME/jre/lib/security/java.security
#

for dev in /dev/random /dev/urandom;do
  echo "test ${dev}: "
  time dd if=${dev} bs=512 count=1 > /dev/null 2>&1
  time dd if=${dev} bs=512 count=1 > /dev/null 2>&1
done
```
