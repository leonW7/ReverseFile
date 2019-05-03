local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.vaps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlanassociatedclients_web")
L0_0 = require
L0_0("teamf1lualib/wlanassociatedclientdetails_web")
L0_0 = require
L0_0("teamf1lualib/distributedtunnelstatus_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
Localswitch = 1
peerswitch = 0
;({}).routerType = 1
;({}).clientMacAddr = 2
;({}).clientIpAddr = 3
;({}).ssid = 4
;({}).bssid = 5
;({}).apMacAddr = 6
;({}).wlanclientdetailsSSID = 1
;({}).wlanclientdetailsBSSID = 2
;({}).wlanclientdetailsAPMACADDRESS = 3
;({}).wlanclientdetailsSTATUS = 4
;({}).wlanclientdetailsCHANNEL = 5
;({}).wlanclientdetailsUSERNAME = 6
;({}).wlanclientdetailsINACTIVEPERIOD = 7
;({}).wlanclientdetailsAGE = 8
;({}).wlanclientdetailsDOT11CAPABLE = 9
;({}).wlanclientdetailsNETBIOSNAME = 10
;({}).wlanclientdetailsASSOCIATINGCONTROLLER = 11
;({}).wlanclientdetailsCONTROLLERMACADDRESS = 12
;({}).wlanclientdetailsCONTROLLERIPADDRESS = 13
;({}).wlanclientdetailsLOCATION = 14
;({}).wlanclientdetailsRADIO = 15
;({}).wlanclientdetailsVLAN = 16
;({}).wlanclientdetailsTXDATARATE = 17
;({}).wlanclientdetailsDETECTEDIPADDRESS = 18
;({}).wlanclientdetailsNETWORKTIME = 19
;({}).status = 1
;({}).homeAPMAC = 2
;({}).clientRoamStatus = 3
;({}).associatedAPMAC = 4
PEER_SWITCH = "Peerswitch"
LOCAL_SWITCH = "Localswitch"
YES = "Yes"
NO = "No"
function wlanAssociatedClientsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L1_2, L0_1 = _UPVALUE0_.wlanassociatedclientsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function wlanAssociatedClientsDissociate(A0_5)
  local L1_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for vaps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_6 = _UPVALUE1_.wlanassociatedclientsDisassociate(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in vaps page" .. L1_6)
  end
  return L1_6
end
function wlanAssociatedClientsDissociateAll()
  local L0_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for vaps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.wlanassociatedclientsDisassociateAll()
  if L0_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in vaps page" .. L0_7)
  end
  return L0_7
end
function wlanAssociatedClientsDetails(A0_8)
  local L1_9, L2_10, L3_11
  L3_11 = {}
  L1_9, L2_10 = _UPVALUE0_.wlanassociatedclientdetailsGet(A0_8)
  if L1_9 ~= _UPVALUE1_.SUCCESS then
    return L1_9
  end
  if L2_10[_UPVALUE2_.wlanclientdetailsASSOCIATINGCONTROLLER] == 0 then
    L2_10[_UPVALUE2_.wlanclientdetailsASSOCIATINGCONTROLLER] = PEER_SWITCH
  elseif L2_10[_UPVALUE2_.wlanclientdetailsASSOCIATINGCONTROLLER] == 1 then
    L2_10[_UPVALUE2_.wlanclientdetailsASSOCIATINGCONTROLLER] = LOCAL_SWITCH
  end
  if L2_10[_UPVALUE2_.wlanclientdetailsDOT11CAPABLE] == 0 then
    L2_10[_UPVALUE2_.wlanclientdetailsDOT11CAPABLE] = NO
  elseif L2_10[_UPVALUE2_.wlanclientdetailsDOT11CAPABLE] == 1 then
    L2_10[_UPVALUE2_.wlanclientdetailsDOT11CAPABLE] = YES
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE2_) do
    L3_11[_FORV_7_] = L2_10[_FORV_8_]
  end
  return L1_9, L3_11
end
function wlanAssocClientsDistributedTunnelingDetails(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L3_15 = {}
  L4_16 = 1
  L1_13, L2_14 = _UPVALUE0_.distributedtunnelstatusGet(A0_12)
  if L1_13 ~= _UPVALUE1_.SUCCESS then
    return L1_13
  end
  for _FORV_8_, _FORV_9_ in pairs(_UPVALUE2_) do
    L3_15[_FORV_8_] = L2_14[_FORV_9_]
  end
  return L1_13, L3_15
end
