#!/bin/sh
#
# dbglog - script for dbglogs
#
# Copyright (c) 2012, TeamF1, Inc.
#
# modification history
# --------------------
# 01a,19Oct'12,was  written
#
# DESCRIPTION - Script for dbglogs
#

DBGLOG_FILE="/var/dbglog.tgz"
dbgFile="/var/dbglog"
dbgVarFile="/var/dbglog/var/"
dbgFileName="dbglog*"

# script expect one agrument {unit name}
if [ $# -eq 1 ]; then
    #make directory to copy all files
    /bin/mkdir -p $dbgVarFile
    if [ $1 != "DSR-250N"  ] && [ $1 != "DSR-250"  ] && [ $1 != "DSR-150N" ] && [ $1 != "DSR-150" ]; then
        /bin/ps w >$dbgFile/ps.output
    else
        /bin/ps >$dbgFile/ps.output
    fi
    
    # network state 
    /sbin/route -n >$dbgFile/route.output
    /sbin/ifconfig -a >$dbgFile/ifconfig.output
    if [ $1 == "DSR-1000" ] || [ $1 == "DSR-1000N" ] || [ $1 == "DSR-500N" ] || [ $1 == "DSR-500" ]; then
         /pfrm2.0/bin/netstat -n >$dbgFile/netstat.output
    else
        /bin/netstat -n >$dbgFile/netstat.output
    fi
	
    #Ipsec state
    /pfrm2.0/bin/setkey -DP >$dbgFile/ipsecSP.output
    /pfrm2.0/bin/setkey -Da >$dbgFile/ipsecSA.output

    # Firewall, NAT and misc logs 
    /sbin/iptables -L -v -n > $dbgFile/iptables.log
    /sbin/iptables -t nat -L -v -n > $dbgFile/nat.log
    /sbin/iptables -t mangle -L -v -n > $dbgFile/mangle.log

    # arp
    /bin/cat /proc/net/stat/arp_cache > $dbgFile/arp.log
    /bin/cat /proc/net/arp >> $dbgFile/arp.log
    
    #copy kallsyms
    /bin/cp -rf /proc/kallsyms $dbgFile/kallsyms
    
    #copy all files from var except dbglog directory itself
    cd /var/ ; /bin/cp -rfPd $(/bin/ls -w 1 | grep -v $dbgFileName) $dbgVarFile

    #copy all files from /tmp except .db, .deb files and .enc (Package Manager related)
    cd /tmp/ ; /bin/cp -rfPd $(/bin/ls -w 1 | /bin/grep -v \\.db$ | /bin/grep -v \\.deb$ | /bin/grep -v \\.deb\\.enc$) $dbgFile ; /bin/cp -rf system.db $dbgFile ; /bin/cp -rf cpAcc.db $dbgFile

    #make tar
    cd $dbgFile
    /bin/tar -czvf $DBGLOG_FILE * --exclude=microcode --exclude=modules > /dev/null 2>&1
fi

