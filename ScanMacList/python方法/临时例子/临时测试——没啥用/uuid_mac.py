#!/usr/bin/env python
#coding:utf-8

import uuid
 
# 获取mac地址
addr_num = hex(uuid.getnode())[2:]
mac = "-".join(addr_num[i: i+2] for i in range(0, len(addr_num), 2))
print(mac)  # 4c-ed-fb-bb-e6-ac
 
# 获取本机所有网卡的mac地址
from psutil import net_if_addrs
for k, v in net_if_addrs().items():
    for item in v:
        address = item[1]
        if "-" in address and len(address)==17:
            print(address)
