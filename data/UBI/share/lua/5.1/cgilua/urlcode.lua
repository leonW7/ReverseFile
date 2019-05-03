local L0_0, L3_1, L4_2
L0_0 = next
L3_1 = pairs
L4_2 = tonumber
module("cgilua.urlcode")
function unescape(A0_3)
  A0_3 = _UPVALUE0_.gsub(A0_3, "+", " ")
  A0_3 = _UPVALUE0_.gsub(A0_3, "%%(%x%x)", function(A0_4)
    if A0_4 ~= "00" then
      return _UPVALUE0_.char(_UPVALUE1_(A0_4, 16))
    end
  end)
  A0_3 = _UPVALUE0_.gsub(A0_3, "\r\n", "\n")
  return A0_3
end
function escape(A0_5)
  A0_5 = _UPVALUE0_.gsub(A0_5, "\n", "\r\n")
  A0_5 = _UPVALUE0_.gsub(A0_5, "([^%w ])", function(A0_6)
    local L2_7
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.format
    return L2_7("%%%02X", _UPVALUE0_.byte(A0_6))
  end)
  A0_5 = _UPVALUE0_.gsub(A0_5, " ", "+")
  return A0_5
end
function insertfield(A0_8, A1_9, A2_10)
  if not A0_8[A1_9] then
    A0_8[A1_9] = A2_10
  elseif _UPVALUE0_(A0_8[A1_9]) == "string" then
    A0_8[A1_9] = {
      A0_8[A1_9],
      A2_10
    }
  elseif _UPVALUE0_(A0_8[A1_9]) == "table" then
    _UPVALUE1_.insert(A0_8[A1_9], A2_10)
  else
    error("CGILua fatal error (invalid args table)!")
  end
end
function parsequery(A0_11, A1_12)
  if _UPVALUE0_(A0_11) == "string" then
    _UPVALUE1_.gsub(A0_11, "([^&=]+)=([^&=]*)&?", function(A0_13, A1_14)
      local L2_15, L3_16
      L2_15 = _UPVALUE0_
      L3_16 = _UPVALUE1_
      L2_15(L3_16, _UPVALUE2_(A0_13), _UPVALUE2_(A1_14))
    end)
  end
end
function encodetable(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
  if A0_17 ~= nil then
    L1_18 = _UPVALUE0_
    L1_18 = L1_18(L2_19)
  elseif L1_18 == nil then
    L1_18 = ""
    return L1_18
  end
  L1_18 = ""
  for L5_22, L6_23 in L2_19(L3_20) do
    L1_18 = L1_18 .. "&" .. escape(L5_22) .. "=" .. escape(L6_23)
  end
  return L2_19(L3_20, L4_21)
end
