#!/bin/sh
echo Content-type: text/plain
echo ""
stat=`/sbin/reboot -d 8 &`
echo $stat
