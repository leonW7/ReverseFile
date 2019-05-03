local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwReturnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
returnCodes = L0_0
L0_0 = require
L0_0 = L0_0("com.teamf1.core.fwReturnCodes")
fwReturnCodes = L0_0
L0_0 = {}
fw = L0_0
L0_0 = fw
L0_0.core = {}
L0_0 = fw
L0_0.ul = {}
L0_0 = db
L0_0 = L0_0.execute
firewallCommandExecute = L0_0
L0_0 = db
L0_0 = L0_0.existsRowWhere
firewallRowWhereExists = L0_0
L0_0 = db
L0_0 = L0_0.existsRow
firewallRowExists = L0_0
L0_0 = db
L0_0 = L0_0.getRows
firewallRowsGet = L0_0
L0_0 = {}
L0_0.Normal_Service = "0"
L0_0.Minimize_Cost = "2"
L0_0.Maximize_Reliability = "4"
L0_0.Maximize_Throughput = "8"
L0_0.Minimize_Delay = "16"
ipmode = {ipv4 = "4", ipv6 = "6"}
function booleanCheck(A0_1)
  A0_1 = tonumber(A0_1)
  if A0_1 == returnCodes.EMPTY or A0_1 == returnCodes.NIL then
    return returnCodes.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  elseif A0_1 == 1 or A0_1 == 0 then
    return returnCodes.SUCCESS
  else
    return returnCodes.FAILURE
  end
end
function split(A0_2, A1_3)
  local L2_4, L3_5, L5_6
  if A1_3 == "" then
    L2_4 = returnCodes
    L2_4 = L2_4.ERROR
    return L2_4
  end
  L2_4 = 0
  L3_5 = {}
  for _FORV_7_, _FORV_8_ in function()
    return string.find(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, true)
  end, nil, nil do
    table.insert(L3_5, string.sub(A0_2, L2_4, _FORV_7_ - 1))
    L2_4 = _FORV_8_ + 1
  end
  L5_6(L3_5, string.sub(A0_2, L2_4))
  return L3_5
