#!/bin/bash

set -e
#----------------------------------------------------------------------------------
ip_file='/home/IPList.txt'
auto_login_ok_file='auto_login_ok.txt'
auto_login_err_file='auto_login_err.txt'
#----------------------------------------------------------------------------------
cmdStr=''
retCode=0
#----------------------------------------------------------------
cmdEndStr="KVM Test:Check password-free login settings End----------------------------"
KVMIP=''
#----------------------------------------------------------------------------------
source ./common-fun-tar.sh
kvmName=$(getKVMName)
#----------------------------------------------------------------------------------
source ./kvm-log.sh
logFile=$logFile
#echo $logFile
write_log=$write_log
#----------------------------------------------------------------------------------
source ./exceptionTrap.sh
exit_end=$exit_end
exit_err=$exit_err
exit_int=$exit_int
#----------------------------------------------------------------------------------
trap 'exit_end "${cmdEndStr}"' EXIT
trap 'exit_err $LINENO $?'     ERR
trap 'exit_int $LINENO'        INT
#----------------------------------------------------------------------------------
trap - ERR
write_log "INFO" "KVM Test: Check password-free login settings Begin----------------------------"


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

if [ -s $auto_login_err_file ];
then
  cmdEndStr="Check password-free login settings failed!"
  echo $cmdEndStr
  write_log "INFO" "$cmdEndStr"
  exit 1
else
  cmdEndStr="Check password-free login settings successfully."
  echo $cmdEndStr
  write_log "INFO" "$cmdEndStr"
  exit 0
fi


