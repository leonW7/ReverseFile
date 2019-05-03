#!/bin/sh
#
# usbProgram - script to handle USB devices
#
# Copyright (c) 2008-2017, TeamF1 Networks Pvt. Ltd. 
# (Subsidiary of D-Link India)
#
# Copyright (c) 2010, TeamF1, Inc.
#
# modification history
# --------------------
# 01l,21june17,mnr  adding changes to support DWM-157-D1 dongle
# 01k,10jan17,ps   merging changes for 4G support
# 01j,19aug16,ps   fixed spr-57686
# 01i,27mar15,sr   ported changes from DSR for HQ20140110000009
# 01h,18mar15,sr   Added changes for USB order in DSR-AC
# 01g,13nov14,as   Changes for SPR #46423
# 01f,15May13,was  Changes for SPR #38051
# 01e,6May13, abr  added logic to dislay correct name for E303 dongle in GUI.
# 01d,01May13,was  Changes for usb autobackup and encryption support
# 01c,29feb12,was  added usb_modwswitch and support for new threeg dongles
# 01b,18jun10,db   added proc entries support.
# 01a,02apr10,anp  written.
#
# DESCRIPTION
# This script is called by the udev and it handles action on different USB
# devices.
#

# macros
USB1_FILE=/var/usb1Info
USB2_FILE=/var/usb2Info
DEV_DIR=/var/dev
LED_BIN=/pfrm2.0/bin/ledctrl
USB1_LINK=/usb1
USB2_LINK=/usb2
USB1_FILE_LIST=/var/usb_filelist1.txt
USB2_FILE_LIST=/var/usb_filelist2.txt
USB1_STATUS=/var/usb_status1.txt
USB2_STATUS=/var/usb_status2.txt
USB1_PROC_FILE=/proc/usb1_status
USB2_PROC_FILE=/proc/usb2_status
USB1=0
USB2=1
FLASH_CONF_FILE=/data/tmp/teamf1.cfg.ascii.tar.bz2
FLASH_CONF_FILE_ENC=/data/tmp/teamf1.cfg.ascii.enc
VAR_CONF_DIR=/var/backpConfigFiles/
VAR_CONF_FILE=/var/backpConfigFiles/teamf1.cfg.ascii
VAR_CONF_FILE_ENC=/var/backpConfigFiles/teamf1.cfg.ascii.enc
CONFIG_OUTPUTFILE=/tmp/CONFIG_OUTPUTFILE
BOOTUP_COMPLETE_FILE=/tmp/bootComplete
BRAND_CONF=/var/brand.conf
LED_BLINK_NUM=3
USB_NUM1=1
USB_NUM2=2
USB_BACKUP_CHECK=0
CONF_FILES_PATH=/pfrm2.0/etc/usb_modeswitch.d/
MODELID_FILES=modelId
MODELID_BEFORE_CON_FILES=modelId_before
LINK_TTYUSB=
TTYUSB0_FILE=TTYUSB0
TTYUSB2_FILE=TTYUSB2
TTYUSB1_FILE=TTYUSB1
TTYACM0_FILE=TTYACM0
USB_MODESWITCH_COMM="/pfrm2.0/bin/usb_modeswitch -IQD -c"
DLINK_A5_SCRIPT="/bin/sh /pfrm2.0/bin/sendatcommandTodevicesdlink.sh ttyACM0"
PACKAGEFILE="/pfrm2.0/pkgMgmt/packageKey"
CHAT_SCRIPT="/pfrm2.0/bin/chat"
CONFIG_FILE=
MODELID=
VENDORID=
DLINK_ZTE_VENDOR_ID=19d2
HUAWEI_VENDOR_ID=12d1
DLINK_DWM157_VENDOR_ID=2001
PPPD_BIN=/pfrm2.0/bin/pppd
VID_PID_FILE=/var/vId_pId.txt
MODEL_ID_BEFORE_CON=
PRODUCT_ID_BEFORE_CON=
#Device Spesific ID's
SYSFS_VENDOR_ID=$3
SYSFS_PRODUCT_ID=$4
DLINK_VENDOR_ID=07d1
DLINK_PRODUCT_ID_A1_DWM=a800
DLINK_PRODUCT_ID_DWM152=3e01
DLINK_PRODUCT_ID_DWM156=3e02
DLINK_PRODUCT_ID_DWP156=a403
DLINK_PRODUCT_ID_DWP156_MODEM=7d0b
DLINK_PRODUCT_ID_DWP157_MODEM=7d0c
DLINK_DWM_221_B1_VENDOR_ID=2001
DLINK_DWM_221_B1_PRODUCT_ID=a401
DLINK_DWM_221_B1_PRODUCT_ID_MODEM=7e19
DLINK_DWM_222_A1_VENDOR_ID=2001
DLINK_DWM_222_A1_PRODUCT_ID=ab00
DLINK_DWM_222_A1_PRODUCT_ID_MODEM=7e35
DLINK_PRODUCT_ID_DWM156A3_MODEM=7d01
DLINK_PRODUCT_ID_DWM157B1_MODEM=7d02
USB_EJECT=/usr/bin/eject
MAX_DISK_SIZE=2199023255552
DISK_SIZE_USB1=/tmp/size1.txt
DISK_SIZE_USB2=/tmp/size2.txt
DEVICE_PATH=`echo $DEVPATH | cut -d / -f8`
modeSwitch=0
export LD_LIBRARY_PATH='.:/pfrm2.0/lib:/lib';
# for debugging purpose
echo "Inside $0 $ACTION:$1:$DEVTYPE:$ID_VENDOR:$ID_MODEL:$ID_TYPE:$SYSFS_PRODUCT_ID:$SYSFS_VENDOR_ID" >> /tmp/debug;

