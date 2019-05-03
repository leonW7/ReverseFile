#!/bin/sh

#start the nimfWanStatus script
str1="teamf1"
Reg_Val="teamf1"
Reg_Val=$(ps | grep nimfWanStatus)
if [ "$Reg_Val" != "$str1" ]
then
   ps | grep nimfWanStatus | xargs killall -q -9 
fi
lua /pfrm2.0/share/lua/5.1/teamf1lualib/nimfWanStatus.lua /tmp/system.db &
ps | grep nimfWanStatus | awk 'NR==1'{'print $1'} > /var/wanStatus.pid

