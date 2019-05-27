#!/bin/bash
#inputIP=$1  

function check_ip() {
    IP=$1
    Check_Result=$(echo $IP|awk -F. '$1<=255&&$2<=255&&$3<=255&&$4<=255{print "yes"}')
    
    if echo $IP|grep -E "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$">/dev/null; then
        if [ ${Check_Result:-no} == "yes" ]; then
            echo "IP:$IP available."
        else
            echo "IP:$IP $IP not available!"
        fi
    else
        echo "IP:$IP format error!"
    fi
}

#调用参考:
check_ip 192.168.1.1
check_ip 1.1.1.288
check_ip abc

