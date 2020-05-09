#!/usr/bin/env python
#coding:utf-8

import os


import sys, socket
def getipaddrs(hostname):
  result = socket.getaddrinfo(hostname,None,0,socket.SOCK_STREAM)
  return [x[4][0] for x in result]
# the name of the local machine
hostname = socket.gethostname()
print('-------------------')
print(hostname)
print('-------------------')
try:
  print "IP addresses:", ", ".join(getipaddrs(hostname))
except socket.gaierror, e:
  print "Couldn't not get IP addresses:", e
