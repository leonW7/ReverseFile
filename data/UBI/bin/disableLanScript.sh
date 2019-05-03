#!/bin/sh

BOARD=`cat /proc/cpuinfo | grep system | awk '{print $4}'`
echo "Disabling Lan: "$BOARD
model_id=`cat /proc/productData/product_model_id`
echo "Enabling Lan: "$model_id
# Adding VLAN entries for merckx/merckx-w
if [ "$BOARD" = "DNI_MERCKX" ] || [ "$BOARD" = "BBGW_REF" ]; then
    # add vconfig entries on eth0 4094
    /sbin/vconfig add eth0 4094
    
    # bringing up the interfaces eth0.4094
    /sbin/ifconfig eth0.4094 up
elif [ "$model_id" = "DSR-250" ] || [ "$model_id" = "DSR-250N" ] || [ "$model_id" = "DSR-150N" ] || [ "$model_id" = "DSR-150" ]; then
    # add vconfig entries on eth0 4093
    /sbin/vconfig add eth0 4093
    
    # bringing up the interfaces eth0.4093
    /sbin/ifconfig eth0.4093 up
    # set the default MAC address
    /pfrm2.0/bin/nimfDefaultMac > /var/interfaces 
    /pfrm2.0/bin/ifDevUpdateMac /tmp/system.db "ethernet" "eth0.4093"
INTERFACE=`cat /var/configPortName`
if [ "$INTERFACE" = "DMZ" ]; then
    /pfrm2.0/bin/sqlite3 /tmp/system.db "update ifStatic set LogicalIfName = 'DMZ' where LogicalIfName = 'DMZ' and AddressFamily = '2'" 2> /tmp/statusDmz
fi 
else
    # Adding VLAN entries for Moser
    sqlresult='Success'
    while [ "$sqlresult" ]
    do
    /pfrm2.0/bin/sqlite3 /tmp/system.db "update bridgePorts set portEnabled ='0' where interfaceName='eth2'" 2> /tmp/statusvlan
    read sqlresult < /tmp/statusvlan
    sleep 1;
    done
fi
