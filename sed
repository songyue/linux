查看文件中5到10行的内容
sed -n '5,10p' filename
搜索并替换文件的内容
 grep 蛋蛋 api/* -r |awk -F ':' '{print $1}' | xargs sed 's/蛋蛋/金币/g' -i
