#!/bin/sh

#Copyright (c) 2016, TeamF1 Networks Pvt. Ltd.
#(Subsidiary of D-Link India)


#Modification history
#--------------------
#01a,22apr16,ss   written.


#Description
#-----------
#This script deletes openVPNSession entry from activeOpenVPNSessions
#based on the common name.

#Sanity check on number of passed arguments.

if [ "$#" -ne 1 ];then
    exit 1
fi

#argument : common name.

#Delete the entry from data base.
retries=1
while [ $retries -lt 5 ];
do
result=`/pfrm2.0/bin/sqlite3 /tmp/system.db "delete from openVPNActiveClients where cnName='$1'" 2>/dev/null`
       #check if last bash operation succeeded, if not retry
       if [ $? == 0 ]; then
           break
       else
           #echo "DB lock retrying again"
           retries=`expr $retries + 1`
           sleep 1
       fi
done ### while database update is successful
exit 0
