#! /bin/bash
#This script calculates the memory usage in linux. It creates a temporary file
#memusage in the same directory which is deleted at the end of the script
cat /proc/meminfo > /tmp/memusage
TOTALMEM=`cat /tmp/memusage | awk '/MemTotal/{print $2}'`
FREEMEM=`cat /tmp/memusage | awk '/MemFree/{print $2}'`
CACHED=`cat /tmp/memusage | awk '/^\ *Cached/{print $2}'`
BUFFERS=`cat /tmp/memusage | awk '/Buffers/{print $2}'`
USEDMEM=`echo "$TOTALMEM-$FREEMEM" | /pfrm2.0/bin/bc`

echo TOTALMEM: $TOTALMEM
echo USEDMEM: $USEDMEM
echo FREE: $FREEMEM
echo CACHED: $CACHED
echo BUFFERS: $BUFFERS
rm /tmp/memusage
