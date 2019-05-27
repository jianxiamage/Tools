#!/bin/bash

#--------------------------------------------------------------------
Server_src='10.2.5.25'
Server_test='10.20.42.91'
Server_user='loongson-test'
Server_user_test='loongson'
Server_waittime=60
Server_waittime_test=3
#--------------------------------------------------------------------

grep -rl $Server_src ./ |xargs sed -i "s/$Server_src/$Server_test/g"

grep -rl $Server_user ./ |xargs sed -i "s/$Server_user/$Server_user_test/g"

grep -rl $Server_waittime ./ |xargs sed -i "s/$Server_waittime/$Server_waittime_test/g"
