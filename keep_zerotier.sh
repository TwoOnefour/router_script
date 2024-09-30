isTunRunning=$(lsmod|grep tun)
enable=0
if [[ "$isTunRunning" = "" ]]; then
        modprobe tun
        echo tun is not loaded. Getting it loaded.
fi
if [ ! -e /koolshare/configs/zerotier-one/zerotier-one.pid ]; then
        /koolshare/bin/zerotier-one -p0 &
        echo zerotier was not running. Running it once.
        enable=1
fi

pid=$(cat /koolshare/configs/zerotier-one/zerotier-one.pid)
pid1=$(/bin/ps | /bin/grep zerotier-one | /bin/grep -v grep | /bin/sed -n 's/^\s*\s*\([0-9]\+\).*/\1/p')
if [[ ! "$pid" = "$pid1" ]]; then
        /koolshare/bin/zerotier-one -p0 &
        echo pid is not the same. Restarting zerotier.
        enable=1
fi

if [ $enable -eq 1 ]; then
        iptables -t nat -A POSTROUTING -o ztr4n3zg26 -j MASQUERADE # 出路由后对源地址进行修改
        iptables -I FORWARD -i ztr4n3zg26 -j ACCEPT # 进入接受
        iptables -I FORWARD -o ztr4n3zg26 -j ACCEPT # 出口接受
        iptables -I INPUT -p tcp --dport 9993 -j ACCEPT  # 打开9993 tcp端口用于zerotier
        iptables -I INPUT -p udp --dport 9993 -j ACCEPT  # 打开9993 udp端口用于zerotier
fi
