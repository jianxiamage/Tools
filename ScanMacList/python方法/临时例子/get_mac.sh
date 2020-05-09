#!/bin/bash
 
#定义ip_head变量，并对该变量赋值
ip_head='10.40.57.'
 
#定义i变量
i=1
 
#定义proc_count变量
proc_count=0
 
#依次循环，i从1到255
#le表示小于或等于254
while [ $i -le 30 ] 
do
	#当超过20个时，进行重置，并睡眠3秒钟
	if [ $proc_count -ge 20 ];then
		proc_count=0
		sleep 3
	#fi相当于end if
	#即为终止if的条件判断
	fi
 
	#依次ping 该地址
	ping -c1 ${ip_head}$i &
	let i++
	let proc_count++
done
wait 
echo "####################################"
arp -a | grep -Ev 'incomplete|grep'
echo "####################################"
