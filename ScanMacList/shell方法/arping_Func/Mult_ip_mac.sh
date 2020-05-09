#!/bin/bash

#功能：
#多线程执行程序，

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
    #ip1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $4}'|head -n 1)
    ip1=$ip.$i
    mac1=$(arping $ip.$i -I $eth -c 2|grep "Unicast reply from"|awk '{print $5}'|awk -F[ '{print $2}'|awk -F] '{print $1}'|head -n 1)
    echo "[${ip1}]:[${mac1}]" >> mac_list.txt
  fi
}

rm -rf mac_list.txt


echo "Getting the mac list Begin..."

echo "***************************************************"

start_time=`date +%s`              #定义脚本运行的开始时间
[ -e /tmp/fd1 ] || mkfifo /tmp/fd1 #创建有名管道
exec 3<>/tmp/fd1                   #创建文件描述符，以可读（<）可写（>）的方式关联管道文件，此时文件描述符3就有了有名管道文件的所有特性
rm -rf /tmp/fd1                    #关联后的文件描述符拥有管道文件的所有特性,因此这时管道文件可以删除，留下文件描述符使用即可
for ((i=1;i<=5;i++))
do
        echo >&3                   #&3代表引用文件描述符3，这条命令代表往管道里面放入了一个"令牌"
done


case_count=0
for i in {1..254};
do
read -u3                           #代表从管道中读取一个令牌
{
  write_mac_list $i 
  echo >&3                         #本次命令执行到最后，把令牌放回管道
}&
done
wait

echo "***************************************************"
stop_time=`date +%s`  #定义脚本运行的结束时间

echo "Exec Time:`expr $stop_time - $start_time`s"
exec 3<&-                         #关闭文件描述符的读
exec 3>&-                         #关闭文件描述符的写

echo "Getting the mac list End."
