#!/bin/sh

BOARD=`cat /proc/cpuinfo | grep system | awk '{print $4}'`

echo "Enabling Lan: "$BOARD
model_id=`cat /proc/productData/product_model_id`
echo "Enabling Lan: "$model_id
# Enable Configurable Port as LAN for Merckx/Metckx-w
if [ "$BOARD" = "DNI_MERCKX" ] || [ "$BOARD" = "BBGW_REF" ]; then
    # Now down the eth0.4094  
    /sbin/ifconfig eth0.4094 down
    # Now remove eth0.4094 entries from vconfig
    /sbin/vconfig rem eth0.4094
elif [ "$model_id" = "DSR-250" ] || [ "$model_id" = "DSR-250N" ] || [ "$model_id" = "DSR-150N" ] || [ "$model_id" = "DSR-150" ]; then
    # Now down the eth0.4093  
    /sbin/ifconfig eth0.4093 down
    # Now remove eth0.4093 entries from vconfig
    /sbin/vconfig rem eth0.4093
else
    # Adding Configurable Port data for Moser
    sqlresult='Success'
    while [ "$sqlresult" ] 
    do
    /pfrm2.0/bin/sqlite3 /tmp/system.db "update bridgePorts set portEnabled ='1' where interfaceName='eth2'" 2> /tmp/statusvlan
if [ "$BOARD" = "MOSER" ]; then
    /pfrm2.0/bin/sqlite3 /tmp/system.db "update vlanPortMgmt set PortType ='BRIDGE' where PortName='OptionalPort'"
fi
    read sqlresult < /tmp/statusvlan
    sleep 1;
    done
fi
