#!/usr/bin python
# -*- coding:utf-8 -*-

#-------------------------
#功能：
#python如何将一个txt文件里的转化为相应字典
#-------------------------

#读取代码
fr = open('dic.txt','r')
dic = {}
keys = [] #用来存储读取的顺序
for line in fr:
    v = line.strip().split(':')
    dic[v[0]] = v[1]
    keys.append(v[0])
fr.close()
print(dic)
#写入文件代码 通过keys的顺序写入
fw = open('wdic.txt','w')
for k in keys:
    fw.write(k+':'+dic[k]+'\n')
 
fw.close()

