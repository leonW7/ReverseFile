local L0_0, L1_1, L2_2, L3_3
L0_0 = unpack
L1_1 = string
L1_1 = L1_1.format
L2_2 = io
L2_2 = L2_2.stderr
L3_3 = io
L3_3 = L3_3.stdout
module("sapi.cgi.response")
function open(A0_4)
  local L1_5, L2_6
  L1_5 = {}
  function L2_6(A0_7)
    _UPVALUE0_:write("Content-type: " .. A0_7 .. [[


]])
  end
  L1_5.contenttype = L2_6
  function L2_6(A0_8, A1_9)
    _UPVALUE0_:write(A0_8)
  end
  L1_5.errorlog = L2_6
  function L2_6(A0_10, A1_11)
    local L3_12
    L3_12 = _UPVALUE0_
    L3_12 = L3_12.write
    L3_12(L3_12, _UPVALUE1_("%s: %s\n", A0_10, A1_11))
  end
  L1_5.header = L2_6
  function L2_6(A0_13)
    _UPVALUE0_:write("Location: " .. A0_13 .. [[


]])
  end
  L1_5.redirect = L2_6
  function L2_6(...)
    local L2_15, L3_16
    L2_15 = _UPVALUE0_
    L3_16 = L2_15
    L2_15 = L2_15.write
    L2_15(L3_16, ...)
  end
  L1_5.write = L2_6
  return L1_5
end
