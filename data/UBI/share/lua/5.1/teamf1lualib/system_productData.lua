local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.productdata", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
productdataTable = "unitInfo"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyValue = "1"
attribute.serialNumber = "serialNumber"
attribute.baseMACAddress = "lanMacAddress"
attribute.countryCode = "regionInfo"
attribute.hardwareVersion = "hardwareVersion"
function serialNumberGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(productdataTable, attribute.key, attribute.keyValue, attribute.serialNumber)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function serialNumberGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function serialNumberSet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function baseMACAddressGet()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(productdataTable, attribute.key, attribute.keyValue, attribute.baseMACAddress)
  if L0_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_7
end
function baseMACAddressGetNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function baseMACAddressSet(A0_10, A1_11)
  local L3_12
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  return L3_12, A0_10
end
function countryCodeGet()
  local L0_13, L1_14, L2_15, L3_16
  L2_15 = io
  L2_15 = L2_15.open
  L3_16 = _UPVALUE0_
  L2_15 = L2_15(L3_16, "r")
  if L2_15 then
    L3_16 = L2_15.read
    L3_16 = L3_16(L2_15, "*all")
    L1_14 = L3_16 or ""
  end
  L3_16 = L2_15.close
  L3_16(L2_15)
  L3_16 = _UPVALUE1_
  L3_16 = L3_16.NIL
  if L1_14 == L3_16 then
    L3_16 = _UPVALUE1_
    L3_16 = L3_16.FAILURE
    return L3_16
  end
  L3_16 = string
  L3_16 = L3_16.sub
  L3_16 = L3_16(L1_14, -2, -1)
  return _UPVALUE1_.SUCCESS, 1, L3_16
end
function countryCodeGetNext(A0_17)
  local L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NOT_SUPPORTED
  return L2_18, A0_17
end
function countryCodeSet(A0_19, A1_20)
  local L3_21
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NOT_SUPPORTED
  return L3_21, A0_19
end
function hardwareVersionGet()
  local L0_22
  L0_22 = db
  L0_22 = L0_22.getAttribute
  L0_22 = L0_22(productdataTable, attribute.key, attribute.keyValue, attribute.hardwareVersion)
  if L0_22 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_22
end
