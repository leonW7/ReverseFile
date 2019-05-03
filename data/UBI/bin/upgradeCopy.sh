#!/bin/sh
# Script to copy required programs to RAM
#

cp -fp /pfrm2.0/bin/upgrade /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/upgrade.sh /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/downgrade.sh /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/upgradePrep.sh /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/flash_eraseall /mnt/tmpfs/ 

chmod +x /mnt/tmpfs/*

exit 0;
