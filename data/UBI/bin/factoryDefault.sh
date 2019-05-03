#!/bin/sh

#light up all leds
#Assign GPIO pin numbers
wifi0=12
wifi1=13
orangeLed=14
powerLed=15
usb1=16
usb2=17

/pfrm2.0/bin/ledCtrl $wifi0 0
/pfrm2.0/bin/ledCtrl $wifi1 0
/pfrm2.0/bin/ledCtrl $orangeLed 0
/pfrm2.0/bin/ledCtrl $powerLed 0
/pfrm2.0/bin/ledCtrl $usb1 0
/pfrm2.0/bin/ledCtrl $usb2 0

date 010100002000
hwclock --systohc

#remove the flash config file
/bin/rm -rf /data/tmp/teamf1.cfg.ascii
/bin/rm -rf /data/tmp/teamf1.cfg.ascii.tar.bz2

#remove the backup configuration files
/bin/rm -rf /data/backup

#remove the stored Images from flash
/bin/rm -rf /flash/tmp/capPort/
/bin/rm -rf /flash/easy-rsa/

#remove the stored certificates from flash
/bin/rm -rf /flash/tmp/https.crt
/bin/rm -rf /flash/tmp/https.key

#remove ssh-host-rsa key file
/bin/rm -rf /flash/tmp/ssh_host_rsa_key

#removing explicit logging database
/bin/rm -rf /data/tmp/logging.db

#Pass a flag to factoryReset the device
#/bin/touch /data/tmp/factoryResetNeeded.txt
