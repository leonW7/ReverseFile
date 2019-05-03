local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
L0_0 = _G
L1_1 = require
L2_2 = "ltn12"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "mime.core"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "io"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "string"
L4_4 = L4_4(L5_5)
L5_5 = module
L5_5("mime")
L5_5 = {}
encodet = L5_5
L5_5 = {}
decodet = L5_5
L5_5 = {}
wrapt = L5_5
function L5_5(A0_6)
  local L1_7
  function L1_7(A0_8, A1_9, A2_10)
    local L3_11
    L3_11 = _UPVALUE0_
    L3_11 = L3_11.type
    L3_11 = L3_11(A0_8)
    if L3_11 ~= "string" then
      L3_11 = "default"
      A1_9, A2_10 = A0_8, A1_9
      A0_8 = L3_11
    end
    L3_11 = _UPVALUE1_
    L3_11 = L3_11[A0_8 or "nil"]
    if not L3_11 then
      error("unknown key (" .. _UPVALUE0_.tostring(A0_8) .. ")", 3)
    else
      return L3_11(A1_9, A2_10)
    end
  end
  return L1_7
end
function encodet.base64()
  return _UPVALUE0_.filter.cycle(b64, "")
end
encodet["quoted-printable"] = function(A0_12)
  return _UPVALUE0_.filter.cycle(qp, "", A0_12 == "binary" and "=0D=0A" or "\r\n")
end
function decodet.base64()
  return _UPVALUE0_.filter.cycle(unb64, "")
end
decodet["quoted-printable"] = function()
  return _UPVALUE0_.filter.cycle(unqp, "")
end
function wrapt.text(A0_13)
  A0_13 = A0_13 or 76
  return _UPVALUE0_.filter.cycle(wrp, A0_13, A0_13)
end
wrapt.base64 = wrapt.text
wrapt.default = wrapt.text
wrapt["quoted-printable"] = function()
  return _UPVALUE0_.filter.cycle(qpwrp, 76, 76)
end
encode = L5_5(encodet)
decode = L5_5(decodet)
wrap = L5_5(wrapt)
function normalize(A0_14)
  return _UPVALUE0_.filter.cycle(eol, 0, A0_14)
end
function stuff()
  return _UPVALUE0_.filter.cycle(dot, 2)
end
