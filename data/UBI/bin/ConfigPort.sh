#!/bin/sh
BOARD=`cat /proc/cpuinfo | grep system | awk '{print $4}'`
if [ "$BOARD" = "DNI_MERCKX" ] || [ "$BOARD" = "BBGW_REF" ]; then
    /pfrm2.0/bin/configPortUpdate /tmp/system.db 18 ConfigPort 1 LAN NEW 
else   
    /pfrm2.0/bin/configPortUpdate /tmp/system.db 18 ConfigPort 1 WAN2 NEW 
fi  

# Reading form ConfiPort Table
result='NIL'
sqlresult='WAN2'

# Giving Dummy Update on WAN2/DMZ
/pfrm2.0/bin/sqlite3 /tmp/system.db << SQL_ENTR_TAG_1;
.timeout 1000;
.output /temp
BEGIN;
select LogicalIfname from ConfigPort Where rowId=1;
COMMIT;
SQL_ENTR_TAG_1
sqlresult=`cat /temp`;
if [ "$sqlresult" = "WAN2" ]; then
    result=`/pfrm2.0/bin/sqlite3 /tmp/system.db "UPDATE nimfconf SET OID ='0' where LogicalIfName = '$sqlresult' and AddressFamily = 2"`
    while [ "$result" == "SQL error: database is locked" ]
    do
    result=`/pfrm2.0/bin/sqlite3 /tmp/system.db "UPDATE nimfconf SET OID ='0' where LogicalIfName = '$sqlresult' and AddressFamily = 2"`
    sleep 1;
    done
fi    
if [ "$sqlresult" = "DMZ" ]; then
    result=`/pfrm2.0/bin/sqlite3 /tmp/system.db "UPDATE ifStatic SET OID ='0' where LogicalIfName = '$sqlresult' and AddressFamily = 2"`
    while [ "$result" == "SQL error: database is locked" ]
    do
    result=`/pfrm2.0/bin/sqlite3 /tmp/system.db "UPDATE ifStatic SET OID ='0' where LogicalIfName = '$sqlresult' and AddressFamily = 2"`
    sleep 1;
    done
fi
