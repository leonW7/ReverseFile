#!/bin/sh
# @copyright (c) 2017, TeamF1 Networks Pvt. Ltd.
# (Subsidiary of D-Link India)
#
# Modification history
# --------------------
# 01b,19dec16,sbr  fixed spr#58681
# 01a,16nov15,ss   ported OmniSSL changes to M8.
#
cd /var/openvpn/easy-rsa/
. ./vars
sh revoke-full $1
cd /root/
