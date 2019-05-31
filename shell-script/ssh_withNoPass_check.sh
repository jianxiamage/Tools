#!/bin/bash

#----------------------------------------------------------------
kvmName=''
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
source ./common-fun.sh
NameExists=$NameExists
#----------------------------------------------------------------------------------
trap 'exit_end "${cmdEndStr}"' EXIT
trap 'exit_err $LINENO $?'     ERR
trap 'exit_int $LINENO'        INT
#----------------------------------------------------------------------------------

write_log "INFO" "KVM Test: Check password-free login settings Begin----------------------------"

#echo -e "$i \c" && ssh $i -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no "date" > /dev/null 2>&1
echo current ip:$kvmName
ssh $kvmName -o PreferredAuthentications=publickey -o StrictHostKeyChecking=no "date" > /dev/null 2>&1
