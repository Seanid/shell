#!/bin/bash

echo "开始更新安装源"

#更新源
apt-get update


echo "开始安装软件依赖"

#安装依赖

# 依赖包括：gcc g++依赖库;pcre依赖库;HTTP重写模块需要;SSL依赖库 https需要; zlib依赖库 gzip需要
apt-get install build-essential libtool libpcre3  libpcre3-dev openssl libssl-dev zlib1g-dev


echo "下载安装包"

#下载最新版本
wget http://nginx.org/download/nginx-1.13.6.tar.gz


#解压
tar -zxvf nginx-1.13.6.tar.gz


#进入解压目录：
cd nginx-1.13.6


echo "配置-安装-编译"

#配置：--prefix=/usr/local/nginx配置安装路径 --with-http_ssl_module开启ssl
./configure --prefix=/usr/local/nginx --with-http_ssl_module


#编译：
make


#安装：
sudo make install

if [ $? -eq 0 ];then 
    echo "安装完成"
else
    echo "安装异常"
fi

echo “为nginx 指定用户组”

chown root.www /usr/local/nginx/sbin/nginx
chmod 750 /usr/local/nginx/sbin/nginx
chmod u+s /usr/local/nginx/sbin/nginx


