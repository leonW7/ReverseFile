#!/bin/sh
export LD_LIBRARY_PATH='.:/pfrm2.0/lib:/lib';
FLASH_PARTITION=$1
CONFIG_FILE=$2
#cp -f $CONFIG_FILE $FLASH_PARTITION
cd /tmp/
#tar -czf teamf1.cfg.ascii.tar.bz2 teamf1.cfg.ascii
#cp -rf teamf1.cfg.ascii.tar.bz2 /data/tmp/teamf1.cfg.ascii.tar.bz2

if [ -e "/data/tmp/teamf1.cfg.ascii.tar.bz2" ]; then
    rm -rf /data/tmp/teamf1.cfg.ascii.tar.bz2
fi
cp -f teamf1.cfg.ascii /data/tmp/
sync
MODEL_ID=`/pfrm2.0/bin/printProductData /dev/mtd0 ModelId |  awk '{print $1}'`
SERIAL_NUMBER=`/pfrm2.0/bin/printProductData /dev/mtd0 SerNo  | awk '{print $1}'`
VAR_CONF_DIR=/var/backpConfigFiles/
VAR_CONF_FILE=/var/backpConfigFiles/teamf1.cfg.ascii
VAR_CONF_FILE_ENC=/var/backpConfigFiles/teamf1.cfg.ascii.enc
CONFIG_OUTPUTFILE=/tmp/CONFIG_OUTPUTFILE
mkdir -p $VAR_CONF_DIR
/pfrm2.0/bin/sqlite3 /tmp/system.db << SQL_ENTR_TAG_1;
.timeout 1000;
.output $CONFIG_OUTPUTFILE
;BEGIN;
select EnableAutoBackup,EncryptEnable from ConfigSupport;
COMMIT;
SQL_ENTR_TAG_1
AUTO_BACKUP_SUPPORT=`cut -d"|" -f1 $CONFIG_OUTPUTFILE`;
ENCYRPT_SUPPORT=`cut -d"|" -f2 $CONFIG_OUTPUTFILE`;
ASCII_FILE=$VAR_CONF_FILE
cp teamf1.cfg.ascii $VAR_CONF_DIR 
if [ $ENCYRPT_SUPPORT == "1" ]; then
    PACKAGEFILE="/pfrm2.0/pkgMgmt/packageKey"
    key128=`cat $PACKAGEFILE | head -n 1`
    iv=`cat $PACKAGEFILE | head -n 2 | tail -n 1`
    /pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in $VAR_CONF_FILE -out $VAR_CONF_FILE_ENC -K $key128 -iv $iv -nosalt
    ASCII_FILE=$VAR_CONF_FILE_ENC
fi

if [ $AUTO_BACKUP_SUPPORT  == "1" ]; then
    if [ -e /usb1/ ]; then
        /bin/rm -rf /usb1/$MODEL_ID"_"$SERIAL_NUMBER.cfg;
        /bin/rm -rf /usb1/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc;
        if [ $ENCYRPT_SUPPORT == "1" ]; then
            cp -f $ASCII_FILE /usb1/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc
        else
            cp -f $ASCII_FILE /usb1/$MODEL_ID"_"$SERIAL_NUMBER.cfg
        fi
    fi

    if [ -e /usb2/ ]; then
        /bin/rm -rf /usb2/$MODEL_ID"_"$SERIAL_NUMBER.cfg;
        /bin/rm -rf /usb2/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc;
        if [ $ENCYRPT_SUPPORT == "1" ]; then
            cp -f $ASCII_FILE /usb2/$MODEL_ID"_"$SERIAL_NUMBER.cfg.enc
        else
            cp -f $ASCII_FILE /usb2/$MODEL_ID"_"$SERIAL_NUMBER.cfg
        fi
    fi
fi

# delete temporary ascii file
/bin/rm -rf $VAR_CONF_DIR*;

cd - 2>&1 > /dev/null

# echo "Configurations Saved Successfully"
