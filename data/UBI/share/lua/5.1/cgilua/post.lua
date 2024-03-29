local L0_0
L0_0 = require
L0_0("cgilua.readuntil")
L0_0 = require
L0_0("cgilua.urlcode")
L0_0 = require
L0_0("cgilua.cookies")
L0_0 = assert
module("cgilua.post")
function parsedata(A0_1)
  local L1_2, L2_3
  L1_2 = _UPVALUE0_
  L2_3 = _UPVALUE1_
  L2_3 = L2_3(A0_1.args)
  L2_3 = L2_3 == "table"
  L1_2(L2_3, "field `args' must be a table")
  L1_2 = _UPVALUE2_
  L2_3 = A0_1
  L1_2(L2_3)
  L1_2 = _UPVALUE3_
  L2_3 = A0_1.content_length
  L1_2 = L1_2(L2_3)
  L1_2 = L1_2 or 0
  L2_3 = _UPVALUE4_
  if L1_2 > L2_3 then
    _UPVALUE5_ = L1_2
    L2_3 = _UPVALUE6_
    L2_3(L1_2)
    L2_3 = _UPVALUE7_
    L2_3(_UPVALUE8_("Total size of incoming data (%d KB) exceeds configured maximum (%d KB)", L1_2 / 1024, _UPVALUE4_ / 1024))
  end
  L2_3 = _UPVALUE9_
  if not L2_3 then
    _UPVALUE7_("Undefined Media Type")
  end
  if _UPVALUE10_(L2_3, "x%-www%-form%-urlencoded") then
    _UPVALUE11_.parsequery(_UPVALUE12_(L1_2), A0_1.args)
  elseif _UPVALUE10_(L2_3, "multipart/form%-data") then
    _UPVALUE13_(L1_2, A0_1.args)
  elseif _UPVALUE10_(L2_3, "text/xml") or _UPVALUE10_(L2_3, "text/plain") then
    _UPVALUE14_(A0_1.args, _UPVALUE12_(L1_2))
  else
    _UPVALUE7_("Unsupported Media Type: " .. L2_3)
  end
end
