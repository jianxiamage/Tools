#!/usr/bin/env bash

#----------------------------------------------------------------------------------
cmdStr=''
nmapFile='nmap.log'
#----------------------------------------------------------------------------------
cmdEndStr="KVM Test:Scan survival host in LAN to get the ip and mac addr.End----------------------------"
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

write_log "INFO" "KVM Test:Scan survival host in LAN to get the ip and mac addr.Begin----------------------------"


local_ip=`ip a | grep inet | grep -v inet6 | grep -v 127 | sed 's/^[ \t]*//g' | cut -d ' ' -f2`
echo $local_ip

#echo 'nmap scanning...'
#command Like:nmap -sn 10.40.41.177/22 |tee nmap.log
nmap -sn $local_ip |tee $nmapFile

#For example:Find the ip by mac from nmap.log
#grep -B 2  "52:54:00:DB:99:A3" nmap.log |head -n 1 |grep -o '(.*)'|cut -d '(' -f2|cut -d ')' -f1

