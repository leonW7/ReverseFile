local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.deauthattacklist", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/deauthattackslist_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).bssid = 1
;({}).channel = 2
;({}).attacktime = 3
;({}).rfScanReportAge = 4
function deAuthAttackListGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = {}
  L1_2, L2_3 = nil, nil
  L3_4 = 1
  L1_2, L2_3 = _UPVALUE0_.deauthattackslistGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    if L1_2 == _UPVALUE2_.DEAUTH_ATTACKSLIST_NO_ENTRY then
      return _UPVALUE1_.SUCCESS
    else
      return L1_2
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L2_3) do
    L0_1[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      L0_1[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L1_2, L0_1
end
