local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
firewallColsNamesGet = db.getColNames
firewallRowsGet = db.getRow
firewallRowsWhereGet = db.getRowsWhere
firewallRowWhereGet = db.getRowWhere
firewallRowExists = db.existsRow
firewallRowWhereExists = db.existsRowWhere
firewallCommandExecute = db.execute
firewallGetTable = db.getTable
fwPriorityMap = "fwPriorityMap"
fwIpv6PriorityMap = "fwPriorityMap6"
;({}).ruleType = "RuleType"
;({}).priorityStr = "PriorityStr"
;({}).resetStr = "ResetStr"
function maxPriorityGet(A0_1)
  local L1_2, L2_3
  L1_2 = "RuleType = 'SECURE_INSECURE'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'INSECURE_SECURE'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'PUBLIC_SECURE'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'SECURE_PUBLIC'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'INSECURE_PUBLIC'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'PUBLIC_INSECURE'"
  L2_3 = L1_2
  L1_2 = L2_3 .. " or RuleType = 'SECURE_SECURE'"
  L2_3 = _UPVALUE0_
  if A0_1 == ipmode.ipv4 then
    L2_3 = firewallCommandExecute(string.format("SELECT MAX(PriorityId) PriorityId FROM FirewallRules WHERE %s", L1_2))
  else
    if A0_1 == ipmode.ipv6 then
      L2_3 = firewallCommandExecute(string.format("SELECT MAX(PriorityId) PriorityId FROM FirewallRules6 WHERE %s", L1_2))
    else
    end
  end
  if L2_3 then
    L2_3:close()
  end
  return L2_3:fetch({}, "a") and (L2_3:fetch({}, "a").PriorityId or "")
end
function newPriorityGet(A0_4)
  local L1_5, L2_6, L3_7
  L1_5 = _UPVALUE0_
  L2_6 = maxPriorityGet
  L3_7 = A0_4
  L2_6 = L2_6(L3_7)
  if L2_6 == nil or L2_6 == "" or L2_6 == "0" then
    L1_5 = 1
  else
    L3_7 = tonumber
    L3_7 = L3_7(L2_6)
    L1_5 = L3_7 + 1
  end
  L3_7 = MAX_32_BIT_INT
  if L1_5 == L3_7 then
    L3_7 = nil
    L1_5 = 1
    while true do
      if A0_4 == ipmode.ipv4 then
        L3_7 = firewallRowsGet("FirewallRules", "PriorityId", L1_5)
      else
        if A0_4 == ipmode.ipv6 then
          L3_7 = firewallRowsGet("FirewallRules6", "PriorityId", L1_5)
        else
        end
      end
      if L3_7 == nil or L3_7 == "" then
        break
      else
        L1_5 = L1_5 + 1
      end
    end
  end
  return L1_5
end
function updatePriorityMap(A0_8, A1_9)
  local L2_10, L3_11, L4_12, L5_13, L6_14
  L5_13 = ""
  L6_14 = nil
  if A1_9 == ipmode.ipv4 then
    L5_13 = db.getAttribute(fwPriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr)
  else
    if A1_9 == ipmode.ipv6 then
      L5_13 = db.getAttribute(fwIpv6PriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr)
    else
    end
  end
  if L5_13 == "" then
    L5_13 = A0_8
  else
    L5_13 = L5_13 .. "," .. A0_8
  end
  if A1_9 == ipmode.ipv4 then
    L6_14 = firewallRowsGet("fwPriorityMap", "RuleType", "ALL")
  else
    if A1_9 == ipmode.ipv6 then
      L6_14 = firewallRowsGet("fwPriorityMap6", "RuleType", "ALL")
    else
    end
  end
  if L6_14 ~= nil then
    if A1_9 == ipmode.ipv4 then
      L3_11, errCode = db.setAttribute(fwPriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr, L5_13)
    elseif A1_9 == ipmode.ipv6 then
      L3_11, errCode = db.setAttribute(fwIpv6PriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr, L5_13)
    else
      return returnCodes.FAILURE
    end
  else
    return returnCodes.FAILURE
  end
  if not L3_11 then
    return returnCodes.FAILURE, cookie
  end
  return returnCodes.SUCCESS, cookie
