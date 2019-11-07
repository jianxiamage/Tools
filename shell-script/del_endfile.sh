#!/bin/bash

#----------------------------------------------------------- 
#linux shell删除所有文件夹下指定扩展名（关键字）的所有文件
#----------------------------------------------------------- 

filename=("*.class" "*.pyc" "*.h.gch" "*.o" "*~")
for name in ${filename[@]}; do
    echo $name
    find  .  -name  $name  -type  f  -print  -exec  rm  -rf  {} \;
done
 
if [ $# -eq 0 ];then
    echo $*
    pwd
fi
