local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.protocolvlan", package.seeall)
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
protocolvlanTable = "ProtocolVlanConfig"
vlanTable = "vlan"
attribute = {}
attribute.keyName = "GroupId"
attribute.groupId = "GroupId"
attribute.groupName = "GroupName"
attribute.port = "portNum"
attribute.protocol = "protocol"
attribute.vlan = "vlanId"
AdvancedVlanStatusTable = "AdvancedVlanStatus"
attributes = {}
attributes.ProtocolVlanState = "ProtocolVlanState"
vlanMinNumber = 1
vlanMaxNumber = 4096
protocolType = {}
protocolType.ip = "IP"
protocolType.ipx = "IPX"
protocolType.arp = "ARP"
ROWID = "_ROWID_"
ENABLE = "1"
DISABLE = "0"
MIN_ID_LENGTH = 0
MAX_ID_LENGTH = 4
MIN_STRING_LENGTH = 0
MAX_STRING_LENGTH = 32
DEFAULT_COOKIE = "1"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(AdvancedVlanStatusTable, ROWID, DEFAULT_COOKIE, attributes.ProtocolVlanState)
  if L0_1 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_1
end
function featureEnable()
  if db.setAttribute(AdvancedVlanStatusTable, ROWID, DEFAULT_COOKIE, attributes.ProtocolVlanState, ENABLE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function featureDisable()
  if db.setAttribute(AdvancedVlanStatusTable, ROWID, DEFAULT_COOKIE, attributes.ProtocolVlanState, DISABLE) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function groupIdGet()
  local L0_2, L1_3
  L0_2 = firstCookieGet
  L1_3 = protocolvlanTable
  L0_2 = L0_2(L1_3)
  L1_3 = db
  L1_3 = L1_3.getAttribute
  L1_3 = L1_3(protocolvlanTable, ROWID, L0_2, attribute.groupId)
  if L1_3 == NIL then
    return _UPVALUE0_.FAILURE, L0_2
  end
  return _UPVALUE0_.SUCCESS, L0_2, L1_3
end
function groupIdSet(A0_4, A1_5)
  local L2_6
  if checkCookieExists(A0_4, protocolvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.PROTOCOLVLAN_FEATURE_DISABLE
  end
  if A1_5 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_6 = _UPVALUE1_.stringLengthCheck(MIN_ID_LENGTH, MAX_ID_LENGTH, A1_5)
  if L2_6 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(protocolvlanTable, ROWID, A0_4, attribute.groupId, A1_5) == NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4
end
function groupIdGetNext(A0_7)
  local L1_8, L2_9, L3_10
  L1_8 = nextCookieGet
  L2_9 = A0_7
  L3_10 = protocolvlanTable
  L2_9 = L1_8(L2_9, L3_10)
  L3_10 = FALSE
  if L1_8 == L3_10 then
    L3_10 = NIL
    if L2_9 == L3_10 then
      L3_10 = _UPVALUE0_
      L3_10 = L3_10.NEXT_ROWID_INVALID
      return L3_10
    else
      L3_10 = _UPVALUE0_
      L3_10 = L3_10.INVALID_COOKIE
      return L3_10
    end
  end
  L3_10 = db
  L3_10 = L3_10.getAttribute
  L3_10 = L3_10(protocolvlanTable, ROWID, L1_8, attribute.groupId)
  if L3_10 == NIL then
    return _UPVALUE0_.FAILURE, L1_8
  end
  return _UPVALUE0_.SUCCESS, L1_8, L3_10
end
function groupIdDelete(A0_11)
  if checkCookieExists(A0_11, protocolvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if db.deleteRow(protocolvlanTable, ROWID, A0_11) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function groupNameGet()
  local L0_12, L1_13
  L0_12 = firstCookieGet
  L1_13 = protocolvlanTable
  L0_12 = L0_12(L1_13)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(protocolvlanTable, ROWID, L0_12, attribute.groupName)
  if L1_13 == NIL then
    return _UPVALUE0_.FAILURE, L0_12
  end
  return _UPVALUE0_.SUCCESS, L0_12, L1_13
end
function groupNameSet(A0_14, A1_15)
  local L2_16
  if checkCookieExists(A0_14, protocolvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_15 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_16 = _UPVALUE1_.stringLengthCheck(MIN_STRING_LENGTH, MAX_STRING_LENGTH, A1_15)
  if L2_16 == _UPVALUE0_.ERROR then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.PROTOCOLVLAN_FEATURE_DISABLE
  end
  if db.setAttribute(protocolvlanTable, ROWID, A0_14, attribute.groupName, A1_15) == NIL then
    return _UPVALUE0_.FAILURE, A0_14
  end
  return _UPVALUE0_.SUCCESS, A0_14
end
function groupNameGetNext(A0_17)
  local L1_18, L2_19, L3_20
  L1_18 = nextCookieGet
  L2_19 = A0_17
  L3_20 = protocolvlanTable
  L2_19 = L1_18(L2_19, L3_20)
  L3_20 = FALSE
  if L1_18 == L3_20 then
    L3_20 = NIL
    if L2_19 == L3_20 then
      L3_20 = _UPVALUE0_
      L3_20 = L3_20.NEXT_ROWID_INVALID
      return L3_20
    else
      L3_20 = _UPVALUE0_
      L3_20 = L3_20.INVALID_COOKIE
      return L3_20
    end
  end
  L3_20 = db
  L3_20 = L3_20.getAttribute
  L3_20 = L3_20(protocolvlanTable, ROWID, L1_18, attribute.groupName)
  if L3_20 == NIL then
    return _UPVALUE0_.FAILURE, L1_18
  end
  return _UPVALUE0_.SUCCESS, L1_18, L3_20
end
function portGet()
  local L0_21, L1_22
  L0_21 = firstCookieGet
  L1_22 = protocolvlanTable
  L0_21 = L0_21(L1_22)
  L1_22 = db
  L1_22 = L1_22.getAttribute
  L1_22 = L1_22(protocolvlanTable, ROWID, L0_21, attribute.port)
  if L1_22 == NIL then
    return _UPVALUE0_.FAILURE, L0_21
  end
  return _UPVALUE0_.SUCCESS, L0_21, L1_22
end
function portSet(A0_23, A1_24)
  if checkCookieExists(A0_23, protocolvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if A1_24 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if portListCheck(A1_24) == FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.PROTOCOLVLAN_FEATURE_DISABLE
  end
  if db.setAttribute(protocolvlanTable, ROWID, A0_23, attribute.port, A1_24) == NIL then
    return _UPVALUE0_.FAILURE, A0_23
  end
  return _UPVALUE0_.SUCCESS, A0_23
end
function portGetNext(A0_25)
  local L1_26, L2_27, L3_28
  L1_26 = nextCookieGet
  L2_27 = A0_25
  L3_28 = protocolvlanTable
  L2_27 = L1_26(L2_27, L3_28)
  L3_28 = FALSE
  if L1_26 == L3_28 then
    L3_28 = NIL
    if L2_27 == L3_28 then
      L3_28 = _UPVALUE0_
      L3_28 = L3_28.NEXT_ROWID_INVALID
      return L3_28
    else
      L3_28 = _UPVALUE0_
      L3_28 = L3_28.INVALID_COOKIE
      return L3_28
    end
  end
  L3_28 = db
  L3_28 = L3_28.getAttribute
  L3_28 = L3_28(protocolvlanTable, ROWID, L1_26, attribute.port)
  if L3_28 == NIL then
    return _UPVALUE0_.FAILURE, L1_26
  end
  return _UPVALUE0_.SUCCESS, L1_26, L3_28
end
function protocolGet()
  local L0_29, L1_30
  L0_29 = firstCookieGet
  L1_30 = protocolvlanTable
  L0_29 = L0_29(L1_30)
  L1_30 = db
  L1_30 = L1_30.getAttribute
  L1_30 = L1_30(protocolvlanTable, ROWID, L0_29, attribute.protocol)
  if L1_30 == NIL then
    return _UPVALUE0_.FAILURE, L0_29
  end
  return _UPVALUE0_.SUCCESS, L0_29, L1_30
end
function protocolSet(A0_31, A1_32)
  if checkCookieExists(A0_31, protocolvlanTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIE
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.PROTOCOLVLAN_FEATURE_DISABLE
  end
  if A1_32 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_32 ~= protocolType.ip and A1_32 ~= protocolType.ipx and A1_32 ~= protocolType.arp then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(protocolvlanTable, ROWID, A0_31, attribute.protocol, A1_32) == NIL then
    return _UPVALUE0_.FAILURE, A0_31
  end
  return _UPVALUE0_.SUCCESS, A0_31
end
function protocolGetNext(A0_33)
  local L1_34, L2_35, L3_36
  L1_34 = nextCookieGet
  L2_35 = A0_33
  L3_36 = protocolvlanTable
  L2_35 = L1_34(L2_35, L3_36)
  L3_36 = FALSE
  if L1_34 == L3_36 then
    L3_36 = NIL
    if L2_35 == L3_36 then
      L3_36 = _UPVALUE0_
      L3_36 = L3_36.NEXT_ROWID_INVALID
      return L3_36
    else
      L3_36 = _UPVALUE0_
      L3_36 = L3_36.INVALID_COOKIE
      return L3_36
    end
  end
  L3_36 = db
  L3_36 = L3_36.getAttribute
  L3_36 = L3_36(protocolvlanTable, ROWID, L1_34, attribute.protocol)
  if L3_36 == NIL then
    return _UPVALUE0_.FAILURE, L1_34
  end
  return _UPVALUE0_.SUCCESS, L1_34, L3_36
end
function vlanGet()
  local L0_37, L1_38
  L0_37 = firstCookieGet
  L1_38 = protocolvlanTable
  L0_37 = L0_37(L1_38)
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(protocolvlanTable, ROWID, L0_37, attribute.vlan)
  if L1_38 == NIL then
    return _UPVALUE0_.FAILURE, L0_37
  end
  return _UPVALUE0_.SUCCESS, L0_37, L1_38
end
function vlanSet(A0_39, A1_40)
  if A1_40 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if isfeatureEnabled() == DISABLE then
    return _UPVALUE0_.PROTOCOLVLAN_FEATURE_DISABLE
  end
  if tonumber(A1_40) < vlanMinNumber or tonumber(A1_40) > vlanMaxNumber then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(protocolvlanTable, ROWID, A0_39, attribute.vlan, A1_40) == NIL then
    return _UPVALUE0_.FAILURE, A0_39
  end
  return _UPVALUE0_.SUCCESS, A0_39
end
function vlanGetNext(A0_41)
  local L1_42, L2_43, L3_44
  L1_42 = nextCookieGet
  L2_43 = A0_41
  L3_44 = protocolvlanTable
  L2_43 = L1_42(L2_43, L3_44)
  L3_44 = FALSE
  if L1_42 == L3_44 then
    L3_44 = NIL
    if L2_43 == L3_44 then
      L3_44 = _UPVALUE0_
      L3_44 = L3_44.NEXT_ROWID_INVALID
      return L3_44
    else
      L3_44 = _UPVALUE0_
      L3_44 = L3_44.INVALID_COOKIE
      return L3_44
    end
  end
  L3_44 = db
  L3_44 = L3_44.getAttribute
  L3_44 = L3_44(protocolvlanTable, ROWID, L1_42, attribute.vlan)
  if L3_44 == NIL then
    return _UPVALUE0_.FAILURE, L1_42
  end
  return _UPVALUE0_.SUCCESS, L1_42, L3_44
end
function protocolVlanGet(A0_45)
  if db.getRow(protocolvlanTable, ROWID, A0_45) == NIL then
    return _UPVALUE0_.FAILURE, A0_45
  end
  return _UPVALUE0_.SUCCESS, A0_45, db.getRow(protocolvlanTable, ROWID, A0_45)[protocolvlanTable .. "." .. attribute.groupId], db.getRow(protocolvlanTable, ROWID, A0_45)[protocolvlanTable .. "." .. attribute.groupName], db.getRow(protocolvlanTable, ROWID, A0_45)[protocolvlanTable .. "." .. attribute.port], db.getRow(protocolvlanTable, ROWID, A0_45)[protocolvlanTable .. "." .. attribute.protocol], db.getRow(protocolvlanTable, ROWID, A0_45)[protocolvlanTable .. "." .. attribute.vlan]
end
function protocolVlanGetAll()
  local L0_46
  L0_46 = db
  L0_46 = L0_46.getTable
  L0_46 = L0_46(protocolvlanTable, false)
  if L0_46 == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_46
end
function protocolVlanCreate(A0_47, A1_48, A2_49, A3_50, A4_51)
  local L5_52, L6_53, L7_54, L8_55, L9_56, L10_57, L11_58, L12_59, L13_60
  L6_53 = isfeatureEnabled
  L7_54 = L6_53()
  L8_55 = DISABLE
  if L7_54 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_FEATURE_DISABLE
    return L8_55
  end
  L8_55 = NIL
  if A0_47 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPID_NIL
    return L8_55
  end
  L8_55 = _UPVALUE1_
  L8_55 = L8_55.stringLengthCheck
  L9_56 = MIN_ID_LENGTH
  L10_57 = MAX_ID_LENGTH
  L11_58 = A0_47
  L8_55 = L8_55(L9_56, L10_57, L11_58)
  L5_52 = L8_55
  L8_55 = _UPVALUE2_
  L8_55 = L8_55.ERROR
  if L5_52 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPID_INVALID
    return L8_55
  end
  L8_55 = NIL
  if A1_48 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPNAME_NIL
    return L8_55
  end
  L8_55 = _UPVALUE1_
  L8_55 = L8_55.stringLengthCheck
  L9_56 = MIN_STRING_LENGTH
  L10_57 = MAX_STRING_LENGTH
  L11_58 = A1_48
  L8_55 = L8_55(L9_56, L10_57, L11_58)
  L5_52 = L8_55
  L8_55 = _UPVALUE2_
  L8_55 = L8_55.ERROR
  if L5_52 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPNAME_INVALID
    return L8_55
  end
  L8_55 = NIL
  if A2_49 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_PORT_NIL
    return L8_55
  end
  L8_55 = portListCheck
  L9_56 = A2_49
  L8_55 = L8_55(L9_56)
  L9_56 = FALSE
  if L8_55 == L9_56 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_PORT_INVALID
    return L8_55
  end
  L8_55 = NIL
  if A3_50 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_PROTOCOL_NIL
    return L8_55
  end
  L8_55 = protocolType
  L8_55 = L8_55.ip
  if A3_50 ~= L8_55 then
    L8_55 = protocolType
    L8_55 = L8_55.ipx
    if A3_50 ~= L8_55 then
      L8_55 = protocolType
      L8_55 = L8_55.arp
      if A3_50 ~= L8_55 then
        L8_55 = _UPVALUE0_
        L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_PROTOCOL_INVALID
        return L8_55
      end
    end
  end
  L8_55 = NIL
  if A4_51 == L8_55 then
    L8_55 = _UPVALUE0_
    L8_55 = L8_55.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_NIL
    return L8_55
  end
  L8_55 = tonumber
  L9_56 = A4_51
  L8_55 = L8_55(L9_56)
  L9_56 = vlanMinNumber
  if not (L8_55 < L9_56) then
    L9_56 = vlanMaxNumber
  elseif L8_55 > L9_56 then
    L9_56 = _UPVALUE0_
    L9_56 = L9_56.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_INVALID
    return L9_56
  end
  L9_56 = db
  L9_56 = L9_56.existsRow
  L10_57 = vlanTable
  L11_58 = attribute
  L11_58 = L11_58.vlan
  L12_59 = A4_51
  L9_56 = L9_56(L10_57, L11_58, L12_59)
  if not L9_56 then
    L10_57 = _UPVALUE0_
    L10_57 = L10_57.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_NOT_EXISTS
    return L10_57
  end
  L10_57 = db
  L10_57 = L10_57.existsRow
  L11_58 = protocolvlanTable
  L12_59 = attribute
  L12_59 = L12_59.groupId
  L13_60 = A0_47
  L10_57 = L10_57(L11_58, L12_59, L13_60)
  if L10_57 then
    L11_58 = _UPVALUE0_
    L11_58 = L11_58.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPID_EXISTS
    return L11_58
  end
  L11_58 = {}
  L12_59 = protocolvlanTable
  L13_60 = "."
  L12_59 = L12_59 .. L13_60 .. attribute.groupId
  L11_58[L12_59] = A0_47
  L12_59 = protocolvlanTable
  L13_60 = "."
  L12_59 = L12_59 .. L13_60 .. attribute.groupName
  L11_58[L12_59] = A1_48
  L12_59 = protocolvlanTable
  L13_60 = "."
  L12_59 = L12_59 .. L13_60 .. attribute.port
  L11_58[L12_59] = A2_49
  L12_59 = protocolvlanTable
  L13_60 = "."
  L12_59 = L12_59 .. L13_60 .. attribute.vlan
  L11_58[L12_59] = A4_51
  L12_59 = protocolvlanTable
  L13_60 = "."
  L12_59 = L12_59 .. L13_60 .. attribute.protocol
  L11_58[L12_59] = A3_50
  L12_59 = db
  L12_59 = L12_59.insert
  L13_60 = protocolvlanTable
  L12_59 = L12_59(L13_60, L11_58)
  L13_60 = db
  L13_60 = L13_60.getAttribute
  L13_60 = L13_60(protocolvlanTable, attribute.keyName, A0_47, ROWID)
  if L12_59 == NIL then
    return _UPVALUE2_.FAILURE, L13_60
  end
  return _UPVALUE2_.SUCCESS, L13_60
end
function protocolVlanSet(A0_61, A1_62, A2_63, A3_64, A4_65)
  local L5_66, L6_67, L7_68, L8_69, L9_70, L10_71
  L6_67 = checkCookieExists
  L7_68 = A0_61
  L8_69 = protocolvlanTable
  L6_67 = L6_67(L7_68, L8_69)
  L7_68 = FALSE
  if L6_67 == L7_68 then
    L6_67 = _UPVALUE0_
    L6_67 = L6_67.INVALID_COOKIE
    return L6_67
  end
  L6_67 = isfeatureEnabled
  L7_68 = L6_67()
  L8_69 = DISABLE
  if L7_68 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_FEATURE_DISABLE
    return L8_69
  end
  L8_69 = NIL
  if A1_62 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPNAME_NIL
    return L8_69
  end
  L8_69 = _UPVALUE2_
  L8_69 = L8_69.stringLengthCheck
  L9_70 = MIN_STRING_LENGTH
  L10_71 = MAX_STRING_LENGTH
  L8_69 = L8_69(L9_70, L10_71, A1_62)
  L5_66 = L8_69
  L8_69 = _UPVALUE0_
  L8_69 = L8_69.ERROR
  if L5_66 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_GROUPNAME_INVALID
    return L8_69
  end
  L8_69 = NIL
  if A2_63 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_PORT_NIL
    return L8_69
  end
  L8_69 = portListCheck
  L9_70 = A2_63
  L8_69 = L8_69(L9_70)
  L9_70 = FALSE
  if L8_69 == L9_70 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_PORT_INVALID
    return L8_69
  end
  L8_69 = NIL
  if A3_64 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_PROTOCOL_NIL
    return L8_69
  end
  L8_69 = protocolType
  L8_69 = L8_69.ip
  if A3_64 ~= L8_69 then
    L8_69 = protocolType
    L8_69 = L8_69.ipx
    if A3_64 ~= L8_69 then
      L8_69 = protocolType
      L8_69 = L8_69.arp
      if A3_64 ~= L8_69 then
        L8_69 = _UPVALUE1_
        L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_PROTOCOL_INVALID
        return L8_69
      end
    end
  end
  L8_69 = NIL
  if A4_65 == L8_69 then
    L8_69 = _UPVALUE1_
    L8_69 = L8_69.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_NIL
    return L8_69
  end
  L8_69 = tonumber
  L9_70 = A4_65
  L8_69 = L8_69(L9_70)
  L9_70 = vlanMinNumber
  if not (L8_69 < L9_70) then
    L9_70 = vlanMaxNumber
  elseif L8_69 > L9_70 then
    L9_70 = _UPVALUE1_
    L9_70 = L9_70.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_INVALID
    return L9_70
  end
  L9_70 = db
  L9_70 = L9_70.existsRow
  L10_71 = vlanTable
  L9_70 = L9_70(L10_71, attribute.vlan, A4_65)
  if not L9_70 then
    L10_71 = _UPVALUE1_
    L10_71 = L10_71.COMP_CFP_DAEMON_PROTOCOLVLAN_VLANID_NOT_EXISTS
    return L10_71
  end
  L10_71 = {}
  L10_71[protocolvlanTable .. "." .. attribute.groupName] = A1_62
  L10_71[protocolvlanTable .. "." .. attribute.port] = A2_63
  L10_71[protocolvlanTable .. "." .. attribute.vlan] = A4_65
  L10_71[protocolvlanTable .. "." .. attribute.protocol] = A3_64
  if db.update(protocolvlanTable, L10_71, A0_61) == NIL then
    return _UPVALUE0_.FAILURE, A0_61
  end
  return _UPVALUE0_.SUCCESS, A0_61
end
function protocolVlanGetNext(A0_72)
  local L1_73
  L1_73 = nextCookieGet
  L1_73 = L1_73(A0_72, protocolvlanTable)
  if L1_73 == FALSE then
    if L1_73(A0_72, protocolvlanTable) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(protocolvlanTable, ROWID, L1_73) == NIL then
    return _UPVALUE0_.FAILURE, L1_73
  end
  return _UPVALUE0_.SUCCESS, L1_73, db.getRow(protocolvlanTable, ROWID, L1_73)[protocolvlanTable .. "." .. attribute.groupId], db.getRow(protocolvlanTable, ROWID, L1_73)[protocolvlanTable .. "." .. attribute.groupName], db.getRow(protocolvlanTable, ROWID, L1_73)[protocolvlanTable .. "." .. attribute.port], db.getRow(protocolvlanTable, ROWID, L1_73)[protocolvlanTable .. "." .. attribute.protocol], db.getRow(protocolvlanTable, ROWID, L1_73)[protocolvlanTable .. "." .. attribute.vlan]
end
function protocolVlanDelete(A0_74)
  if isfeatureEnabled() == ENABLE then
    return _UPVALUE0_.COMP_CFP_DAEMON_PROTOCOLVLAN_FEATURE_ENABLE
  end
  if checkCookieExists(A0_74, protocolvlanTable) == FALSE then
    return _UPVALUE1_.INVALID_COOKIE
  end
  if db.deleteRow(protocolvlanTable, ROWID, A0_74) == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function protocolVlanDeleteAll()
  if isfeatureEnabled() == ENABLE then
    return _UPVALUE0_.COMP_CFP_DAEMON_PROTOCOLVLAN_FEATURE_ENABLE
  end
  if db.deleteAllRows(protocolvlanTable) == NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
