#!/bin/bash

#获取系统版本信息脚本
#获取包括系统版本，位数，IP，硬盘，内存，核数等信息

#获取系统版本
echo '获取系统版本。。。'
if [ -f "/usr/bin/lsb_release" ];then
#ubuntu
	OS=$(/usr/bin/lsb_release -a | grep 'Description' | awk -F ':' '{print $2}'| sed 's/^[\t]*//g')
else
#centos
	OS=$(cat /etc/issue | sed -n '1p' | sed 's/[[:space:]]//g' )
fi
echo  '系统版本为'.$OS

#获取系统位数
OS_BIT=$(getconf LONG_BIT)

echo '系统位数为'$OS_BIT

#获取系统IP

LOCAL_IP=$(ifconfig| awk -F ' *|:' '/inet addr/{if ($4!="127.0.0.1")print $4}')

echo '本地IP为'$LOCAL_IP

NET_IP=""
#腾讯云IP地址
#NET_IP=$(curl -s  http://metadata.tencentyun.com/meta-data/public-ipv4)
#echo '公网IP为'$NET_IP

#获取CPU核数

CPU=$(grep processor /proc/cpuinfo  | wc -l)

echo 'CPU核数'$CPU

# 获取系统内存大小
MEMORY=$(free -m | grep "Mem" | awk '{print $2}')

echo '内存大小'$MEMORY'M'


# 获取系统硬盘大小
DISK=$(df -h / | grep -e '/' | awk '{print $2}')

echo '硬盘大小'$DISK

#获取机器唯一标实

SYSTEM_UUID=$(dmidecode -s system-uuid)

echo '机器唯一码'$SYSTEM_UUID

request="curl -s  --data-urlencode \"uuid=$SYSTEM_UUID\" --data-urlencode \"os=$OS\"  --data-urlencode \"bit=$OS_BIT\" --data-urlencode \"localIP=$LOCAL_IP\" --data-urlencode \"netIP=$NET_IP\" --data-urlencode \"core=$CPU\" --data-urlencode \"memory=${MEMORY}M\" --data-urlencode \"disk=$DISK\" \"上报地址\" "

echo $request
result=$(eval $request)
echo $result

if [ $result = "0000" ];then
	echo "上报成功"
else
	echo "上报失败"
fi

