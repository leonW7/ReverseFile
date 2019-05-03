local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.radvdPrefixes", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.returnCodes")
radvdLANPrefixPoolTable = "radvdLANPrefixPool"
ROWID = "_ROWID_"
attribute = {}
attribute.interfaceName = "interfaceName"
function radvdAdvPrefixesSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.prefixGrpGet
  L6_7 = L0_1()
  L7_8 = _UPVALUE1_
  L7_8 = L7_8.SUCCESS
  if L0_1 ~= L7_8 then
    return L0_1
  end
  L7_8 = {}
  L7_8["advertisementPrefixes.prefix"] = L2_3
  L7_8["advertisementPrefixes.prefixLength"] = L3_4
  L7_8["advertisementPrefixes.prefixLifeTime"] = L4_5
  L7_8["advertisementPrefixes.prefixType"] = L5_6
  L7_8["advertisementPrefixes.sla"] = L6_7
  return L0_1, L1_2, L7_8
end
function radvdAdvPrefixesSectionGetNext(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  L3_12 = A0_9["advertisementPrefixes.cookie"]
  if L3_12 == nil then
    L4_13 = util
    L4_13 = L4_13.appendDebugOut
    L5_14 = "Delete : Invalid Cookie"
    L4_13(L5_14)
    L4_13 = _UPVALUE0_
    L4_13 = L4_13.BAD_PARAMETER
    return L4_13
  end
  L4_13, L5_14, L6_15, L7_16, L8_17 = nil, nil, nil, nil, nil
  L9_18 = _UPVALUE1_
  L9_18 = L9_18.prefixGrpGetNext
  L2_11, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18 = L3_12, nil, nil, nil, nil, nil, L9_18(L3_12)
  L1_10 = L9_18
  L9_18 = _UPVALUE0_
  L9_18 = L9_18.SUCCESS
  if L1_10 ~= L9_18 then
    return L1_10
  end
  L9_18 = {}
  L9_18["advertisementPrefixes.prefix"] = L4_13
  L9_18["advertisementPrefixes.prefixLength"] = L5_14
  L9_18["advertisementPrefixes.prefixLifeTime"] = L6_15
  L9_18["advertisementPrefixes.prefixType"] = L7_16
  L9_18["advertisementPrefixes.sla"] = L8_17
  return L1_10, L2_11, L9_18
end
function radvdAdvPrefixesSectionGetCur(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28
  if A0_19 == nil then
    L3_22 = util
    L3_22 = L3_22.appendDebugOut
    L4_23 = "Delete : Invalid Cookie"
    L3_22(L4_23)
    L3_22 = _UPVALUE0_
    L3_22 = L3_22.BAD_PARAMETER
    return L3_22
  end
  L3_22, L4_23, L5_24, L6_25, L7_26, L8_27 = nil, nil, nil, nil, nil, nil
  L9_28 = _UPVALUE1_
  L9_28 = L9_28.prefixGrpGetCur
  L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28 = A0_19, nil, nil, nil, nil, nil, nil, L9_28(A0_19)
  L1_20 = L9_28
  L9_28 = _UPVALUE0_
  L9_28 = L9_28.SUCCESS
  if L1_20 ~= L9_28 then
    return L1_20
  end
  L9_28 = {}
  L9_28["advertisementPrefixes.prefix"] = L3_22
  L9_28["advertisementPrefixes.prefixLength"] = L4_23
  L9_28["advertisementPrefixes.prefixLifeTime"] = L5_24
  L9_28["advertisementPrefixes.prefixType"] = L6_25
  L9_28["advertisementPrefixes.sla"] = L7_26
  L9_28["advertisementPrefixes.vlanInterface"] = L8_27
  return L1_20, L2_21, L9_28
end
function radvdAdvPrefixesSectionSet(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40
  L3_32 = ACCESS_LEVEL
  if L3_32 ~= 0 then
    L3_32 = util
    L3_32 = L3_32.appendDebugOut
    L4_33 = "Detected Unauthorized access for page advertisementPrefixes"
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
    L5_34 = L5_34.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_ADVERTISEMENT_PREFIXES
    return L5_34
  end
  L5_34 = A0_29["advertisementPrefixes.cookie"]
  L6_35 = A0_29["advertisementPrefixes.prefix"]
  L7_36 = A0_29["advertisementPrefixes.prefixLength"]
  L8_37 = A0_29["advertisementPrefixes.prefixLifeTime"]
  L9_38 = A0_29["advertisementPrefixes.prefixType"]
  L10_39 = A0_29["advertisementPrefixes.sla"]
  L11_40 = A0_29["advertisementPrefixes.vlanInterface"]
  if L5_34 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L9_38 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L9_38) == 2 and (L6_35 == nil or L7_36 == nil or L8_37 == nil or L10_39 ~= nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L9_38) == 1 and (L6_35 ~= nil or L7_36 ~= nil or L8_37 == nil or L10_39 == nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L11_40 == nil then
    return _UPVALUE0_.NO_VLAN_INTERFACE_AVAILABLE
  end
  _UPVALUE3_.start()
  L3_32, L2_31 = _UPVALUE4_.prefixGrpSet(L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40)
  if L3_32 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page advertisementPrefixes" .. L3_32)
    _UPVALUE3_.abort()
    return L3_32, L5_34
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_31
end
function radvdAdvPrefixesSectionCreate(A0_41)
  local L1_42, L2_43, L3_44, L4_45, L5_46, L6_47, L7_48, L8_49, L9_50, L10_51
  L3_44 = ACCESS_LEVEL
  if L3_44 ~= 0 then
    L3_44 = util
    L3_44 = L3_44.appendDebugOut
    L4_45 = "Detected Unauthorized access for page advertisementPrefixes"
    L3_44(L4_45)
    L3_44 = _UPVALUE0_
    L3_44 = L3_44.UNAUTHORIZED
    return L3_44
  end
  L3_44 = _UPVALUE1_
  L3_44 = L3_44.vlanStateGet
  L4_45 = L3_44()
  L5_46 = _UPVALUE0_
  L5_46 = L5_46.SUCCESS
  if L3_44 ~= L5_46 then
    return L3_44
  end
  if L4_45 == "0" then
    L5_46 = _UPVALUE2_
    L5_46 = L5_46.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_ADVERTISEMENT_PREFIXES
    return L5_46
  end
  L5_46 = A0_41["advertisementPrefixes.prefix"]
  L6_47 = A0_41["advertisementPrefixes.prefixLength"]
  L7_48 = A0_41["advertisementPrefixes.prefixLifeTime"]
  L8_49 = A0_41["advertisementPrefixes.prefixType"]
  L9_50 = A0_41["advertisementPrefixes.sla"]
  L10_51 = A0_41["advertisementPrefixes.vlanInterface"]
  if L8_49 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L8_49) == 2 and (L5_46 == nil or L6_47 == nil or L7_48 == nil or L9_50 ~= nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if tonumber(L8_49) == 1 and (L5_46 ~= nil or L6_47 ~= nil or L7_48 == nil or L9_50 == nil) then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L10_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  L3_44, L2_43 = _UPVALUE4_.prefixCreate(L5_46, L6_47, L7_48, L8_49, L9_50, L10_51)
  if L3_44 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page advertisementPrefixes" .. L3_44)
    _UPVALUE3_.abort()
    return L3_44, L2_43
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_43
end
function radvdAdvPrefixesSectionDelete(A0_52)
  local L1_53, L2_54
  L2_54 = ACCESS_LEVEL
  if L2_54 ~= 0 then
    L2_54 = util
    L2_54 = L2_54.appendDebugOut
    L2_54("Detected Unauthorized access for page advertisementPrefixes")
    L2_54 = _UPVALUE0_
    L2_54 = L2_54.UNAUTHORIZED
    return L2_54
  end
  L2_54 = A0_52["advertisementPrefixes.cookie"]
  if L2_54 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_53, cookie = _UPVALUE2_.prefixDelete(L2_54)
  if L1_53 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page advertisementPrefixes" .. L1_53)
    _UPVALUE1_.abort()
    return L1_53, L2_54
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function radvdAdvPrefixesSectionGetAll()
  local L0_55, L1_56
  L0_55 = _UPVALUE0_
  L0_55 = L0_55.radvdPrefixesGetAll
  L1_56 = L0_55()
  if L0_55 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operaion in page advertisementPrefixes" .. L0_55)
    return L0_55
  end
  return _UPVALUE1_.SUCCESS, L1_56
end
function radvdAdvPrefixesSectionDeleteAll(A0_57)
  local L1_58, L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65
  L1_58 = ACCESS_LEVEL
  if L1_58 ~= 0 then
    L1_58 = util
    L1_58 = L1_58.appendDebugOut
    L2_59 = "Detected Unauthorized access for page advertisementPrefixes"
    L1_58(L2_59)
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.UNAUTHORIZED
    return L1_58
  end
  L1_58, L2_59 = nil, nil
  L3_60()
  for L6_63, L7_64 in L3_60(L4_61) do
    L8_65 = db
    L8_65 = L8_65.getAttribute
    L8_65 = L8_65(radvdLANPrefixPoolTable, ROWID, L7_64, attribute.interfaceName)
    L1_58, L2_59 = _UPVALUE2_.prefixDelete(L7_64)
    if L1_58 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page advertisementPrefixes" .. L1_58)
      _UPVALUE1_.abort()
      return L1_58
    end
  end
  L3_60()
  L3_60()
  return L3_60
end
function radvdEnabledVlanIdGetAll()
  local L0_66, L1_67, L2_68, L3_69
  L1_67 = {}
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.radvdAdvPrefixVlanIdGetAll
  L3_69 = L2_68()
  return L2_68, L3_69
end
