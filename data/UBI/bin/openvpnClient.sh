#!/bin/sh
# @copyright (c) 2015, TeamF1 Networks Pvt. Ltd.
# (Subsidiary of D-Link India)
# 
# Modification history
# --------------------
# 01a,16nov15,ss   ported OmniSSL changes to M8.
#
cd /var/openvpn/easy-rsa/
. ./vars
sh build-key $1
cp keys/$1.key /var/certs/openvpn/
cp keys/$1.crt /var/certs/openvpn/
cp keys/$1.csr /var/certs/openvpn/
rm -rf keys/*.pem
exit 0;

