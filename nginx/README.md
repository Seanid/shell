# 常用的nginx脚本

1. nginx 安装脚本(install.sh):主要实现nginx依赖安装、下载、源码编译等功能

使用

~~~

	chmod +x install.sh
	sudo ./install.sh

~~~

2. nginx 日志自动分割脚本(logSplit.sh):主要实现将nginx日志进行分割处理的功能

使用

~~~

	方式一:sudo ./logSplit.sh
        方式二：使用crontab 
        crontab -u root -e
	# 每小时备份一次
        0 * * * * /home/logmv.sh > /home/cro.log 2>&1 & 

~~~

