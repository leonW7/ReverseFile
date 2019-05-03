#!/bin/sh

ifName=$1

    echo "Now finding LogicalIfName of $ifName" >/tmp/op
    
    LogicalIfName=`sqlite3 /tmp/system.db "select LogicalIfName from networkInterface
    where interfaceName='$ifName'"`
    while [ "$LogicalIfName" == "SQL error: database is locked" ]
    do
    LogicalIfName=`sqlite3 /tmp/system.db "select LogicalIfName from networkInterface
    where interfaceName='$ifName'"`
    sleep 1;
    done 

    echo $LogicalIfName >>/tmp/op

    echo "Now starting the daemon "

    /pfrm2.0/bin/healthMonitord /tmp/system.db $LogicalIfName &
