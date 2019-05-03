#!bin/sh
# args 1 - file name;2 - username;3 - password; 4 - server ip; 5 - protocol; 6 - device name;
#we want to exit the script if any statements return with error
set -e
echo filename-$1:username-$2:password$3:serverip$4:protocol$5:devicename$6 > /var/snmpFirmwareParams
UPGRADE_PROGRAM="/mnt/tmpfs/upgrade"
KERNEL_PARTITION="/dev/mtd2"
ROOTFS_PARTITION="/dev/mtd3"
NEW_CONFIG_PARTITION="/dev/mtd4"
FILENAME=$1
USERNAME=$2
PASSWORD=$3
SERVERIP=$4
PROTOCOL=$5
DEVICENAME=$6
HW_VERSION=`/pfrm2.0/bin/printProductData /dev/mtd0 HwVer`
FIRMWARE="/dev/mtd1"
FIRMWARE_VERSION=`cat /pfrm2.0/etc/firmVersion`
TFTP_PROTOCOL="1"
FTP_PROTOCOL="2"

echo "Attempting to transfer image" > /var/snmpFirmwareStatus
if [ $PROTOCOL == $TFTP_PROTOCOL ]; then
echo "tftp -g -r $FILENAME -l /tmp/$FILENAME $SERVERIP" >> /var/snmpFirmwareParams
tftp -g -r $FILENAME -l /tmp/$FILENAME $SERVERIP  >> /var/snmpFirmwareStatus 2>&1
elif [ $PROTOCOL == $FTP_PROTOCOL ]; then
echo "ftpget -u $USERNAME -p $PASSWORD $SERVERIP /tmp/$FILENAME $FILENAME" >> /var/snmpFirmwareParams
ftpget -u $USERNAME -p $PASSWORD $SERVERIP /tmp/$FILENAME $FILENAME >> /var/snmpFirmwareStatus 2>&1
fi


#/pfrm2.0/bin/upgradeCopy.sh

cp -fp /pfrm2.0/bin/upgrade /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/upgrade.sh /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/upgradePrep.sh /mnt/tmpfs/ 
cp -fp /pfrm2.0/bin/flash_eraseall /mnt/tmpfs/ 

chmod +x /mnt/tmpfs/*
#%s /tmp/%s %s %s %s", UPGRADE_PROGRAM, pFirmName, sysBuffer, KERNEL_PARTITION, ROOTFS_PARTITION
echo "upgradecopy.sh is done" >> /var/snmpFirmwareParams
echo "Transfer done:flashing image now" > /var/snmpFirmwareStatus
echo "$UPGRADE_PROGRAM /tmp/$FILENAME $DEVICENAME $KERNEL_PARTITION $ROOTFS_PARTITION $FIRMWARE_VERSION $NEW_CONFIG_PARTITION $HW_VERSION $FIRMWARE" >>  /var/snmpFirmwareParams
$UPGRADE_PROGRAM /tmp/$FILENAME $DEVICENAME $KERNEL_PARTITION $ROOTFS_PARTITION $FIRMWARE_VERSION $NEW_CONFIG_PARTITION $HW_VERSION $FIRMWARE 
echo "return from upgrade program" >> /var/snmpFirmwareParams
echo "rebooting now" > /var/snmpFirmwareStatus
#sleep 2
#reboot
