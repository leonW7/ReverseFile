#!/bin/bash

#ruleSet for Router
EBTABLES=/pfrm2.0/bin/ebtables

#flush all rules first
$EBTABLES -t filter -F
$EBTABLES -t nat -F
$EBTABLES -t broute -F

#Bridge table: nat
$EBTABLES -t nat -N fwAccntIn
$EBTABLES -t nat -N fwAccntOut
$EBTABLES -t nat -N fwLANAccntIn
$EBTABLES -t nat -N fwWWANAccntIn
$EBTABLES -t nat -N fwLANAccntOut
$EBTABLES -t nat -N fwWWANAccntOut
$EBTABLES -t nat -N fwWanEmail
$EBTABLES -t nat -N fwAccRateLAN
$EBTABLES -t nat -N fwAccRateWWAN
$EBTABLES -t nat -N fwPreAccRateLAN
$EBTABLES -t nat -N fwPreAccRateWWAN

$EBTABLES -t nat -P fwAccntIn RETURN
$EBTABLES -t nat -P fwAccntOut RETURN
$EBTABLES -t nat -P fwLANAccntIn RETURN
$EBTABLES -t nat -P fwWWANAccntIn RETURN
$EBTABLES -t nat -P fwLANAccntOut RETURN
$EBTABLES -t nat -P fwWWANAccntOut RETURN
$EBTABLES -t nat -P fwWanEmail RETURN
$EBTABLES -t nat -P fwAccRateLAN RETURN
$EBTABLES -t nat -P fwAccRateWWAN RETURN
$EBTABLES -t nat -P fwPreAccRateLAN RETURN
$EBTABLES -t nat -P fwPreAccRateWWAN RETURN

#Bridge table: filter

#create new chains

#for logging

$EBTABLES -N fwInputLnA
$EBTABLES -N fwdAccept
$EBTABLES -N fwWanIbLog
$EBTABLES -N INSECURE_SECURE_LnA
$EBTABLES -N INSECURE_SECURE_LnD
$EBTABLES -N SECURE_INSECURE_LnD
$EBTABLES -N SECURE_INSECURE_LnA
$EBTABLES -N SECURE_PUBLIC_LnA
$EBTABLES -N SECURE_PUBLIC_LnD
$EBTABLES -N INSECURE_PUBLIC_LnA
$EBTABLES -N INSECURE_PUBLIC_LnD
$EBTABLES -N PUBLIC_SECURE_LnA
$EBTABLES -N PUBLIC_SECURE_LnD
$EBTABLES -N PUBLIC_INSECURE_LnA
$EBTABLES -N PUBLIC_INSECURE_LnD
$EBTABLES -N fwFwdAccept
$EBTABLES -N fwFwdDrop


#custom INPUT chains

$EBTABLES -N LanToBox
$EBTABLES -N WanToBox

#custom FORWARD chains

$EBTABLES -N Inbound
$EBTABLES -N Outbound
$EBTABLES -N fwForwardInbound
$EBTABLES -N DefaultInboundPolicy
$EBTABLES -N fwForwardOutbound
$EBTABLES -N DefaultOutboundPolicy
$EBTABLES -N qosForwardOutClassify
$EBTABLES -N qosForwardOutClassifyLogs
$EBTABLES -N qosForwardInClassify
$EBTABLES -N qosForwardInClassifyLogs
$EBTABLES -N fwL2UrlFilter
$EBTABLES -N pktRelay

#set default policy of all custom defined chains to RETURN
$EBTABLES -P LanToBox RETURN
$EBTABLES -P WanToBox RETURN
$EBTABLES -P Inbound RETURN
$EBTABLES -P Outbound RETURN
$EBTABLES -P fwForwardInbound RETURN
$EBTABLES -P DefaultInboundPolicy RETURN
$EBTABLES -P fwForwardOutbound RETURN
$EBTABLES -P DefaultOutboundPolicy RETURN
$EBTABLES -P qosForwardOutClassify RETURN
$EBTABLES -P qosForwardOutClassifyLogs RETURN
$EBTABLES -P qosForwardInClassify RETURN
$EBTABLES -P qosForwardInClassifyLogs RETURN
$EBTABLES -P fwL2UrlFilter RETURN
$EBTABLES -P pktRelay RETURN
$EBTABLES -P INSECURE_SECURE_LnD DROP
$EBTABLES -P SECURE_INSECURE_LnD DROP
$EBTABLES -P SECURE_PUBLIC_LnD DROP
$EBTABLES -P INSECURE_PUBLIC_LnD DROP
$EBTABLES -P PUBLIC_SECURE_LnD DROP
$EBTABLES -P PUBLIC_INSECURE_LnD DROP

