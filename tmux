vim+tmux 使用记录

======= tmux 是什么 ====== 
我们在linux服务器上的工作一般都是通过一个远程的终端连接软件连接到远端系统进行操作，例如使用xshell或者SecureCRT工具通过ssh进行远程连接。在使用过程中，如果要做比较耗时的操作，例如有时候进行编译，或者下载大文件需要比较长的时间，一般情况下是下班之后直接运行希望第二天早上过来运行完成，这样就不用耽误工作时间。但是网络有时候不稳定，可能在半夜会出现连接断掉的情况，一旦连接断掉，我们所执行的程序也就中断，我们当然可以写一个脚本后台运行，但是还是不方便。那么有没有一种工具可以解决这样的问题呢。这就是我们这里要提到的tmux了。其实类似tmux的工具还有很多。例如gnu screen等。tmux刚好可以解决我们描述的问题，当我们在tmux中工作的时候，即使关掉SecureCRT的连接窗口，再次连接，进入tmux的会话我们之前的工作仍然在继续。

tmux是一个linux下面的工具，在使用之前需要安装，就像安装linux下的其他工具一样方便。首先我们通过SecureCRT连接登入远程的linux机器，我们将此时的环境称为终端环境。如果这个机器上并没有安装tmux，我们需要安装。例如在CentOs上是yum install tmux，完成之后我们就可以使用tmux命令了。

tmux中有3种概念:
    1.会话
        会话有点像是tmux的服务，在后端运行，我们可以通过tmux命令创建这种服务，并且可以通过tmux命令查看，附加到后端运行的会话中。
    2.窗口(window)
        一个会话可以包含多个窗口，
    3.窗格(pane)
        一个窗口可以被分割成多个窗格(pane)。


======= tmux 的会话 ====== 
1.新建会话
    tmux 或者 tmux new -s seesion1 建立一个自定义名称的会话     
    使用 tmux new -s 命令新建一个会话 -s (其实是session的头字母)。后面指定会话名即可。运行之后会从shell的终端环境进入到会话环境中，并停留在刚才新建的会话中
2.退出会话
    ctrl+b d 退出会话,回到shell的终端环境(按ctrl+b 之后再按一个字母d即可，字母d是detach的缩写)
3.查看会话列表
    tmux ls 终端环境查看会话列表
    会话状态内查看方法: ctrl+b s
4.恢复会话
    tmux a -t sessionName (其中a字母是attach的头字母 -t 指定要进入已存在的会话名)
    This section contains a list of the commands supported by tmux.  Most commands accept the optional -t (and sometimes -s) argument with one of target-client, target-session target-window, or
     target-pane.  These specify the client, session, window or pane which a command should affect.

5.销毁会话
    tmux kill-session -t sessionName 
    会话状态内: ctrl+b : (按组合键之后再按一个冒号键),状态栏变成黄色之后提示我们可以在会话环境中输入命令，此时输入 kill-session -t session1 回车即可
    
6.重命名会话
    tmux rename -t old_session_name new_session_name
    会话状态内: ctrl+b $ 重命名会话


======= tmux 的window ====== 
1.创建窗口
    可以在当前会话窗口中创建多个窗口，例如 ctrl+b c 创建之后会多出一个窗口
    crtl+b , (组合键之后按一个逗号)来修改当前窗口的名字
2.切换窗口
    在同一个会话的多个窗口之间可以通过如下快捷键进行切换：

    ctrl+b p (previous的首字母) 切换到上一个window。
    
    ctrl+b n (next的首字母) 切换到下一个window。
    
    ctrl+b 0 切换到0号window，依次类推，可换成任意窗口序号
    
    ctrl+b w (windows的首字母) 列出当前session所有window，通过上、下键切换窗口
    
    ctrl+b l (字母L的小写)相邻的window切换
3.关闭窗口
    ctrl+b & 关闭当前window，会给出提示是否关闭当前窗口，按下y确认即可。

======= tmux 的pane ====== 
1.垂直分屏
    ctrl+b % 垂直分屏(组合键之后按一个百分号)，用一条垂线把当前窗口分成左右两屏。
2.水平分屏
    ctrl+b " 水平分屏(组合键之后按一个引号)，用一条水平线把当前窗口分成上下两屏。
3.切换pane
    ctrl+b o 依次切换当前窗口下的各个pane。

    ctrl+b Up|Down|Left|Right 根据按箭方向选择切换到某个pane。

    ctrl+b Space (空格键) 对当前窗口下的所有pane重新排列布局，每按一次，换一种样式。

    ctrl+b z 最大化当前pane。再按一次后恢复。
4.关闭pane
    ctrl+b x 关闭当前使用中的pane，操作之后会给出是否关闭的提示，按y确认即关闭。

======= 总结  ====== 

进入tmux操作，首先需要Ctrl+b，然后在输入快捷指令，比如创建新窗口 Ctrl + b + c


参考网址 https://www.cnblogs.com/wangqiguo/p/8905081.html

======= 常用命令 ========
窗口
   c => create  
   p => previous
   n => next
   0 => switch 0 window
   w => window list 
   l => 相邻的窗口
   & => close 
窗格
   % => 垂直分屏
   " => 水平分平
   o => switch pane
   方向键 => 直接切换
   空格 => 重新布局
   z => 最大/恢复
   x => close 
   ctrl+方向 => 调整大小



















================================
