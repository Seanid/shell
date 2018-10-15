#!/bin/bash

#
#nginx 自动分割脚本（需要使用root权限执行）
#主要是根据需求，将原本的nginx日志移动到指定目录，并使nginx生成新的日志
#使用
#	方式一:sudo ./logSplit.sh
#	方式二：使用crontab 
#		crontab -u root -e
#		0 * * * * /home/logmv.sh > /home/cro.log 2>&1 & 		
#


#nginx 日志目录
nginx_log_path=/usr/local/nginx/logs

#nginx 日志分割目录
backup_log_path=/home/logs/nginx

#nginx pid文件 用于后期的重新生成日志文件
nginx_pid=/usr/local/nginx/logs/nginx.pid


#移动日志文件
mv $nginx_log_path/access.log $backup_log_path/access_"$(date -d yesterday +%Y%m%d%H%M)".log

mv $nginx_log_path/error.log $backup_log_path/error_"$(date -d yesterday +%Y%m%d%H%M)".log


#通知nginx产生新日志文件，作用于reload相同
kill -USR1 `cat $nginx_pid`
