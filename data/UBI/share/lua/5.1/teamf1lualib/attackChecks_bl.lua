local L0_0
L0_0 = module
L0_0("com.teamf1.bl.firewall.attackChecks", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwAttackChecks")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function attackChecksSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = fw.core.attackChecks.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L9_10, L10_11, L11_12, L12_13 = fw.core.icsaSettings.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  L0_1, L1_2, L13_14, L14_15, L15_16 = fw.core.fwDosAttackSettings.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L9_10, L10_11, L11_12, L7_8, L13_14, L14_15, L15_16, L8_9
end
function attackChecksSectionSet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27, L11_28, L12_29, L13_30, L14_31, L15_32, L16_33, L17_34
  L1_18 = ACCESS_LEVEL
  if L1_18 ~= 0 then
    L1_18 = util
    L1_18 = L1_18.appendDebugOut
    L2_19 = "Detected Unauthorized access for attackChecks PAGE"
    L1_18(L2_19)
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.UNAUTHORIZED
    return L1_18
  end
  L1_18 = A0_17["attackChecks.cookie"]
  L2_19 = A0_17["attackChecks.stealthModeStatus"]
  L3_20 = A0_17["attackChecks.blockTcpFloodStatus"]
  L4_21 = A0_17["attackChecks.blockUdpFloodStatus"]
  L5_22 = A0_17["attackChecks.udpConnectionLimitValue"]
  L6_23 = A0_17["attackChecks.pingOnLanStatus"]
  L7_24 = A0_17["attackChecks.blockSpoofPktStatus"]
  L8_25 = A0_17["attackChecks.tcpFilterStatus"]
  L9_26 = A0_17["attackChecks.blockICMPNotification"]
  L10_27 = A0_17["attackChecks.blockFragPkts"]
  L11_28 = A0_17["attackChecks.blockMulticastPkts"]
  L12_29 = "0"
  L13_30 = A0_17["attackChecks.synFloodDetectRate"]
  L14_31 = A0_17["attackChecks.echoStormFloodRate"]
  L15_32 = A0_17["attackChecks.icmpFloodRate"]
  if L1_18 == nil then
    L16_33 = util
    L16_33 = L16_33.appendDebugOut
    L17_34 = "Set : Invalid Cookie"
    L16_33(L17_34)
    L16_33 = _UPVALUE0_
    L16_33 = L16_33.BAD_PARAMETER
    return L16_33
  end
  if L2_19 == nil or L3_20 == nil or L4_21 == nil or L6_23 == nil or L7_24 == nil or L9_26 == nil or L10_27 == nil or L11_28 == nil or L13_30 == nil or L14_31 == nil or L15_32 == nil or L8_25 == nil then
    L16_33 = util
    L16_33 = L16_33.appendDebugOut
    L17_34 = "GetNext : Invalid Cookie"
    L16_33(L17_34)
    L16_33 = _UPVALUE0_
    L16_33 = L16_33.BAD_PARAMETER
    return L16_33
  end
  L16_33, L17_34 = nil, nil
  _UPVALUE1_.start()
  L16_33, L17_34 = fw.core.attackChecks.edit(L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25)
  if L16_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in attackChecks PAGE" .. L16_33)
    _UPVALUE1_.abort()
    return L16_33, L1_18
  end
  L16_33, L17_34 = fw.core.icsaSettings.edit(L9_26, L10_27, L11_28, L12_29)
  if L16_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in attackChecks PAGE" .. L16_33)
    _UPVALUE1_.abort()
    return L16_33, L1_18
  end
  L16_33, L17_34 = fw.core.fwDosAttackSettings.edit(L13_30, L14_31, L15_32)
  if L16_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in attackChecks PAGE" .. L16_33)
    _UPVALUE1_.abort()
    return L16_33, L1_18
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L17_34
end
