#!/bin/sh
#
PFRM_DIR=/pfrm2.0
while [ 1 ]
do
  status=" "
  status=`ps | grep -v grep | grep "snmpd"`

  if [ -z "$status" ]; then
      $PFRM_DIR/bin/snmpd -p /var/run/snmp.pid &
  else
      pid=`ps | grep -v grep | grep "snmpd" | awk {'print $1'}`
      fdCount=`ls /proc/$pid/fd | wc -l`
      if [ $fdCount -gt 1022 ]; then
         # we will kill the snmp process if we are not able to get fd's
         kill -9 $pid
         # A grace period Ahem ?
         sleep 2
         # Now start the process, better is you reload the conf
         $PFRM_DIR/bin/snmpd -p /var/run/snmp.pid &
      fi                                           
  fi
  sleep 20;
done

