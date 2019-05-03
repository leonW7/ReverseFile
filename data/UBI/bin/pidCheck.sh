#!/bin/sh
check=`ps | grep l2tp | grep 5110 | awk 'NR==1'{'print $1'}`
if [ "$check" = "" ]; then
        echo 0 > /var/l2tpProcess.pid
else
        ps | grep l2tp | grep 5110 | awk 'NR==1'{'print $1'} > /var/l2tpProcess.pid
fi

