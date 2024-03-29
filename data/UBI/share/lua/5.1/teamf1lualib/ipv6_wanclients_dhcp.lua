local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6_wanclients.dhcp", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipv6_mode")
L0_0 = require
L0_0("teamf1lualib/returnCodes_ipv6_nimf")
L0_0 = require
L0_0("teamf1lualib/returnCodes_dhcpv6")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
dhcpTable = "dhcpv6c"
;({}).wanPort = "LogicalIfName"
;({}).statelessMode = "statelessMode"
;({}).prefixDelegation = "prefixDelegation"
;({}).ipv6Mode = "netWorkMode"
function wanPortGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = 0
  L0_1 = L0_1(L1_2, dhcpTable)
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE0_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(dhcpTable, "_ROWID_", L0_1, _UPVALUE1_.wanPort)
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(A0_3, dhcpTable)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.FAILURE
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(dhcpTable, "_ROWID_", L1_4, _UPVALUE1_.wanPort)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function wanPortDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function statelessModeGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = 0
  L0_12 = L0_12(L1_13, dhcpTable)
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NIL
  if L0_12 == L1_13 then
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.FAILURE
    return L1_13
  end
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(dhcpTable, "_ROWID_", L0_12, _UPVALUE1_.statelessMode)
  if L1_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_12, L1_13
end
function statelessModeGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 ~= L1_15 then
    L1_15 = tonumber
    L2_16 = A0_14
    L1_15 = L1_15(L2_16)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NIL
  elseif L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = nil
  L2_16 = db
  L2_16 = L2_16.getNextRowId
  L2_16 = L2_16(A0_14, dhcpTable)
  L1_15 = L2_16
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.FAILURE
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(dhcpTable, "_ROWID_", L1_15, _UPVALUE1_.statelessMode)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function statelessModeSet(A0_17, A1_18)
  local L2_19, L3_20, L4_21
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.ipv6ModeGet
  L4_21 = L2_19()
  if tonumber(L4_21) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_17 == _UPVALUE1_.NIL or tonumber(A0_17) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_18 == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if A1_18 ~= _UPVALUE2_ and A1_18 ~= _UPVALUE3_ then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", A0_17, _UPVALUE4_.statelessMode, A1_18) == FALSE then
    return _UPVALUE1_.FAILURE, A0_17
  end
  return _UPVALUE1_.SUCCESS, A0_17
end
function isprefixDelegationEnabled()
  local L0_22, L1_23
  L0_22 = db
  L0_22 = L0_22.getNextRowId
  L1_23 = 0
  L0_22 = L0_22(L1_23, dhcpTable)
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.NIL
  if L0_22 == L1_23 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.FAILURE
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getAttribute
  L1_23 = L1_23(dhcpTable, "_ROWID_", L0_22, _UPVALUE1_.prefixDelegation)
  if L1_23 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_22, L1_23
end
function isprefixDelegationEnabledNext(A0_24)
  local L1_25, L2_26
  L1_25 = _UPVALUE0_
  L1_25 = L1_25.NIL
  if A0_24 ~= L1_25 then
    L1_25 = tonumber
    L2_26 = A0_24
    L1_25 = L1_25(L2_26)
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.NIL
  elseif L1_25 == L2_26 then
    L1_25 = _UPVALUE0_
    L1_25 = L1_25.INVALID_ARGUMENT
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.getNextRowId
  L2_26 = A0_24
  L1_25 = L1_25(L2_26, dhcpTable)
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NIL
  if L1_25 == L2_26 then
    L2_26 = _UPVALUE0_
    L2_26 = L2_26.FAILURE
    return L2_26
  end
  L2_26 = db
  L2_26 = L2_26.getAttribute
  L2_26 = L2_26(dhcpTable, "_ROWID_", L1_25, _UPVALUE1_.prefixDelegation)
  if L2_26 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_25
  end
  return _UPVALUE0_.SUCCESS, L1_25, L2_26
