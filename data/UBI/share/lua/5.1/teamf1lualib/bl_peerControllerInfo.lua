local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.peercontrollerinfo", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/peercontrollerinfo_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).clusterIPaddress = 1
;({}).totalPeerControllers = 2
;({}).ipAddress = 1
;({}).vendorID = 2
;({}).softwareVersion = 3
;({}).protocolVersion = 4
;({}).discoveryReason = 5
;({}).managedAPCount = 6
;({}).age = 7
function peerCtrlInfoGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L1_2 = {}
  L2_3 = {}
  L3_4 = nil
  L4_5 = {}
  L5_6 = 1
  L0_1, L1_2, L3_4 = _UPVALUE0_.peercontrollerinfoGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_9_, _FORV_10_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_9_] = L1_2[_FORV_10_]
  end
  if L3_4 ~= _UPVALUE1_.NIL then
    for _FORV_9_, _FORV_10_ in pairs(L3_4) do
      L4_5[L5_6] = {}
      for _FORV_14_, _FORV_15_ in pairs(_UPVALUE3_) do
        L4_5[L5_6][_FORV_14_] = _FORV_10_[_FORV_15_]
      end
      L5_6 = L5_6 + 1
    end
  end
  return L0_1, L2_3, L4_5
end
