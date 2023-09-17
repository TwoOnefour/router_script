# Description

这是一个自用的linux脚本仓库

一般是我的路由器脚本

我会在里面收集所有我自用的路由器脚本，例如ipv6ddns，zerotier，iptables规则等等

关于我路由器ipv6的配置请移步[我的csdn文档](https://blog.csdn.net/qq_37550958/article/details/125012399)

我的路由器型号及固件，内核等信息

```
Linux RT-AC68U-79E8 2.6.36.4brcmarm #1 SMP PREEMPT Sat Aug 7 08:32:18 UTC 2021 armv7l ASUSWRT-Merlin-KoolShare

386.3_2 梅林
```

# ddns.sh
自动同步ipv6的ddns脚本

# iptables.sh
关于我路由的一些开机自启的配置，包括写入crontab， 添加iptables规则， 开启zerotier， 绑定arp， socat反向代理ipv6到ipv4等等

# zerotier.sh
我的zerotier启动脚本