#Bridge chain: INPUT, entries: 3, policy: ACCEPT
$EBTABLES -P INPUT ACCEPT
$EBTABLES -I INPUT -p IPv4 --ip-proto 17 --ip-dport 67:68 -j ACCEPT
$EBTABLES -I INPUT -p ARP -j ACCEPT 
$EBTABLES -A INPUT --src-group 0x1/0x1 -j LanToBox
$EBTABLES -A INPUT --src-group 0x2/0x2 -j WanToBox
#$EBTABLES -A INPUT --src-group 0x2/0x2 -p IPv4 --ip-proto 6 --ip-dport 443 -j DROP

#Bridge chain: FORWARD, entries: 3, policy: DROP
$EBTABLES -P FORWARD DROP
$EBTABLES -I FORWARD --src-group 0x2/0x2 -j pktRelay
$EBTABLES -A FORWARD --dst-group 0x2/0x2 --src-group 0x1/0x1 -j qosForwardOutClassify
$EBTABLES -A FORWARD --dst-group 0x2/0x2 --src-group 0x1/0x1 -j qosForwardOutClassifyLogs
$EBTABLES -A FORWARD --dst-group 0x1/0x1 --src-group 0x2/0x2 -j qosForwardInClassify
$EBTABLES -A FORWARD --dst-group 0x1/0x1 --src-group 0x2/0x2 -j qosForwardInClassifyLogs
$EBTABLES -A FORWARD -p ARP -j ACCEPT
$EBTABLES -A FORWARD --src-group 0x2/0x2 -j Inbound
$EBTABLES -A FORWARD --src-group 0x1/0x1 -j Outbound

#Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

#Bridge chain: LanToBox, entries: 6, policy: RETURN
$EBTABLES -A LanToBox -p IPv4 --ip-proto 1 --ip-icmptype 8 -j ACCEPT
$EBTABLES -A LanToBox -p IPv4 --ip-proto 6 --ip-dport 80 -j ACCEPT 
$EBTABLES -A LanToBox -p IPv4 --ip-proto 6 --ip-dport 443 -j ACCEPT 
$EBTABLES -A LanToBox -p IPv4 --ip-proto 17 --ip-dport 69 -j ACCEPT 
$EBTABLES -A LanToBox -p IPv4 --ip-proto 17 --ip-dport 161 -j ACCEPT 
$EBTABLES -A LanToBox -p IPv4 --ip-proto 6 --ip-dport 22 -j ACCEPT 
$EBTABLES -A LanToBox -p IPv4 --ip-proto 6 --ip-dport 23 -j ACCEPT 

#Bridge chain: WanToBox, entries: 0, policy: RETURN

#Bridge chain: Inbound, entries: 2, policy: RETURN
$EBTABLES -A Inbound  --dst-group 0x1/0x1 -j fwForwardInbound
$EBTABLES -A Inbound --dst-group 0x1/0x1 -j DefaultInboundPolicy

#Bridge chain: Outbound, entries: 2, policy: RETURN
$EBTABLES -A Outbound --dst-group 0x2/0x2 -j fwForwardOutbound
$EBTABLES -A Outbound --dst-group 0x2/0x2 -j DefaultOutboundPolicy

#Bridge chain: DefaultInboundPolicy, entries: 0, policy: RETURN

#Bridge chain: DefaultOutboundPolicy, entries: 0, policy: RETURN

#Bridge chain: fwForwardOutbound, entries: 0, policy: RETURN

#Bridge chain: fwForwardInbound, entries: 0, policy: RETURN

#Bridge chain: fwFwdAccept, entries: 0, policy: RETURN
$EBTABLES -A fwFwdAccept -j ACCEPT

#Bridge chain: fwFwdDrop, entries: 0, policy: RETURN
$EBTABLES -A fwFwdDrop -j DROP
