#!/bin/bash
#统计Nginx日志文件access.log的某列的数据量
#$1:日志文件地址
#$2:查询第几列数据
if [[ ! -n "$1" ]];then
    echo "请传入文件地址！"
    exit
fi

if [[ ! -f "$1" ]];then
    echo "文件不存在！"
    exit
fi

#默认查第1列
if [[ ! -n "$2" ]];then
    column="1"
else
    column=$2
fi

case ${column} in
"1")
    #统计每一个ip的请求量，逆序输出
    awk -f ip_count.awk $1 | sort -n -k 2 -r
   ;;
"7")
    awk -f url_count.awk $1 | sort -n -k 2 -r
    ;;
"9")
    awk -f http_code_count.awk $1 | sort -n -k 2 -r
    ;;
esac

