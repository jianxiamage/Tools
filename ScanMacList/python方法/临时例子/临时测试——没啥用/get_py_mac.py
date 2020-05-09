#!/usr/bin/env python
#coding:utf-8

def get_max_address():
    import uuid
    node=uuid.getnode()
    mac=uuid.UUID(int=node).hex[-12:]
    return mac


mac=get_max_address()
print('mac is:%s') %(mac)
