#!/bin/bash

#系统加固脚本
echo "------系统加固脚本------"

if [ $UID -ne 0 ]; then
	echo "请以root权限执行脚本!!"
	exit
fi

#停用部分用户
#修改用户密码文件/etc/passwd
echo "=============开始停用部分用户============"
sed -i '1,$s/^adm:x/#adm:x/' /etc/passwd
sed -i '1,$s/^lp:x/#lp:x/' /etc/passwd
sed -i '1,$s/^sync:x/#sync:x/' /etc/passwd
sed -i '1,$s/^uucp:x/#uucp:x/' /etc/passwd
sed -i '1,$s/^operator:x/#operator:x/' /etc/passwd
sed -i '1,$s/^games:x/#games:x/' /etc/passwd
sed -i '1,$s/^gopher:x/#gopher:x/' /etc/passwd
sed -i '1,$s/^ftp:x/#ftp:x/' /etc/passwd
sed -i '1,$s/^vcsa:x/#vcsa:x/' /etc/passwd
sed -i '1,$s/^news:x/#news:x/' /etc/passwd
sed -i '1,$s/^rpc:x/#rpc:x/' /etc/passwd
sed -i '1,$s/^rpcuser:x/#rpcuser:x/' /etc/passwd
sed -i '1,$s/^nfsnobody:x/#nfsnobody:x/' /etc/passwd


#修改/etc/shadow文件
sed -i '1,$s/^adm:*/#adm:*/' /etc/shadow
sed -i '1,$s/^lp:*/#lp:*/' /etc/shadow
sed -i '1,$s/^sync:*/#sync:*/' /etc/shadow
sed -i '1,$s/^uucp:*/#uucp:*/' /etc/shadow
sed -i '1,$s/^operator:*/#operator:*/' /etc/shadow
sed -i '1,$s/^games:*/#games:*/' /etc/shadow
sed -i '1,$s/^gopher:*/#gopher:*/' /etc/shadow
sed -i '1,$s/^ftp:*/#ftp:*/' /etc/shadow
sed -i '1,$s/^vcsa:*/#vcsa:*/' /etc/shadow
sed -i '1,$s/^news:*/#news:*/' /etc/shadow
sed -i '1,$s/^rpc:*/#rpc:*/' /etc/shadow
sed -i '1,$s/^rpcuser:*/#rpcuser:*/' /etc/shadow
sed -i '1,$s/^nfsnobody:*/#nfsnobody:*/' /etc/shadow
echo "===========停用部分用户配置完成==========="


#优化系统配置
#配置/etc/security/limits.conf
sed -i '$a\* 	- 	nofile 	20480' /etc/security/limits.conf
sed -i '$a\* 	- 	nproc 	20480' /etc/security/limits.conf








