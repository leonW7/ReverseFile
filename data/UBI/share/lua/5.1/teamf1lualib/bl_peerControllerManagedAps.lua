local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.peermanagedaps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/peermanagedaplist_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).MACAddress = 1
;({}).apIPAddress = 2
;({}).peerIPAddress = 3
;({}).location = 4
;({}).profileId = 5
;({}).profileName = 6
;({}).hardwareID = 7
function peerManagedApsInfoGet()
  local L0_1, L1_2, L2_3, L3_4
  L1_2 = {}
  L2_3 = nil
  L3_4 = 1
  L0_1, L2_3 = _UPVALUE0_.peermanagedaplistGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L2_3 ~= _UPVALUE1_.NIL then
    for _FORV_7_, _FORV_8_ in pairs(L2_3) do
      L1_2[L3_4] = {}
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
        L1_2[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
      L3_4 = L3_4 + 1
    end
  end
  return L0_1, L1_2
end
