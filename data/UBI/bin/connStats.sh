#!/bin/sh
# This is a bash script which will parse the connection information from the
# INPUT_FILE and add entries into the activesessions table

INPUT_FILE=/proc/net/ip_conntrack
OUTPUT_FILE=/tmp/ip_conntrack
PROTO_POSITION=1
STATE_POSITION=$(($PROTO_POSITION + 3))
HOSTIP_POSITION=$(($PROTO_POSITION + 4))
DESTIP_POSITION=$(($PROTO_POSITION + 5))
SPORT_POSITION=$(($PROTO_POSITION + 6))
DPORT_POSITION=$(($PROTO_POSITION + 7))

# Since the '/proc' entries are continuously updated so capture it in a file
cat $INPUT_FILE > $OUTPUT_FILE

# Delete all the existing rows before adding new ones
/pfrm2.0/bin/sqlite3 /tmp/system.db 'delete from activesessions'

#For a bit of filtering.
selfip=`/sbin/ifconfig bdg1 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
localhostip=`/sbin/ifconfig lo | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

# Read one line at a time from the OUTPUT_FILE and parse the line to get the 
# parameter values and then compose the cmdstring and execute it using 'sh'

while read line
do   
     proto=$( echo $line | cut -d ' ' -f$PROTO_POSITION )
          
     if [ $proto == "udp" ] || [ $proto == "icmp" ];
     then
         hostip=$( echo $line | cut -d ' ' -f$(($HOSTIP_POSITION - 1)) | cut -d '=' -f2 );
         remoteip=$( echo $line | cut -d ' ' -f$(($DESTIP_POSITION - 1)) | cut -d '=' -f2 );
         sport=$( echo $line | cut -d ' ' -f$(($SPORT_POSITION - 1)) | cut -d '=' -f2 );
         dport=$( echo $line | cut -d ' ' -f$(($DPORT_POSITION - 1)) | cut -d '=' -f2 );
         state="none";
     elif [ $proto == "tcp" ];
     then
         hostip=$( echo $line | cut -d ' ' -f$HOSTIP_POSITION | cut -d '=' -f2 );
         remoteip=$( echo $line | cut -d ' ' -f$DESTIP_POSITION | cut -d '=' -f2 );
         sport=$( echo $line | cut -d ' ' -f$SPORT_POSITION | cut -d '=' -f2 );
         dport=$( echo $line | cut -d ' ' -f$DPORT_POSITION | cut -d '=' -f2 );
         state=$(echo $line|cut -d ' ' -f$STATE_POSITION);
     fi

     if test "$remoteip" = "$selfip" 
	then
		#echo "Connection: $proto host: $hostip dest : $remoteip "
		#echo "Not considering this connection"
		continue
	fi

	if test "$hostip" = "$localhostip" 
	then
		#echo "Connection: $proto host: $hostip dest : $remoteip "
		#echo "Not considering this connection"
		continue
	fi


     qryString="insert into activesessions values ('$proto', '$hostip:$sport', '$remoteip:$dport', '$state', '', '', '', '')"
     cmdstring=`echo "/pfrm2.0/bin/sqlite3 /tmp/system.db \"$qryString\""`
     echo $cmdstring | sh
                                                                                                   
     #echo "Connection: $proto hostip: $hostip destip : $remoteip state = $state cmdstring = $cmdstring"
done < $OUTPUT_FILE

