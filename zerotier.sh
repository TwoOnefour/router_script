#/bin/sh

iptables -I FORWARD -i ztr4n3zg26 -j ACCEPT  # 路由，使得外网ip可以访问内网ip

sleep 1s

iptables -I INPUT -i ztr4n3zg26 -j ACCEPT  # zerotier网卡允许访问

sleep 1s

iptables -I INPUT -p tcp --dport 25499 -j ACCEPT

iptables -I INPUT -p tcp --dport 25500 -j ACCEPT

iptables -I INPUT -p tcp --dport 9993 -j ACCEPT

iptables -I INPUT -p udp --dport 25499 -j ACCEPT

iptables -I INPUT -p udp --dport 25500 -j ACCEPT

iptables -I INPUT -p udp --dport 9993 -j ACCEPT

iptables -I INPUT -p tcp --dport 25499 -j ACCEPT

ip6tables -I INPUT -p tcp --dport 25500 -j ACCEPT

ip6tables -I INPUT -p tcp --dport 9993 -j ACCEPT

ip6tables -I INPUT -p udp --dport 25499 -j ACCEPT

ip6tables -I INPUT -p udp --dport 25500 -j ACCEPT

ip6tables -I INPUT -p udp --dport 9993 -j ACCEPT

# 打开zerotier所需端口