#### cpu温控
1. 这个540的本子,就是cpu温度老是很高,风扇老是狂转,麻烦死了
1. 控制风扇不是关键,关键还是cpu,当然散热也是个问题,暂时就没时间拆机器,更换散热材料.
1. 于是我们就改变方向,发现可以通过cpufreqd来进行控制.
1. 而gnome里面,直接搜索cpu power manager就可以达到一定的效果.
1. 里面提供了多种策略. 自己去试一下吧.
1. 我当前用的 30% - 50%, 打开睿频. cpu就一直在1.85GHZ, 温度则是67左右.
1. 这也是很奇怪, 其实cpu的使用也不是很犀利的. 怎么就老这么high呢? 
1. 这里还有一个Redhat的关于Power Management的Guide: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/power_management_guide/
   1. BATTERY LIFE TOOL KIT
   1. GNOME Power Manager
   1. Tuned
   1. 现在的540 CentOS用的是intel_pstat driver. 只提供performance 和 power save两种governors, 而intel官方说, 有时候, 低频不一定比高频省电. 因此他们仅提供这两种. 如果要用原来的, 需要禁掉这个driver
   可以看这个链接 https://unix.stackexchange.com/questions/121410/setting-cpu-governor-to-on-demand-or-conservative 
