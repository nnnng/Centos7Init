事情是这样的, 公司的vpn, 教程里面只有 mac + windows , 而手上的Linux就显得比较尴尬了.

测试了一下, 什么东西都不弄的话, 是连不进去的, 而我又懒得折腾. 所以上网找了一下, 就是模拟端口映射来处理了

在Linux里面, 端口映射很简单(Windows里面也行的)
就是一句命令

ssh -L 本地绑定IP地址:本地绑定端口:远端IP地址:远端端口 -l远端登录用户名 远端主机IP

sample : ssh -L 0.0.0.0:1525:172.16.160.11:1521 -lroot 172.16.160.11

