#!/bin/bash
#Author:Jink
#这脚本使用ping和arp命令获取内网主机的MAC地址，查询到的MAC地址写入到文件中
myping(){
    ping -c2 -w1 -i0.5 $1 &>/dev/null
    if [ $? -eq 0 ];then
        arp $1 | tail -1 | awk '{print $1,$3}'>> mac_table.txt
    fi
}
for i in {1..254}
do
    myping 10.20.42.$i
done
