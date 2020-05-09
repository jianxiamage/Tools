#!/usr/bin/env python
#coding:utf-8

import os
import uuid

node = uuid.getnode()
mac = uuid.UUID(int=node)
addr = mac.hex[-12:]
print('macAddr:%s') %(addr)
