local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.clientaps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/clientneighboraps_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).location = 2
;({}).radioIndex = 3
;({}).radioMode = 4
;({}).discoveryReason = 5
function clientsApGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L3_4 = {}
  L4_5 = nil
  rowId = 1
  L4_5 = A0_1.MAC
  if L4_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_2, L2_3 = _UPVALUE1_.clientneighborapsGet(L4_5)
  if L1_2 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the associatedClients page" .. L1_2)
  end
  for _FORV_8_, _FORV_9_ in pairs(L2_3) do
    L3_4[rowId] = {}
    for _FORV_13_, _FORV_14_ in pairs(_UPVALUE2_) do
      L3_4[rowId][_FORV_13_] = _FORV_9_[_FORV_14_]
    end
    rowId = rowId + 1
  end
  return L1_2, L3_4
end
