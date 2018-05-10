#!/bin/bash

#
# curl response time info
#
# examples:
#  ./curl_request_time.sh \
#     http://localhost:8086/monitor/api/v2/noticeGroup/2d37bc35e8814813882ce6b1bfb42c01 \
#     --cookie "paasos-token=U46LPXKA5xkrrT5aJvgyUZUtq5rTdMiEbZnfiyFetaD6WH2Qg1kP8t9FG9gAj7L8GE46HGC8Bapu4deoZNWFV5hm9kLrnRW6uFPCWa4UkeDxrjYJH9EFiAbRm5Hu9DEsy5ipvhi71DMbTGWdUn6TBxSooYzzB"
#
#


curl -o /dev/null -s -w ---DNS解析域名:%{time_namelookup}"\n"---建立TCP连接:%{time_connect}"\n"---client发出请求到webserver响应第一个字节的时间:%{time_starttransfer}"\n"---client发出请求到webserver响应完所有数据的时间:%{time_total}"\n"---下载速度:%{speed_download}[byte/s]"\n" $*
