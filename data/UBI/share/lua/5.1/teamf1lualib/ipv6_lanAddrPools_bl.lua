local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipv6.lanAddressPools", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_lanAddressPools")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function ipv6AddressPoolNetworkValidation(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.NIL
  L5_6 = _UPVALUE0_
  L5_6 = L5_6.NIL
  if A0_1 == "" or A0_1 == nil or A1_2 == "" or A1_2 == nil then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.INVALID_IPV6_ADDRESS_FIELD
    return L6_7
  end
  if A2_3 ~= nil then
    L6_7 = tonumber
    L6_7 = L6_7(A2_3)
    if not (L6_7 < 0) then
      L6_7 = tonumber
      L6_7 = L6_7(A2_3)
    end
  elseif L6_7 > 128 then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.INVALID_IPV6_PREFIX_LENGTH
    return L6_7
  end
  L6_7 = _UPVALUE1_
  L6_7 = L6_7.ipAddressCheck
  L5_6, L6_7 = "10", L6_7("10", A0_1)
  L4_5 = L6_7
  if L4_5 ~= 0 then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.INVALID_IPV6_ADDRESS_FIELD
    return L6_7
  end
  L6_7 = _UPVALUE1_
  L6_7 = L6_7.ipAddressCheck
  L5_6, L6_7 = "10", L6_7("10", A1_2)
  L4_5 = L6_7
  if L4_5 ~= 0 then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.INVALID_IPV6_ADDRESS_FIELD
    return L6_7
  end
  L6_7 = _UPVALUE1_
  L6_7 = L6_7.ipv6SingleMaskCheck
  L5_6, L6_7 = A0_1, L6_7(A0_1, A1_2, A2_3)
  L4_5 = L6_7
  if L4_5 ~= 0 then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.INVALID_IPV6_ADRESS_NETWORKS
    return L6_7
  end
  L6_7 = "LogicalIfName"
  L6_7 = L6_7 .. " = '" .. A3_4 .. "' AND " .. "AddressFamily" .. " = 10"
  if db.getRowWhere("ifStatic", L6_7) == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  L4_5, L5_6 = _UPVALUE1_.ipv6DualMaskCheck(A0_1, A2_3, db.getRowWhere("ifStatic", L6_7)["ifStatic" .. "." .. "StaticIp"], db.getRowWhere("ifStatic", L6_7)["ifStatic" .. "." .. "PrefixLength"])
  if L4_5 ~= 0 then
    return _UPVALUE0_.INVALID_IPV6_ADRESS_INTERFACE
  end
  return _UPVALUE0_.SUCCESS
end
function dhcpAddressPoolSectionGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13
  L0_8 = _UPVALUE0_
  L0_8 = L0_8.addressPoolGet
  L4_12 = L0_8()
  L5_13 = _UPVALUE1_
  L5_13 = L5_13.SUCCESS
  if L0_8 ~= L5_13 then
    return L0_8
  end
  L5_13 = {}
  L5_13["ipv6AddressPools.startIpAddress"] = L2_10
  L5_13["ipv6AddressPools.endIpAddress"] = L3_11
  L5_13["ipv6AddressPools.prefixLength"] = L4_12
  return L0_8, L1_9, L5_13
end
function dhcpAddressPoolGetNext(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21
  L1_15 = A0_14["ipv6AddressPools.cookie"]
  if L1_15 == nil then
    L2_16 = util
    L2_16 = L2_16.appendDebugOut
    L3_17 = "Delete : Invalid Cookie"
    L2_16(L3_17)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.BAD_PARAMETER
    return L2_16
  end
  L2_16 = _UPVALUE1_
  L2_16 = L2_16.addressPoolGetNext
  L3_17 = L1_15
  L6_20 = L2_16(L3_17)
  L7_21 = _UPVALUE0_
  L7_21 = L7_21.SUCCESS
  if L2_16 ~= L7_21 then
    return L2_16
  end
  L7_21 = {}
  L7_21["ipv6AddressPools.startIpAddress"] = L4_18
  L7_21["ipv6AddressPools.endIpAddress"] = L5_19
  L7_21["ipv6AddressPools.prefixLength"] = L6_20
  return L2_16, L3_17, L7_21
end
function dhcpAddressPoolSectionGetCur(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29
  if A0_22 == nil then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Delete : Invalid Cookie"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.BAD_PARAMETER
    return L1_23
  end
  L1_23 = _UPVALUE1_
  L1_23 = L1_23.addressPoolGetCur
  L2_24 = A0_22
  L6_28 = L1_23(L2_24)
  L7_29 = _UPVALUE0_
  L7_29 = L7_29.SUCCESS
  if L1_23 ~= L7_29 then
    return L1_23
  end
  L7_29 = {}
  L7_29["ipv6AddressPools.startIpAddress"] = L3_25
  L7_29["ipv6AddressPools.endIpAddress"] = L4_26
  L7_29["ipv6AddressPools.prefixLength"] = L5_27
  L7_29["ipv6AddressPools.vlanInterface"] = L6_28
  return L1_23, L2_24, L7_29
end
function dhcpAddressPoolSectionSet(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39
  L3_33 = ACCESS_LEVEL
  if L3_33 ~= 0 then
    L3_33 = util
    L3_33 = L3_33.appendDebugOut
    L4_34 = "Detected Unauthorized access for page ipv6AddressPools"
    L3_33(L4_34)
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.UNAUTHORIZED
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.vlanStateGet
  L4_34 = L3_33()
  L5_35 = _UPVALUE0_
  L5_35 = L5_35.SUCCESS
  if L3_33 ~= L5_35 then
    return L3_33
  end
  if L4_34 == "0" then
    L5_35 = _UPVALUE2_
    L5_35 = L5_35.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_ADDRESSPOOLS
    return L5_35
  end
  L5_35 = A0_30["ipv6AddressPools.cookie"]
  L6_36 = A0_30["ipv6AddressPools.startIpAddress"]
  L7_37 = A0_30["ipv6AddressPools.endIpAddress"]
  L8_38 = A0_30["ipv6AddressPools.prefixLength"]
  L9_39 = A0_30["ipv6AddressPools.vlanInterface"]
  if L5_35 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L6_36 == nil or L7_37 == nil or L8_38 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_33 = ipv6AddressPoolNetworkValidation(L6_36, L7_37, L8_38, L9_39)
  if L3_33 ~= _UPVALUE0_.SUCCESS then
    return L3_33
  end
  if L9_39 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE3_.start()
  L3_33, L2_32 = _UPVALUE4_.addressPoolSet(L5_35, L6_36, L7_37, L8_38, L9_39)
  if L3_33 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6AddressPools" .. L3_33)
    _UPVALUE3_.abort()
    return L3_33, L5_35
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_32
end
function dhcpAddressPoolSectionCreate(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45, L6_46, L7_47, L8_48
  L3_43 = ACCESS_LEVEL
  if L3_43 ~= 0 then
    L3_43 = util
    L3_43 = L3_43.appendDebugOut
    L4_44 = "Detected Unauthorized access for page ipv6AddressPools"
    L3_43(L4_44)
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.UNAUTHORIZED
    return L3_43
  end
  L3_43 = _UPVALUE1_
  L3_43 = L3_43.vlanStateGet
  L4_44 = L3_43()
  L5_45 = _UPVALUE0_
  L5_45 = L5_45.SUCCESS
  if L3_43 ~= L5_45 then
    return L3_43
  end
  if L4_44 == "0" then
    L5_45 = _UPVALUE2_
    L5_45 = L5_45.COMP_VLAN_NOT_ABLE_TO_CONFIGURE_ADDRESSPOOLS
    return L5_45
  end
  L5_45 = A0_40["ipv6AddressPools.startIpAddress"]
  L6_46 = A0_40["ipv6AddressPools.endIpAddress"]
  L7_47 = A0_40["ipv6AddressPools.prefixLength"]
  L8_48 = A0_40["ipv6AddressPools.vlanInterface"]
  if L5_45 == nil or L6_46 == nil or L7_47 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L8_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L3_43 = ipv6AddressPoolNetworkValidation(L5_45, L6_46, L7_47, L8_48)
  if L3_43 ~= _UPVALUE0_.SUCCESS then
    return L3_43
  end
  _UPVALUE3_.start()
  L3_43, L2_42 = _UPVALUE4_.addressPoolCreate(L5_45, L6_46, L7_47, L8_48)
  if L3_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page ipv6AddressPools" .. L3_43)
    _UPVALUE3_.abort()
    return L3_43, curCookie
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L2_42
end
function dhcpAddressPoolSectionDelete(A0_49)
  local L1_50, L2_51
  L2_51 = ACCESS_LEVEL
  if L2_51 ~= 0 then
    L2_51 = util
    L2_51 = L2_51.appendDebugOut
    L2_51("Detected Unauthorized access for page ipv6AddressPools")
    L2_51 = _UPVALUE0_
    L2_51 = L2_51.UNAUTHORIZED
    return L2_51
  end
  L2_51 = A0_49["ipv6AddressPools.cookie"]
  if L2_51 == nil then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L1_50, cookie = _UPVALUE2_.addressPoolDelete(L2_51)
  if L1_50 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page ipv6AddressPools" .. L1_50)
    _UPVALUE1_.abort()
    return L1_50, L2_51
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function dhcpAddressPoolSectionGetAll()
  local L0_52, L1_53
  L0_52 = _UPVALUE0_
  L0_52 = L0_52.dhcpAddressPoolGetAll
  L1_53 = L0_52()
  if L0_52 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Get All Operaion in page ipv6AddressPools" .. L0_52)
    return L0_52
  end
  return _UPVALUE1_.SUCCESS, L1_53
end
function dhcpAddressPoolSectionDeleteAll(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  if L3_57 ~= 0 then
    L3_57(L4_58)
    return L3_57
  end
  L3_57()
  for L6_60, L7_61 in L3_57(L4_58) do
    L1_55, L2_56 = _UPVALUE2_.addressPoolDelete(L7_61)
    if L1_55 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page ipv6AddressPools" .. L1_55)
      _UPVALUE1_.abort()
      return L1_55
    end
  end
  L3_57()
  L3_57()
  return L3_57
end
