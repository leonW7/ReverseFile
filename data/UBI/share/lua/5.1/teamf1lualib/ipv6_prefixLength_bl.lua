local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.lanPrefixPools", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_lanPrefixPools")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function dhcpPrefixPoolSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.prefixPoolGet
  L3_4 = L0_1()
  L4_5 = _UPVALUE1_
  L4_5 = L4_5.SUCCESS
  if L0_1 ~= L4_5 then
    return L0_1
  end
  L4_5 = {}
  L4_5["ipv6PrefixLength.prefix"] = L2_3
  L4_5["ipv6PrefixLength.prefixLength"] = L3_4
  return L0_1, L1_2, L4_5
end
function dhcpPrefixPoolGetNext(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = A0_6["ipv6PrefixLength.cookie"]
  if L1_7 == nil then
    L2_8 = util
    L2_8 = L2_8.appendDebugOut
    L3_9 = "Delete : Invalid Cookie"
    L2_8(L3_9)
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8 = _UPVALUE1_
  L2_8 = L2_8.prefixPoolGetNext
  L3_9 = L1_7
  L5_11 = L2_8(L3_9)
  L6_12 = _UPVALUE0_
  L6_12 = L6_12.SUCCESS
  if L2_8 ~= L6_12 then
    return L2_8
  end
  L6_12 = {}
  L6_12["ipv6PrefixLength.prefix"] = L4_10
  L6_12["ipv6PrefixLength.prefixLength"] = L5_11
  return L2_8, L3_9, L6_12
end
function dhcpPrefixPoolSectionGetCur(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  if A0_13 == nil then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Delete : Invalid Cookie"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.BAD_PARAMETER
    return L1_14
  end
  L1_14 = _UPVALUE1_
  L1_14 = L1_14.prefixPoolGetCur
  L2_15 = A0_13
  L5_18 = L1_14(L2_15)
  L6_19 = _UPVALUE0_
  L6_19 = L6_19.SUCCESS
  if L1_14 ~= L6_19 then
    return L1_14
  end
  L6_19 = {}
  L6_19["ipv6PrefixLength.prefix"] = L3_16
  L6_19["ipv6PrefixLength.prefixLength"] = L4_17
  L6_19["ipv6PrefixLength.vlanInterface"] = L5_18
  return L1_14, L2_15, L6_19
end
function dhcpPrefixPoolSectionSet(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L3_23 = ACCESS_LEVEL
  if L3_23 ~= 0 then
    L3_23 = util
    L3_23 = L3_23.appendDebugOut
    L4_24 = "Detected Unauthorized access for page ipv6PrefixLength"
    L3_23(L4_24)
    L3_23 = _UPVALUE0_
    L3_23 = L3_23.UNAUTHORIZED
    return L3_23
  end
  L3_23 = _UPVALUE1_
  L3_23 = L3_23.vlanStateGet
  L4_24 = L3_23()
  L5_25 = _UPVALUE0_
  L5_25 = L5_25.SUCCESS
  if L3_23 ~= L5_25 then
    return L3_23
  end
  if L4_24 == "0" then
    L5_25 = _UPVALUE2_
    L5_25 = L5_25.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_PREFIX_DELEGATION
    return L5_25
  end
  L5_25 = A0_20["ipv6PrefixLength.cookie"]
  L6_26 = A0_20["ipv6PrefixLength.prefix"]
  L7_27 = A0_20["ipv6PrefixLength.prefixLength"]
  L8_28 = A0_20["ipv6PrefixLength.vlanInterface"]
  if L5_25 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_26 == nil or L7_27 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_28 == _UPVALUE0_.NIL or L8_28 == "" then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  L3_23, L2_22 = _UPVALUE4_.prefixPoolSet(L5_25, L6_26, L7_27, L8_28)
  if L3_23 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6PrefixLength" .. L3_23)
    _UPVALUE3_.abort()
    return L3_23, L5_25
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_22
end
function dhcpPrefixPoolSectionCreate(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  L3_32 = ACCESS_LEVEL
  if L3_32 ~= 0 then
    L3_32 = util
    L3_32 = L3_32.appendDebugOut
    L4_33 = "Detected Unauthorized access for page ipv6PrefixLength"
    L3_32(L4_33)
    L3_32 = _UPVALUE0_
    L3_32 = L3_32.UNAUTHORIZED
    return L3_32
  end
  L3_32 = _UPVALUE1_
  L3_32 = L3_32.vlanStateGet
  L4_33 = L3_32()
  L5_34 = _UPVALUE0_
  L5_34 = L5_34.SUCCESS
  if L3_32 ~= L5_34 then
    return L3_32
  end
  if L4_33 == "0" then
    L5_34 = _UPVALUE2_
    L5_34 = L5_34.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_PREFIX_DELEGATION
    return L5_34
  end
  L5_34 = A0_29["ipv6PrefixLength.prefix"]
  L6_35 = A0_29["ipv6PrefixLength.prefixLength"]
  L7_36 = A0_29["ipv6PrefixLength.vlanInterface"]
  if L5_34 == nil or L6_35 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_36 == _UPVALUE0_.NIL or L7_36 == "" then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  L3_32, L2_31 = _UPVALUE4_.prefixPoolCreate(L5_34, L6_35, L7_36)
  if L3_32 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6PrefixLength" .. L3_32)
    _UPVALUE3_.abort()
    return L3_32, curCookie
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_31
end
function dhcpPrefixPoolSectionDelete(A0_37)
  local L1_38, L2_39
  L2_39 = ACCESS_LEVEL
  if L2_39 ~= 0 then
    L2_39 = util
    L2_39 = L2_39.appendDebugOut
    L2_39("Detected Unauthorized access for page ipv6PrefixLength")
    L2_39 = _UPVALUE0_
    L2_39 = L2_39.UNAUTHORIZED
    return L2_39
  end
  L2_39 = A0_37["ipv6PrefixLength.cookie"]
  if L2_39 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_38, cookie = _UPVALUE2_.prefixPoolDelete(L2_39)
  if L1_38 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page ipv6PrefixLength" .. L1_38)
    _UPVALUE1_.abort()
    return L1_38, L2_39
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function dhcpPrefixPoolSectionGetAll()
  local L0_40, L1_41
  L0_40 = _UPVALUE0_
  L0_40 = L0_40.dhcpPrefixPoolGetAll
  L1_41 = L0_40()
  if L0_40 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operaion in page ipv6PrefixLength" .. L0_40)
    return L0_40
  end
  return _UPVALUE1_.SUCCESS, L1_41
end
function dhcpPrefixPoolSectionDeleteAll(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47, L6_48, L7_49
  L1_43 = ACCESS_LEVEL
  if L1_43 ~= 0 then
    L1_43 = util
    L1_43 = L1_43.appendDebugOut
    L2_44 = "Detected Unauthorized access for page ipv6PrefixLength"
    L1_43(L2_44)
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.UNAUTHORIZED
    return L1_43
  end
  L1_43, L2_44 = nil, nil
  L3_45()
  for L6_48, L7_49 in L3_45(L4_46) do
    L1_43, L2_44 = _UPVALUE2_.prefixPoolDelete(L7_49)
    if L1_43 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page ipv6PrefixLength" .. L1_43)
      _UPVALUE1_.abort()
      return L1_43
    end
  end
  L3_45()
  L3_45()
  return L3_45
end
