#!/bin/sh
echo Content-type: text/plain
echo ""
stat=`cat /tmp/progress.txt;echo @;cat /tmp/firmwareUpgradeStatus.txt`
echo $stat
