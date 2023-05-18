#!/bin/sh
# A script for dnspod ddns synchronizing ipv6
ip=$(ip addr show dev ppp0 | sed -e's/^.*inet6 \(2409[^ ]*\)\/64 scope global.*$/\1/;t;d')
# ppp0 需要改成你自己的ipv6网卡例如eth0，2409也要改成你的ip的前缀
token1="" # dnspod的第一个token

token2="" # dnspod的第二个token

domain_id="" # dnspod的域名id

sub_domain="" # 子域名名称

record_id=""  # 记录id

curl -s -X POST  https://dnsapi.cn/Record.Modify --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36"  -d "login_token=${token1},${token2}&format=json&record_line_id=0&domain_id=${domain_id}&value=${ip}&record_type=AAAA&record_id=${record_id}&sub_domain=${sub_domain}"
