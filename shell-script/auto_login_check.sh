#!/bin/bash

set -e
#---------------------------------------------------------------
ip_file='/home/IPList.txt'
auto_login_ok_file='auto_login_ok.txt'
auto_login_err_file='auto_login_err.txt'
#---------------------------------------------------------------

rm -rf $auto_login_ok_file
rm -rf $auto_login_err_file

for i in `grep -v "#" $ip_file`
do
  #echo -e "$i \c" && ssh $i -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no "date" > /dev/null 2>&1
  echo current ip:$i
  ssh $i -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no "date" > /dev/null 2>&1
if [ $? -eq 0 ];
then 
  echo $i >> $auto_login_ok_file
else
  echo $i >> $auto_login_err_file
fi
done
