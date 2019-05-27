#!/usr/bin/env python
# -*- coding:utf-8 -*-

import os,sys
import socket

def valid_ip(address):
    try:
        socket.inet_aton(address)
        print "check ip address success!"
        return True
    except:
        print "check ip address failed!"
        return False

 
def check_ip_format(ipaddr):
    addr = ipaddr.strip().split('.') #以符号:[.]切割IP地址为一个列表
 
    #print addr
    if len(addr) != 4: #切割后列表参数个数必须为4
        print "check ip address failed!"
        #sys.exit()
        return False
    
    return valid_ip(ipaddr)
 
def main():
  retFlag=True
  if len(sys.argv)!=2: #传参加本身长度必须为2 
      print "Usage: %s 10.2.5.25 "%sys.argv[0]
      sys.exit(1)
  else:
      retCode=check_ip_format(sys.argv[1]) #满足条件调用校验IP函数
  
  if retCode:
    sys.exit(0)
  else:
    sys.exit(1)

if __name__ == '__main__':
    main()
    # print(__name__)
