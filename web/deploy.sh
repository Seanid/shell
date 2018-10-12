#!/bin/bash

#
# 博客发布脚本
#

if [ $# -ne 2 ];then
	echo "请输入远程git目录和发布目录"
	exit 1
fi


#远程git目录

remote_git_url=$1

#本地发布目录
#local_deploy_path=/usr/local/www/blog

local_deploy_path=$2

#本地备份目录
local_bak_path=/home/ubuntu/bak


#获取库hash值
url_hash=$(echo $remote_git_url|md5sum|cut -d ' ' -f1)

#是否复制成功
isOk=1

#判断是否存在目录
if [ -d $url_hash ];then
        echo "本地目录已存在"
        cd $url_hash
	echo "开始更新版本"
	git pull origin master:master

	if [ $? -eq 0 ];then
                echo "更新完成"
        else
                exit 1
        fi
	cd ../
else
        echo "本地目录不存在"
	echo "开始拷贝远程目录：$remote_git_url"
	echo $url_hash

	git clone $remote_git_url ./$url_hash

	if [ $? -eq 0 ];then
        	echo "拷贝完成"
	else
        	exit 1
	fi
fi


pwd

# 判断nginx目录是否存在
if [ -d $local_deploy_path ];then
	#备份原有目录
	curday=`date +%Y-%m-%d-%H-%M-%S`
	mv $local_deploy_path $local_bak_path/$curday


	if [ $? -eq 0 ];then
        	echo "备份完成"
	else
        	exit 1
	fi
fi

echo "开始copy"

ls

#发布到nginx

cp -rf  $url_hash  $local_deploy_path


if [ $? -eq 0 ];then
        echo "发布完成"
else
        exit 1
fi

