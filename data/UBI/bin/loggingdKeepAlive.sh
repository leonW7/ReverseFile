#!/bin/sh
# Note : During the heavy traffic and when logs are enabled then the loggingd is 
#        getting killed, which is caused as sqlite3 API's are returning cowardly
#        when they are not getting memory.(assert() is used there to check NULL
#        pointers. And hence sigsegv with dump)
# PS   : Once fix is available then remove this work around.
#
PFRM_DIR=/pfrm2.0
DB_FILE_NAME=/tmp/system.db
PID_FILE=/var/run/loggingdPID.txt
RM_CMD=/bin/rm

# we store this scripts PID into a file, so that we can kill it during upgrade.
echo $$ > /var/run/loggingdKeepAliveScript.pid

# we loop for eternity
while [ 1 ]
do
  loggingdStatus=" "
  loggingdStatus=`ps | grep -v grep | grep -v "loggingdKeepAlive" | grep -i "loggingd"`

  # Do we need to restart it.
  if [ -z "$loggingdStatus" ]; then
      # remove the earlier PID file
      $RM_CMD -rf $PID_FILE
      # start the daemon
      $PFRM_DIR/bin/loggingd $DB_FILE_NAME
  fi

  # sleep for 60 seconds
  sleep 60;
done

