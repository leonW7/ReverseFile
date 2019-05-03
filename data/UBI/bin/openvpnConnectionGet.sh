#!/bin/sh
# Note : During the heavy requests from snmp we are not able to get the
# connection status from socket
# PS   : Once fix is available then remove this work around.
#
PFRM_DIR=/pfrm2.0

# we store this scripts PID into a file, so that we can kill it during upgrade.
echo $$ > /var/run/openvpnConnectionGet.pid

# we loop for eternity
while [ 1 ]
do
  $PFRM_DIR/bin/lua $PFRM_DIR/share/lua/5.1/teamf1lualib/openvpnStatusGet.lua
  # sleep for 60 seconds
  sleep 60;
done
