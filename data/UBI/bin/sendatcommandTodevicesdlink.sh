#!/bin/sh
tmpfile=$HOME/temporaryfile
timeout=3                       # was 5
echo $1
deviceID="/dev/$1"

## clear output file
echo -n '' > $tmpfile
i=$timeout
out=" "

#prepare command
cmd='at+cfun=1\r'

  #redirect all output from modem to tmpfile
  cat  $deviceID > $tmpfile  &  
  sleep 2 
  # echo  -E $cmd >&2 # debug

#send command
/pfrm2.0/bin/chat   -V  '' $cmd <$deviceID >$deviceID
#wait answer
cnt=$[$timeout*2]
sleep 2 
while [ $cnt -gt 0 ]
  do
  out=`tr -s '\r' '\n' < $tmpfile | tail -n 1 ` 

  if [ ${out} -gt 1 ] 
    then 
    if [ `expr substr "$out" 1 2` == "OK" ]
      then
      echo  `tr -s '\r' '\n' < $tmpfile | tail -n 2 ` 
      killall cat 2> /dev/null 
      return
      else 
        echo $out
        killall cat 2> /dev/null 
	return
      fi
    fi
  sleep 2
  cnt=$[$cnt-1]
  done
cat $tmpfile
killall cat 2> /dev/null 

exit 0
