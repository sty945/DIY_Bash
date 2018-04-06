# 目的
通过自己编写的脚本实现Linux系统不自带的功能，来提高工作效率。

欢迎大家fork一起来完善更多的功能，如果觉得还不错的欢迎点个star.

# 具体功能介绍
**sort_file.sh**

linux系统下以存储从大到小并以K，M，G为单位的方式查看当前目录下的文件信息

**结果展示如下：**

```
sty@dl-server01:~/styfiles$ sort_file.sh
2.60G            fastAI
14.93M           pythonFile
9.89M            teamviewer_amd64.deb
24k              styNet
4k               demo.sh

```

**为什么不用其他的`ls`、`du`呢？**
这里为你做了一个[详细对比](https://blog.csdn.net/sty945/article/details/79830915)



# 在linux任意位置都可以使用这个目录下的脚本

我们从Github中下载文件夹到自己的电脑上，解压后，进入文件夹，然后敲命令`pwd`显示当前文件的路径是多少，比如我的电脑的路径是：

```
sty@dl-server01:~/DIY_Bash$ pwd
/media/home/sty/DIY_Bash
```

然后我们打开`~/.bash_profile`

```
sty@dl-server01:~$ vim ~/.bash_profile
```
在`~/.bash_profile`中按照下面的样式加入刚才显示的目录

```
export PATH=/media/home/sty/DIY_Bash:$PATH
```
然后执行下面的命令

```
source ~/.bash_profile
```
重新执行刚修改的初始化文件，使之立即生效，而不必注销并重新登录

然后我们就可以在任意的文件夹下使用我们的脚本了
比如我们只需要在输入`sorf_file.sh`就可以**以从存储大到小的顺序而且人性化的**显示当前文件夹的非隐藏目录的大小了。

## 注意
如果你出现出现类似下面的错误：`Permission denied`

```
sty@dl-server01:~$ sort_file.sh
-bash: /media/home/sty/DIY_Bash/sort_file.sh: Permission denied

```
这是由于这个脚本没有权限的原因，你只需要进入DIY_Bash文件夹执行下面的命令即可，
这将为DIY_Bash下的脚本都赋予执行权限：

```
 chmod +x *
```

