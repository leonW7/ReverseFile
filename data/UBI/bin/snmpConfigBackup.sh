#!bin/sh
# args 1 - file name;2 - username;3 - password; 4 - server ip; 5 - protocol; 6 -
# device name;7 : backup or restore;8 encryption enable/disable
#we want to exit the script if any statements return with error
set -e
FILENAME=$1
USERNAME=$2
PASSWORD=$3
SERVERIP=$4
PROTOCOL=$5
DEVICENAME=$6
CONFIG_ACTION=$7
ENCRYPTION=$8

TFTP_PROTOCOL="1"
FTP_PROTOCOL="2"
BACKUP_ACTION="1"
RESTORE_ACTION="2"
SETTINGS_FILE="/tmp/teamf1.cfg.ascii"
RESTORE_FILE="/tmp/DSR.cfg"
CONFFILE="/pfrm2.0/pkgMgmt/packageKey"
ENCRYPTENABLE=""
OUTFILE="out.cfg"

if [ $CONFIG_ACTION == $BACKUP_ACTION ] && [ $ENCRYPTION == "1" ]; then
    while read line 
    do
    KEY=$line
    IV=$line
    echo $KEY,$IV 
    done <$CONFFILE
    VALUE=`/pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in $SETTINGS_FILE -out $SETTINGS_FILE.enc -K  $KEY -iv $IV -nosalt`
    temp="-p"

    if [ $PROTOCOL == $TFTP_PROTOCOL ]; then
    echo "tftp $temp -r $FILENAME.cfg.enc -l $SETTINGS_FILE.enc $SERVERIP" > /flash/tmp/snmpFirmwareParams
   tftp $temp -r $FILENAME.cfg.enc -l $SETTINGS_FILE.enc $SERVERIP > /flash/tmp/snmpConfigStatus 2>&1
    /bin/rm $SETTINGS_FILE.enc
    elif [ $PROTOCOL == $FTP_PROTOCOL ]; then
    echo "ftpput -u $USERNAME -p $PASSWORD $SERVERIP  $FILENAME.cfg.enc $SETTINGS_FILE.enc" > /flash/tmp/snmpFirmwareParams
    STATUS="$(ftpput -u $USERNAME -p $PASSWORD $SERVERIP $FILENAME.cfg.enc $SETTINGS_FILE.enc)"  > /flash/tmp/snmpConfigStatus 2>&1
      if [ -z "$STATUS" ]; then
       echo "Config File Backup through ftp is SuccessFul." > /flash/tmp/snmpConfigStatus 
      fi
    fi
elif [ $CONFIG_ACTION == $BACKUP_ACTION ] && [ $ENCRYPTION == "0" ]; then
     temp="-p"
     if [ $PROTOCOL == $TFTP_PROTOCOL ]; then
     echo "tftp $temp -r $FILENAME  -l $SETTINGS_FILE $SERVERIP" > /flash/tmp/snmpFirmwareParams
     tftp $temp -r $FILENAME -l $SETTINGS_FILE $SERVERIP > /flash/tmp/snmpConfigStatus 2>&1
     elif [ $PROTOCOL == $FTP_PROTOCOL ]; then
     echo "ftpput -u $USERNAME -p $PASSWORD $SERVERIP $FILENAME $SETTINGS_FILE" > /flash/tmp/snmpFirmwareParams
   STATUS="$(ftpput -u $USERNAME -p $PASSWORD $SERVERIP $FILENAME $SETTINGS_FILE)" > /flash/tmp/snmpConfigStatus 2>&1        
       if [ -z "$STATUS" ]; then
        echo "Config File Backup through ftp is SuccessFul." > /flash/tmp/snmpConfigStatus 
       fi 
     fi

elif [ $CONFIG_ACTION == $RESTORE_ACTION ]; then
    echo "it is restore" > /flash/tmp/snmpFirmwareParams
    temp="-g"

    if echo "$FILENAME" | grep -q "enc"; then
   ENCRYPTENABLE="1"
    else
    ENCRYPTENABLE="0"
    fi
    echo $ENCRYPTENABLE
    ORIGINALFILE=$FILENAME
    echo $ORIGINALFILE
    if [ $ENCRYPTENABLE == 1 ]; then
      if [ $PROTOCOL == $FTP_PROTOCOL ]; then
         echo "ftpget -u $USERNAME -p $PASSWORD $SERVERIP /tmp/DSR.cfg.enc  $FILENAME" > /flash/tmp/snmpFirmwareParams
         ftpget -u $USERNAME -p $PASSWORD $SERVERIP /tmp/DSR.cfg.enc  $FILENAME  > /flash/tmp/snmpConfigStatus 2>&1
      fi
      if [ $PROTOCOL == $TFTP_PROTOCOL ]; then
         echo tftp -g -r $FILENAME -l /tmp/DSR.cfg.enc $SERVERIP > /flash/tmp/snmpFirmwareParams
         tftp -g -r $FILENAME -l /tmp/DSR.cfg.enc $SERVERIP > /flash/tmp/snmpConfigStatus 2>&1
      fi
    elif [ $ENCRYPTENABLE == 0 ]; then
           touch $RESTORE_FILE
           chmod 777 $RESTORE_FILE
      if [ $PROTOCOL == $FTP_PROTOCOL ]; then
        echo "ftpget -u $USERNAME -p $PASSWORD $SERVERIP $RESTORE_FILE  $FILENAME" > /flash/tmp/snmpFirmwareParams
       STATUS="$(ftpget -u $USERNAME -p $PASSWORD $SERVERIP $RESTORE_FILE  $FILENAME)"  > /flash/tmp/snmpConfigStatus 2>&1
         if [ -z "$STATUS" ]; then
           echo "Config File Restore through ftp is Successful on $(date)." > /flash/tmp/snmpConfigStatus 
         fi
      fi
      if [ $PROTOCOL == $TFTP_PROTOCOL ]; then
        echo tftp -g -r $FILENAME -l $RESTORE_FILE $SERVERIP > /flash/tmp/snmpFirmwareParams
        STATUS="$(tftp -g -r $FILENAME -l $RESTORE_FILE $SERVERIP)" > /flash/tmp/snmpConfigStatus 2>&1  
        if [ -z "$STATUS" ]; then
           echo "Config File Restore through tftp is Successful on $(date)." > /flash/tmp/snmpConfigStatus
           touch /tmp/restoreProgress.txt
         fi
      fi
    fi
    if [ $ENCRYPTENABLE == "1" ]; then
        while read line 
    do
    KEY=$line
    IV=$line
    echo $KEY,$IV 
    done <$CONFFILE
    VALUE=`/pfrm2.0/bin/usrKlite openssl enc -d -aes-128-cbc -in /tmp/DSR.cfg.enc -out /tmp/$OUTFILE -K $KEY  -iv $IV -nosalt` > /flash/tmp/snmpConfigStatus 2>&1
    FILENAME=$OUTFILE
    echo $FILENAME
   fi
   SYSTEMNAME=`cat /tmp/$FILENAME | grep -i 'firmwareFile' | cut -d'"' -f4 | cut -d'_' -f1`
   if [ $SYSTEMNAME != $DEVICENAME ]; then
      /bin/rm -rf /tmp/$FILENAME 
      /bin/rm -rf /tmp/$ORIGINALFILE
      echo "Invalid File"  > /flash/tmp/snmpFirmwareParams
      
    fi
	
fi

 

