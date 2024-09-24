#/bin/sh
/opt/bin/zerotier-one -d /opt/var/lib/zerotier-one # 开启zerotier，请根据需要替换路径

sleep 10s # 等待zerotier设置完毕

iptables -I INPUT -i ztr4n3zg26 -j ACCEPT  # zerotier网卡允许访问，请修改网卡名称，下面同
iptables -t nat -A POSTROUTING -o ztr4n3zg26 -j MASQUERADE # 出路由后对源地址进行修改
iptables -I FORWARD -i ztr4n3zg26 -j ACCEPT # 进入接受
iptables -I FORWARD -o ztr4n3zg26 -j ACCEPT # 出口接受
iptables -I INPUT -p tcp --dport 9993 -j ACCEPT  # 打开9993 tcp端口用于zerotier
iptables -I INPUT -p udp --dport 9993 -j ACCEPT  # 打开9993 udp端口用于zerotier
ip6tables -I INPUT -p tcp --dport 9993 -j ACCEPT # 打开9993 ipv6 tcp端口用于zerotier
ip6tables -I INPUT -p udp --dport 9993 -j ACCEPT # 打开9993 ipv6 udp端口用于zerotier

ip route add 192.168.50.0/24 via 172.23.75.26 dev ztr4n3zg26 # 添加路由信息
# 打开zerotier所需端口
