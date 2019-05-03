#!/bin/sh
#
# usb_printerAdd - add USB printer script
#
# Copyright (c) 2010, TeamF1, Inc.
# Copyright (c) 2016, TeamF1 Networks Pvt. Ltd. 
# (Subsidiary of D-Link India)
#
# modification history
# --------------------
# 01a,25oct10,db   written.
# 01b,16mar16,skb  fixed SPR-55439.
#

USB1_FILE=/var/usb1Info
USB2_FILE=/var/usb2Info
CUPS_BIN=/pfrm2.0/bin/cupsd
LED_BIN=/pfrm2.0/bin/ledctrl
LPADMIN_BIN=/pfrm2.0/bin/lpadmin
IPTABLES_BIN=/pfrm2.0/bin/iptables
USB1_STATUS=/var/usb_status1.txt
USB2_STATUS=/var/usb_status2.txt
USB1_PROC_FILE=/proc/usb1_status
USB2_PROC_FILE=/proc/usb2_status
USB1=0
USB2=1

export LD_LIBRARY_PATH='.:/pfrm2.0/lib:/lib';
MODEL_ID=`/pfrm2.0/bin/printProductData /etc/mtdDevice ModelId |  awk '{print $1}'`
HW_VERSION=`/pfrm2.0/bin/printProductData /etc/mtdDevice HwVer |  awk '{print $1}'`
# It will be a nice catch to get the hardware family in here so that everyone
# will use it
HARDWARE_FAMILY_SERIES=`cat /tmp/hwFamilyVersion | awk '{print $1}'`
PRODUCT_ID=${MODEL_ID}_${HARDWARE_FAMILY_SERIES}

