local L0_0
L0_0 = require
L0_0("teamf1lualib/fwProtocolBindingValidation")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
protocolBinding = {}
function protocolBinding.config(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  L3_4 = ACCESS_LEVEL
  if L3_4 ~= 0 then
    L3_4 = "ACCESS_DENIED"
    L4_5 = "10187"
    return L3_4, L4_5
  end
  L3_4 = db
  L3_4 = L3_4.beginTransaction
  L3_4()
  L3_4 = false
  L4_5 = nil
  if db.typeAndRangeValidate(A0_1) then
    if A2_3 == "add" then
      L3_4, L4_5 = protocolBindingRuleValidation(A0_1, "add", -1)
      if not L3_4 then
        printCLIError(_UPVALUE0_.errorStringGet(L4_5))
      else
        L3_4 = db.insert("ProtocolBinding", A0_1)
      end
    elseif A2_3 == "edit" then
      L3_4, L4_5 = protocolBindingRuleValidation(A0_1, "edit", A1_2)
      if not L3_4 then
        printCLIError(_UPVALUE0_.errorStringGet(L4_5))
      else
        L3_4 = db.update("ProtocolBinding", A0_1, A1_2)
      end
    elseif A2_3 == "delete" then
      L3_4 = false
    end
  end
  if L3_4 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11886"
  end
end
function protocolBinding.modifyRules(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L2_8 = ACCESS_LEVEL
  if L2_8 ~= 0 then
    L2_8 = "ACCESS_DENIED"
    L3_9 = "10187"
    return L2_8, L3_9
  end
  L2_8 = db
  L2_8 = L2_8.beginTransaction
  L2_8()
  L2_8 = true
  L3_9 = "12265"
  if A1_7 == "enable" then
    for L7_13, L8_14 in L4_10(L5_11) do
      L9_15 = {}
      L9_15["ProtocolBinding.Enabled"] = "1"
      L2_8 = db.update("ProtocolBinding", L9_15, L8_14)
      if L2_8 == false then
        L3_9 = "12096"
        break
      end
    end
    if L2_8 then
      L3_9 = "12095"
    end
  elseif A1_7 == "disable" then
    for L7_13, L8_14 in L4_10(L5_11) do
      L9_15 = {}
      L9_15["ProtocolBinding.Enabled"] = "0"
      L2_8 = db.update("ProtocolBinding", L9_15, L8_14)
      if L2_8 == false then
        L3_9 = "12094"
        break
      end
    end
    if L2_8 then
      L3_9 = "12093"
    end
  else
    for L7_13, L8_14 in L4_10(L5_11) do
      L9_15 = {}
      L9_15["ProtocolBinding._ROWID_"] = L8_14
      L2_8 = db.delete("ProtocolBinding", L9_15)
      if L2_8 == false then
        L3_9 = "12091"
        break
      end
    end
    if L2_8 then
      L3_9 = "12092"
    end
  end
  if L2_8 then
    L4_10(L5_11)
    return L4_10, L5_11
  else
    L4_10()
    return L4_10, L5_11
  end
end
