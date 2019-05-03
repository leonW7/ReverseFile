#!/bin/sh
#

FIRMWARE_IMAGE=$1
KERNEL_PARTITION=$2
ROOTFS_PARTITION=$3
CONFIG_PARTITION=$4
FIRM_HDR_PARTITION=$5
MD5SUM_BIN=/usr/bin/md5sum
FIRM_MD5SUM=/data/tmp/firmMd5sum
FIRM_MD5SUM_TMP=/data/tmp/temp1
FIRM_TMP_FILE=/tmp/firmwareFile
FIRM_TMP_FILE1=/tmp/firmwareFile1
CUT=/usr/bin/cut
RM=/bin/rm
UBI_IMAGE_SIZE=`cat /etc/ubiSize | awk '{print$1}'`
PEB_SIZE=131072
LEB_COUNT=$((UBI_IMAGE_SIZE / PEB_SIZE))
UBI_KERNEL_IMAGE_SIZE=`cat /etc/ubiKernelSize | awk '{print$1}'`
LEB_KERNEL_COUNT=$((UBI_KERNEL_IMAGE_SIZE / PEB_SIZE))

ECHO_BIN=/bin/echo
UPGRADE_STATUS=/tmp/firmwareUpgradeStatus.txt
PROGRESS=/tmp/progress.txt

# Verify the firmware header. The upgrade binary is from the firmware 
# component.This only verifies the sanity of the image by using the firmware
# header.


$MD5SUM_BIN  $FIRMWARE_IMAGE > $FIRM_MD5SUM_TMP
$CUT -f1 -d " " $FIRM_MD5SUM_TMP > $FIRM_MD5SUM
$RM $FIRM_MD5SUM_TMP

# kill all process before upgrade start
/bin/sh /pfrm2.0/bin/upgradeKill.sh

/bin/rm -rf /flash/pfrm2.0
$ECHO_BIN 18 > $PROGRESS
$ECHO_BIN ERASING KERNEL> $UPGRADE_STATUS

/mnt/tmpfs/flash_eraseall $FIRM_HDR_PARTITION > /dev/null
/bin/dd if=$FIRMWARE_IMAGE of=$FIRM_TMP_FILE bs=512 count=256 > /dev/null 
/usr/bin/nandwrite $FIRM_HDR_PARTITION $FIRM_TMP_FILE > /dev/null
$RM $FIRM_TMP_FILE

/bin/dd if=$FIRMWARE_IMAGE of=$FIRM_TMP_FILE bs=512 skip=1 count=16383 > /dev/null
/bin/dd if=$FIRM_TMP_FILE of=$FIRM_TMP_FILE1 bs=$PEB_SIZE count=$LEB_KERNEL_COUNT > /dev/null
ubidetach -p $KERNEL_PARTITION > /dev/null
ubiformat -y $KERNEL_PARTITION -f $FIRM_TMP_FILE1 -s 512 > /dev/null
ubiattach -p $KERNEL_PARTITION > /dev/null
$RM $FIRM_TMP_FILE $FIRM_TMP_FILE1
$ECHO_BIN 28 > $PROGRESS
$ECHO_BIN ERASING FILESYSTEM> $UPGRADE_STATUS

/bin/dd if=$FIRMWARE_IMAGE of=$FIRM_TMP_FILE bs=$PEB_SIZE skip=64 count=$LEB_COUNT > /dev/null 
ubidetach -p $ROOTFS_PARTITION > /dev/null
ubiformat -y $ROOTFS_PARTITION -f $FIRM_TMP_FILE -s 512 > /dev/null
ubiattach -p $ROOTFS_PARTITION > /dev/null
#/usr/bin/nandwrite $ROOTFS_PARTITION $FIRM_TMP_FILE 2> /dev/null
$ECHO_BIN 69 > $PROGRESS
$ECHO_BIN WRITING FILESYSTEM> $UPGRADE_STATUS 
$RM $FIRM_TMP_FILE

$ECHO_BIN 94 > $PROGRESS
$ECHO_BIN ERASING PACKAGE MANAGER CONFIGURATION> $UPGRADE_STATUS

/mnt/tmpfs/flash_eraseall $CONFIG_PARTITION > /dev/null
$ECHO_BIN 99 > $PROGRESS
$ECHO_BIN WRITING PACKAGE MANAGER CONFIGURATION> $UPGRADE_STATUS
/bin/dd if=$FIRMWARE_IMAGE of=$FIRM_TMP_FILE bs=512 skip=147456 count=24576 > /dev/null 
/usr/bin/nandwrite $CONFIG_PARTITION $FIRM_TMP_FILE > /dev/null
$RM $FIRM_TMP_FILE

sleep 5
$ECHO_BIN 100 > $PROGRESS
$ECHO_BIN DONE> $UPGRADE_STATUS



exit 0; 