if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
    [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
    endPoint=$(echo $DEVPATH | cut -d / -f8);
    LED_BIN=/pfrm2.0/bin/ledCtrl
    USB2_GPIO_PIN=16
    USB1_GPIO_PIN=17
    GPIO_CLEAR=0
    GPIO_SET=1
elif [ $MODEL_ID == "DSR-1000N" ] || [ $MODEL_ID == "DSR-1000" ] || [ $MODEL_ID == "DWC-1000" ]; then
    endPoint=$(echo $PHYSDEVPATH | cut -d / -f7);
elif [ $MODEL_ID == "DSR-500N" ] || [ $MODEL_ID == "DSR-500" ] || [ $MODEL_ID == "DSR-250N" ] || [ $MODEL_ID == "DSR-250" ] || [ $MODEL_ID == "DSR-150N" ] || [ $MODEL_ID == "DSR-150" ]; then
    endPoint=$(echo $PHYSDEVPATH | cut -d / -f6);
fi

if [ $ACTION == "add" ]; then

if [ $MODEL_ID == "DSR-250N" ] || [ $MODEL_ID == "DSR-250" ]; then
    ln -s /var/dev/usb/$1 /dev/usb$1
    chmod 777 /var/dev/usb/$1
elif [ $MODEL_ID == "DSR-150N" ] || [ $MODEL_ID == "DSR-150" ]; then
    mkdir -p /dev/usb
    chmod 777 /var/dev/usb/$1
    ln -s /var/dev/usb/$1 /dev/usb/$1
else
    ln -s /dev/usb/$1 /dev/usb$1
fi
#printerName=$(echo $PRODUCT | sed 's/\ /_/g')
if [ -e /usr/lib/cups/backend/usb ]; then
/usr/lib/cups/backend/usb > /tmp/temp_printer
else
/pfrm2.0/lib/backend/usb > /tmp/temp_printer
fi
sed -i 's/[ ]/_/g' /tmp/temp_printer
printerName=`cat /tmp/temp_printer | cut -d "\"" -f2`


devType="Printer"
device="$DEV_DIR/usb/$1";

if [ $endPoint == "1-1.1" ]; then
   if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
    [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
      echo "1" > $USB2_PROC_FILE
      echo -2 > $USB2_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB2_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
      # turn LED ON
      $LED_BIN usb1 on;

   else
      echo "1" > $USB1_PROC_FILE
      echo -2 > $USB1_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB1_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
      # turn LED ON
      $LED_BIN usb1 on;
   fi
elif [ $endPoint == "1-1.2" ]; then
   if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
      [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
      echo "1" > $USB1_PROC_FILE
      echo -2 > $USB1_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB1_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
      # turn LED ON
      $LED_BIN usb2 on;
   else
      echo "1" > $USB2_PROC_FILE
      echo -2 > $USB2_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB2_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
     # turn LED ON
    $LED_BIN usb2 on;
   fi
elif [ $endPoint == "1-1" ]; then
   if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
      [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
      echo "1" > $USB2_PROC_FILE
      echo -2 > $USB2_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB2_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
      # turn LED ON
      $LED_BIN USB2_GPIO_PIN GPIO_CLEAR;
   else
      echo "1" > $USB1_PROC_FILE
      echo -2 > $USB1_STATUS;
      echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB1_FILE;
      /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
      # turn LED ON
      $LED_BIN usb1 on;
   fi
elif [ $endPoint == "3-1" ]; then
    echo "1" > $USB1_PROC_FILE
    echo -2 > $USB1_STATUS;
    echo "$MANUFACTURE:$printerName:$devType:$mountPoint:$device" > $USB1_FILE;
    /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
    # turn LED ON
    $LED_BIN USB1_GPIO_PIN GPIO_CLEAR;
fi
fi

if [ $ACTION == "remove" ]; then

    # USB1
    if [ $endPoint == "1-1.1" ]; then
       if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
          [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
          usbFile=$USB2_FILE;
          $LED_BIN usb1 off;
          rm -f $USB2_LINK;
          rm -f $USB2_STATUS;
          /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
          # signal kernel that device is removed
          echo "0" > $USB2_PROC_FILE
       else
          usbFile=$USB1_FILE;
          $LED_BIN usb1 off;
          rm -f $USB1_LINK;
          rm -f $USB1_STATUS;
          /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
          # signal kernel that device is removed
          echo "0" > $USB1_PROC_FILE
       fi
    # USB2
    elif [ $endPoint == "1-1.2" ]; then
       if [ $PRODUCT_ID == "DSR-1000AC_Ax" ] || [ $PRODUCT_ID == "DSR-500AC_Ax" ] ||
          [ $PRODUCT_ID == "DSR-1000_Bx" ] || [ $PRODUCT_ID == "DSR-500_Bx" ]; then
          usbFile=$USB1_FILE;
          $LED_BIN usb2 off;
          rm -f $USB1_LINK;
          rm -f $USB1_STATUS;
          /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
          # signal kernel that device is removed
          echo "0" > $USB1_PROC_FILE
       else
          usbFile=$USB2_FILE;
          $LED_BIN usb2 off;
          rm -f $USB2_LINK;
          rm -f $USB2_STATUS;
          /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
          # signal kernel that device is removed
          echo "0" > $USB2_PROC_FILE
       fi
    elif [ $endPoint == "1-1" ]; then
        usbFile=$USB2_FILE;
        $LED_BIN USB2_GPIO_PIN GPIO_SET;
        rm -f $USB2_LINK;
        rm -f $USB2_STATUS;
        /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB2;
        # signal kernel that device is removed
        echo "0" > $USB2_PROC_FILE
    elif [ $endPoint == "3-1" ]; then
        usbFile=$USB1_FILE;
        $LED_BIN USB1_GPIO_PIN GPIO_SET;
        rm -f $USB1_LINK;
        rm -f $USB1_STATUS;
        /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
        # signal kernel that device is removed
        echo "0" > $USB1_PROC_FILE
    fi
    
    # USB1
    if [ $MODEL_ID == "DSR-500N" ] || [ $MODEL_ID == "DSR-500" ] || [ $MODEL_ID == "DSR-250N" ] || [ $MODEL_ID == "DSR-250" ] || [ $MODEL_ID == "DSR-150N" ] || [ $MODEL_ID == "DSR-150" ]; then
        usbFile=$USB1_FILE;
        $LED_BIN usb1 off;
        rm -f $USB1_LINK;
        rm -f $USB1_STATUS;
        /pfrm2.0/bin/usbTblUpdate /tmp/system.db PrintServer $USB1;
        # signal kernel that device is removed
        echo "0" > $USB1_PROC_FILE
    fi

    if [ ! -e $usbFile ]; then
        exit 0;
    fi
    rm -f $usbFile;
fi
