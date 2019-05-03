local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.discoveredip", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipdiscoveryglobal_web")
L0_0 = require
L0_0("teamf1lualib/ipdiscoveryshow_web")
L0_0 = require
L0_0("teamf1lualib/ipdiscoveryconfig_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).ipAddress = 1
;({}).pollStatus = 2
function dicoverdIpStatus()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.ipdiscoveryglobalGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in discoverdIp page" .. L0_1)
    return _UPVALUE1_.FAILURE
  end
  return L0_1, L1_2
end
function dicoverdIpModeSet(A0_3)
  local L1_4, L2_5
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredIpAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_5 = A0_3.status
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_5 = tonumber(L2_5)
  L1_4 = _UPVALUE1_.ipdiscoveryglobalSet(L2_5)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in discoverdIp page" .. L1_4)
    return _UPVALUE0_.FAILURE
  end
  return L1_4
end
function discoverIpGet()
  local L0_6, L1_7, L2_8, L3_9
  L2_8 = {}
  L3_9 = 1
  L0_6, L1_7 = _UPVALUE0_.ipdiscoveryshowGet()
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredIpAddresses page" .. L0_6)
    return _UPVALUE1_.FAILURE
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_7) do
    L2_8[L3_9] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_8[L3_9][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_9 = L3_9 + 1
  end
  return L0_6, L2_8
end
function discoveredIpAdd(A0_10)
  local L1_11, L2_12, L3_13, L4_14
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredIpAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_12 = A0_10.startIpAddress
  if L2_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_13 = A0_10.endIpAddress
  L1_11, L4_14 = dicoverdIpStatus()
  if L4_14 ~= _UPVALUE1_ then
    return _UPVALUE2_.DISCOVEREDIP_MODE_DISABLED
  end
  L1_11 = _UPVALUE3_.ipdiscoveryconfigAdd(L2_12, L3_13)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredIpAddresses page" .. L1_11)
    return _UPVALUE0_.FAILURE
  end
  return L1_11
end
function discoveredIpDelete(A0_15)
  local L1_16, L2_17, L3_18
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredIpAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_17 = A0_15.cookie
  if L2_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_16, L3_18 = dicoverdIpStatus()
  if L3_18 ~= _UPVALUE1_ then
    return _UPVALUE2_.DISCOVEREDIP_MODE_DISABLED
  end
  L1_16 = _UPVALUE3_.ipdiscoveryshowDelete(L2_17)
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredIpAddresses page" .. L1_16)
    return _UPVALUE0_.FAILURE
  end
  return L1_16
end
function discoveredIpDeleteAll()
  local L0_19, L1_20
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredIpAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_19, L1_20 = dicoverdIpStatus()
  if L1_20 ~= _UPVALUE1_ then
    return _UPVALUE2_.DISCOVEREDIP_MODE_DISABLED
  end
  L0_19 = _UPVALUE3_.ipdiscoveryshowDeleteAll()
  if L0_19 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the apProfiles page" .. L0_19)
    return _UPVALUE0_.FAILURE
  end
  return L0_19
end
