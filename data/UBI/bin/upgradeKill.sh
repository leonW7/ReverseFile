#!/bin/sh
#killing all process which are not used for Upgrade.
/bin/echo 0 > /proc/sys/vm/drop_caches
