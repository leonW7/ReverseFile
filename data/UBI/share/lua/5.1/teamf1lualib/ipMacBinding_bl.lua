local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_macIpReservations")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
macipreservationsTable = "IPMACBinding"
ipMacPage = "ipMacBinding"
IPMACBINDING_COOKIE = "ipMacBinding.cookie"
function ipMacBindingGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.macIpBindingGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function ipMacBindingGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10
  L1_4, L7_10, L2_5, L3_6, L4_7, L5_8, L6_9 = _UPVALUE0_.macIpBindingGet(A0_3)
  if L1_4 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_
  end
  return L1_4, L7_10, L2_5, L3_6, L4_7, L5_8, L6_9
end
function ipMacBindingGetNext(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
  L1_12 = A0_11["ipMacBinding.cookie"]
  if L1_12 == nil then
    L2_13 = util
    L2_13 = L2_13.appendDebugOut
    L3_14 = "GetNext : Invalid Cookie"
    L2_13(L3_14)
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.BAD_PARAMETER
    return L2_13
  end
  L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19 = nil, nil, nil, nil, nil, nil, nil
  L2_13, L8_19, L3_14, L4_15, L5_16, L6_17, L7_18 = _UPVALUE1_.macIpBindingGetNext(L1_12)
  if L2_13 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_
  end
  return L2_13, L8_19, L3_14, L4_15, L5_16, L6_17, L7_18
end
function ipMacBindingSet(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28
  L1_21 = ACCESS_LEVEL
  if L1_21 ~= 0 then
    L1_21 = util
    L1_21 = L1_21.appendDebugOut
    L2_22 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_21(L2_22)
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.UNAUTHORIZED
    return L1_21
  end
  L1_21 = A0_20["ipMacBinding.cookie"]
  L2_22 = A0_20["ipMacBinding.macAddress"]
  L3_23 = A0_20["ipMacBinding.ipAddress"]
  L4_24 = A0_20["ipMacBinding.hostName"]
  L5_25 = A0_20["ipMacBinding.logStatus"]
  L6_26 = A0_20["ipMacBinding.associatingEnabled"]
  if L1_21 == nil then
    L7_27 = util
    L7_27 = L7_27.appendDebugOut
    L8_28 = "Set : Invalid Cookie"
    L7_27(L8_28)
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.BAD_PARAMETER
    return L7_27
  end
  if L2_22 == nil or L3_23 == nil or L4_24 == nil or L5_25 == nil or L6_26 == nil then
    L7_27 = util
    L7_27 = L7_27.appendDebugOut
    L8_28 = "GetNext : Invalid Cookie"
    L7_27(L8_28)
    L7_27 = _UPVALUE0_
    L7_27 = L7_27.BAD_PARAMETER
    return L7_27
  end
  L7_27, L8_28 = nil, nil
  _UPVALUE1_.start()
  L7_27, L8_28 = _UPVALUE2_.macIpBindingSet(L1_21, L2_22, L3_23, L4_24, L5_25, L6_26)
  if L7_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L7_27)
    _UPVALUE1_.abort()
    return L7_27, L1_21
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L8_28
end
function ipMacBindingDelete(A0_29)
  local L1_30, L2_31
  L1_30 = ACCESS_LEVEL
  if L1_30 ~= 0 then
    L1_30 = util
    L1_30 = L1_30.appendDebugOut
    L2_31 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_30(L2_31)
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.UNAUTHORIZED
    return L1_30
  end
  L1_30 = IPMACBINDING_COOKIE
  L1_30 = A0_29[L1_30]
  if L1_30 == nil then
    L2_31 = util
    L2_31 = L2_31.appendDebugOut
    L2_31("Delete : Invalid Cookie")
    L2_31 = _UPVALUE0_
    L2_31 = L2_31.BAD_PARAMETER
    return L2_31
  end
  L2_31 = nil
  _UPVALUE1_.start()
  L2_31, cookie = _UPVALUE2_.macIpBindingDelete(L1_30)
  if L2_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_31)
    _UPVALUE1_.abort()
    return L2_31, L1_30
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function ipMacBindingDefaultsGet()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42
  L3_35 = "Disable"
  L4_36 = "Disable"
  L6_37 = _UPVALUE0_
  L6_37 = L6_37.SUCCESS
  L7_38 = 0
  L8_39 = L0_32
  L9_40 = L1_33
  L10_41 = L2_34
  L11_42 = L3_35
  return L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L4_36
end
function ipMacBindingCreate(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50
  L1_44 = ACCESS_LEVEL
  if L1_44 ~= 0 then
    L1_44 = util
    L1_44 = L1_44.appendDebugOut
    L2_45 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_44(L2_45)
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.UNAUTHORIZED
    return L1_44
  end
  L1_44 = A0_43["ipMacBinding.macAddress"]
  L2_45 = A0_43["ipMacBinding.ipAddress"]
  L3_46 = A0_43["ipMacBinding.hostName"]
  L4_47 = A0_43["ipMacBinding.logStatus"]
  L5_48 = A0_43["ipMacBinding.associatingEnabled"]
  if L1_44 == nil or L2_45 == nil or L3_46 == nil or L4_47 == nil or L5_48 == nil then
    L6_49 = util
    L6_49 = L6_49.appendDebugOut
    L7_50 = "GetNext : Invalid Cookie"
    L6_49(L7_50)
    L6_49 = _UPVALUE0_
    L6_49 = L6_49.BAD_PARAMETER
    return L6_49
  end
  L6_49, L7_50 = nil, nil
  _UPVALUE1_.start()
  L6_49, L7_50 = _UPVALUE2_.macIpBindingCreate(L1_44, L2_45, L3_46, L4_47, L5_48)
  if L6_49 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_49)
    _UPVALUE1_.abort()
    return L6_49, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_50
end
function ipMacBindingDeleteAll(A0_51)
  local L1_52, L2_53, L3_54, L4_55, L5_56, L6_57
  L1_52 = ACCESS_LEVEL
  if L1_52 ~= 0 then
    L1_52 = util
    L1_52 = L1_52.appendDebugOut
    L1_52(L2_53)
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.UNAUTHORIZED
    return L1_52
  end
  L1_52 = _UPVALUE0_
  L1_52 = L1_52.NIL
  if A0_51 == L1_52 then
    L1_52 = _UPVALUE0_
    L1_52 = L1_52.BAD_PARAMETER
    return L1_52
  end
  L1_52 = nil
  L2_53()
  for L5_56, L6_57 in L2_53(L3_54) do
    L1_52, cookie = _UPVALUE2_.macIpBindingDelete(L6_57)
    if L1_52 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L1_52)
      _UPVALUE1_.abort()
      return L1_52, curCookie
    end
  end
  L2_53()
  L2_53()
  return L2_53, L3_54
end
