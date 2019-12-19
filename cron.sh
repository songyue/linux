# File Name: cron.sh
# Author: songyue
# mail: songyue118@gmail.com
# Created Time: 2019年12月19日 星期四 17时35分40秒
#########################################################################
#!/bin/bash
logs_path="/home/logs"
#logs_path1="/home/log-bak"
logs_path1="/home1/log-bak"
DATE=`date +%Y%m%d`
pid_path="/usr/local/nginx/logs/nginx.pid"
mv ${logs_path}/m.vfou.cn.log ${logs_path1}/vfou/m.vfou.log.${DATE}.log
mv ${logs_path}/ssl.vfou.log ${logs_path1}/vfou/ssl.vfou.log${DATE}.log

kill -USR1 `cat ${pid_path}`
pid_path1="/usr/local/php/var/run/php-fpm.pid"
mv ${logs_path}/php/dianru12091.php.access.log ${logs_path1}/php/dianru12091.php.access.${DATE}.log
kill -USR1 `cat ${pid_path1}`
