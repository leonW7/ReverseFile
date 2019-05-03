#!/bin/sh
KEPLER_INSTALL_PATH=/pfrm2.0
export LD_LIBRARY_PATH=$KEPLER_INSTALL_PATH/lib:$LD_LIBRARY_PATH
export KEPLER_INIT=$KEPLER_INSTALL_PATH/etc/kepler/1.1/kepler_init.lua
if [ -z "$PATH_INFO" ]; then
    export PATH_INFO="/platform.lua"
    export PATH_TRANSLATED=$KEPLER_INSTALL_PATH/var/www/platform.lua
fi
$KEPLER_INSTALL_PATH/bin/cgi