end
function rearrangePriorityIndex(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26
  L4_19 = ""
  L5_20 = nil
  L6_21 = ipmode
  L6_21 = L6_21.ipv4
  if A1_16 == L6_21 then
    L6_21 = firewallRowsGet
    L6_21 = L6_21(L7_22, L8_23, L9_24)
    L5_20 = L6_21
  else
    L6_21 = ipmode
    L6_21 = L6_21.ipv6
    if A1_16 == L6_21 then
      L6_21 = firewallRowsGet
      L6_21 = L6_21(L7_22, L8_23, L9_24)
      L5_20 = L6_21
    else
    end
  end
  if L5_20 ~= nil then
    L6_21 = ipmode
    L6_21 = L6_21.ipv4
    if A1_16 == L6_21 then
      L6_21 = db
      L6_21 = L6_21.getAttribute
      L10_25 = _UPVALUE2_
      L10_25 = L10_25.priorityStr
      L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25)
      L4_19 = L6_21
    else
      L6_21 = ipmode
      L6_21 = L6_21.ipv6
      if A1_16 == L6_21 then
        L6_21 = db
        L6_21 = L6_21.getAttribute
        L10_25 = _UPVALUE2_
        L10_25 = L10_25.priorityStr
        L6_21 = L6_21(L7_22, L8_23, L9_24, L10_25)
        L4_19 = L6_21
      else
      end
    end
    if L4_19 ~= nil and L4_19 ~= "" then
      L6_21 = util
      L6_21 = L6_21.split
      L6_21 = L6_21(L7_22, L8_23)
      if L6_21 ~= false then
        L4_19 = ""
        for L10_25, L11_26 in L7_22(L8_23) do
          if false then
            L4_19 = L4_19 .. L11_26 .. ","
          end
        end
        L10_25 = string
        L10_25 = L10_25.len
        L11_26 = L4_19
        L10_25 = L10_25(L11_26)
        L10_25 = L10_25 - 1
        L4_19 = L7_22
        if A1_16 == L7_22 then
          L10_25 = _UPVALUE1_
          L11_26 = _UPVALUE2_
          L11_26 = L11_26.priorityStr
          L3_18 = L8_23
          L2_17 = L7_22
        elseif A1_16 == L7_22 then
          L10_25 = _UPVALUE1_
          L11_26 = _UPVALUE2_
          L11_26 = L11_26.priorityStr
          L3_18 = L8_23
          L2_17 = L7_22
        else
          return L7_22
        end
        if not L2_17 then
          return L7_22, L8_23
        else
          L2_17 = L7_22.SUCCESS
        end
      else
        L2_17 = L7_22.FAILURE
      end
    else
      L6_21 = returnCodes
      L2_17 = L6_21.FAILURE
    end
  else
    L6_21 = returnCodes
    L2_17 = L6_21.FAILURE
  end
  L6_21 = L2_17
  return L6_21, L7_22
