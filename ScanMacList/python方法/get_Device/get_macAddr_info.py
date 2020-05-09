#!/usr/bin/env python
#coding:utf-8

import os
import fcntl
import struct
import socket
def get_interface_mac(interface):
    DEVICE_NAME_LEN = 15
    MAC_START = 18
    MAC_END = 24
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    info = fcntl.ioctl(s.fileno(), 0x8927,
                       struct.pack('256s', interface[:DEVICE_NAME_LEN]))
    return ''.join(['%02x:' % ord(char)
                    for char in info[MAC_START:MAC_END]])[:-1]

if __name__=='__main__':

  try:
    dev_name = 'enp1s0'
    ip = get_interface_mac(dev_name)
    print ip
  except:
    print sys.exc_info()

