系统安装完毕，用的gnome桌面，结果打开后，弹了个小warning的东西，大概是告诉我有故障发生了
开了一个terminal，看到下面的一段话

BRT has detected 1 problem(s). For more info run: abrt-cli list --since 1522910148

于是，跟着来运行咯

[ng@w540 Centos7Init]$ abrt-cli list --since 1522910148
Private Reports is enabled, use 'abrt-cli -a COMMAND' to get the detected problems.
id b3b9f519998ff9121c560479fd84bf25a9e111b7
reason:         mce: [Hardware Error]: Machine check events logged
time:           Fri 06 Apr 2018 04:03:33 AM CST
cmdline:        BOOT_IMAGE=/vmlinuz-3.10.0-693.el7.x86_64 root=/dev/mapper/centos-root ro rd.lvm.lv=centos/root rd.lvm.lv=centos/swap rhgb quiet LANG=en_US.UTF-8
package:        kernel
uid:            0 (root)
count:          1
Directory:      /var/spool/abrt/oops-2018-04-06-04:03:33-11945-0
Reported:       cannot be reported

The Autoreporting feature is disabled. Please consider enabling it by issuing
'abrt-auto-reporting enabled' as a user with root privileges
[ng@w540 Centos7Init]$ ll /var/spool/abrt/oops-2018-04-06-04:03:33-11945-0


这个目录里面有比较详细的信息，当然我也不大会看（例如dmesg）

网上搜索看到有人用这个命令
journalctl -p 3 -b

看到是同样的问题，就是报警cpu温度过高，不过我是刚刚开机，估计是某些兼容问题而已。
网上的提和TPL有点关系，这个我就先放一下，不影响眼前的工作。

