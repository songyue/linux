# sudo
alias svim='sudo vim'
alias vims='svim'
alias sapt='sudo apt'
# curl
alias tojson='python -m json.tool'
# vim 
alias rctags='ctags -R .'
alias rctagsphp='ctags `find . -name "*.php" | grep -vE "vendor|PHPExcel"` --links=no '
# php
alias phpS='php -S 0.0.0.0:8881'
alias strtotime='/home/songyue/.sh/tools.sh'
alias echodate="echo 当前时间： `date +%Y-%m-%d\ %H:%M:%S`  当前时间戳： `date +%s`"
alias composer='composer -vvv'
# other
alias getsite='wget -r -p -np -k -E -c'
alias hp="export http_proxy=http://127.0.0.1:8080"
alias hsp="export https_proxy=http://127.0.0.1:8080"
alias diffdir='diff -abBcHrq'
alias manzh='LANG=zh_CN.utf-8 LC_ALL=zh_CN.utf-8 man'
alias mount-m='sshfs -o allow_other m:work/xyz-git /home/songyue/work/xyz'

alias ls='ls --color=auto'
alias lsd='ls -d */ | xargs -i du -sh {}'
alias lsdc='ls -l | grep ^d | wc -l'
alias lsdl='ls -l | grep ^d'
alias lsf='ls -p | grep [^/]$ | xargs -i du -sh {}'
alias lsfc='ls -l | grep ^- | wc -l'
alias lsfl='ls -l | grep ^-'
alias lshf='ls -AF | grep "^\."'

#fun
alias hi='fortune-zh | cowthink'

alias sl='sl -e'
alias docker='sudo docker'
alias docker-nodejs-bash='docker exec -it node bash'

#git
alias gitlog='git log  --oneline'
# 查看指定文件或目录的日志
alias gitlogfile='git log --follow'
# 查看指定用户的日志
alias gitlogme='git log --author=songyue'