# to blink the led
power_led_blink()
{
    i="0"
    $LED_BIN ps_green off;
    while [ $i -lt $1 ]
    do
        $LED_BIN ps_amber on;
        sleep 1;
        $LED_BIN ps_amber off;
        sleep 1;
        i=`expr $i + 1`;
    done
    if [ -e $BRAND_CONF ]; then
        $LED_BIN ps_green on;
    else
        $LED_BIN ps_amber on;
    fi
}

#to transfer configuration to usb
backup_check()
{
MODEL_ID=`/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId |  awk '{print $1}'`
SERIAL_NUMBER=`/pfrm2.0/bin/printProductData /etc/mtdDevice SerNo  | awk '{print $1}'`
key128=`cat $PACKAGEFILE | head -n 1`
iv=`cat $PACKAGEFILE | head -n 2 | tail -n 1`
/pfrm2.0/bin/sqlite3 /tmp/system.db << SQL_ENTR_TAG_1;
.timeout 1000;
.output $CONFIG_OUTPUTFILE
;BEGIN;
select EnableAutoBackup,EncryptEnable from ConfigSupport;
COMMIT;
SQL_ENTR_TAG_1
AUTO_BACKUP_SUPPORT=`cut -d"|" -f1 $CONFIG_OUTPUTFILE`;
ENCYRPT_SUPPORT=`cut -d"|" -f2 $CONFIG_OUTPUTFILE`;
if [ $AUTO_BACKUP_SUPPORT  == "1" ]; then
    if [ -e /usb$1/ ]; then
        if [ -e  $FLASH_CONF_FILE ] && [ -e $BOOTUP_COMPLETE_FILE ]; then
            /bin/rm -rf /usb$1/$MODEL_ID"_"$SERIAL_NUMBER.cfg;
            /bin/rm -rf /usb$1/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc;
            mkdir -p $VAR_CONF_DIR;
            tar -xzf $FLASH_CONF_FILE -C $VAR_CONF_DIR; 
            if [ $ENCYRPT_SUPPORT == "1" ]; then
                /pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in $VAR_CONF_FILE -out $VAR_CONF_FILE_ENC -K $key128 -iv $iv -nosalt
                cp -f $VAR_CONF_FILE_ENC /usb$1/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc;
            else
               cp -f $VAR_CONF_FILE /usb$1/$MODEL_ID"_"$SERIAL_NUMBER.cfg;
            fi
            # delete the temporary configuration files we created.
            rm -rf $VAR_CONF_DIR*;
            power_led_blink $LED_BLINK_NUM;
        fi
    fi
fi
}

