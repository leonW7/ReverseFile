#! /bin/bash
#This script calculates the cpu utilisation(in %). It uses internally
#vmstat utility
#vmstat output
#r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
#0  0   2440   6672   5900  90116    0    0    40    30  132  157 11  1 87  1  0
#1  2      3      4      5      6    7    8    9     10   11   12 13 14 15 16 17

VAL=`/pfrm2.0/bin/vmstat  | sed -e '1,2d'`
CPUIOWAIT=`echo $VAL | awk '{print $16}'`
CPUIDLE=`echo $VAL | awk '{print $15}'`
CPUKERNEL=`echo $VAL | awk '{print $14}'`
CPUUSR=`echo $VAL | awk '{print $13}'`
CPUUSAGE=`echo "scale=2; 100 - $CPUIDLE - $CPUIOWAIT" | /pfrm2.0/bin/bc`

echo USR_CPU_USAGE: $CPUUSR
echo KERNEL_CPU_USAGE: $CPUKERNEL
echo IDLE: $CPUIDLE
echo IOWAIT: $CPUIOWAIT
echo TOTAL_CPU_USAGE: $CPUUSAGE
