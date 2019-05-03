local L0_0
L0_0 = module
L0_0("com.teamf1.bl.snmp.sysinfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmp_sysInfo")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function systemInfoSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L1_2, L2_3, L3_4, L4_5 = _UPVALUE0_.systemInformationGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5
end
function systemInfoSectionSet(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = util
    L1_7 = L1_7.appendDebugOut
    L2_8 = "Detected Unauthorized access for page snmpSystemInfo"
    L1_7(L2_8)
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.UNAUTHORIZED
    return L1_7
  end
  L1_7 = A0_6["snmpSystemInfo.cookie"]
  L2_8 = A0_6["snmpSystemInfo.sysContact"]
  L3_9 = A0_6["snmpSystemInfo.sysLoc"]
  L4_10 = A0_6["snmpSystemInfo.name"]
  if L1_7 == nil then
    L5_11 = util
    L5_11 = L5_11.appendDebugOut
    L6_12 = "Set : Invalid Cookie"
    L5_11(L6_12)
    L5_11 = _UPVALUE0_
    L5_11 = L5_11.BAD_PARAMETER
    return L5_11
  end
  if L2_8 == nil or L3_9 == nil or L4_10 == nil then
    L5_11 = util
    L5_11 = L5_11.appendDebugOut
    L6_12 = "GetNext : Invalid Cookie"
    L5_11(L6_12)
    L5_11 = _UPVALUE0_
    L5_11 = L5_11.BAD_PARAMETER
    return L5_11
  end
  L5_11, L6_12 = nil, nil
  _UPVALUE1_.start()
  L5_11, L6_12 = _UPVALUE2_.systemInformationSet(L6_12, L2_8, L3_9, L4_10)
  if L5_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page snmpSystemInfo" .. L5_11)
    _UPVALUE1_.abort()
    return L5_11, L1_7
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L6_12
end
