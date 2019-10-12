#!/bin/sh

#------------------------------------
#功能：删除文件中含有给定字符串的一行
#------------------------------------

FILENAME=file.txt   # 可换为$1
 
 
if [ ! -f file.txt ];then
        echo "$FILENAME no found"
        exit 1
fi
echo -n "INPUT SOME THING: "
read  REPLY
if [ ! -z "$REPLY" ];then
     INFO=$(grep $REPLY $FILENAME)
     if [ ! -z "$INFO" ] ; then
          sed -i "/$REPLY/d" ${FILENAME}
     else
          echo "没有指定内容的信息"
          exit 1
     fi
else 
     echo "input some thing"
     exit 1
fi
exit $? 
