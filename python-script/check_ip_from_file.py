#!/usr/bin/env python
#_*_coding:utf-8_*_

import os
import sys
from check_ip import check_ip_format

#hostFile = 'hostlist.txt'
hostFile = sys.argv[1]
#hostList = [line.strip() for line in hostFile.readlines()]

retCode=0

def main():

  if len(sys.argv)!=2: #传参加本身长度必须为2 
      print "Usage: %s hostfile.txt "%sys.argv[0]
      sys.exit(1)

  lineNum=1
  try:
    with open(hostFile,"r") as f:
      for element in f:
        #print element
        line = element.split(" ")#按照空格键分割每一行里面的数据
        line1=str(line[0])
        line2=str(line[1])
        #print line1
        #print line2
        if not check_ip_format(line1):
          retCode=1
          print('Line:[%s], [%s] is not a correct IP,Please check it!' %(lineNum,line1))
          break
        if not check_ip_format(line2):
          retCode=1
          print('Line:[%s], [%s] is not a correct IP,Please check it!' %(lineNum,line2))
          break
        lineNum = lineNum + 1
  except IOError as ex:
    print(ex)
  finally:
    if not 'f' in locals().keys():
       sys.exit(1)
    if f is not  None:
       f.close()
       print retCode
       sys.exit(retCode)

if __name__=='__main__':
    main()
    # print(__name__)

