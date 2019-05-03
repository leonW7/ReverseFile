local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.vlanOverWan", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).vlanName = "vlanName"
;({}).vlanId = "vlanId"
;({}).LogicalIfName = "LogicalIfName"
;({}).InterfaceName = "InterfaceName"
;({}).VlanPortMode = "VlanPortMode"
;({}).VlanId = "VlanId"
;({}).ROWID = "_ROWID_"
function vlanOverWanConfig(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L6_7 = {}
  L7_8 = ""
  L8_9 = ""
  L9_10 = _UPVALUE0_
  L9_10 = L9_10.NIL
  if A0_1 ~= L9_10 then
    L9_10 = _UPVALUE0_
    L9_10 = L9_10.NIL
    if A1_2 ~= L9_10 then
      L9_10 = _UPVALUE0_
      L9_10 = L9_10.NIL
    end
  elseif A2_3 == L9_10 then
    L9_10 = _UPVALUE0_
    L9_10 = L9_10.INVALID_ARGUMENT
    return L9_10
  end
  L9_10 = _UPVALUE1_
  L9_10 = L9_10.isBoolean
  L9_10 = L9_10(A0_1)
  L4_5 = L9_10
  L9_10 = _UPVALUE0_
  L9_10 = L9_10.SUCCESS
  if L4_5 ~= L9_10 then
    L9_10 = _UPVALUE0_
    L9_10 = L9_10.INVALID_ARGUMENT
    return L9_10
  end
  L9_10 = _UPVALUE2_
  if A2_3 ~= L9_10 then
    L9_10 = _UPVALUE3_
    if A2_3 ~= L9_10 then
      L9_10 = _UPVALUE0_
      L9_10 = L9_10.INVALID_ARGUMENT
      return L9_10
    end
  end
  L5_6 = nil
  L9_10 = _UPVALUE2_
  if A2_3 == L9_10 then
    L9_10 = tonumber
    L9_10 = L9_10(A1_2)
    if L9_10 ~= 0 then
      L7_8 = _UPVALUE4_
      L8_9 = _UPVALUE5_
    end
  else
    L9_10 = _UPVALUE3_
    if A2_3 == L9_10 then
      L9_10 = tonumber
      L9_10 = L9_10(A1_2)
      if L9_10 ~= 0 then
        L7_8 = _UPVALUE6_
        L8_9 = _UPVALUE7_
      end
    end
  end
  L9_10 = _UPVALUE8_
  if A0_1 == L9_10 then
    L9_10 = tonumber
    L9_10 = L9_10(A1_2)
    if not (L9_10 <= 0) then
      L9_10 = tonumber
      L9_10 = L9_10(A1_2)
    elseif L9_10 >= 4094 then
      L9_10 = _UPVALUE9_
      L9_10 = L9_10.COMP_VLAN_ADDRESSING_VLANID_INVALID
      return L9_10
    end
    L9_10 = _UPVALUE10_
    L9_10 = L9_10 .. "." .. _UPVALUE11_.VlanPortMode
    L6_7[L9_10] = _UPVALUE12_
    L9_10 = _UPVALUE10_
    L9_10 = L9_10 .. "." .. _UPVALUE11_.InterfaceName
    L6_7[L9_10] = L7_8
  else
    L9_10 = _UPVALUE10_
    L9_10 = L9_10 .. "." .. _UPVALUE11_.VlanPortMode
    L6_7[L9_10] = _UPVALUE13_
    L9_10 = _UPVALUE10_
    L9_10 = L9_10 .. "." .. _UPVALUE11_.InterfaceName
    L6_7[L9_10] = L8_9
  end
  L9_10 = _UPVALUE10_
  L9_10 = L9_10 .. "." .. _UPVALUE11_.VlanId
  L6_7[L9_10] = A1_2
  L9_10 = db
  L9_10 = L9_10.getAttribute
  L9_10 = L9_10(_UPVALUE10_, _UPVALUE11_.LogicalIfName, A2_3, _UPVALUE11_.ROWID)
  if L9_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L3_4 = db.update(_UPVALUE10_, L6_7, L9_10)
  if not L3_4 then
    return L4_5
  end
  return _UPVALUE0_.SUCCESS
end
function vlanOverWanConfigGet(A0_11)
  local L1_12, L2_13
  L1_12 = {}
  L2_13 = nil
  if A0_11 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A0_11 ~= _UPVALUE1_ and A0_11 ~= _UPVALUE2_ then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_12 = db.getRow(_UPVALUE3_, _UPVALUE4_.LogicalIfName, A0_11)
  if L1_12 == _UPVALUE0_.NIL then
    return L2_13
  end
  L2_13 = _UPVALUE0_.SUCCESS
  return L2_13, L1_12
end
function WAN_ConnType_nimfTblUpdate(A0_14)
  local L1_15
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.FAILURE
  L1_15 = db.update(_UPVALUE1_, A0_14, A0_14[_UPVALUE1_ .. "." .. _UPVALUE2_.ROWID])
  if not L1_15 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
