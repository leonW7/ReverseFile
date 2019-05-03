local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.macF", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wireless_macFilter")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function wirelessAccessPointsGet(A0_1)
  local L1_2, L2_3
  L1_2 = {}
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.FAILURE
  if A0_1 == _UPVALUE0_.NIL or A0_1 == "" or A0_1 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_3 = _UPVALUE1_.MAC_Fil_stored_accessPointSet(A0_1)
  if L2_3 ~= _UPVALUE0_.SUCCESS then
    return L2_3, L1_2
  end
  L2_3, L1_2 = _UPVALUE1_.MAC_Fil_accessPointGet(A0_1)
  if L2_3 ~= _UPVALUE0_.SUCCESS then
    return L2_3, L1_2
  end
  return L2_3, L1_2
end
function wirelessAccessListGet(A0_4)
  local L1_5, L2_6
  L1_5 = {}
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.FAILURE
  if A0_4 == _UPVALUE0_.NIL or A0_4 == "" or A0_4 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_6, L1_5 = _UPVALUE1_.MAC_Fil_accessPointListGet(A0_4)
  if L2_6 ~= _UPVALUE0_.SUCCESS then
    return L2_6, L1_5
  end
  return L2_6, L1_5
end
function wirelessAccessListDel(A0_7, A1_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A1_8 == _UPVALUE0_.NIL or A1_8 == "" or A1_8 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_7 == _UPVALUE0_.NIL or A0_7 == "" or A0_7 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_9 = _UPVALUE2_.MAC_Fil_accessPointListDelete(A0_7, A1_8)
  if L2_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the MACS.")
    _UPVALUE1_.abort()
    return L2_9
  end
  L2_9 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_9
end
function macAddrsplit(A0_10, A1_11)
  local L2_12, L3_13, L5_14
  if A1_11 == "" then
    L2_12 = false
    return L2_12
  end
  L2_12 = 0
  L3_13 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_13, string.sub(A0_10, L2_12, _FORV_7_ - 1))
    L2_12 = _FORV_8_ + 1
  end
  L5_14(L3_13, string.sub(A0_10, L2_12))
  return L3_13
end
function hasTypeValidate(A0_15, A1_16, A2_17, A3_18)
  local L4_19, L5_20
  L4_19 = 0
  L5_20 = 0
  if A0_15 == nil then
    return 1, "ERR_EMPTY_VALUE_ENTERED"
  end
  if A2_17 ~= nil then
    for _FORV_9_, _FORV_10_ in string.gfind(A0_15, "[" .. A1_16 .. "]") do
      if _FORV_9_ ~= A2_17 then
        L5_20 = 1
      else
        L4_19 = L4_19 + 1
      end
    end
    if L4_19 ~= A3_18 and A3_18 ~= nil then
      L5_20 = 1
    end
  elseif string.find(A0_15, "[" .. A1_16 .. "]") then
    L5_20 = 1
  else
    L5_20 = 0
  end
  return L5_20
end
function macAddressValidate(A0_21, A1_22)
  local L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
  L2_23 = 0
  L3_24 = ""
  macTable = L4_25
  if L4_25 ~= 6 then
    L7_28 = ""
    return L4_25, L5_26, L6_27, L7_28
  end
  L7_28 = ":"
  L2_23 = L4_25
  if L2_23 == 1 then
    L7_28 = ""
    return L4_25, L5_26, L6_27, L7_28
  elseif L2_23 == 0 then
    for L7_28, _FORV_8_ in L4_25(L5_26) do
      if macTable[L7_28] == nil or macTable[L7_28] == "" then
        return 1, "ERR_MAC_EMPTY_VALUE_OCTET_" .. L7_28, A1_22, ""
      elseif string.len(macTable[L7_28]) ~= 2 then
        return 1, "ERR_TWOCHAR_OCTET_" .. L7_28, A1_22, ""
      elseif hasTypeValidate(macTable[L7_28], "g-z") == 1 then
        return 1, "ERR_ONLYHEX_OCTET_" .. L7_28, A1_22, ""
      else
        L2_23 = 0
      end
    end
  end
  L7_28 = ""
  return L4_25, L5_26, L6_27, L7_28
end
function wirelessAccessListAdd(A0_29, A1_30)
  local L2_31
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_29 == _UPVALUE0_.NIL or A0_29 == "" or A0_29 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A1_30 == _UPVALUE0_.NIL or A1_30 == "" or A1_30 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_31 = _UPVALUE2_.MAC_Fil_accessPointListAdd(A0_29, A1_30)
  if L2_31 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in adding the MACS.")
    _UPVALUE1_.abort()
    return L2_31
  end
  L2_31 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_31
end
function wirelessAccessPolicyModify(A0_32, A1_33)
  local L2_34
  L2_34 = _UPVALUE0_
  L2_34 = L2_34.FAILURE
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_32 == _UPVALUE0_.NIL or A0_32 == "" or A0_32 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A1_33 == _UPVALUE0_.NIL or A1_33 == "" or A1_33 == " " then
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_34 = _UPVALUE2_.accessPointACLPolicySet(A0_32, A1_33)
  if L2_34 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in modifying policies.")
    _UPVALUE1_.abort()
    return L2_34
  end
  L2_34 = _UPVALUE0_.SUCCESS
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_34
end
function wirelessStoredAccessPointsGet()
  local L0_35, L1_36
  L0_35 = _UPVALUE0_
  L0_35 = L0_35.FAILURE
  L1_36 = _UPVALUE0_
  L1_36 = L1_36.NIL
  L0_35, L1_36 = _UPVALUE1_.MAC_Fil_stored_accessPointGet()
  if L0_35 ~= _UPVALUE0_.SUCCESS then
    L1_36 = _UPVALUE0_.NIL
  end
  return L1_36
end
function wirelessAccessPointGetAll()
  local L0_37, L1_38
  L0_37 = _UPVALUE0_
  L0_37 = L0_37.FAILURE
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.NIL
  L0_37, L1_38 = _UPVALUE1_.MAC_Fil_accessPointGetAll()
  if L0_37 ~= _UPVALUE0_.SUCCESS then
    L1_38 = _UPVALUE0_.NIL
  end
  return L1_38
end
