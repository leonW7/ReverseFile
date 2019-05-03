local L0_0
L0_0 = module
L0_0("com.teamf1.core.snmp.sysinfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmp_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.snmp.returnCodes")
sysinfoTable = "system"
;({}).key = "_ROWID_"
;({}).keyvalue = "1"
;({}).contact = "sysContact"
;({}).location = "sysLoc"
;({}).name = "name"
function contactGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(sysinfoTable, _UPVALUE0_.key, _UPVALUE0_.keyvalue, _UPVALUE0_.contact)
  if L0_1 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_1
end
function contactGetNext(A0_2)
  return _UPVALUE0_.NOT_SUPPORTED
end
function contactSet(A0_3, A1_4)
  if A1_4 == nil then
    return _UPVALUE0_.FAILURE, A0_3
  end
  if string.len(A1_4) < 0 or string.len(A1_4) > 32 then
    return _UPVALUE1_, A0_3
  end
  if A1_4 == _UPVALUE2_ then
    return _UPVALUE3_, A0_3
  end
  if db.setAttribute(sysinfoTable, _UPVALUE4_.key, _UPVALUE4_.keyvalue, _UPVALUE4_.contact, A1_4) == nil then
    return _UPVALUE0_.FAILURE, A0_3
  end
  return _UPVALUE0_.SUCCESS, A0_3
end
function locationGet()
  local L0_5
  L0_5 = db
  L0_5 = L0_5.getAttribute
  L0_5 = L0_5(sysinfoTable, _UPVALUE0_.key, _UPVALUE0_.keyvalue, _UPVALUE0_.location)
  if L0_5 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_5
end
function locationGetNext(A0_6)
  return _UPVALUE0_.NOT_SUPPORTED
end
function locationSet(A0_7, A1_8)
  if A1_8 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT, A0_7
  end
  if string.len(A1_8) < 0 or string.len(A1_8) > 32 then
    return _UPVALUE1_, A0_7
  end
  if A1_8 == _UPVALUE2_ then
    return _UPVALUE3_, A0_7
  end
  if db.setAttribute(sysinfoTable, _UPVALUE4_.key, _UPVALUE4_.keyvalue, _UPVALUE4_.location, A1_8) == nil then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function nameGet()
  local L0_9
  L0_9 = db
  L0_9 = L0_9.getAttribute
  L0_9 = L0_9(sysinfoTable, _UPVALUE0_.key, _UPVALUE0_.keyvalue, _UPVALUE0_.name)
  if L0_9 == nil then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_9
end
function nameGetNext(A0_10)
  return _UPVALUE0_.NOT_SUPPORTED
end
function nameSet(A0_11, A1_12)
  if A1_12 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if string.len(A1_12) < 0 or string.len(A1_12) > 32 then
    return _UPVALUE0_.FAILURE
  end
  if db.setAttribute(sysinfoTable, _UPVALUE1_.key, _UPVALUE1_.keyvalue, _UPVALUE1_.name, A1_12) == nil then
    return _UPVALUE0_.FAILURE, A0_11
  end
  return _UPVALUE0_.SUCCESS, A0_11
end
function systemInformationGet()
  local L0_13, L1_14, L2_15, L3_16
  L0_13 = {}
  L1_14 = db
  L1_14 = L1_14.getRow
  L2_15 = sysinfoTable
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.key
  L1_14 = L1_14(L2_15, L3_16, _UPVALUE0_.keyvalue)
  L0_13 = L1_14
  if L0_13 == nil then
    L1_14 = _UPVALUE1_
    L1_14 = L1_14.FAILURE
    return L1_14
  end
  L1_14, L2_15, L3_16 = nil, nil, nil
  L1_14 = L0_13[sysinfoTable .. "." .. _UPVALUE0_.contact]
  L2_15 = L0_13[sysinfoTable .. "." .. _UPVALUE0_.location]
  L3_16 = L0_13[sysinfoTable .. "." .. _UPVALUE0_.name]
  return _UPVALUE1_.SUCCESS, 1, L1_14, L2_15, L3_16
end
function systemInformationGetNext(A0_17)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemInformationSet(A0_18, A1_19, A2_20, A3_21)
  local L4_22
  if A1_19 == nil then
    L4_22 = INVALID_ARGUMENT
    return L4_22
  end
  L4_22 = string
  L4_22 = L4_22.len
  L4_22 = L4_22(A1_19)
  if not (L4_22 < 0) then
    L4_22 = string
    L4_22 = L4_22.len
    L4_22 = L4_22(A1_19)
  elseif L4_22 > 32 then
    L4_22 = _UPVALUE0_
    L4_22 = L4_22.SNMP_SYSINFO_CONTACT_LENINVALID
    return L4_22
  end
  if A2_20 == nil then
    L4_22 = _UPVALUE1_
    L4_22 = L4_22.INVALID_ARGUMENT
    return L4_22
  end
  L4_22 = string
  L4_22 = L4_22.len
  L4_22 = L4_22(A2_20)
  if not (L4_22 < 0) then
    L4_22 = string
    L4_22 = L4_22.len
    L4_22 = L4_22(A2_20)
  elseif L4_22 > 32 then
    L4_22 = _UPVALUE0_
    L4_22 = L4_22.SNMP_SYSINFO_LOCATION_LENINVALID
    return L4_22
  end
  if A3_21 == nil then
    L4_22 = _UPVALUE1_
    L4_22 = L4_22.INVALID_ARGUMENT
    return L4_22
  end
  L4_22 = string
  L4_22 = L4_22.len
  L4_22 = L4_22(A3_21)
  if not (L4_22 < 0) then
    L4_22 = string
    L4_22 = L4_22.len
    L4_22 = L4_22(A3_21)
  elseif L4_22 > 32 then
    L4_22 = _UPVALUE0_
    L4_22 = L4_22.SNMP_SYSINFO_NAME_LENINVALID
    return L4_22
  end
  L4_22 = {}
  L4_22[sysinfoTable .. "." .. _UPVALUE2_.contact] = A1_19
  L4_22[sysinfoTable .. "." .. _UPVALUE2_.location] = A2_20
  L4_22[sysinfoTable .. "." .. _UPVALUE2_.name] = A3_21
  if db.update(sysinfoTable, L4_22, _UPVALUE2_.keyvalue) == nil then
    return _UPVALUE1_.FAILURE, A0_18
  end
  return _UPVALUE1_.SUCCESS, A0_18
end
function systemInformationCreate(A0_23, A1_24, A2_25)
  return _UPVALUE0_.NOT_SUPPORTED
end
function systemInformationDelete(A0_26)
  return _UPVALUE0_.NOT_SUPPORTED
end
