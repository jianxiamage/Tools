#!/usr/bin/env python
#coding:utf-8

import sys
import socket
import uuid

if sys.getdefaultencoding() != 'utf-8':
    reload(sys)
    sys.setdefaultencoding('utf-8')


# 获取主机名
hostname = socket.gethostname()
#获取IP
ip = socket.gethostbyname(hostname)
# 获取Mac地址
def get_mac_address():
    mac=uuid.UUID(int = uuid.getnode()).hex[-12:]
    return ":".join([mac[e:e+2] for e in range(0,11,2)])

ipList = socket.gethostbyname_ex(hostname)
print(ipList)
print("HostName：",hostname)
print("IP：",ip)
print("MacAddr：",get_mac_address())
