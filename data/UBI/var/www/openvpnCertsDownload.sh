#!/bin/sh

#Copyright (c) 2016, TeamF1 Networks Pvt. Ltd.
#(Subsidiary of D-Link India)


#Modification history
#--------------------
#01a,10mar16,ss   written.


#Description
#-----------
#This script used to copy the openvpneasyrsacert table related contents (like
# ca.crt,ca.key etc) into a folder and tar's it for user.

if [ "$#" -ne 1 ];then
    exit 1
fi

DB_FILENAME="/tmp/system.db"
/bin/rm -rf /tmp/openVpnCerts/*
/bin/rm -rf /tmp/openVpnCerts.tar

OPENVPN_CERTS_DIR="/tmp/openVpnCerts"

/bin/mkdir -p $OPENVPN_CERTS_DIR
cd /tmp/

#Initialize retry count to 1.
retries=1

while [ $retries -lt 5 ];
do
results=`/pfrm2.0/bin/sqlite3 $DB_FILENAME  "select CaCertData,CaKeyData,ServerCertData,ServerKeyData,ClientCertData,ClientKeyData,DhKeyData from OpenVpnEasyrsaCert where rowid=$1"` 

#check if last bash operation succeded, if not retry
       if [ $? == 0 ]; then
           break
       else
           #echo "DB lock retrying again"
           retries=`expr $retries + 1`
           sleep 1
       fi
done ### while database update is successful

OLD_IFS=$IFS    # save internal field separator
IFS="|"         # set it to '|'
set -- $results       # make the result positional parameters
echo "$1" > $OPENVPN_CERTS_DIR/ca.crt
echo "$2" > $OPENVPN_CERTS_DIR/ca.key
echo "$3" > $OPENVPN_CERTS_DIR/server.crt
echo "$4" > $OPENVPN_CERTS_DIR/server.key
echo "$5" > $OPENVPN_CERTS_DIR/client.crt
echo "$6" > $OPENVPN_CERTS_DIR/client.key
echo "$7" > $OPENVPN_CERTS_DIR/dh.pem
IFS=$OLD_IFS

/bin/tar -cvf openVpnCerts.tar openVpnCerts/ > /dev/null 2>&1 
