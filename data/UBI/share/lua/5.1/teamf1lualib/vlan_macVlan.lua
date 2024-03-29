local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.macvlan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_validation")
L0_0 = require
L0_0("teamf1lualib/cfp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.cfp_returnCodes")
macvlanTable = "MacVlanConfig"
vlanTable = "vlan"
attribute = {}
attribute.keyName = "macAddress"
attribute.macAddress = "macAddress"
attribute.vlanId = "vlanId"
attribute.port = "portNum"
attribute.vlanId = "vlanId"
AdvancedVlanStatusTable = "AdvancedVlanStatus"
attributes = {}
attributes.MacVlanState = "MacVlanState"
vlanMinNumber = 1
vlanMaxNumber = 4096
ROWID = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
FALSE = false
function isfeatureEnabled()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = AdvancedVlanStatusTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(AdvancedVlanStatusTable, ROWID, L0_1, attributes.MacVlanState)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function featureEnable(A0_3)
  if checkCookieExists(A0_3, AdvancedVlanStatusTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(AdvancedVlanStatusTable, ROWID, A0_3, attributes.MacVlanState, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_3
  end
  return _UPVALUE0_.SUCCESS, A0_3
end
function featureDisable(A0_4)
  if checkCookieExists(A0_4, AdvancedVlanStatusTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.setAttribute(AdvancedVlanStatusTable, ROWID, A0_4, attributes.MacVlanState, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4
end
function macAddressGet()
  local L0_5, L1_6
  L0_5 = firstCookieGet
  L1_6 = macvlanTable
  L0_5 = L0_5(L1_6)
  L1_6 = db
  L1_6 = L1_6.getAttribute
  L1_6 = L1_6(macvlanTable, ROWID, L0_5, attribute.macAddress)
  if L1_6 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_5, L1_6
end
function macAddressSet(A0_7, A1_8)
  local L2_9
  if checkCookieExists(A0_7, macvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.MACVLAN_FEATURE_DISABLE
  end
  L2_9 = _UPVALUE1_.isMacAddress(A1_8)
  if L2_9 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(macvlanTable, ROWID, A0_7, attribute.macAddress, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function macAddressDelete(A0_10)
  if checkCookieExists(A0_10, macvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(macvlanTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function macAddressGetNext(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = nextCookieGet
  L2_13 = A0_11
  L3_14 = macvlanTable
  L2_13 = L1_12(L2_13, L3_14)
  L3_14 = FALSE
  if L1_12 == L3_14 then
    L3_14 = NIL
    if L2_13 == L3_14 then
      L3_14 = _UPVALUE0_
      L3_14 = L3_14.NEXT_ROWID_INVALID
      return L3_14
    else
      L3_14 = _UPVALUE0_
      L3_14 = L3_14.INVALID_COOKIE
      return L3_14
    end
  end
  L3_14 = db
  L3_14 = L3_14.getAttribute
  L3_14 = L3_14(macvlanTable, ROWID, L1_12, attribute.macAddress)
  if L3_14 == NIL then
    return _UPVALUE0_.FAILURE, L1_12
  end
  return _UPVALUE0_.SUCCESS, L1_12, L3_14
end
function vlanGet()
  local L0_15, L1_16
  L0_15 = firstCookieGet
  L1_16 = macvlanTable
  L0_15 = L0_15(L1_16)
  L1_16 = db
  L1_16 = L1_16.getAttribute
  L1_16 = L1_16(macvlanTable, ROWID, L0_15, attribute.vlanId)
  if L1_16 == NIL then
    return _UPVALUE0_.FAILURE, L0_15
  end
  return _UPVALUE0_.SUCCESS, L0_15, L1_16
end
function vlanSet(A0_17, A1_18)
  if A1_18 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_18) < vlanMinNumber or tonumber(A1_18) > vlanMaxNumber then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if checkCookieExists(A0_17, macvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.MACVLAN_FEATURE_DISABLE
  end
  if db.setAttribute(macvlanTable, ROWID, A0_17, attribute.vlanId, A1_18) == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function vlanGetNext(A0_19)
  local L1_20, L2_21, L3_22
  L1_20 = nextCookieGet
  L2_21 = A0_19
  L3_22 = macvlanTable
  L2_21 = L1_20(L2_21, L3_22)
  L3_22 = FALSE
  if L1_20 == L3_22 then
    L3_22 = NIL
    if L2_21 == L3_22 then
      L3_22 = _UPVALUE0_
      L3_22 = L3_22.NEXT_ROWID_INVALID
      return L3_22
    else
      L3_22 = _UPVALUE0_
      L3_22 = L3_22.INVALID_COOKIE
      return L3_22
    end
  end
  L3_22 = db
  L3_22 = L3_22.getAttribute
  L3_22 = L3_22(macvlanTable, ROWID, L1_20, attribute.vlanId)
  if L3_22 == NIL then
    return _UPVALUE0_.FAILURE, L1_20
  end
  return _UPVALUE0_.SUCCESS, L1_20, L3_22
end
function portGet()
  local L0_23, L1_24
  L0_23 = firstCookieGet
  L1_24 = macvlanTable
  L0_23 = L0_23(L1_24)
  L1_24 = db
  L1_24 = L1_24.getAttribute
  L1_24 = L1_24(macvlanTable, ROWID, L0_23, attribute.port)
  if L1_24 == NIL then
    return _UPVALUE0_.FAILURE, L0_23
  end
  return _UPVALUE0_.SUCCESS, L0_23, L1_24
end
function portSet(A0_25, A1_26)
  if A1_26 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if portListCheck(A1_26) == FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if checkCookieExists(A0_25, macvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.MACVLAN_FEATURE_DISABLE
  end
  if db.setAttribute(macvlanTable, ROWID, A0_25, attribute.port, A1_26) == NIL then
    return _UPVALUE0_.FAILURE, A0_25
  end
  return _UPVALUE0_.SUCCESS, A0_25
end
function portGetNext(A0_27)
  local L1_28, L2_29, L3_30
  L1_28 = nextCookieGet
  L2_29 = A0_27
  L3_30 = macvlanTable
  L2_29 = L1_28(L2_29, L3_30)
  L3_30 = FALSE
  if L1_28 == L3_30 then
    L3_30 = NIL
    if L2_29 == L3_30 then
      L3_30 = _UPVALUE0_
      L3_30 = L3_30.NEXT_ROWID_INVALID
      return L3_30
    else
      L3_30 = _UPVALUE0_
      L3_30 = L3_30.INVALID_COOKIE
      return L3_30
    end
  end
  L3_30 = db
  L3_30 = L3_30.getAttribute
  L3_30 = L3_30(macvlanTable, ROWID, L1_28, attribute.port)
  if L3_30 == NIL then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, L3_30
end
function macVlanGetNext(A0_31)
  local L1_32
  L1_32 = nextCookieGet
  L1_32 = L1_32(A0_31, macvlanTable)
  if L1_32 == FALSE then
    if L1_32(A0_31, macvlanTable) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(macvlanTable, ROWID, L1_32) == NIL then
    return _UPVALUE0_.FAILURE, L1_32
  end
  return _UPVALUE0_.SUCCESS, L1_32, db.getRow(macvlanTable, ROWID, L1_32)[macvlanTable .. "." .. attribute.macAddress], db.getRow(macvlanTable, ROWID, L1_32)[macvlanTable .. "." .. attribute.vlanId], db.getRow(macvlanTable, ROWID, L1_32)[macvlanTable .. "." .. attribute.port]
end
function macVlanGetCur(A0_33)
  if db.getRow(macvlanTable, ROWID, A0_33) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_33, db.getRow(macvlanTable, ROWID, A0_33)[macvlanTable .. "." .. attribute.macAddress], db.getRow(macvlanTable, ROWID, A0_33)[macvlanTable .. "." .. attribute.vlanId], db.getRow(macvlanTable, ROWID, A0_33)[macvlanTable .. "." .. attribute.port]
end
function macVlanGet()
  local L0_34
  L0_34 = firstCookieGet
  L0_34 = L0_34(macvlanTable)
  if db.getRow(macvlanTable, ROWID, L0_34) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_34, db.getRow(macvlanTable, ROWID, L0_34)[macvlanTable .. "." .. attribute.macAddress], db.getRow(macvlanTable, ROWID, L0_34)[macvlanTable .. "." .. attribute.vlanId], db.getRow(macvlanTable, ROWID, L0_34)[macvlanTable .. "." .. attribute.port]
end
function macVlanGetAll()
  local L0_35
  L0_35 = db
  L0_35 = L0_35.getTable
  L0_35 = L0_35(macvlanTable, FALSE)
  if L0_35 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_35
end
function macVlanCreate(A0_36, A1_37, A2_38)
  local L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48, L13_49
  L4_40 = NIL
  if A0_36 == L4_40 then
    L4_40 = _UPVALUE0_
    L4_40 = L4_40.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_NIL
    return L4_40
  end
  L4_40 = isfeatureEnabled
  L6_42 = L4_40()
  L7_43 = DISABLE
  if L6_42 == L7_43 then
    L7_43 = _UPVALUE0_
    L7_43 = L7_43.COMP_CFP_DAEMON_MACVLAN_FEATURE_DISABLE
    return L7_43
  end
  L7_43 = _UPVALUE1_
  L7_43 = L7_43.isMacAddress
  L8_44 = A0_36
  L7_43 = L7_43(L8_44)
  L3_39 = L7_43
  L7_43 = _UPVALUE2_
  L7_43 = L7_43.ERROR
  if L3_39 == L7_43 then
    L7_43 = _UPVALUE0_
    L7_43 = L7_43.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_INVALID
    return L7_43
  end
  L7_43 = NIL
  if A1_37 == L7_43 then
    L7_43 = _UPVALUE0_
    L7_43 = L7_43.COMP_CFP_DAEMON_MACVLAN_VLANID_NIL
    return L7_43
  end
  L7_43 = tonumber
  L8_44 = A1_37
  L7_43 = L7_43(L8_44)
  L8_44 = vlanMinNumber
  if not (L7_43 < L8_44) then
    L8_44 = vlanMaxNumber
  elseif L7_43 > L8_44 then
    L8_44 = _UPVALUE0_
    L8_44 = L8_44.COMP_CFP_DAEMON_MACVLAN_VLANID_INVALID
    return L8_44
  end
  L8_44 = db
  L8_44 = L8_44.existsRow
  L9_45 = vlanTable
  L10_46 = attribute
  L10_46 = L10_46.vlanId
  L11_47 = A1_37
  L8_44 = L8_44(L9_45, L10_46, L11_47)
  if not L8_44 then
    L9_45 = _UPVALUE0_
    L9_45 = L9_45.COMP_CFP_DAEMON_MACVLAN_VLANID_NOT_EXISTS
    return L9_45
  end
  L9_45 = NIL
  if A2_38 == L9_45 then
    L9_45 = _UPVALUE0_
    L9_45 = L9_45.COMP_CFP_DAEMON_MACVLAN_PORT_NIL
    return L9_45
  end
  L9_45 = portListCheck
  L10_46 = A2_38
  L9_45 = L9_45(L10_46)
  L10_46 = FALSE
  if L9_45 == L10_46 then
    L9_45 = _UPVALUE0_
    L9_45 = L9_45.COMP_CFP_DAEMON_MACVLAN_PORT_INVALID
    return L9_45
  end
  L9_45 = attribute
  L9_45 = L9_45.macAddress
  L10_46 = "='"
  L11_47 = A0_36
  L12_48 = "' and "
  L13_49 = attribute
  L13_49 = L13_49.port
  L9_45 = L9_45 .. L10_46 .. L11_47 .. L12_48 .. L13_49 .. "='" .. A2_38 .. "'"
  L10_46 = db
  L10_46 = L10_46.existsRowWhere
  L11_47 = macvlanTable
  L12_48 = L9_45
  L10_46 = L10_46(L11_47, L12_48)
  if L10_46 then
    L11_47 = _UPVALUE0_
    L11_47 = L11_47.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_EXISTS
    return L11_47
  end
  L11_47 = {}
  L12_48 = macvlanTable
  L13_49 = "."
  L12_48 = L12_48 .. L13_49 .. attribute.macAddress
  L11_47[L12_48] = A0_36
  L12_48 = macvlanTable
  L13_49 = "."
  L12_48 = L12_48 .. L13_49 .. attribute.vlanId
  L11_47[L12_48] = A1_37
  L12_48 = macvlanTable
  L13_49 = "."
  L12_48 = L12_48 .. L13_49 .. attribute.port
  L11_47[L12_48] = A2_38
  L12_48 = db
  L12_48 = L12_48.insert
  L13_49 = macvlanTable
  L12_48 = L12_48(L13_49, L11_47)
  L13_49 = db
  L13_49 = L13_49.getAttribute
  L13_49 = L13_49(macvlanTable, attribute.keyName, A0_36, ROWID)
  if L12_48 == NIL then
    return _UPVALUE2_.FAILURE, L13_49
  end
  return _UPVALUE2_.SUCCESS, L13_49
end
function macVlanSet(A0_50, A1_51, A2_52, A3_53)
  local L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62
  L5_55 = checkCookieExists
  L6_56 = A0_50
  L7_57 = macvlanTable
  L5_55 = L5_55(L6_56, L7_57)
  L6_56 = FALSE
  if L5_55 == L6_56 then
    L5_55 = _UPVALUE0_
    L5_55 = L5_55.INVALID_COOKIE
    return L5_55
  end
  L5_55 = isfeatureEnabled
  L7_57 = L5_55()
  L8_58 = DISABLE
  if L7_57 == L8_58 then
    L8_58 = _UPVALUE1_
    L8_58 = L8_58.COMP_CFP_DAEMON_MACVLAN_FEATURE_DISABLE
    return L8_58
  end
  L8_58 = NIL
  if A1_51 == L8_58 then
    L8_58 = _UPVALUE1_
    L8_58 = L8_58.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_NIL
    return L8_58
  end
  L8_58 = _UPVALUE2_
  L8_58 = L8_58.isMacAddress
  L9_59 = A1_51
  L8_58 = L8_58(L9_59)
  L4_54 = L8_58
  L8_58 = _UPVALUE0_
  L8_58 = L8_58.ERROR
  if L4_54 == L8_58 then
    L8_58 = _UPVALUE1_
    L8_58 = L8_58.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_INVALID
    return L8_58
  end
  L8_58 = attribute
  L8_58 = L8_58.macAddress
  L9_59 = "='"
  L10_60 = A1_51
  L11_61 = "' and "
  L12_62 = attribute
  L12_62 = L12_62.port
  L8_58 = L8_58 .. L9_59 .. L10_60 .. L11_61 .. L12_62 .. "='" .. A3_53 .. "'"
  L9_59 = db
  L9_59 = L9_59.existsRowWhere
  L10_60 = macvlanTable
  L11_61 = L8_58
  L9_59 = L9_59(L10_60, L11_61)
  if L9_59 then
    L10_60 = _UPVALUE1_
    L10_60 = L10_60.COMP_CFP_DAEMON_MACVLAN_MACADDRESS_EXISTS
    return L10_60
  end
  L10_60 = NIL
  if A2_52 == L10_60 then
    L10_60 = _UPVALUE1_
    L10_60 = L10_60.COMP_CFP_DAEMON_MACVLAN_VLANID_NIL
    return L10_60
  end
  L10_60 = tonumber
  L11_61 = A2_52
  L10_60 = L10_60(L11_61)
  L11_61 = vlanMinNumber
  if not (L10_60 < L11_61) then
    L11_61 = vlanMaxNumber
  elseif L10_60 > L11_61 then
    L11_61 = _UPVALUE1_
    L11_61 = L11_61.COMP_CFP_DAEMON_MACVLAN_VLANID_INVALID
    return L11_61
  end
  L11_61 = db
  L11_61 = L11_61.existsRow
  L12_62 = vlanTable
  L11_61 = L11_61(L12_62, attribute.vlanId, A2_52)
  if not L11_61 then
    L12_62 = _UPVALUE1_
    L12_62 = L12_62.COMP_CFP_DAEMON_MACVLAN_VLANID_NOT_EXISTS
    return L12_62
  end
  L12_62 = NIL
  if A3_53 == L12_62 then
    L12_62 = _UPVALUE1_
    L12_62 = L12_62.COMP_CFP_DAEMON_MACVLAN_PORT_NIL
    return L12_62
  end
  L12_62 = portListCheck
  L12_62 = L12_62(A3_53)
  if L12_62 == FALSE then
    L12_62 = _UPVALUE1_
    L12_62 = L12_62.COMP_CFP_DAEMON_MACVLAN_PORT_INVALID
    return L12_62
  end
  L12_62 = {}
  L12_62[macvlanTable .. "." .. attribute.macAddress] = A1_51
  L12_62[macvlanTable .. "." .. attribute.vlanId] = A2_52
  L12_62[macvlanTable .. "." .. attribute.port] = A3_53
  if db.update(macvlanTable, L12_62, A0_50) == NIL then
    return _UPVALUE0_.FAILURE, A0_50
  end
  return _UPVALUE0_.SUCCESS, A0_50
end
function macVlanDelete(A0_63)
  if checkCookieExists(A0_63, macvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if isfeatureEnabled() == ENABLE then
    return _UPVALUE1_.COMP_CFP_DAEMON_MACVLAN_FEATURE_ENABLE
  end
  if db.deleteRow(macvlanTable, ROWID, A0_63) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function macVlanDeleteAll()
  if isfeatureEnabled() == ENABLE then
    return _UPVALUE0_.COMP_CFP_DAEMON_MACVLAN_FEATURE_ENABLE
  end
  if db.deleteAllRows(macvlanTable) == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
