local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apfirmwarestatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/apfirmwareglobalstatus_web")
L0_0 = require
L0_0("teamf1lualib/apfirmwareupgradestatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).txnResult = 1
;({}).status = 2
;({}).downloadCount = 3
;({}).successCount = 4
;({}).failureCount = 5
;({}).abortCount = 6
;({}).macAddress = 1
;({}).location = 2
;({}).swVersion = 3
;({}).upgradeStatus = 4
function apUpgradeStatusGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L1_2, L0_1 = _UPVALUE0_.apfirmwareupgradestatusGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    if L1_2 == _UPVALUE2_.AP_UPGRADE_NO_ENTRY then
      return _UPVALUE1_.SUCCESS
    else
      return L1_2
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L0_1) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      if _FORV_13_ == _UPVALUE4_ then
        L2_3[L3_4][_FORV_12_] = _UPVALUE5_[_FORV_8_[_FORV_13_] + _UPVALUE6_]
      else
        L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
      end
    end
    L3_4 = L3_4 + _UPVALUE6_
  end
  return L1_2, L2_3
end
function apFirmwareUpgradeStatusGet()
  local L0_5, L1_6, L2_7
  L2_7 = {}
  L1_6, L0_5 = _UPVALUE0_.apfirmwareglobalstatusGet()
  if L1_6 ~= _UPVALUE1_.SUCCESS then
    return L1_6
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    if _FORV_7_ == _UPVALUE3_ then
      L2_7[_FORV_6_] = _UPVALUE4_[L0_5[_FORV_7_] + _UPVALUE5_]
    else
      L2_7[_FORV_6_] = L0_5[_FORV_7_]
    end
  end
  return L1_6, L2_7
end
