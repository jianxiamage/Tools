#!/bin/bash

#-----------------------------------------------------------------------
#本脚本功能:
#扫描整个局域网中的ip和mac地址信息
#便于根据mac地址获取ip(反之亦然)
#适用场景:kvm宿主机为网桥环境，已知虚拟机的mac地址(可以从xml文件获取)，
#要获取虚拟机的ip，包括单机与多机情况
#-----------------------------------------------------------------------
#获取本机ip(含有prefix)
local_ip=`ip a | grep inet | grep -v inet6 | grep -v 127 | sed 's/^[ \t]*//g' | cut -d ' ' -f2`
echo $local_ip

#通过nmap工具获取ip和mac地址信息
#nmap -sn 10.40.41.177/22 |tee nmap.log
nmap -sn $local_ip |tee nmap.log

#通过已知的mac获取对应IP
#grep -B 2  "52:54:00:DB:99:A3" nmap.log |head -n 1 |grep -o '(.*)'|cut -d '(' -f2|cut -d ')' -f1

#ip=`grep -B 2 -i $mac nmap.log |head -n 1 |grep -o '(.*)'|cut -d '(' -f2|cut -d ')' -f1`

