#!/bin/bash
#获取网络中所有主机的MAC地址，把MAC地址输出到一个文件中（mac-list.txt）
#ip=$(ifconfig|grep "broadcast"|grep -v 192.168|awk -F: '{print $2}'|awk '{print $1}'|cut -d. -f1,2,3)
ip=$(ifconfig|grep "broadcast"|grep -v 192.168|awk '{print $2}'|cut -d. -f1,2,3)
#eth=$(ifconfig|grep eth|awk '{print $1}')
#eth=$(ifconfig|grep eth|grep -v "00:00:00:00:00:00"| awk '{print $2}')

cat /proc/net/dev | awk '{i++; if(i>2){print $1}}' | sed 's/^[\t]*//g' | sed 's/[:]*$//g'
eth=`cat /proc/net/dev | awk '{i++; if(i>2){print $1}}' | sed 's/^[\t]*//g' | sed 's/[:]*$//g'|grep "^e"`

echo "======================"
echo $ip
echo "======================"

echo $eth
echo "======================"


function write_mac_list()
{  
  i=$1
  Reply=$(arping $ip.$i -I $eth -c 2|grep reply|awk '{print $2}'|head -n 1) || continue
  if [ "$Reply"x = "reply"x ];
  then
    ip1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $4}'|head -n 1)
    mac1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $5}'|awk -F[ '{print $2}'|awk -F] '{print $1}'|head -n 1)
    echo "[${ip1}]:[${mac1}]" >> mac_list.txt
  fi
}

rm -rf mac_list.txt

for i in {1..254};
do
  write_mac_list $i &
done
wait
