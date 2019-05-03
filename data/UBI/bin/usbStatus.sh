#!/bin/sh

usbNum=$1
if [ $usbNum == "1" ]; then
    ls /usb1/ > /var/usb_filelist1.txt
fi
if [ $usbNum == "2" ]; then
    ls /usb2/ > /var/usb_filelist2.txt
fi
