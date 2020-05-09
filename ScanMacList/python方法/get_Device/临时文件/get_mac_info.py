#! /usr/bin/env python
 
from fcntl import ioctl
import socket
import struct
import sys
 
sock=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
try:
    ip=ioctl(sock.fileno(),0x8927,struct.pack('256s','enp1s0'))
    ip=socket.inet_ntoa(ip[18:24])
    print ip
except:
    print sys.exc_info()
