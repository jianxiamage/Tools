#!/bin/bash
NU_PING=30
for (( a=2; a<=NU_PING;a++))
   do
     ping -c 3 10.40.57.$a > /dev/null
       if [ $? -eq 0 ]
         then
               echo "ping ......10.40.57.$a is up "
         else
               echo "ping ......10.40.57.$a is down "
       fi
   done
#arp -a |awk -v 'OFS===>' '{print $2,$4}'|grep ':' |sed -e  's/(//' -e 's/)//'
