#!/bin/sh
#
PFRM_DIR=/pfrm2.0
echo $$ > /var/run/ospfKeepAlive.pid
while [ 1 ]
do
  status=" "

  if [ -e "/etc/ospfd.conf" ]; then
     status=`ps | grep -v grep | grep "ospfd"`
     if [ -z "$status" ]; then
        /pfrm2.0/bin/ospfd -u root -g root -f /etc/ospfd.conf &
     fi
 fi
  sleep 20;
done


