#!/bin/sh

#Copyright (c) 2017, TeamF1 Networks Pvt. Ltd.
#(Subsidiary of D-Link India)


#Modification history
#--------------------
#01a,09mar16,ss   written.


#Description
#-----------
#This script is used to generate easy-rsa certs, keys and stores them into 
#openvpneasyrsacert table.

#File paths.
SQLITE_INSTALL_PATH="/pfrm2.0"
DB_FILENAME="/tmp/system.db"

#Error messages.
SUCCESS=0
INSUFFICIENT_PARAMETERS=2

#Arguments passed to this file.
#$1:country name.
#$2:state name.
#$3:city name.
#$4:company name.
#$5:ou name.
#$6:cn name.
#$7:server name.
#$8:client name.
#$9:subject name.

if [ "$#" -ne 10 ];then
    exit $INSUFFICIENT_PARAMETERS
fi

#Certificates and keys generation starts here.
cd /var/openvpn/easy-rsa/
mkdir -p tempkeys
rm -rf tempkeys/*
touch tempkeys/index.txt
echo 01 > tempkeys/serial
cp /pfrm2.0/bin/easy-rsa/keys/dh1024.pem tempkeys/
. ./ovpnVars "$1" "$2" "$3" "$4" "$5" "$6" "$10"
sh build-ca
export KEY_CN=$7
sh build-key-server $7
export KEY_CN=$8
sh build-key $8
export KEY_CN="default"
sh build-key "default"

#Copy the required contents into variables.
cacertData=`cat tempkeys/ca.crt`
cakeyData=`cat tempkeys/ca.key`
servercertData=`cat tempkeys/$7.crt`
serverkeyData=`cat tempkeys/$7.key`
clientcertData=`cat tempkeys/$8.crt`
clientkeyData=`cat tempkeys/$8.key`
dhkeyData=`cat tempkeys/dh1024.pem`
defaultCrt=`cat tempkeys/default.crt`
defaultKey=`cat tempkeys/default.key`

#Removing the certificates generated.

#Perform query for inserting into the table fields.
table="OpenVpnEasyrsaCert"
query="INSERT INTO $table (ServerName,ClientName,SubjectName,CertCreatedStatus,CertDefaultStatus,CaCertData,CaKeyData,ServerCertData,ServerKeyData,ClientCertData,ClientKeyData,DhKeyData,defaultCrtData,defaultKeyData) VALUES ('$7','$8','$9','1','0','$cacertData','$cakeyData','$servercertData','$serverkeyData','$clientcertData','$clientkeyData','$dhkeyData','$defaultCrt','$defaultKey')"

# Executing SQL query
$SQLITE_INSTALL_PATH/bin/sqlite3 $DB_FILENAME << SQL_ENTR_TAG_1;
.timeout 1000;
BEGIN;
$query;
COMMIT;
SQL_ENTR_TAG_1

exit $SUCCESS