end
function ipv4Check(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16, L10_17
  L1_8 = true
  L2_9 = 4
  L3_10 = 0
  L4_11 = 255
  if A0_7 == nil then
    L1_8 = false
    return L1_8
  else
    L5_12 = util
    L5_12 = L5_12.split
    L5_12 = L5_12(L6_13, L7_14)
    if L6_13 == L2_9 then
      for L9_16, L10_17 in L6_13(L7_14) do
        if L10_17:match("%a") or L10_17:match("%W") then
          L1_8 = false
          return L1_8
        elseif L4_11 < tonumber(L10_17) or L3_10 > tonumber(L10_17) then
          L1_8 = false
          return L1_8
        end
      end
    else
      L1_8 = false
      return L1_8
    end
    return L1_8
  end
end
function macAddressCheck(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28
  L1_19 = true
  L2_20 = 6
  L3_21 = 2
  if A0_18 == nil then
    L1_19 = false
    return L1_19
  else
    L4_22 = "[abcdefABCDEF%d]"
    L5_23 = split
    L5_23 = L5_23(L6_24, L7_25)
    if L6_24 == L2_20 then
      for L9_27, L10_28 in L6_24(L7_25) do
        if string.len(L10_28) == L3_21 then
          for _FORV_16_ in L10_28:gmatch(L4_22) do
            ({})[1] = _FORV_16_
          end
          if ({})[1] == nil or ({})[2] == nil then
            L1_19 = false
            return L1_19
          end
        else
          L1_19 = false
          return L1_19
        end
      end
    else
      L1_19 = false
      return L1_19
    end
    return L1_19
  end
end
function numberRangeCheck(A0_29, A1_30, A2_31)
  A2_31 = tonumber(A2_31)
  A0_29 = tonumber(A0_29)
  A1_30 = tonumber(A1_30)
  if A2_31 == returnCodes.NIL or A2_31 == returnCodes.EMPTY or A0_29 == returnCodes.NIL or A0_29 == returnCodes.EMPTY or A1_30 == returnCodes.NIL or A1_30 == returnCodes.EMPTY then
    return returnCodes.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  if A2_31 > A1_30 or A2_31 < A0_29 then
    return returnCodes.FAILURE, "ERR_BOUND_INVALID_RANGE"
  else
    return returnCodes.SUCCESS
  end
end
function urlValidation(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39
  L1_33 = false
  valid = L1_33
  if A0_32 ~= nil then
    L1_33 = string
    L1_33 = L1_33.len
    L2_34 = A0_32
    L1_33 = L1_33(L2_34)
    L2_34 = _UPVALUE0_
  elseif L1_33 > L2_34 then
    L1_33 = valid
    return L1_33
  end
  L1_33 = string
  L1_33 = L1_33.len
  L2_34 = A0_32
  L1_33 = L1_33(L2_34)
  L2_34 = string
  L2_34 = L2_34.sub
  L2_34 = L2_34(L3_35, L4_36, L5_37)
  if L2_34 ~= "." then
    L2_34 = string
    L2_34 = L2_34.sub
    L2_34 = L2_34(L3_35, L4_36, L5_37)
    if L2_34 ~= "-" then
      L2_34 = string
      L2_34 = L2_34.sub
      L2_34 = L2_34(L3_35, L4_36, L5_37)
      if L2_34 ~= "." then
        L2_34 = string
        L2_34 = L2_34.sub
        L2_34 = L2_34(L3_35, L4_36, L5_37)
      end
    end
  elseif L2_34 == "-" then
    L2_34 = valid
    return L2_34
  end
  L2_34 = split
  L2_34 = L2_34(L3_35, L4_36)
  for L6_38, L7_39 in L3_35(L4_36) do
    L1_33 = string.len(L7_39)
    if L1_33 < 1 or L1_33 > _UPVALUE1_ then
      return valid
    end
  end
  valid = L3_35
  return L3_35
end
function getFirstCookie(A0_40, A1_41, A2_42)
  local L3_43, L4_44
  L3_43 = {}
  L4_44 = nil
  if A0_40 == NIL or A1_41 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_42 ~= NIL then
    L3_43 = db.getColumnWhere(A0_40, A1_41, A2_42)
  else
    L3_43 = db.getColumn(A0_40, A1_41)
  end
  if L3_43 == NIL then
    return returnCodes.Failure
  end
  L4_44 = L3_43[1]
  return returnCodes.SUCCESS, L4_44
end
function getNextCookie(A0_45, A1_46, A2_47, A3_48)
  local L4_49, L5_50
  L4_49 = {}
  L5_50 = nil
  if A0_45 == NIL or A1_46 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A2_47 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A3_48 ~= NIL then
    L4_49 = db.getColumnWhere(A0_45, A1_46, A3_48)
  else
    L4_49 = db.getColumn(A0_45, A1_46)
  end
  if L4_49 == NIL then
    return returnCodes.Failure
  end
  L5_50 = tostring(A2_47)
  for _FORV_10_, _FORV_11_ in pairs(L4_49) do
    if L5_50 == _FORV_11_ then
      L5_50 = L4_49[_FORV_10_ + 1]
      break
    end
  end
  if not true or L5_50 == NIL then
    return returnCodes.COOKIEFAIL
  end
  return returnCodes.SUCCESS, L5_50
end
function db.getColumn(A0_51, A1_52)
  local L2_53, L3_54, L4_55, L5_56
  L2_53 = db
  L2_53 = L2_53.execute
  L3_54 = string
  L3_54 = L3_54.format
  L4_55 = [[
    SELECT %s FROM %s
    ]]
  L5_56 = A1_52
  L5_56 = L3_54(L4_55, L5_56, A0_51)
  L2_53 = L2_53(L3_54, L4_55, L5_56, L3_54(L4_55, L5_56, A0_51))
  L3_54 = {}
  if L2_53 then
    L4_55 = 0
    L5_56 = L2_53.fetch
    L5_56 = L5_56(L2_53, {}, "a")
    while L5_56 do
      L4_55 = L4_55 + 1
      for _FORV_9_, _FORV_10_ in pairs(L5_56) do
        L3_54[L4_55] = _FORV_10_
      end
      L5_56 = L2_53:fetch(L5_56, "a")
    end
    L2_53:close()
    return L3_54
  else
    return L3_54
  end
end
function db.getColumnWhere(A0_57, A1_58, A2_59)
  local L3_60, L4_61, L5_62, L6_63
  L3_60 = db
  L3_60 = L3_60.execute
  L4_61 = string
  L4_61 = L4_61.format
  L5_62 = [[
    SELECT %s FROM %s WHERE %s
    ]]
  L6_63 = A1_58
  L6_63 = L4_61(L5_62, L6_63, A0_57, A2_59)
  L3_60 = L3_60(L4_61, L5_62, L6_63, L4_61(L5_62, L6_63, A0_57, A2_59))
  L4_61 = {}
  if L3_60 then
    L5_62 = 0
    L6_63 = L3_60.fetch
    L6_63 = L6_63(L3_60, {}, "a")
    while L6_63 do
      L5_62 = L5_62 + 1
      for _FORV_10_, _FORV_11_ in pairs(L6_63) do
        L4_61[L5_62] = _FORV_11_
      end
      L6_63 = L3_60:fetch(L6_63, "a")
    end
    L3_60:close()
    return L4_61
  else
    return L4_61
  end
end
function ipv6Check(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69
  L1_65 = true
  L2_66 = 0
  L3_67 = 0
  L4_68 = 0
  L5_69 = ""
  if A0_64 == "" then
    return 1, "ERR_IPV6_EMPTY_VALUE"
  end
  addrArr = validations.split(A0_64, ":")
  addrArrLen = #addrArr
  if #addrArr > 8 or addrArrLen == 1 or addrArrLen == 2 then
    L1_65 = false
    return L1_65, "CHECK_NUMBER_OCTETS_IPV6"
  end
  for _FORV_9_, _FORV_10_ in pairs(addrArr) do
    if _FORV_9_ < addrArrLen - 2 and addrArr[_FORV_9_] == "" and addrArr[_FORV_9_ + 1] == "" and addrArr[_FORV_9_ + 2] == "" then
      L1_65 = false
      return L1_65, "CHECK_COLON_POSITION_IPV6"
    end
    if validations.hasTypeValidate(addrArr[_FORV_9_], "g-z") == 1 or validations.hasTypeValidate(addrArr[_FORV_9_], "G-Z") == 1 then
      L1_65 = false
      return L1_65, "INVALID_IPV6ADDR_CHAR"
    end
    if string.len(addrArr[_FORV_9_]) > 4 then
      L2_66 = L2_66 + 1
    end
    if addrArr[_FORV_9_] == "" then
      L3_67 = L3_67 + 1
    end
  end
  if L3_67 > 2 then
    L1_65 = false
    return L1_65, "INVALID_IPV6ADDR_CHECK_COLONS"
  end
  if L2_66 > 1 then
    L1_65 = false
    return L1_65, "CHECK_OCTET_IPV4_TYPE"
  end
  if L2_66 == 1 then
    if string.len(addrArr[addrArrLen]) > 4 then
      L4_68, errMsg = validations.ipAddressValidate(addrArr[addrArrLen], "")
    else
      L1_65 = false
      return L1_65, "INVALID_IPV4ADRR_NOT_AT_END"
    end
  end
  if L4_68 == 1 then
    return L4_68, errMsg
  end
  if L3_67 == 1 and (addrArr[1] == "" or addrArr[addrArrLen] == "") then
    L1_65 = false
    return L1_65, "INVALID_IPV6ADDR_CHECK_OCTECT_POSITION"
  end
  if L2_66 == 1 and addrArrLen > 7 then
    L1_65 = false
    return L1_65, "INVALID_IPV6ADDR_CHECK_NUMBER_OCTETS", field
  end
  if L3_67 ~= 2 or addrArr[1] == "" and addrArr[2] == "" or addrArr[addrArrLen - 1] == "" and addrArr[addrArrLen] == "" then
  else
    L1_65 = false
    return L1_65, "INVALID_IPV6ADDR_CHECK_OCTET"
  end
  return L1_65
end
function fw_portValidation(A0_70, A1_71, A2_72, A3_73)
  local L4_74, L5_75, L6_76
  L6_76 = tonumber
  L6_76 = L6_76(A2_72)
  L5_75 = L6_76
  L6_76 = returnCodes
  L6_76 = L6_76.EMPTY
  if L5_75 ~= L6_76 then
    L6_76 = returnCodes
    L6_76 = L6_76.NIL
  elseif L5_75 == L6_76 then
    L6_76 = L5_75
    return L6_76, endPort, returnCodes.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  L6_76 = numberRangeCheck
  L6_76 = L6_76(A0_70, A1_71, L5_75)
  L4_74 = L6_76
  L6_76 = returnCodes
  L6_76 = L6_76.SUCCESS
  if L4_74 ~= L6_76 then
    L6_76 = L5_75
    return L6_76, endPort, returnCodes.INVALID_ARGUMENT
  end
  L6_76 = returnCodes
  L6_76 = L6_76.EMPTY
  if A3_73 ~= L6_76 then
    L6_76 = returnCodes
    L6_76 = L6_76.NIL
    if A3_73 ~= L6_76 then
      L6_76 = nil
      L6_76 = tonumber(A3_73)
      if L6_76 == returnCodes.EMPTY or L6_76 == returnCodes.NIL then
        return L5_75, L6_76, returnCodes.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
      end
      L4_74 = numberRangeCheck(A0_70, A1_71, L6_76)
      if L4_74 ~= returnCodes.SUCCESS then
        return L5_75, L6_76, returnCodes.INVALID_ARGUMENT
      end
      if L5_75 > L6_76 then
        return L5_75, L6_76, returnCodes.INVALID_ARGUMENT
      end
      return L5_75, L6_76, returnCodes.SUCCESS
    end
  end
  L6_76 = L5_75
  return L6_76, returnCodes.SUCCESS
end
function fw_textValidation(A0_77, A1_78, A2_79)
  local L3_80
  if A0_77 == returnCodes.EMPTY or A0_77 == returnCodes.NIL then
    return returnCodes.ERROR, "ERR_EMPTY_OR_BAD_VALUE_ENTERED"
  end
  if A1_78 ~= returnCodes.EMPTY and A1_78 ~= returnCodes.NIL and A2_79 ~= returnCodes.EMPTY and A2_79 ~= returnCodes.NIL and (A2_79 < string.len(A0_77) or A1_78 > string.len(A0_77)) then
    return returnCodes.INVALID_ARGUMENT
  end
  if A0_77:match(" ") or A0_77:match("'") or A0_77:match("\"") then
    return returnCodes.ERROR, fwReturnCodes.COMP_FIREWALL_INVALID_TEXT
  end
  return returnCodes.SUCCESS
end
function fw_multiPortValidation(A0_81, A1_82, A2_83)
  local L3_84, L4_85, L5_86, L6_87, L7_88, L8_89, L9_90
  if A2_83 == L5_86 then
    return L5_86
  end
  L4_85 = L5_86
  for L8_89, L9_90 in L5_86(L6_87) do
    if tonumber(L9_90) == 0 then
      return returnCodes.INVALID_PORT_NUMBER, cookie
    end
    multiPort, L3_84 = fw_portValidation(A0_81, A1_82, L9_90)
    if L3_84 ~= returnCodes.SUCCESS then
      return returnCodes.INVALID_PORT_NUMBER, cookie
    end
  end
  return L5_86
end
function fw_qosPriorityValidation(A0_91)
  if A0_91 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  for _FORV_4_, _FORV_5_ in pairs(_UPVALUE0_) do
    if A0_91 == _FORV_5_ then
      return returnCodes.SUCCESS
    end
  end
  return returnCodes.ERROR
end
function fw_actionValidation(A0_92)
  if A0_92 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  for _FORV_4_, _FORV_5_ in pairs(_UPVALUE0_) do
    if A0_92 == _FORV_5_ then
      return returnCodes.SUCCESS
    end
  end
  return returnCodes.ERROR
end
function fw_zoneTypeValidation(A0_93, A1_94)
  if A0_93 == NIL or A1_94 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A0_93 ~= _UPVALUE0_.SECURE and A0_93 == A1_94 then
    return returnCodes.INVALID_ARGUMENT
  end
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE0_) do
    if A0_93 == _FORV_6_ then
      return returnCodes.SUCCESS
    end
  end
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE0_) do
    if A1_94 == _FORV_6_ then
      return returnCodes.SUCCESS
    end
  end
  return returnCodes.ERROR
end
function fw_networkRangeValidation(A0_95, A1_96, A2_97, A3_98)
  local L4_99
  if A0_95 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A0_95 == _UPVALUE0_.ANY then
    return returnCodes.SUCCESS
  elseif A0_95 == _UPVALUE0_.SINGLE or A0_95 == _UPVALUE0_.RANGE then
    if A1_96 == NIL then
      return returnCodes.INVALID_ARGUMENT
    else
      if A3_98 == ipmode.ipv4 then
        L4_99 = ipv4Check(A1_96)
      elseif A3_98 == ipmode.ipv6 then
        L4_99 = ipv6Check(A1_96)
      else
        return returnCodes.INVALID_ARGUMENT
      end
      if L4_99 ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT
      end
    end
    if A0_95 == _UPVALUE0_.RANGE then
      if A2_97 == NIL then
        return returnCodes.INVALID_ARGUMENT
      else
        if A3_98 == ipmode.ipv4 then
          L4_99 = ipv4Check(A2_97)
        elseif A3_98 == ipmode.ipv6 then
          L4_99 = ipv6Check(A2_97)
        else
          return returnCodes.INVALID_ARGUMENT
        end
        if L4_99 ~= returnCodes.SUCCESS then
          return returnCodes.INVALID_ARGUMENT
        end
      end
    end
  else
    return returnCodes.ERROR
  end
  return returnCodes.SUCCESS
end
function fw_snatAddressType(A0_100, A1_101, A2_102)
  if A0_100 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  if A0_100 == _UPVALUE0_.SINGLE_ADDRESS then
    if A2_102 == NIL then
      return returnCodes.INVALID_ARGUMENT
    else
      valid = ipv4Check(A2_102)
      if valid ~= returnCodes.SUCCESS then
        return returnCodes.INVALID_ARGUMENT
      end
    end
  elseif A0_100 ~= _UPVALUE0_.SINGLE_ADDRESS then
    if A1_101 == NIL then
      return returnCodes.INVALID_ARGUMENT
    end
    for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
      if A1_101 == _FORV_7_ then
        return returnCodes.SUCCESS
      end
    end
  else
    return returnCodes.ERROR
  end
  return returnCodes.SUCCESS
end
