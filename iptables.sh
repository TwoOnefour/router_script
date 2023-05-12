#!/bin/sh

socat TCP6-LISTEN:8442,reuseaddr,fork TCP4:192.168.50.1:8443&  # 绑定ipv6的端口，转发到本地ipv4

socat UDP6-LISTEN:2333,reuseaddr,fork UDP4:192.168.50.59:9&

#socat TCP6-LISTEN:8440,reuseaddr,fork TCP4:192.168.50.107:445&

#socat TCP6-LISTEN:9000,reuseaddr,fork TCP4:192.168.50.107:2335&

echo '1 * * * * /bin/sh /jffs/.koolshare/S23myddnsd.sh'|cat >/tmp/var/spool/cron/crontabs/***  &

arp -s 192.168.50.59 d8:**:c1:**:d5:**  # 绑定mac，实现外网开机

sleep 1m  # 等待ipv6网卡就绪

/jffs/.koolshare/S23myddnsd.sh  # 我的ddns脚本

modprobe tun  # 打开tun

/jffs/.koolshare/bin/zerotier-one -d  # 我的zerotier

sleep 10s

/jffs/.koolshare/zerotier.sh  # 我的zerotier打开端口和iptables脚本

ip6tables -I INPUT -p udp --dport 2333 -j ACCEPT  # 打开ipv6端口用于外网访问

ip6tables -I INPUT -p tcp --dport 8442 -j ACCEPT  # 打开ipv6端口用于外网访问

#ip6tables -I INPUT -p tcp --dport 9000 -j ACCEPT

#ip6tables -I INPUT -p tcp --dport 8440 -j ACCEPT