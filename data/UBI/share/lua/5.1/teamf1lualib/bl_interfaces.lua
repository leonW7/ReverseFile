local L0_0
L0_0 = module
L0_0("com.teamf1.bl.traffic.statistics", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/statistics_traffic")
L0_0 = require
L0_0("teamf1lualib/statistics_activeInfo")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.statistics.traffic")
;({}).key = "_ROWID_"
;({}).keyValue = "1"
;({}).interface = "interfaceName"
;({}).transmittedPackets = "tx_packets"
;({}).receivedPackets = "rx_packets"
;({}).transmittedPacketsDropped = "tx_dropped"
;({}).receivedPacketsDropped = "rx_dropped"
function lanInfoGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L7_8 = _UPVALUE0_
  L7_8 = L7_8.NIL
  if A0_1 == L7_8 then
    L7_8 = _UPVALUE0_
    L7_8 = L7_8.INVALID_ARGUMENT
    return L7_8
  end
  if A0_1 ~= "LAN" and A0_1 ~= "WAN1" and A0_1 ~= "WAN2" and A0_1 ~= "WAN3" then
    L7_8 = _UPVALUE0_
    L7_8 = L7_8.INVALID_ARGUMENT
    return L7_8
  end
  L7_8 = _UPVALUE1_
  L7_8 = L7_8.trafficCountersGet
  L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8 = A0_1, nil, nil, nil, nil, nil, L7_8(A0_1)
  returnCode = L7_8
  L7_8 = {}
  L7_8.interface = L2_3
  L7_8.txPackets = L3_4
  L7_8.rxPackets = L4_5
  L7_8.txPacketsDrop = L5_6
  L7_8.rxPacketsDrop = L6_7
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_2, L7_8
end
function vlanStatisticsGet(A0_9)
  local L1_10, L2_11
  L2_11 = {}
  if A0_9 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_9 ~= "vlan" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  returnCode, L1_10, L2_11 = _UPVALUE1_.trafficCountersGet(A0_9)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_10, L2_11
end
function vlanStatisticsGetNext(A0_12, A1_13)
  local L2_14, L3_15
  L3_15 = {}
  if A1_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  returnCode, A0_12, L3_15 = _UPVALUE1_.trafficCountersGetNext(A0_12, A1_13)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, A0_12, L3_15
end
function wlanStatisticsGet()
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26
  L10_26 = "wlan"
  returnCode, L0_16, L10_26, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L9_25, L8_24 = _UPVALUE0_.trafficCountersGet(L10_26)
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_16, L10_26, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L9_25, L8_24
end
function activeInfoGet()
  local L0_27, L1_28, L2_29, L3_30, L4_31
  returnCode, L0_27, L1_28, L2_29, L3_30, L4_31 = _UPVALUE0_.miscDataGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_27, L1_28, L2_29, L3_30, L4_31
end
