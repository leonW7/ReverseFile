#!/bin/sh
#
PFRM_DIR=/pfrm2.0
while [ 1 ]
do
  httpdStatus=" "
  httpdStatus=`ps | grep -v grep | grep -v "httpd -p" | grep "bin/httpd"`

  if [ -z "$httpdStatus" ]; then
      $PFRM_DIR/sslvpn/bin/httpd
  fi

  if [ "$1" != "" ]; then
      httpdStatus=" "
      httpdStatus=`ps | grep -v grep | grep "bin/httpd -p"`
	  if [ -z "$httpdStatus" ]; then
		  $PFRM_DIR/sslvpn/bin/httpd -p $1
	  fi
  fi
  sleep 60;
done
