local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.sessions", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captiveportal_validations")
L0_0 = require
L0_0("captivePortalLib")
L0_0 = "CaptivePortalSession"
sessionsTable = L0_0
L0_0 = "intervlanrouting"
interVlanTable = L0_0
L0_0 = "CaptivePortalSSID"
SSIDTable = L0_0
L0_0 = {}
attribute = L0_0
L0_0 = attribute
L0_0.user = "UserName"
L0_0 = attribute
L0_0.ipAddress = "ipAddr"
L0_0 = attribute
L0_0.ifName = "ifName"
L0_0 = attribute
L0_0.authType = "authType"
L0_0 = attribute
L0_0.MACAddress = "macAddr"
L0_0 = attribute
L0_0.idleTimeout = "idleTimeout"
L0_0 = attribute
L0_0.sessionTimeout = "sessionTimeOut"
L0_0 = attribute
L0_0.interfaceNumber = "intfNum"
L0_0 = attribute
L0_0.accessType = "accessType"
L0_0 = attribute
L0_0.vlanId = "vlanId"
L0_0 = "bdg"
BDG = L0_0
L0_0 = "_ROWID_"
ROWID = L0_0
L0_0 = "2"
IPV4_ADDRESS_FAMILY = L0_0
L0_0 = nil
NIL = L0_0
L0_0 = false
FALSE = L0_0
L0_0 = "1"
WLAN_CLIENT = L0_0
L0_0 = "0"
LAN_CLIENT = L0_0
L0_0 = "captivePortalSSID"
function userGet()
  local L0_1, L1_2, L2_3
  L0_1 = getFirstCookie
  L1_2 = ROWID
  L2_3 = sessionsTable
  L1_2 = L0_1(L1_2, L2_3)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  if L0_1 ~= L2_3 then
    return L0_1
  end
  L2_3 = db
  L2_3 = L2_3.getAttribute
  L2_3 = L2_3(sessionsTable, ROWID, L1_2, attribute.user)
  if L2_3 == nil then
    return _UPVALUE0_.FAILURE, L1_2
  end
  return _UPVALUE0_.SUCCESS, L1_2, L2_3
