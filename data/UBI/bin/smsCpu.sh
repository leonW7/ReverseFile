#! /bin/bash
#This script calculates the cpu/memory utilisation(in %). It uses internally
#vmstat utility
#vmstat output
#r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
#0  0   2440   6672   5900  90116    0    0    40    30  132  157 11  1 87  1  0
#1  2      3      4      5      6    7    8    9     10   11   12 13 14 15 16 17

# we store this scripts PID into a file, so that we can kill it during upgrade.
echo $$ > /var/smsCpuScriptPID.pid

while [ 0 ];
do
VAL=`/pfrm2.0/bin/vmstat 2>/dev/null | sed -e '1,2d'`
CPUIOWAIT=`echo $VAL | awk '{print $16}'`
CPUIDLE=`echo $VAL | awk '{print $15}'`
CPUKERNEL=`echo $VAL | awk '{print $14}'`
CPUUSR=`echo $VAL | awk '{print $13}'`
CPUUSAGE=`echo "scale=2; 100 - $CPUIDLE - $CPUIOWAIT" | /pfrm2.0/bin/bc`

CPU_FILE=/tmp/cpuFile
HUNDRED_DIGIT=100
COMP_ID_CPU=76
COMP_ID_MEM=200
MAX_VAL=80
MAX_VAL_CPU=50
STATUS=1
if [ $CPUUSAGE -gt $MAX_VAL_CPU ];then    
if [ ! -e $CPU_FILE ];then                     
echo "CPU usage is greater than 50%"
CPU_LOG_MESSAGE="CPU usage is greater than 50%."                                    
/pfrm2.0/bin/smsSupportConfig /tmp/system.db $COMP_ID_CPU "$CPU_LOG_MESSAGE"  
/pfrm2.0/bin/eventTraps /tmp/system.db $COMP_ID_CPU $STATUS "$CPU_LOG_MESSAGE"           
touch $CPU_FILE
fi
else
if [ -e $CPU_FILE ];then
rm $CPU_FILE
fi
fi                                                                              

cat /proc/meminfo > /tmp/memusagefile
if [ -e /tmp/memusagefile ];then
TOTALMEM=`cat /tmp/memusagefile | awk '/MemTotal/{print $2}'`
FREEMEM=`cat /tmp/memusagefile | awk '/MemFree/{print $2}'`
CACHED=`cat /tmp/memusagefile | awk '/^\ *Cached/{print $2}'`
BUFFERS=`cat /tmp/memusagefile | awk '/Buffers/{print $2}'`
USEDMEM=`echo "$TOTALMEM-$FREEMEM" | /pfrm2.0/bin/bc`
rm /tmp/memusagefile
MEM_FILE=/tmp/memFile
MEM_USAGE_INFO=$(( $USEDMEM * $HUNDRED_DIGIT ))                                         
MEM_USAGE_PER=`expr $MEM_USAGE_INFO / $TOTALMEM`                                
if [ $MEM_USAGE_PER -gt $MAX_VAL ];then    
if [ ! -e $MEM_FILE ];then                                           
echo "Memory usage is greater than 80%"
MEM_LOG_MESSAGE="Memory usage is greater than 80%."                                 
/pfrm2.0/bin/smsSupportConfig /tmp/system.db $COMP_ID_MEM "$MEM_LOG_MESSAGE"   
/pfrm2.0/bin/eventTraps /tmp/system.db $COMP_ID_MEM $STATUS "$MEM_LOG_MESSAGE"           
touch $MEM_FILE               
fi
else
if [ -e $MEM_FILE ];then
rm $MEM_FILE
fi
fi
fi
sleep 10;
done;                                                                           
                                                                                
