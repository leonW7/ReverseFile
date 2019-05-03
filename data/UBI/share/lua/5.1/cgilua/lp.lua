local L0_0, L5_1, L6_2, L7_3, L8_4, L9_5, L10_6, L11_7, L12_8, L13_9, L15_10, L16_11
L0_0 = assert
L5_1 = error
L6_2 = getfenv
L7_3 = loadstring
L8_4 = setfenv
L9_5 = string
L9_5 = L9_5.find
L10_6 = string
L10_6 = L10_6.format
L11_7 = string
L11_7 = L11_7.gsub
L12_8 = string
L12_8 = L12_8.sub
L13_9 = table
L13_9 = L13_9.concat
L15_10 = table
L15_10 = L15_10.insert
L16_11 = io
L16_11 = L16_11.open
module(...)
function translate(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19
  L1_13 = _UPVALUE0_
  if L1_13 then
    L1_13 = _UPVALUE1_
    L2_14 = A0_12
    L3_15 = "$|(.-)|%$"
    L4_16 = "<?lua = %1 ?>"
    L1_13 = L1_13(L2_14, L3_15, L4_16)
    A0_12 = L1_13
    L1_13 = _UPVALUE1_
    L2_14 = A0_12
    L3_15 = "<!%-%-$$(.-)$$%-%->"
    L4_16 = "<?lua %1 ?>"
    L1_13 = L1_13(L2_14, L3_15, L4_16)
    A0_12 = L1_13
  end
  L1_13 = _UPVALUE1_
  L2_14 = A0_12
  L3_15 = "<%%(.-)%%>"
  L4_16 = "<?lua %1 ?>"
  L1_13 = L1_13(L2_14, L3_15, L4_16)
  A0_12 = L1_13
  L1_13 = {}
  L2_14 = 1
  while true do
    L3_15 = _UPVALUE2_
    L4_16 = A0_12
    L5_17 = "<%?(%w*)[ \t]*(=?)(.-)%?>"
    L6_18 = L2_14
    L7_19 = L3_15(L4_16, L5_17, L6_18)
    if not L3_15 then
      break
    end
    _UPVALUE3_(L1_13, _UPVALUE4_(A0_12, L2_14, L3_15 - 1))
    if L5_17 ~= "" and L5_17 ~= "lua" then
      _UPVALUE3_(L1_13, _UPVALUE4_(A0_12, L3_15, L4_16))
    elseif L6_18 == "=" then
      _UPVALUE3_(L1_13, _UPVALUE5_(" %s(%s);", _UPVALUE6_, L7_19))
    else
      _UPVALUE3_(L1_13, _UPVALUE5_(" %s ", L7_19))
    end
    L2_14 = L4_16 + 1
  end
  L3_15 = _UPVALUE3_
  L4_16 = L1_13
  L5_17 = _UPVALUE4_
  L6_18 = A0_12
  L7_19 = L2_14
  L7_19 = L5_17(L6_18, L7_19)
  L3_15(L4_16, L5_17, L6_18, L7_19, L5_17(L6_18, L7_19))
  L3_15 = _UPVALUE7_
  L4_16 = L1_13
  return L3_15(L4_16)
end
function setoutfunc(A0_20)
  local L1_21
  _UPVALUE0_ = A0_20
end
function setcompatmode(A0_22)
  local L1_23
  _UPVALUE0_ = A0_22
end
function compile(A0_24, A1_25)
  local L2_26, L3_27
  L2_26 = _UPVALUE0_
  L2_26 = L2_26[A0_24]
  L3_27 = nil
  if L2_26 then
    return L2_26
  end
  L2_26, L3_27 = _UPVALUE1_(translate(A0_24), A1_25)
  if not L2_26 then
    _UPVALUE2_(L3_27, 3)
  end
  _UPVALUE0_[A0_24] = L2_26
  return L2_26
end
function include(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33
  L2_30 = _UPVALUE0_
  L3_31 = _UPVALUE1_
  L4_32 = A0_28
  L5_33 = L3_31(L4_32)
  L2_30 = L2_30(L3_31, L4_32, L5_33, L3_31(L4_32))
  L4_32 = L2_30
  L3_31 = L2_30.read
  L5_33 = "*a"
  L3_31 = L3_31(L4_32, L5_33)
  L5_33 = L2_30
  L4_32 = L2_30.close
  L4_32(L5_33)
  L4_32 = compile
  L5_33 = L3_31
  L4_32 = L4_32(L5_33, "@" .. A0_28)
  L5_33 = nil
  if A1_29 then
    L5_33 = _UPVALUE2_(L4_32)
    _UPVALUE3_(L4_32, A1_29)
  end
  L4_32()
end
