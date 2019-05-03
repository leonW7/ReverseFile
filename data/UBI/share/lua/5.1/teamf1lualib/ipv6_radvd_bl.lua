local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.radvd", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_radvd")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipv6.radvd")
function radvdAdvSectionGet(A0_1)
  local L1_2, L2_3, L3_4
  L1_2, L2_3, L3_4 = _UPVALUE0_.advertisementGet(A0_1)
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operation in page router Advertisement page" .. L1_2)
    return L1_2
  end
  return _UPVALUE1_.SUCCESS, L2_3, L3_4
end
function radvdAdvSectionGetAll()
  local L0_5, L1_6
  L0_5, outputTable = _UPVALUE0_.advertisementGetAll()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operation in page router Advertisement page" .. L0_5)
    return L0_5
  end
  return _UPVALUE1_.SUCCESS, outputTable
end
function radvdAdvSectionStatus()
  returnCode, status = _UPVALUE0_.advertisementstatusGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get status Operation in page router Advertisement page" .. returnCode)
    return returnCode
  end
  return _UPVALUE1_.SUCCESS, status
end
function radvdAdvSectionSet(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19, L13_20
  L3_10 = ACCESS_LEVEL
  if L3_10 ~= 0 then
    L3_10 = util
    L3_10 = L3_10.appendDebugOut
    L4_11 = "Detected Unauthorized access for page routerAdvertisement"
    L3_10(L4_11)
    L3_10 = _UPVALUE0_
    L3_10 = L3_10.UNAUTHORIZED
    return L3_10
  end
  L3_10 = _UPVALUE1_
  L3_10 = L3_10.vlanStateGet
  L4_11 = L3_10()
  L5_12 = _UPVALUE0_
  L5_12 = L5_12.SUCCESS
  if L3_10 ~= L5_12 then
    return L3_10
  end
  if L4_11 == "0" then
    L5_12 = _UPVALUE2_
    L5_12 = L5_12.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_RADVD
    return L5_12
  end
  L5_12 = A0_7["radvd.cookie"]
  L6_13 = A0_7["radvd.mode"]
  L7_14 = A0_7["radvd.interval"]
  L8_15 = A0_7["radvd.managed"]
  L9_16 = A0_7["radvd.other"]
  L10_17 = A0_7["radvd.mtu"]
  L11_18 = A0_7["radvd.routerPreference"]
  L12_19 = A0_7["radvd.lifetime"]
  L13_20 = db
  L13_20 = L13_20.getAttribute
  L13_20 = L13_20("radvd", "_ROWID_", L5_12, "isEnabled")
  if tonumber(L13_20) ~= 1 and tonumber(L13_20) ~= 0 then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L13_20) == 1 and (L6_13 == nil or L8_15 == nil or L9_16 == nil or L10_17 == nil or L11_18 == nil or L12_19 == nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_13 == "1" then
    L6_13 = 0
  end
  if L6_13 == "2" then
    L6_13 = 1
  end
  _UPVALUE3_.start()
  L3_10, L5_12 = _UPVALUE4_.advertisementSet(L5_12, L13_20, L6_13, L7_14, L8_15, L9_16, L10_17, L11_18, L12_19)
  if L3_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page routerAdvertisement" .. L3_10)
    _UPVALUE3_.abort()
    return L3_10, L5_12
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L5_12
end
function radvdAdvSectionDisable(A0_21)
  local L1_22, L2_23
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L2_23 = "Detected Unauthorized access for page routerAdvertisement"
    L1_22(L2_23)
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["radvd.cookie"]
  L2_23 = _UPVALUE1_
  _UPVALUE2_.start()
  returnCode, curCookie = _UPVALUE3_.advertisementStatusSet(L2_23, L1_22)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page vlanSettings PAGE" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode, curCookie
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L1_22
end
function radvdAdvSectionEnable(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = ACCESS_LEVEL
  if L1_25 ~= 0 then
    L1_25 = util
    L1_25 = L1_25.appendDebugOut
    L2_26 = "Detected Unauthorized access for page routerAdvertisement"
    L1_25(L2_26)
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.UNAUTHORIZED
    return L1_25
  end
  L1_25 = _UPVALUE1_
  L1_25 = L1_25.vlanStateGet
  L2_26 = L1_25()
  L3_27 = _UPVALUE0_
  L3_27 = L3_27.SUCCESS
  if L1_25 ~= L3_27 then
    return L1_25
  end
  if L2_26 == "0" then
    L3_27 = _UPVALUE2_
    L3_27 = L3_27.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_RADVD
    return L3_27
  end
  L3_27 = A0_24["radvd.cookie"]
  L4_28 = _UPVALUE3_
  _UPVALUE4_.start()
  L1_25, curCookie = _UPVALUE5_.advertisementStatusSet(L4_28, L3_27)
  if L1_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page vlanSettings PAGE" .. L1_25)
    _UPVALUE4_.abort()
    return L1_25, curCookie
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return _UPVALUE0_.SUCCESS, L3_27
end
function radvdAdvSectionDisableAll(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35
  if L1_30 ~= 0 then
    L1_30(L2_31)
    return L1_30
  end
  L1_30()
  for L4_33, L5_34 in L1_30(L2_31) do
    L6_35 = _UPVALUE2_
    L6_35 = L6_35.advertisementStatusSet
    L6_35 = L6_35(_UPVALUE3_, L5_34)
    if L6_35 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in disabling Operation in page routerAdvertisement" .. L6_35)
      _UPVALUE1_.abort()
      return L6_35
    end
  end
  L1_30()
  L1_30()
  return L1_30
end
function radvdAdvSectionEnableAll(A0_36)
  local L1_37, L2_38
  L2_38 = ACCESS_LEVEL
  if L2_38 ~= 0 then
    L2_38 = util
    L2_38 = L2_38.appendDebugOut
    L2_38("Detected Unauthorized access for page routerAdvertisement")
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.UNAUTHORIZED
    return L2_38
  end
  L2_38 = _UPVALUE1_
  L2_38 = L2_38.vlanStateGet
  L2_38 = L2_38()
  if L2_38 ~= _UPVALUE0_.SUCCESS then
    return L2_38
  end
  if L2_38() == "0" then
    return _UPVALUE2_.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_RADVD
  end
  L2_38 = _UPVALUE3_.advertisementEnableAll(status, id)
  if L2_38 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in disabling Operation in page routerAdvertisement" .. L2_38)
    _UPVALUE4_.abort()
    return L2_38
  end
  _UPVALUE4_.complete()
  _UPVALUE4_.save()
  return _UPVALUE0_.SUCCESS
end
