local L0_0, L1_1
L0_0 = os
L0_0 = L0_0.getenv
L1_1 = io
L1_1 = L1_1.stdin
module("sapi.cgi.request")
function open(A0_2)
  local L1_3, L2_4
  L1_3 = {}
  L2_4 = _UPVALUE0_
  L1_3.servervariable = L2_4
  function L2_4(A0_5)
    return _UPVALUE0_:read(A0_5)
  end
  L1_3.getpostdata = L2_4
  return L1_3
end
