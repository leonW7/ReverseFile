local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.discoveredvlan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlandiscoveryglobal_web")
L0_0 = require
L0_0("teamf1lualib/vlandiscoveryshow_web")
L0_0 = require
L0_0("teamf1lualib/vlandiscoveryconfig_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0("teamf1lualib/bl_networkProfiles")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).vlanId = 1
;({}).vlanName = 2
function discoverdVlanStatus()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.vlandiscoveryglobalGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in discoverdVlan page" .. L0_1)
    return _UPVALUE1_.FAILURE
  end
  return L0_1, L1_2
end
function discoverdVlanModeSet(A0_3)
  local L1_4, L2_5
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredVlans page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_5 = A0_3.status
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_5 = tonumber(L2_5)
  L1_4 = _UPVALUE1_.vlandiscoveryglobalSet(L2_5)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in discoverdVlans page" .. L1_4)
    return _UPVALUE0_.FAILURE
  end
  return L1_4
end
function discoverVlanGet()
  local L0_6, L1_7, L2_8, L3_9
  L2_8 = {}
  L3_9 = 1
  L0_6, L1_7 = _UPVALUE0_.vlandiscoveryshowGet()
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredVlans page" .. L0_6)
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
function discoveredVlanAdd(A0_10)
  local L1_11, L2_12, L3_13
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredVlans page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_12 = A0_10.vlanId
  if L2_12 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_11 = _UPVALUE1_.vlanCheck(L2_12)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE2_.INVALID_VLAN_ID
  end
  L1_11, L3_13 = discoverdVlanStatus()
  if L3_13 ~= _UPVALUE3_ then
    return _UPVALUE2_.DISCOVEREDVLAN_MODE_DISABLED
  end
  L1_11 = _UPVALUE4_.vlandiscoveryconfigAdd(L2_12)
  if L1_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredVlans page" .. L1_11)
    return _UPVALUE0_.FAILURE
  end
  return L1_11
end
function discoveredVlanDelete(A0_14)
  local L1_15, L2_16, L3_17
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredVlanAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_16 = A0_14.cookie
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_15, L3_17 = discoverdVlanStatus()
  if L3_17 ~= _UPVALUE1_ then
    return _UPVALUE2_.DISCOVEREDVLAN_MODE_DISABLED
  end
  L1_15 = _UPVALUE3_.vlandiscoveryshowDelete(L2_16)
  if L1_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredVlanAddresses page" .. L1_15)
    return _UPVALUE0_.FAILURE
  end
  return L1_15
end
function discoveredVlanDeleteAll()
  local L0_18, L1_19
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredVlanAddresses page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_18, L1_19 = discoverdVlanStatus()
  if L1_19 ~= _UPVALUE1_ then
    return _UPVALUE2_.DISCOVEREDVLAN_MODE_DISABLED
  end
  L0_18 = _UPVALUE3_.vlandiscoveryshowDeleteAll()
  if L0_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the discoveredVlanAddresses page" .. L0_18)
    return _UPVALUE0_.FAILURE
  end
  return L0_18
end
