Linux 扫描局域网在线主机名与IP地址
安装nmap工具
sudo apt-get install nmap

扫描192.168.50.0/24 网段局域网的主机名与ip地址
sudo nmap -sP 192.168.50.0/24