end
function prefixDelegationEnable(A0_27)
  local L1_28, L2_29, L3_30
  L1_28 = _UPVALUE0_
  L1_28 = L1_28.ipv6ModeGet
  L3_30 = L1_28()
  if tonumber(L3_30) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_27 == _UPVALUE1_.NIL or tonumber(A0_27) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", A0_27, _UPVALUE2_.prefixDelegation, _UPVALUE3_) == FALSE then
    return _UPVALUE1_.FAILURE, A0_27
  end
  return _UPVALUE1_.SUCCESS, A0_27
end
function prefixDelegationDisable(A0_31)
  local L1_32, L2_33, L3_34
  L1_32 = _UPVALUE0_
  L1_32 = L1_32.ipv6ModeGet
  L3_34 = L1_32()
  if tonumber(L3_34) ~= 3 then
    return _UPVALUE1_.NOT_SUPPORTED
  end
  if A0_31 == _UPVALUE1_.NIL or tonumber(A0_31) == _UPVALUE1_.NIL then
    return _UPVALUE1_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpTable, "_ROWID_", A0_31, _UPVALUE2_.prefixDelegation, _UPVALUE3_) == FALSE then
    return _UPVALUE1_.FAILURE, A0_31
  end
  return _UPVALUE1_.SUCCESS, A0_31
end
function dhcpIpGroupGet()
  local L0_35, L1_36, L2_37, L3_38, L4_39
  L0_35 = db
  L0_35 = L0_35.getNextRowId
  L1_36 = 0
  L2_37 = dhcpTable
  L0_35 = L0_35(L1_36, L2_37)
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.NIL
  if L0_35 == L1_36 then
    L1_36 = _UPVALUE0_
    L1_36 = L1_36.FAILURE
    return L1_36
  end
  L1_36 = db
  L1_36 = L1_36.getRow
  L2_37 = dhcpTable
  L3_38 = "_ROWID_"
  L4_39 = L0_35
  L1_36 = L1_36(L2_37, L3_38, L4_39)
  L2_37 = _UPVALUE0_
  L2_37 = L2_37.NIL
  if L1_36 == L2_37 then
    L2_37 = _UPVALUE0_
    L2_37 = L2_37.FAILURE
    return L2_37
  end
  L2_37 = dhcpTable
  L3_38 = "."
  L4_39 = _UPVALUE1_
  L4_39 = L4_39.wanPort
  L2_37 = L2_37 .. L3_38 .. L4_39
  L2_37 = L1_36[L2_37]
  L3_38 = dhcpTable
  L4_39 = "."
  L3_38 = L3_38 .. L4_39 .. _UPVALUE1_.statelessMode
  L3_38 = L1_36[L3_38]
  L4_39 = dhcpTable
  L4_39 = L4_39 .. "." .. _UPVALUE1_.prefixDelegation
  L4_39 = L1_36[L4_39]
  return _UPVALUE0_.SUCCESS, L0_35, L2_37, L3_38, L4_39
end
function dhcpIpGroupGetNext(A0_40)
  local L1_41, L2_42, L3_43, L4_44, L5_45
  L1_41 = _UPVALUE0_
  L1_41 = L1_41.NIL
  if A0_40 ~= L1_41 then
    L1_41 = tonumber
    L2_42 = A0_40
    L1_41 = L1_41(L2_42)
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.NIL
  elseif L1_41 == L2_42 then
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.INVALID_ARGUMENT
    return L1_41
  end
  L1_41 = db
  L1_41 = L1_41.getNextRowId
  L2_42 = A0_40
  L3_43 = dhcpTable
  L1_41 = L1_41(L2_42, L3_43)
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NIL
  if L1_41 == L2_42 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.FAILURE
    return L2_42
  end
  L2_42 = db
  L2_42 = L2_42.getRow
  L3_43 = dhcpTable
  L4_44 = "_ROWID_"
  L5_45 = L1_41
  L2_42 = L2_42(L3_43, L4_44, L5_45)
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NIL
  if L2_42 == L3_43 then
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.FAILURE
    return L3_43
  end
  L3_43 = dhcpTable
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.wanPort
  L3_43 = L3_43 .. L4_44 .. L5_45
  L3_43 = L2_42[L3_43]
  L4_44 = dhcpTable
  L5_45 = "."
  L4_44 = L4_44 .. L5_45 .. _UPVALUE1_.statelessMode
  L4_44 = L2_42[L4_44]
  L5_45 = dhcpTable
  L5_45 = L5_45 .. "." .. _UPVALUE1_.prefixDelegation
  L5_45 = L2_42[L5_45]
  return _UPVALUE0_.SUCCESS, L1_41, L3_43, L4_44, L5_45
