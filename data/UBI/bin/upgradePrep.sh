#!/bin/sh

#killing all process which are not used for Upgrade.
#fuser -mk /pfrm2.0/
fuser -m /pfrm2.0/ | xargs kill -9


# Copying minimal number of files required for page loading after upgrade is done 
mkdir /mnt/tmpfs/pfrm2.0
mkdir /mnt/tmpfs/pfrm2.0/lib
mkdir -p /mnt/tmpfs/pfrm2.0/lib/lua
mkdir -p /mnt/tmpfs/pfrm2.0/var/www/
mkdir -p /mnt/tmpfs/pfrm2.0/var/www/js
mkdir -p /mnt/tmpfs/pfrm2.0/var/www/images
mkdir -p /mnt/tmpfs/pfrm2.0/var/www/help
mkdir -p /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
mkdir -p /mnt/tmpfs/pfrm2.0/share/lua/5.1/cgilua
mkdir -p /mnt/tmpfs/pfrm2.0/bin
mkdir -p /mnt/tmpfs/pfrm2.0/etc
cp -f /pfrm2.0/etc/ignoreList /mnt/tmpfs/pfrm2.0/etc/
cp -f /pfrm2.0/var/www/firmware.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/mainMenu.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/leftMenuMaintenance.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/footer.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/textValidationsJS.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/systemJS.htm /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/js/system.js /mnt/tmpfs/pfrm2.0/var/www/js/
cp -f /pfrm2.0/var/www/js/menu.js /mnt/tmpfs/pfrm2.0/var/www/js/
cp -f /pfrm2.0/var/www/js/mgmt.js /mnt/tmpfs/pfrm2.0/var/www/js/
cp -f /pfrm2.0/var/www/js/textValidations.js /mnt/tmpfs/pfrm2.0/var/www/js/
cp -f /pfrm2.0/var/www/images/logo.gif /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/images/logo.gif /mnt/tmpfs/pfrm2.0/var/www/images/
cp -f /pfrm2.0/var/www/help/toolsHelp.txt /mnt/tmpfs/pfrm2.0/var/www/help/
cp -f /pfrm2.0/var/www/platform.lua /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/platform.cgi /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/db.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/web.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/login.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/util.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/factDef.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/I18N.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/pkgMgmt.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/captivePortal.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/firmware.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/teamf1lualib/config.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/teamf1lualib
cp -f /pfrm2.0/share/lua/5.1/cgilua/*.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/cgilua/
cp -f /pfrm2.0/share/lua/5.1/*.lua /mnt/tmpfs/pfrm2.0/share/lua/5.1/
cp -a /pfrm2.0/share/lua/5.1/sapi /mnt/tmpfs/pfrm2.0/share/lua/5.1/
cp -a /pfrm2.0/share/lua/5.1/socket /mnt/tmpfs/pfrm2.0/share/lua/5.1/
cp -f /pfrm2.0/bin/cgi /mnt/tmpfs/pfrm2.0/bin/
cp -rf /pfrm2.0/sslvpn/ /mnt/tmpfs/pfrm2.0/
cp -a /pfrm2.0/lib/lua/5.1 /mnt/tmpfs/pfrm2.0/lib/lua/
cp -a /pfrm2.0/pkgMgmt/ /mnt/tmpfs/pfrm2.0/
cp -f /pfrm2.0/var/www/upgradeStatus.cgi /mnt/tmpfs/pfrm2.0/var/www/
cp -f /pfrm2.0/var/www/quickvpn.cgi /mnt/tmpfs/pfrm2.0/var/www/

cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-lua.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-x509.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-klite.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-adaptos.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-umi.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-sslim.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libmipsmips64-octeon-linux-gnu-time.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libSys.so /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libssl.so* /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libcrypto.so* /mnt/tmpfs/pfrm2.0/lib/
cp -f /pfrm2.0/lib/libsqlite3.so* /mnt/tmpfs/pfrm2.0/lib/
chmod 755 /mnt/tmpfs/pfrm2.0/var/www/upgradeStatus.cgi
chmod 775 /mnt/tmpfs/pfrm2.0/var/www/platform.cgi
chmod 775 /mnt/tmpfs/pfrm2.0/bin/cgi


cp -f /pfrm2.0/bin/busybox /tmp/busybox
ln -s /tmp/busybox /tmp/flashcp
chmod 755 /tmp/flashcp

sleep 3
/bin/umount /pfrm2.0 
ps w > /data/tmp/db
sleep 1
/bin/mount /mnt/tmpfs/pfrm2.0 /pfrm2.0 
sleep 3

#start httpd server for upgrade progress bar
/mnt/tmpfs/pfrm2.0/sslvpn/bin/httpd &
cp
exit 0;