end
function userGetNext(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9
  L1_5 = NIL
  if A0_4 == L1_5 then
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.INVALID_ARGUMENT
    return L1_5
  end
  L1_5 = cookieValidate
  L2_6 = ROWID
  L3_7 = A0_4
  L4_8 = sessionsTable
  L2_6 = L1_5(L2_6, L3_7, L4_8)
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.SUCCESS
  if L1_5 ~= L3_7 then
    return L1_5
  end
  L3_7 = getNextValidCookie
  L4_8 = L2_6
  L5_9 = sessionsTable
  L4_8 = L3_7(L4_8, L5_9)
  L5_9 = _UPVALUE0_
  L5_9 = L5_9.SUCCESS
  if L3_7 ~= L5_9 then
    return L3_7
  end
  L5_9 = db
  L5_9 = L5_9.getAttribute
  L5_9 = L5_9(sessionsTable, ROWID, L4_8, attribute.user)
  if L5_9 == nil then
    return _UPVALUE0_.FAILURE, L2_6
  end
  return _UPVALUE0_.SUCCESS, L4_8, L5_9
end
function userSet(A0_10, A1_11)
  local L2_12, L3_13
  L2_12 = NIL
  if A0_10 == L2_12 then
    L2_12 = _UPVALUE0_
    L2_12 = L2_12.INVALID_ARGUMENT
    return L2_12
  end
  L2_12 = cookieValidate
  L3_13 = ROWID
  L3_13 = L2_12(L3_13, A0_10, sessionsTable)
  if L2_12 ~= _UPVALUE0_.SUCCESS then
    return L2_12
  end
  if A1_11 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(sessionsTable, ROWID, L3_13, attribute.user, A1_11) == nil then
    return _UPVALUE0_.FAILURE, L3_13
  end
  return _UPVALUE0_.SUCCESS, L3_13
end
function ipAddressGet()
  local L0_14, L1_15, L2_16
  L0_14 = getFirstCookie
  L1_15 = ROWID
  L2_16 = sessionsTable
  L1_15 = L0_14(L1_15, L2_16)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.SUCCESS
  if L0_14 ~= L2_16 then
    return L0_14
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(sessionsTable, ROWID, L1_15, attribute.ipAddress)
  if L2_16 == nil then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function ipAddressGetNext(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22
  L1_18 = NIL
  if A0_17 == L1_18 then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18.INVALID_ARGUMENT
    return L1_18
  end
  L1_18 = cookieValidate
  L2_19 = ROWID
  L3_20 = A0_17
  L4_21 = sessionsTable
  L2_19 = L1_18(L2_19, L3_20, L4_21)
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.SUCCESS
  if L1_18 ~= L3_20 then
    return L1_18
  end
  L3_20 = getNextValidCookie
  L4_21 = L2_19
  L5_22 = sessionsTable
  L4_21 = L3_20(L4_21, L5_22)
  L5_22 = _UPVALUE0_
  L5_22 = L5_22.SUCCESS
  if L3_20 ~= L5_22 then
    return L3_20
  end
  L5_22 = db
  L5_22 = L5_22.getAttribute
  L5_22 = L5_22(sessionsTable, ROWID, L4_21, attribute.ipAddress)
  if L5_22 == nil then
    return _UPVALUE0_.FAILURE, L4_21
  end
  return _UPVALUE0_.SUCCESS, L4_21, L5_22
end
function ipAddressSet(A0_23, A1_24)
  local L2_25, L3_26
  L2_25 = NIL
  if A0_23 == L2_25 then
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.INVALID_ARGUMENT
    return L2_25
  end
  L2_25 = cookieValidate
  L3_26 = ROWID
  L3_26 = L2_25(L3_26, A0_23, sessionsTable)
  if L2_25 ~= _UPVALUE0_.SUCCESS then
    return L2_25
  end
  if A1_24 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = validations.ipv4Check(IPV4_ADDRESS_FAMILY, A1_24)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(sessionsTable, ROWID, L3_26, attribute.ipAddress, A1_24) == nil then
    return _UPVALUE0_.FAILURE, L3_26
  end
  return _UPVALUE0_.SUCCESS, L3_26
end
function sessionGet()
  local L0_27, L1_28
  L0_27 = getFirstCookie
  L1_28 = ROWID
  L1_28 = L0_27(L1_28, sessionsTable)
  if L0_27 ~= _UPVALUE0_.SUCCESS then
    return L0_27
  end
  if db.getRow(sessionsTable, ROWID, L1_28) == nil then
    return _UPVALUE0_.FAILURE, L1_28
  end
  return _UPVALUE0_.SUCCESS, L1_28, db.getRow(sessionsTable, ROWID, L1_28)[sessionsTable .. "." .. attribute.user], db.getRow(sessionsTable, ROWID, L1_28)[sessionsTable .. "." .. attribute.ipAddress]
end
function sessionGetNext(A0_29)
  local L1_30, L2_31, L3_32, L4_33
  L1_30 = NIL
  if A0_29 == L1_30 then
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.INVALID_ARGUMENT
    return L1_30
  end
  L1_30 = cookieValidate
  L2_31 = ROWID
  L3_32 = A0_29
  L4_33 = sessionsTable
  L2_31 = L1_30(L2_31, L3_32, L4_33)
  L3_32 = _UPVALUE0_
  L3_32 = L3_32.SUCCESS
  if L1_30 ~= L3_32 then
    return L1_30
  end
  L3_32 = getNextValidCookie
  L4_33 = L2_31
  L4_33 = L3_32(L4_33, sessionsTable)
  if L3_32 ~= _UPVALUE0_.SUCCESS then
    return L3_32
  end
  if db.getRow(sessionsTable, ROWID, L4_33) == nil then
    return _UPVALUE0_.FAILURE, L2_31
  end
  return _UPVALUE0_.SUCCESS, L4_33, db.getRow(sessionsTable, ROWID, L4_33)[sessionsTable .. "." .. attribute.user], db.getRow(sessionsTable, ROWID, L4_33)[sessionsTable .. "." .. attribute.ipAddress]
end
function sessionSet(A0_34, A1_35, A2_36)
  local L3_37, L4_38, L5_39
  L3_37 = NIL
  if A0_34 == L3_37 then
    L3_37 = _UPVALUE0_
    L3_37 = L3_37.INVALID_ARGUMENT
    return L3_37
  end
  L3_37 = cookieValidate
  L4_38 = ROWID
  L5_39 = A0_34
  L4_38 = L3_37(L4_38, L5_39, sessionsTable)
  L5_39 = _UPVALUE0_
  L5_39 = L5_39.SUCCESS
  if L3_37 ~= L5_39 then
    return L3_37
  end
  if A1_35 == nil then
    L5_39 = _UPVALUE0_
    L5_39 = L5_39.INVALID_ARGUMENT
    return L5_39
  end
  if A2_36 == nil then
    L5_39 = _UPVALUE0_
    L5_39 = L5_39.INVALID_ARGUMENT
    return L5_39
  end
  L5_39 = validations
  L5_39 = L5_39.ipv4Check
  L5_39 = L5_39(IPV4_ADDRESS_FAMILY, A2_36)
  valid = L5_39
  L5_39 = valid
  if L5_39 ~= _UPVALUE0_.SUCCESS then
    L5_39 = _UPVALUE0_
    L5_39 = L5_39.INVALID_ARGUMENT
    return L5_39
  end
  L5_39 = {}
  L5_39[sessionsTable .. "." .. attribute.user] = A1_35
  L5_39[sessionsTable .. "." .. attribute.ipAddress] = A2_36
  if db.update(sessionsTable, L5_39, ROWID, L4_38) == nil then
    return _UPVALUE0_.FAILURE, L4_38
  end
  return _UPVALUE0_.SUCCESS, L4_38
end
function sessionCreate(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46
  if A0_40 == nil then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.INVALID_ARGUMENT
    return L2_42
  end
  if A1_41 == nil then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.INVALID_ARGUMENT
    return L2_42
  end
  L2_42 = validations
  L2_42 = L2_42.ipv4Check
  L3_43 = IPV4_ADDRESS_FAMILY
  L4_44 = A1_41
  L2_42 = L2_42(L3_43, L4_44)
  valid = L2_42
  L2_42 = valid
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.SUCCESS
  if L2_42 ~= L3_43 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.INVALID_ARGUMENT
    return L2_42
  end
  L2_42 = captivePortalLib
  L2_42 = L2_42.macAddrGet
  L3_43 = ipAddr
  L2_42 = L2_42(L3_43)
  L3_43 = NIL
  if L2_42 == L3_43 then
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.INVALID_ARGUMENT
    return L3_43
  end
  L3_43 = LAN_CLIENT
  L4_44 = WLAN_CLIENT
  if L3_43 == L4_44 then
    L4_44 = db
    L4_44 = L4_44.getAttribute
    L5_45 = SSIDTable
    L6_46 = attribute
    L6_46 = L6_46.interfaceNumber
    L4_44 = L4_44(L5_45, L6_46, vlanId, attribute.vlanId)
    ifName = L4_44
    L4_44 = ifName
    L5_45 = NIL
    if L4_44 == L5_45 then
      L4_44 = _UPVALUE0_
      L4_44 = L4_44.INVALID_ARGUMENT
      return L4_44
    end
    L4_44 = BDG
    L5_45 = ifName
    L4_44 = L4_44 .. L5_45
    L5_45 = vlanId
    L6_46 = db
    L6_46 = L6_46.getAttribute
    L6_46 = L6_46(SSIDTable, attribute.interfaceNumber, vlanId, attribute.accessType)
    if L6_46 == NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  else
    L4_44 = BDG
    L5_45 = vlanId
    L4_44 = L4_44 .. L5_45
    L5_45 = vlanId
    L6_46 = db
    L6_46 = L6_46.getAttribute
    L6_46 = L6_46(interVlanTable, attribute.vlanId, vlanId, attribute.accessType)
    if L6_46 == NIL then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
  end
  L4_44 = {}
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.user
  L4_44[L5_45] = A0_40
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.ipAddress
  L4_44[L5_45] = A1_41
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.ifName
  L6_46 = ifName
  L4_44[L5_45] = L6_46
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.interfaceNumber
  L6_46 = interfaceNumber
  L4_44[L5_45] = L6_46
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.authType
  L6_46 = authType
  L4_44[L5_45] = L6_46
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.MACAddress
  L4_44[L5_45] = L2_42
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.idleTimeout
  L6_46 = idleTimeout
  L4_44[L5_45] = L6_46
  L5_45 = sessionsTable
  L6_46 = "."
  L5_45 = L5_45 .. L6_46 .. attribute.sessionTimeout
  L6_46 = sessionTimeout
  L4_44[L5_45] = L6_46
  L5_45 = db
  L5_45 = L5_45.insert
  L6_46 = sessionsTable
  L5_45 = L5_45(L6_46, L4_44)
  L6_46 = db
  L6_46 = L6_46.getAttribute
  L6_46 = L6_46(sessionsTable, attribute.user, A0_40)
  if L5_45 == nil then
    return _UPVALUE0_.FAILURE, L6_46
  end
  return _UPVALUE0_.SUCCESS, L6_46
end
function sessionDelete(A0_47)
  local L1_48, L2_49, L3_50, L4_51, L5_52, L6_53, L7_54
  L1_48 = NIL
  if A0_47 == L1_48 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = cookieValidate
  L2_49 = ROWID
  L3_50 = A0_47
  L4_51 = sessionsTable
  L2_49 = L1_48(L2_49, L3_50, L4_51)
  L3_50 = _UPVALUE0_
  L3_50 = L3_50.SUCCESS
  if L1_48 ~= L3_50 then
    return L1_48
  end
  L3_50 = false
  L4_51, L5_52, L6_53 = nil, nil, nil
  L7_54 = SAPI
  L7_54 = L7_54.Request
  L7_54 = L7_54.servervariable
  L7_54 = L7_54("REMOTE_ADDR")
  L7_54 = string.gsub(L7_54, "(%a*:)", "")
  if db.getRow(sessionsTable, ROWID, L2_49)[sessionsTable .. "." .. attribute.ipAddress] == L7_54 and db.getRow(sessionsTable, ROWID, L2_49)[sessionsTable .. "." .. attribute.ifName] == "wlan" then
    L3_50 = db.getAttribute(_UPVALUE1_, attribute.interfaceNumber, db.getRow(sessionsTable, ROWID, L2_49)[sessionsTable .. "." .. attribute.interfaceNumber], attribute.accessType)
    if L3_50 == NIL then
      return _UPVALUE0_.FAILURE
    end
    L4_51 = "LogicalIfName ='LAN' and AddressFamily = 2"
    L5_52 = db.getRowWhere("ifStatic", L4_51)
    if L5_52 == NIL then
      return _UPVALUE0_.FAILURE
    end
    L6_53 = L5_52["ifStatic.StaticIp"]
  end
  if db.deleteRow(sessionsTable, ROWID, L2_49) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L3_50, L6_53
end
function captivePortalSessionGetAll()
  local L0_55
  L0_55 = db
  L0_55 = L0_55.getTable
  L0_55 = L0_55(sessionsTable, false)
  if L0_55 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L0_55
end