end
function dhcpIpGroupSet(A0_46, A1_47, A2_48)
  local L3_49, L4_50, L5_51, L6_52, L7_53, L8_54
  L3_49 = _UPVALUE0_
  L3_49 = L3_49.ipv6ModeGet
  L5_51 = L3_49()
  L6_52 = tonumber
  L7_53 = L5_51
  L6_52 = L6_52(L7_53)
  if L6_52 ~= 3 then
    L6_52 = _UPVALUE1_
    L6_52 = L6_52.IPV6MODE_NOT_ENABLED
    return L6_52
  end
  L6_52 = nil
  if A0_46 ~= "WAN1" and A0_46 ~= "WAN2" then
    L7_53 = _UPVALUE2_
    L7_53 = L7_53.WAN_DHCP_INVALID_WANPORT
    return L7_53
  end
  L7_53 = _UPVALUE3_
  L7_53 = L7_53.NIL
  if A1_47 == L7_53 then
    L7_53 = _UPVALUE2_
    L7_53 = L7_53.WAN_DHCP_STATELESS_MODE_NIL
    return L7_53
  end
  L7_53 = tonumber
  L8_54 = A1_47
  L7_53 = L7_53(L8_54)
  L8_54 = _UPVALUE4_
  if L7_53 ~= L8_54 then
    L7_53 = tonumber
    L8_54 = A1_47
    L7_53 = L7_53(L8_54)
    L8_54 = _UPVALUE5_
    if L7_53 ~= L8_54 then
      L7_53 = _UPVALUE2_
      L7_53 = L7_53.WAN_DHCP_INVALID_STATELESS_MODE
      return L7_53
    end
  end
  L7_53 = _UPVALUE3_
  L7_53 = L7_53.NIL
  if A2_48 == L7_53 then
    L7_53 = _UPVALUE2_
    L7_53 = L7_53.WAN_DHCP_PREFIX_DEL_NIL
    return L7_53
  end
  L7_53 = _UPVALUE6_
  L7_53 = L7_53.isBoolean
  L8_54 = A2_48
  L7_53 = L7_53(L8_54)
  L6_52 = L7_53
  L7_53 = _UPVALUE3_
  L7_53 = L7_53.SUCCESS
  if L6_52 ~= L7_53 then
    L7_53 = _UPVALUE2_
    L7_53 = L7_53.WAN_DHCP_INVALID_PREFIX_DEL
    return L7_53
  end
  L7_53 = nil
  if A0_46 == "WAN1" then
    L7_53 = 1
  else
    L7_53 = 2
  end
  L8_54 = {}
  L8_54[dhcpTable .. "." .. _UPVALUE7_.statelessMode] = A1_47
  L8_54[dhcpTable .. "." .. _UPVALUE7_.prefixDelegation] = A2_48
  if db.update(dhcpTable, L8_54, L7_53) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, L7_53
  end
  return _UPVALUE3_.SUCCESS, L7_53
end
function dhcpIpGroupCreate(A0_55, A1_56)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dhcpIpGroupDelete(A0_57)
  local L2_58
  L2_58 = _UPVALUE0_
  L2_58 = L2_58.NOT_SUPPORTED
  return L2_58, A0_57
end
