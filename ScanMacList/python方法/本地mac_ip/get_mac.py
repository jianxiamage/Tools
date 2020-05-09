#!/usr/bin/env python
#coding:utf-8
import uuid

def get_mac_address():

    node = uuid.getnode()
    mac = uuid.UUID(int = node).hex[-12:]
    return mac


mac = get_mac_address()
print('mac is:%s') %(mac)
