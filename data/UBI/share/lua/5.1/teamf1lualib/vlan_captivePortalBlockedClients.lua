local L0_0
L0_0 = module
L0_0("com.teamf1.core.vlan.captiveportalblockedclients", package.seeall)
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
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.captivePortal_returnCodes")
captiveportalblockedclientsTable = "blockMAC"
attribute = {}
attribute.macAddress = "sourceMACAddress"
attribute.description = "description"
ROWID = "_ROWID_"
MIN_STRING_LENGTH = 0
MAX_STRING_LENGTH = 64
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function macAddressGet()
  local L0_1, L1_2
  L0_1 = firstCookieGet
  L1_2 = captiveportalblockedclientsTable
  L0_1 = L0_1(L1_2)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(captiveportalblockedclientsTable, ROWID, L0_1, attribute.macAddress)
  if L1_2 == NIL then
    return _UPVALUE0_.FAILURE, L0_1
  end
  return _UPVALUE0_.SUCCESS, L0_1, L1_2
end
function macAddressGetNext(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = nextCookieGet
  L2_5 = A0_3
  L3_6 = captiveportalblockedclientsTable
  L2_5 = L1_4(L2_5, L3_6)
  L3_6 = FALSE
  if L1_4 == L3_6 then
    L3_6 = NIL
    if L2_5 == L3_6 then
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.NEXT_ROWID_INVALID
      return L3_6
    else
      L3_6 = _UPVALUE0_
      L3_6 = L3_6.INVALID_COOKIE
      return L3_6
    end
  end
  L3_6 = db
  L3_6 = L3_6.getAttribute
  L3_6 = L3_6(captiveportalblockedclientsTable, ROWID, L1_4, attribute.macAddress)
  if L3_6 == NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L3_6
end
function macAddressSet(A0_7, A1_8)
  local L2_9
  if checkCookieExists(A0_7, captiveportalblockedclientsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if A1_8 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_9 = _UPVALUE1_.isMacAddress(A1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(captiveportalblockedclientsTable, ROWID, A0_7, attribute.macAddress, A1_8) == NIL then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function macAddressDelete(A0_10)
  if checkCookieExists(A0_10, captiveportalblockedclientsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if db.deleteRow(captiveportalblockedclientsTable, ROWID, A0_10) == NIL then
    return _UPVALUE0_.FAILURE, A0_10
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function descriptionGet()
  local L0_11, L1_12
  L0_11 = firstCookieGet
  L1_12 = captiveportalblockedclientsTable
  L0_11 = L0_11(L1_12)
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(captiveportalblockedclientsTable, ROWID, L0_11, attribute.description)
  if L1_12 == NIL then
    return _UPVALUE0_.FAILURE, L0_11
  end
  return _UPVALUE0_.SUCCESS, L0_11, L1_12
end
function descriptionGetNext(A0_13)
  local L1_14, L2_15, L3_16
  L1_14 = nextCookieGet
  L2_15 = A0_13
  L3_16 = captiveportalblockedclientsTable
  L2_15 = L1_14(L2_15, L3_16)
  L3_16 = FALSE
  if L1_14 == L3_16 then
    L3_16 = NIL
    if L2_15 == L3_16 then
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.NEXT_ROWID_INVALID
      return L3_16
    else
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.INVALID_COOKIE
      return L3_16
    end
  end
  L3_16 = db
  L3_16 = L3_16.getAttribute
  L3_16 = L3_16(captiveportalblockedclientsTable, ROWID, L1_14, attribute.description)
  if L3_16 == NIL then
    return _UPVALUE0_.FAILURE, L1_14
  end
  return _UPVALUE0_.SUCCESS, L1_14, L3_16
end
function descriptionSet(A0_17, A1_18)
  if checkCookieExists(A0_17, captiveportalblockedclientsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if A1_18 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  valid = _UPVALUE1_.stringLengthCheck(MIN_STRING_LENGTH, MAX_STRING_LENGTH, A1_18)
  if valid ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(captiveportalblockedclientsTable, ROWID, A0_17, attribute.description, A1_18) == NIL then
    return _UPVALUE0_.FAILURE, A0_17
  end
  return _UPVALUE0_.SUCCESS, A0_17
end
function blockedClientGet()
  local L0_19
  L0_19 = firstCookieGet
  L0_19 = L0_19(captiveportalblockedclientsTable)
  if db.getRow(captiveportalblockedclientsTable, ROWID, L0_19) == NIL then
    return _UPVALUE0_.FAILURE, L0_19
  end
  return _UPVALUE0_.SUCCESS, L0_19, db.getRow(captiveportalblockedclientsTable, ROWID, L0_19)[captiveportalblockedclientsTable .. "." .. attribute.macAddress], db.getRow(captiveportalblockedclientsTable, ROWID, L0_19)[captiveportalblockedclientsTable .. "." .. attribute.description]
end
function blockedClientGetNext(A0_20)
  local L1_21
  L1_21 = nextCookieGet
  L1_21 = L1_21(A0_20, captiveportalblockedclientsTable)
  if L1_21 == FALSE then
    if L1_21(A0_20, captiveportalblockedclientsTable) == NIL then
      return _UPVALUE0_.NEXT_ROWID_INVALID
    else
      return _UPVALUE0_.INVALID_COOKIE
    end
  end
  if db.getRow(captiveportalblockedclientsTable, ROWID, L1_21) == NIL then
    return _UPVALUE0_.FAILURE, L1_21
  end
  return _UPVALUE0_.SUCCESS, L1_21, db.getRow(captiveportalblockedclientsTable, ROWID, L1_21)[captiveportalblockedclientsTable .. "." .. attribute.macAddress], db.getRow(captiveportalblockedclientsTable, ROWID, L1_21)[captiveportalblockedclientsTable .. "." .. attribute.description]
end
function blockedClientSet(A0_22, A1_23, A2_24)
  local L3_25, L4_26, L5_27, L6_28, L7_29
  L4_26 = checkCookieExists
  L5_27 = A0_22
  L6_28 = captiveportalblockedclientsTable
  L4_26 = L4_26(L5_27, L6_28)
  L5_27 = FALSE
  if L4_26 == L5_27 then
    L4_26 = _UPVALUE0_
    L4_26 = L4_26.INVALID_COOKIES
    return L4_26
  end
  L4_26 = NIL
  if A1_23 == L4_26 then
    L4_26 = _UPVALUE1_
    L4_26 = L4_26.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_NIL
    return L4_26
  end
  L4_26 = _UPVALUE2_
  L4_26 = L4_26.isMacAddress
  L5_27 = A1_23
  L4_26 = L4_26(L5_27)
  L3_25 = L4_26
  L4_26 = _UPVALUE0_
  L4_26 = L4_26.SUCCESS
  if L3_25 ~= L4_26 then
    L4_26 = _UPVALUE1_
    L4_26 = L4_26.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_INVALID
    return L4_26
  end
  L4_26 = NIL
  if A2_24 == L4_26 then
    L4_26 = _UPVALUE1_
    L4_26 = L4_26.COMP_CAPTIVEPORTAL_BLOCKCLIENT_DESCRIPTION_NILT
    return L4_26
  end
  L4_26 = _UPVALUE2_
  L4_26 = L4_26.stringLengthCheck
  L5_27 = MIN_STRING_LENGTH
  L6_28 = MAX_STRING_LENGTH
  L7_29 = A2_24
  L4_26 = L4_26(L5_27, L6_28, L7_29)
  L3_25 = L4_26
  L4_26 = _UPVALUE0_
  L4_26 = L4_26.SUCCESS
  if L3_25 ~= L4_26 then
    L4_26 = _UPVALUE1_
    L4_26 = L4_26.COMP_CAPTIVEPORTAL_BLOCKCLIENT_DESCRIPTION_INVALID
    return L4_26
  end
  L5_27 = A1_23
  L4_26 = A1_23.lower
  L6_28 = A1_23
  L4_26 = L4_26(L5_27, L6_28)
  L5_27 = "lower("
  L6_28 = captiveportalblockedclientsTable
  L7_29 = "."
  L5_27 = L5_27 .. L6_28 .. L7_29 .. attribute.macAddress .. ")='" .. L4_26 .. "' and " .. ROWID .. "!='" .. A0_22 .. "'"
  L6_28 = db
  L6_28 = L6_28.existsRowWhere
  L7_29 = captiveportalblockedclientsTable
  L6_28 = L6_28(L7_29, L5_27)
  if L6_28 then
    L7_29 = _UPVALUE1_
    L7_29 = L7_29.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_EXISTS
    return L7_29
  end
  L7_29 = {}
  L7_29[captiveportalblockedclientsTable .. "." .. attribute.macAddress] = A1_23
  L7_29[captiveportalblockedclientsTable .. "." .. attribute.description] = A2_24
  if db.update(captiveportalblockedclientsTable, L7_29, A0_22) == NIL then
    return _UPVALUE0_.FAILURE, A0_22
  end
  return _UPVALUE0_.SUCCESS, A0_22
end
function blockedClientCreate(A0_30, A1_31)
  local L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39
  L3_33 = NIL
  if A0_30 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_NIL
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.isMacAddress
  L4_34 = A0_30
  L3_33 = L3_33(L4_34)
  L2_32 = L3_33
  L3_33 = _UPVALUE2_
  L3_33 = L3_33.SUCCESS
  if L2_32 ~= L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_INVALID
    return L3_33
  end
  L3_33 = NIL
  if A1_31 == L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_CAPTIVEPORTAL_BLOCKCLIENT_DESCRIPTION_NIL
    return L3_33
  end
  L3_33 = _UPVALUE1_
  L3_33 = L3_33.stringLengthCheck
  L4_34 = MIN_STRING_LENGTH
  L5_35 = MAX_STRING_LENGTH
  L6_36 = A1_31
  L3_33 = L3_33(L4_34, L5_35, L6_36)
  L2_32 = L3_33
  L3_33 = _UPVALUE2_
  L3_33 = L3_33.SUCCESS
  if L2_32 ~= L3_33 then
    L3_33 = _UPVALUE0_
    L3_33 = L3_33.COMP_CAPTIVEPORTAL_BLOCKCLIENT_DESCRIPTION_INVALID
    return L3_33
  end
  L4_34 = A0_30
  L3_33 = A0_30.lower
  L5_35 = A0_30
  L3_33 = L3_33(L4_34, L5_35)
  L4_34 = "lower("
  L5_35 = captiveportalblockedclientsTable
  L6_36 = "."
  L7_37 = attribute
  L7_37 = L7_37.macAddress
  L8_38 = ")='"
  L9_39 = L3_33
  L4_34 = L4_34 .. L5_35 .. L6_36 .. L7_37 .. L8_38 .. L9_39 .. "'"
  L5_35 = db
  L5_35 = L5_35.existsRowWhere
  L6_36 = captiveportalblockedclientsTable
  L7_37 = L4_34
  L5_35 = L5_35(L6_36, L7_37)
  if L5_35 then
    L6_36 = _UPVALUE0_
    L6_36 = L6_36.COMP_CAPTIVEPORTAL_BLOCKCLIENT_MACADDRESS_EXISTS
    return L6_36
  end
  L6_36 = {}
  L7_37 = captiveportalblockedclientsTable
  L8_38 = "."
  L9_39 = attribute
  L9_39 = L9_39.macAddress
  L7_37 = L7_37 .. L8_38 .. L9_39
  L6_36[L7_37] = A0_30
  L7_37 = captiveportalblockedclientsTable
  L8_38 = "."
  L9_39 = attribute
  L9_39 = L9_39.description
  L7_37 = L7_37 .. L8_38 .. L9_39
  L6_36[L7_37] = A1_31
  L7_37 = db
  L7_37 = L7_37.getTable
  L8_38 = captiveportalblockedclientsTable
  L7_37 = L7_37(L8_38)
  if L7_37 ~= nil then
    L8_38 = #L7_37
    L9_39 = _UPVALUE3_
    if L8_38 >= L9_39 then
      L8_38 = _UPVALUE2_
      L8_38 = L8_38.MAX_LIMIT_REACHED
      return L8_38
    end
  end
  L8_38 = db
  L8_38 = L8_38.insert
  L9_39 = captiveportalblockedclientsTable
  L8_38 = L8_38(L9_39, L6_36)
  L9_39 = db
  L9_39 = L9_39.getAttribute
  L9_39 = L9_39(captiveportalblockedclientsTable, attribute.macAddress, A0_30, ROWID)
  if L8_38 == NIL then
    return _UPVALUE2_.FAILURE, L9_39
  end
  return _UPVALUE2_.SUCCESS, L9_39
end
function blockedClientDelete(A0_40)
  if checkCookieExists(A0_40, captiveportalblockedclientsTable) == FALSE then
    return _UPVALUE0_.INVALID_COOKIES
  end
  if db.deleteRow(captiveportalblockedclientsTable, ROWID, A0_40) == NIL then
    return _UPVALUE0_.FAILURE, A0_40
  end
  return _UPVALUE0_.SUCCESS, A0_40
end
function blockedClientsGetAll()
  local L0_41
  L0_41 = db
  L0_41 = L0_41.getTable
  L0_41 = L0_41(captiveportalblockedclientsTable, false)
  if L0_41 == NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, L0_41
end
function blockedClientsDeleteAll()
  if db.deleteAllRows(captiveportalblockedclientsTable) == NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function blockedClientGetCur(A0_42)
  if db.getRow(captiveportalblockedclientsTable, ROWID, A0_42) == NIL then
    return _UPVALUE0_.FAILURE, A0_42
  end
  return _UPVALUE0_.SUCCESS, db.getRow(captiveportalblockedclientsTable, ROWID, A0_42)[captiveportalblockedclientsTable .. "." .. attribute.macAddress], db.getRow(captiveportalblockedclientsTable, ROWID, A0_42)[captiveportalblockedclientsTable .. "." .. attribute.description]
end
