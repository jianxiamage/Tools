#!/usr/bin/env python
#coding=utf-8

import os

from socket import gethostbyname, gethostname

# 获取本机IP地址

host = gethostbyname(gethostname())

# 获取ARP表

os.system('arp -a > temp.txt')

withopen('temp.txt') as fp:

  for line in fp:

  line = line.split()[:2]

  if line and line[0].startswith(host[:4]) and (notline[0].endswith('255')):

  print(':'.join(line))
