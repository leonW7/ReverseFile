local L0_0
L0_0 = require
L0_0("cgilua.urlcode")
L0_0 = error
module("cgilua.cookies")
function set(A0_1, A1_2, A2_3)
  local L3_4, L4_5
  L3_4 = _UPVALUE0_
  L4_5 = "Set-Cookie"
  L3_4(L4_5, _UPVALUE1_(A0_1, A1_2, A2_3))
end
function sethtml(A0_6, A1_7, A2_8)
  local L3_9, L4_10, L5_11
  L3_9 = _UPVALUE0_
  L4_10 = _UPVALUE1_
  L5_11 = "<meta http-equiv=\"Set-Cookie\" content=\"%s\">"
  L5_11 = L4_10(L5_11, _UPVALUE2_(A0_6, A1_7, A2_8))
  L3_9(L4_10, L5_11, L4_10(L5_11, _UPVALUE2_(A0_6, A1_7, A2_8)))
end
function get(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17
  L1_13 = _UPVALUE0_
  L2_14 = "HTTP_COOKIE"
  L1_13 = L1_13(L2_14)
  L1_13 = L1_13 or ""
  L2_14 = ";"
  L3_15 = L1_13
  L4_16 = ";"
  L1_13 = L2_14 .. L3_15 .. L4_16
  L2_14 = _UPVALUE1_
  L3_15 = L1_13
  L4_16 = "%s*;%s*"
  L5_17 = ";"
  L2_14 = L2_14(L3_15, L4_16, L5_17)
  L1_13 = L2_14
  L2_14 = ";"
  L3_15 = A0_12
  L4_16 = "=(.-);"
  L2_14 = L2_14 .. L3_15 .. L4_16
  L3_15 = _UPVALUE2_
  L4_16 = L1_13
  L5_17 = L2_14
  L5_17 = L3_15(L4_16, L5_17)
  return L5_17 and _UPVALUE3_(L5_17)
end
function delete(A0_18, A1_19)
  A1_19 = A1_19 or {}
  A1_19.expires = 1
  set(A0_18, "xxx", A1_19)
end
