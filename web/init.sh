#!/bin/bash

#新增web程序用户信息

#初始化用户信息

#添加www目录
mkdir /www
#修改www 目录的权限
chmod 770 /www
#添加用户组
groups www
#添加www用户
useradd -d /www -s /bin/bash -g www www