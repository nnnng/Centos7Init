真是一个折腾的过程
很是奇怪，我印象里面，原来的gnome应该带的是fcitx，结果，现在看到的，又是ibus，奇怪

首先，我用ibus其实也还挺好的，是ibus里面的pinyin输入法。
后来按转了intellij IDEA后，发现无法在里面输入中文。

而我之前倒腾的xfce + sogou输入还是挺好的，是搜狗输入法的1.1版本，除了偶尔抽风，导致要重新启动机器。。。其他都比现在的2.2好。。。
或者是我安装的问题吧？哈哈

我收集一下对应的安装包先。。。

这次我的2.2的安装包，是通过alien进行deb转rpm的。很神奇哟～毕竟业界有很多ubuntu的安装包，到时候还是又比较多可以用的地方
yum install alien即可

恩，回到正题
1. yum remove ibus imsettings imsettings-libs im-chooser
这个删除我也不知道是否正确，不过ibus的干扰实在很大，所以都清理掉（imsettings不知道是否可以保留）
我查看了我原来的linux，是可以保留的。
不过现在也已经被安装回去了。可能是fcitx安装时依赖吧。
应该在这里就把ibus的进程都kill了

2. 安装fcitx
yum list | grep fcitx
都是从 epel源 里面安装的

3. 添加配置到 ~/.bashrc 里面
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=”@im=fcitx”

4. 经过简单的测试,发现,有点版本兼容问题. 2.2的搜狗不兼容我现在的1708的centos. 然后我找到了以前不知道从哪里下载的2.1的包.
这个包很特别, 包括两个文件, 一个主要文件, 另一个是selinux的文件, 此时就需要我们禁用selinux. 否则老是会有错误出现.
其次, 2.1的包, 自己启动也是有问题的. 需要帮他一下, 否则就只是输入英文, 很奇怪.
所谓帮它, 就是帮他启动 sogou-qimpanel 这个东西.
估计也只是程序有bug所致.

然后相对就比较完美了.

那么, 现在剩下的问题, 就是启动时, 如何自动启动 fcitx 和 sogou 呢? 应该写到哪个文件里面才是正确的? 


5. 激活
pkill ibus-daemon
gsettings set org.gnome.settings-daemon.plugins.keyboard active false
imsettings-switch fcitx

x. 参考资料
https://bbs.archlinuxcn.org/viewtopic.php?id=4552
http://snailhome.github.io/note/fcitx_in_centos7.html

我现在拷贝了老版本的过来，想试一下


