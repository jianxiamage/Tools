#!/bin/bash
#获取网络中所有主机的MAC地址，把MAC地址输出到一个文件中（mac-list.txt）
ip=$(ifconfig|grep "Bcast"|awk -F: '{print $2}'|awk '{print $1}'|cut -d. -f1,2,3)
eth=$(ifconfig|grep eth|awk '{print $1}')
for i in {1..255};
do
	Reply=$(arping $ip.$i -I $eth -c 2|grep reply|awk '{print $2}')
	if [ "$Reply"x = "reply"x ];
		then
		ip1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $4}')
		mac1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $5}'|awk -F[ '{print $2}'|awk -F] '{print $1}')
		echo $ip1-----$mac1 >> mac_list.txt
	fi
done