end
function moveRules(A0_27, A1_28, A2_29)
  local L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42
  L3_30 = false
  L4_31 = nil
  L5_32 = _UPVALUE0_
  L6_33 = ""
  L7_34 = _UPVALUE0_
  L8_35 = ipmode
  L8_35 = L8_35.ipv4
  if A2_29 == L8_35 then
    L8_35 = firewallRowsGet
    L8_35 = L8_35(L9_36, L10_37, L11_38)
    L7_34 = L8_35
  else
    L8_35 = ipmode
    L8_35 = L8_35.ipv6
    if A2_29 == L8_35 then
      L8_35 = firewallRowsGet
      L8_35 = L8_35(L9_36, L10_37, L11_38)
      L7_34 = L8_35
    else
    end
  end
  L8_35 = _UPVALUE0_
  if L7_34 ~= L8_35 then
    L8_35 = ipmode
    L8_35 = L8_35.ipv4
    if A2_29 == L8_35 then
      L8_35 = L7_34["fwPriorityMap.PriorityStr"]
      L5_32 = L8_35 or ""
    else
      L8_35 = ipmode
      L8_35 = L8_35.ipv6
      if A2_29 == L8_35 then
        L8_35 = L7_34["fwPriorityMap6.PriorityStr"]
        L5_32 = L8_35 or ""
      end
    end
  else
  end
  L8_35 = _UPVALUE0_
  if L5_32 ~= L8_35 and L5_32 ~= "" then
    L8_35 = util
    L8_35 = L8_35.split
    L8_35 = L8_35(L9_36, L10_37)
    if L8_35 ~= false then
      if L9_36 == 0 then
        L6_33 = L9_36 .. L10_37
      else
        for L12_39, L13_40 in L9_36(L10_37) do
          L14_41 = L6_33
          L6_33 = L14_41 .. L15_42 .. ","
        end
      end
      L5_32 = ""
      for L12_39, L13_40 in L9_36(L10_37) do
        L14_41 = true
        for _FORV_18_, _FORV_19_ in L15_42(A0_27) do
          if L13_40 == _FORV_19_ then
            L14_41 = false
            break
          end
        end
        if L14_41 then
          L5_32 = L15_42 .. L13_40 .. ","
        end
      end
      if L5_32 == "" then
        L5_32 = L6_33
      elseif L9_36 == 1 then
        L5_32 = L9_36 .. L10_37 .. L11_38
      elseif L9_36 == L10_37 then
        L5_32 = L9_36 .. L10_37 .. L11_38
      elseif L9_36 ~= false then
        if L10_37 >= L11_38 then
          L5_32 = L10_37 .. L11_38 .. L12_39
        else
          L5_32 = ""
          for L14_41, L15_42 in L11_38(L12_39) do
            if L10_37 == tonumber(A1_28) then
              L5_32 = L5_32 .. "," .. L6_33
            end
            L5_32 = L5_32 .. L15_42 .. ","
          end
        end
      end
      L5_32 = L9_36
      L5_32 = L9_36
    end
  end
  L8_35 = ipmode
  L8_35 = L8_35.ipv4
  if A2_29 == L8_35 then
    L8_35 = db
    L8_35 = L8_35.setAttribute
    L8_35 = L8_35(L9_36, L10_37, L11_38, L12_39, L13_40)
    L4_31 = L9_36
    L3_30 = L8_35
  else
    L8_35 = ipmode
    L8_35 = L8_35.ipv6
    if A2_29 == L8_35 then
      L8_35 = db
      L8_35 = L8_35.setAttribute
      L8_35 = L8_35(L9_36, L10_37, L11_38, L12_39, L13_40)
      L4_31 = L9_36
      L3_30 = L8_35
    else
    end
  end
  if not L3_30 then
    L8_35 = returnCodes
    L8_35 = L8_35.FAILURE
    return L8_35, L9_36
  end
  L8_35 = returnCodes
  L8_35 = L8_35.SUCCESS
  return L8_35, L9_36
end
function resetPriorityMap(A0_43)
  local L1_44, L2_45, L3_46
  L3_46 = ""
  if A0_43 == ipmode.ipv4 then
    L1_44, errCode = db.setAttribute(fwPriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr, L3_46)
  elseif A0_43 == ipmode.ipv6 then
    L1_44, errCode = db.setAttribute(fwIpv6PriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr, L3_46)
  end
  if not L1_44 then
    return returnCodes.FAILURE, L2_45
  end
  return returnCodes.SUCCESS, L2_45
end
function priorityStrGet()
  local L0_47
  L0_47 = db.getAttribute(fwPriorityMap, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.priorityStr)
  if L0_47 == returnCodes.NIL then
    return returnCode.FAILURE
  end
  return returnCodes.SUCCESS, L0_47
end