# handles a device remove
if [ $ACTION == "remove" ]; then
    product_id=`/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId |  awk '{print $1}'`
   
    # USB2
    if [ $1 == "1-1.1" ]; then
        usbFile=$USB2_FILE;
        $LED_BIN usb1 off;
        rm -f $USB2_LINK;
        rm -f $USB2_FILE_LIST;
        rm -f $USB2_STATUS;
        devType=$(head -n 1 $usbFile | cut -d : -f3)
        if [ $devType == "storage" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
        fi
        if [ $devType == "Printer" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
        fi

        # signal kernel that device is removed
        echo "0" > $USB2_PROC_FILE
    # USB1
    elif [ $1 == "3-1" ]; then
        usbFile=$USB1_FILE;
        $LED_BIN usb2 off;
        rm -f $USB1_LINK;
        rm -f $USB1_FILE_LIST;
        rm -f $USB1_STATUS;
        devType=$(head -n 1 $usbFile | cut -d : -f3)
        if [ $devType == "storage" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB1;
        fi
        if [ $devType == "Printer" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
        fi
        # signal kernel that device is removed
        echo "0" > $USB1_PROC_FILE
    # USB2
    elif [ $1 == "1-1" ]; then
        usbFile=$USB2_FILE;
        $LED_BIN usb1 off;
        rm -f $USB2_LINK;
        rm -f $USB2_FILE_LIST;
        rm -f $USB2_STATUS;
        devType=$(head -n 1 $usbFile | cut -d : -f3)
        if [ $devType == "storage" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
        fi
        if [ $devType == "Printer" ]; then
            /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
        fi

        # signal kernel that device is removed
        echo "0" > $USB2_PROC_FILE
    fi

    if [ ! -e $usbFile ]; then
        exit 0;
    fi

    mountPoint=$(head -n 1 $usbFile | cut -d : -f4)   
    device=$(head -n 1 $usbFile | cut -d : -f5)
    umount $mountPoint;
    rm -rf $mountPoint;
    rm -f $usbFile;
fi


if [ $ACTION == "add" ]; then
    if [ -e "$DEV_DIR/$1" ]; then
        product_id=`/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId |  awk '{print $1}'`
        if [ $SYSFS_VENDOR_ID == $DLINK_VENDOR_ID ] && [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_A1_DWM ] && [ $ID_VENDOR == "ConnMgr" ]; then
            rm -rf /dev/modem; 
            ln -s /dev/ttyUSB0 /dev/modem;
            if [ $ID_TYPE = "disk" ]; then
                mkdir -p /usb/$1;
                mount $DEV_DIR/$1 /usb/$1;
                mountPoint="/usb/$1";
                device="$DEV_DIR/$1";
                touch /usb/$1/wcdma.cfg;
                devType="3G";
                endPoint=$(echo $ID_PATH | cut -d : -f2);
        if [ $mountPoint != "" ]; then
            # provide important information about the device to the appications
            if [ $endPoint == "1.1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB2_FILE;
                echo "1" > $USB2_PROC_FILE

                # turn LED ON
                $LED_BIN usb1 on;

                # create a link for user applications
                ln -sf $mountPoint $USB2_LINK;

                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                else
                    echo -2 > $USB2_STATUS;
                fi
            elif [ $DEVICE_PATH == "3-1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB1_FILE;
                echo "1" > $USB1_PROC_FILE

                # turn LED ON
                $LED_BIN usb2 on;
                ln -sf $mountPoint $USB1_LINK;

                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB1_STATUS;
                    ls $USB1_LINK/ > $USB1_FILE_LIST;
                    backup_check $USB_NUM2;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB1;
                else
                    echo -2 > $USB1_STATUS;
                fi
            elif [ $endPoint == "1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB2_FILE;
                echo "1" > $USB2_PROC_FILE

                # turn LED ON
                $LED_BIN usb1 on;

                # create a link for user applications
                ln -sf $mountPoint $USB2_LINK;
                
                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                else
                    echo -2 > $USB2_STATUS;
                fi
            fi
        fi
            elif [ $ID_TYPE = "cd" ]; then
                $USB_EJECT /var/dev/$1;
            fi
        elif ([ $SYSFS_VENDOR_ID == $DLINK_DWM_221_B1_VENDOR_ID ] && [ $SYSFS_PRODUCT_ID == $DLINK_DWM_221_B1_PRODUCT_ID ] && [ $ID_VENDOR == "Mobile_Connect" ]) || ([ $SYSFS_VENDOR_ID == $DLINK_DWM_222_A1_VENDOR_ID ] && [ $SYSFS_PRODUCT_ID == $DLINK_DWM_222_A1_PRODUCT_ID ] && [ $ID_VENDOR == "Mobile_Connect" ]); then
            rm -rf /dev/modem; 
            ln -s /var/dev/ttyUSB2 /dev/modem;
            if [ $ID_TYPE = "disk" ]; then
                mkdir -p /usb/$1;
                mount $DEV_DIR/$1 /usb/$1;
                mountPoint="/usb/$1";
                device="$DEV_DIR/$1";
                touch /usb/$1/wcdma.cfg;
                devType="4G";
                endPoint=$(echo $ID_PATH | cut -d : -f2);
        if [ $mountPoint != "" ]; then
            # provide important information about the device to the appications
            if [ $endPoint == "1.1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB2_FILE;
                echo "1" > $USB2_PROC_FILE

                # turn LED ON
                $LED_BIN usb1 on;

                # create a link for user applications
               ln -sf $mountPoint $USB2_LINK;

                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                else
                    echo -2 > $USB2_STATUS;
                fi
            elif [ $DEVICE_PATH == "3-1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB1_FILE;
                echo "1" > $USB1_PROC_FILE

                # turn LED ON
                $LED_BIN usb2 on;
                ln -sf $mountPoint $USB1_LINK;

                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB1_STATUS;
                    ls $USB1_LINK/ > $USB1_FILE_LIST;
                    backup_check $USB_NUM2;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB1;
                else
                    echo -2 > $USB1_STATUS;
                fi
            elif [ $endPoint == "1" ]; then
                echo "$ID_VENDOR:$ID_MODEL:$devType:$mountPoint:$device" > $USB2_FILE;
                echo "1" > $USB2_PROC_FILE

                # turn LED ON
                $LED_BIN usb1 on;

                # create a link for user applications
                ln -sf $mountPoint $USB2_LINK;
                
                # create a file list for firmware upgrade                
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                else
                    echo -2 > $USB2_STATUS;
                fi
            fi
        fi
           elif [ $ID_TYPE = "cd" ]; then
               $USB_EJECT /dev/$1;
           fi
       else 
           CONFIG_FILE=`ls $CONF_FILES_PATH|grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID`;
           if [ -n "$CONFIG_FILE" ]; then
           $USB_MODESWITCH_COMM $CONF_FILES_PATH$SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID;
           $USB_MODESWITCH_COMM $CONF_FILES_PATH$SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID;   
           echo $CONFIG_FILE > $VID_PID_FILE;  
           # setting modeSwitch flag to 1 to avoid writing the info to usbxInfo file
           if [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWP156 ]
           then
              modeSwitch=1
           fi      
           fi
           if ([ $SYSFS_VENDOR_ID == $DLINK_DWM_221_B1_VENDOR_ID ] && [ $SYSFS_PRODUCT_ID == $DLINK_DWM_221_B1_PRODUCT_ID_MODEM ] && [ $ID_VENDOR == "Mobile_Connect" ]) || ([ $SYSFS_VENDOR_ID == $DLINK_DWM_222_A1_VENDOR_ID ] && [ $SYSFS_PRODUCT_ID == $DLINK_DWM_222_A1_PRODUCT_ID_MODEM ] && [ $ID_VENDOR == "Mobile_Connect" ]); then
               echo $SYSFS_VENDOR_ID $SYSFS_PRODUCT_ID > /sys/bus/usb-serial/drivers/option1/new_id

           fi
           LINK_TTYUSB=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$TTYUSB0_FILE`;
           if [ -n "$LINK_TTYUSB" ]; then
               rm -rf /dev/modem;
               ln -s /var/dev/ttyUSB0 /dev/modem;
               $PPPD_BIN /dev/modem connect "chat -v -f /var/smsChat -t 3"
           else
               LINK_TTYUSB=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$TTYUSB2_FILE`;
               if [ -n "$LINK_TTYUSB" ]; then
                  rm -rf /dev/modem;
                  ln -s /var/dev/ttyUSB2 /dev/modem;
                  $PPPD_BIN /dev/modem connect "chat -v -f /var/smsChat -t 3"
                  if [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWP156_MODEM ] || [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWP157_MODEM ] || [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM156A3_MODEM ] ||  [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM157B1_MODEM ]
                  then
                     #Setting GSM to maximum functionality
                     $CHAT_SCRIPT TIMEOUT 1 "" "AT+CFUN=1" "OK" >> /dev/modem
                  fi
               else
                   LINK_TTYUSB=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$TTYUSB1_FILE`;
                   if [ -n "$LINK_TTYUSB" ]; then
                       rm -rf /dev/modem;
                       ln -s /var/dev/ttyUSB1 /dev/modem;
                       $PPPD_BIN /dev/modem connect "chat -v -f /var/smsChat -t 3"
                       if [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWP156_MODEM ] || [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWP157_MODEM ] || [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM156A3_MODEM ] ||  [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM157B1_MODEM ]
                       then
                           #Setting GSM to maximum functionality
                           $CHAT_SCRIPT TIMEOUT 1 "" "AT+CFUN=1" "OK" >> /dev/modem
                       fi
                   else
                       LINK_TTYUSB=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$TTYACM0_FILE`;
                       if [ -n "$LINK_TTYUSB" ]; then
                           rm -rf /dev/modem;
                           ln -s /var/dev/ttyACM0 /dev/modem;
                           $DLINK_A5_SCRIPT;
                           $PPPD_BIN /dev/modem connect "chat -v -f /var/smsChat -t 3"
                       else
                           rm -rf /dev/modem;
                           ln -s /var/dev/ttyUSB0 /dev/modem;
                           $PPPD_BIN /dev/modem connect "chat -v -f /var/smsChat -t 3"
                       fi
                   fi
               fi
           fi
       mkdir -p /usb/$1;
      if [ $SYSFS_VENDOR_ID == $DLINK_VENDOR_ID ]; then
             if [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM152 ] || [ $SYSFS_PRODUCT_ID == $DLINK_PRODUCT_ID_DWM156 ]; then
                rm -rf /dev/modem; 
                ln -s /var/dev/ttyUSB0 /dev/modem;
             fi
      fi
       
       MODEL_ID_BEFORE_CON=`grep -f $VID_PID_FILE $CONF_FILES_PATH$MODELID_BEFORE_CON_FILES | cut -d : -f1`;
       PRODUCT_ID_BEFORE_CON=`grep -f $VID_PID_FILE $CONF_FILES_PATH$MODELID_BEFORE_CON_FILES | cut -d : -f2`;
       if [ -n "$MODEL_ID_BEFORE_CON" ] && [ -n "$PRODUCT_ID_BEFORE_CON" ]; then
           MODELID=`grep $MODEL_ID_BEFORE_CON:$PRODUCT_ID_BEFORE_CON $CONF_FILES_PATH$MODELID_BEFORE_CON_FILES | cut -d : -f3`;
           VENDORID=`grep $MODEL_ID_BEFORE_CON:$PRODUCT_ID_BEFORE_CON $CONF_FILES_PATH$MODELID_BEFORE_CON_FILES | cut -d : -f4`;
           DEV_TYPE=`grep $MODEL_ID_BEFORE_CON:$PRODUCT_ID_BEFORE_CON $CONF_FILES_PATH$MODELID_BEFORE_CON_FILES | cut -d : -f5`;
       else
           MODELID=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$MODELID_FILES | cut -d : -f3`;
           VENDORID=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$MODELID_FILES | cut -d : -f4`;          
           DEV_TYPE=`grep $SYSFS_VENDOR_ID:$SYSFS_PRODUCT_ID $CONF_FILES_PATH$MODELID_FILES | cut -d : -f5`;
       fi    
    
       if [ -z "$MODELID" ]; then
           MODELID=$ID_MODEL;
           VENDORID=$ID_VENDOR;
       fi
             if [ $ID_FS_USAGE == "filesystem" ] || [ $DEVTYPE == "partition" ]; then
                 if [ $DEVICE_PATH == "3-1" ]; then
                     fileUSB1=`cat $DISK_SIZE_USB1`;
                     if [ $fileUSB1 -ge $MAX_DISK_SIZE ]; then
                         echo 2 > $USB1_STATUS
                         exit 0;
                     fi
                 elif [ $DEVICE_PATH == "1-1" ]; then
                       fileUSB2=`cat $DISK_SIZE_USB2`;
                       if [ $fileUSB2 -ge $MAX_DISK_SIZE ]; then
                           echo 2 > $USB2_STATUS
                           exit 0;
                       fi
              
                 fi
             if [ $ID_FS_TYPE == "vfat" ]; then
                mount -t vfat -o utf8 $DEV_DIR/$1 /usb/$1;
            elif [ $ID_FS_TYPE == "ntfs" ]; then
                /pfrm2.0/bin/ntfs-3g $DEV_DIR/$1 /usb/$1;
            else
              mount $DEV_DIR/$1 /usb/$1;
            fi
                 mountPoint="/usb/$1";
                 devType="storage";
                 device="$DEV_DIR/$1";
             elif [ $DEVTYPE == "disk" ]; then
                if [ $SYSFS_VENDOR_ID == $DLINK_VENDOR_ID ] || [ $SYSFS_VENDOR_ID == $DLINK_ZTE_VENDOR_ID ] || [ $SYSFS_VENDOR_ID == $HUAWEI_VENDOR_ID ] || [ $SYSFS_VENDOR_ID == $DLINK_DWM157_VENDOR_ID ]; then
                    mount $DEV_DIR/$1 /usb/$1;
                    mountPoint="/usb/$1";
                    devType="3G";
                    device="$DEV_DIR/$1";
                else
                    if [ $DEVICE_PATH == "3-1" ]; then
                        if [ -e "$DISK_SIZE_USB1" ]; then
                            rm -rf "$DISK_SIZE_USB1";
                        fi
                        sizeUSB1=$(fdisk -l /dev/$1 | grep -i Disk | awk '{print$5}');
                        echo "$sizeUSB1" > $DISK_SIZE_USB1;
                    fi
                    if [ $DEVICE_PATH == "1-1" ]; then
                        if [ -e "$DISK_SIZE_USB2" ]; then
                            rm -rf "$DISK_SIZE_USB2";
                        fi
                        sizeUSB2=$(fdisk -l /dev/$1 | grep -i Disk | awk '{print$5}');
                        echo "$sizeUSB2" > $DISK_SIZE_USB2;
                    fi
                fi
             fi
        if [ $ID_VENDOR == "ConnMgr" ]; then
            devType="3G";
        fi
        endPoint=$(echo $ID_PATH | cut -d : -f2);
        if [ $mountPoint != "" ]; then
            if [ $DEVICE_PATH == "1-1" ]; then
                if [ $modeSwitch != "1" ]
                then
                     if [ -z $DEV_TYPE ]; then
                         DEV_TYPE=$devType;
                     fi
                     echo "$VENDORID:$MODELID:$DEV_TYPE:$mountPoint:$device" > $USB2_FILE;
                fi
                echo "1" > $USB2_PROC_FILE
                $LED_BIN usb1 on;
                ln -sf $mountPoint $USB2_LINK;
                if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                else
                    echo -2 > $USB2_STATUS;
                fi
             elif [ $DEVICE_PATH == "3-1" ]; then
                 if [ $modeSwitch != "1" ]
                 then
                     if [ -z $DEV_TYPE ]; then
                         DEV_TYPE=$devType;
                     fi
                     echo "$VENDORID:$MODELID:$DEV_TYPE:$mountPoint:$device" > $USB1_FILE;
                 fi
                 echo "1" > $USB1_PROC_FILE
                 $LED_BIN usb2 on;
                 ln -sf $mountPoint $USB1_LINK;
                 if [ $devType == "storage" ]; then 
                    echo 1 > $USB1_STATUS;
                    ls $USB1_LINK/ > $USB1_FILE_LIST;
                    backup_check $USB_NUM2;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB1;
                 else
                     echo -2 > $USB1_STATUS;
                 fi
              elif [ $endPoint == "1" ]; then
                  if [ $modeSwitch != "1" ]
                  then
                     if [ -z $DEV_TYPE ]; then
                         DEV_TYPE=$devType;
                     fi
                     echo "$VENDORID:$MODELID:$DEV_TYPE:$mountPoint:$device" > $USB2_FILE;
                  fi
                  echo "1" > $USB2_PROC_FILE
                  $LED_BIN usb1 on;
                  ln -sf $mountPoint $USB2_LINK;
                  if [ $devType == "storage" ]; then 
                    echo 1 > $USB2_STATUS;
                    ls $USB2_LINK/ > $USB2_FILE_LIST;
                    backup_check $USB_NUM1;
                    /pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer $USB2;
                  else
                      echo -2 > $USB2_STATUS;
                  fi
               fi
           fi
        fi
      fi
  fi
 
