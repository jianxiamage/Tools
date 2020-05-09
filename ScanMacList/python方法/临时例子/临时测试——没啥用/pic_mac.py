#!/usr/bin/env python
#coding:utf-8

import os

def Get_dstmac(dstip):
    #ping -c3 -i0.3 -W1 $IP_Val &>/dev/null
    s='ping -c3 -i0.3 -W1 ' + dstip
    os.system(s)
    mac = ''
    for line in os.popen("arp -a"):
        if line.lstrip().startswith(dstip):
           s1 = line.split()
           print(s1)
           mac = s1[1].replace("-",":")
           print mac

    return mac

ip = '10.40.57.2'
mac_ret = Get_dstmac(ip)
print('mac is:%s') %(mac_ret)

