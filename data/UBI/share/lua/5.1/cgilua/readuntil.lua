local L0_0, L1_1, L2_2
L0_0 = string
L0_0 = L0_0.sub
L1_1 = string
L1_1 = L1_1.find
L2_2 = string
L2_2 = L2_2.len
module("cgilua.readuntil")
function iterate(A0_3)
  local L2_4
  L2_4 = ""
  return function(A0_5, A1_6)
    local L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
    L2_7 = _UPVALUE0_
    L3_8 = A0_5
    L2_7 = L2_7(L3_8)
    L3_8, L4_9 = nil, nil
    while true do
      L5_10 = _UPVALUE1_
      L6_11 = _UPVALUE2_
      L7_12 = A0_5
      L6_11 = L5_10(L6_11, L7_12, 1, 1)
      L4_9 = L6_11
      L3_8 = L5_10
      if L3_8 then
        break
      end
      L5_10 = _UPVALUE3_
      L5_10 = L5_10()
      if not L5_10 then
        break
      end
      L6_11 = _UPVALUE4_
      L7_12 = _UPVALUE2_
      L6_11 = L6_11(L7_12, -L2_7 + 1)
      L7_12 = L6_11
      L7_12 = L7_12 .. _UPVALUE4_(L5_10, 1, L2_7 - 1)
      if L2_7 > _UPVALUE0_(_UPVALUE2_) or L2_7 > _UPVALUE0_(L5_10) or _UPVALUE1_(L7_12, A0_5, 1, 1) then
        _UPVALUE2_ = _UPVALUE4_(_UPVALUE2_, 1, -L2_7)
        L5_10 = L6_11 .. L5_10
      end
      L6_11 = A1_6
      L7_12 = _UPVALUE2_
      L6_11(L7_12)
      _UPVALUE2_ = L5_10
    end
    L5_10 = A1_6
    L6_11 = _UPVALUE4_
    L7_12 = _UPVALUE2_
    L7_12 = L6_11(L7_12, 1, (L3_8 or 0) - 1)
    L5_10(L6_11, L7_12, L6_11(L7_12, 1, (L3_8 or 0) - 1))
    L5_10 = _UPVALUE4_
    L6_11 = _UPVALUE2_
    L7_12 = L4_9 or L7_12(_UPVALUE2_)
    L7_12 = L7_12 + 1
    L5_10 = L5_10(L6_11, L7_12)
    _UPVALUE2_ = L5_10
    L5_10 = L3_8 ~= nil
    return L5_10
  end
end
