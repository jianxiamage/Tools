#!/bin/bash
#自动检查网卡与IP
for i in `seq 1 5`
do
  b=`ifconfig |grep "enp1s[0-9]"|awk '{print $1}'|sed -n $i\p && ifconfig |grep -A1 "enp1s[0-9]"|grep inet| awk '{print $2}'|sed -n $i\p`
  echo "$b" 
done
