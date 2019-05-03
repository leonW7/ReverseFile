local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apwidssecurity", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/apwidssecurity_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).administratorConfiguredRogueAP = 2
;({}).managedSSIDfromUnknownAP = 3
;({}).managedSSIDfromaFakeManagedAP = 4
;({}).apWithoutSSID = 5
;({}).fakeManagedAPInvalidChannel = 6
;({}).managedSSIDIncorrectSecurity = 7
;({}).invalidSSIDfromaManagedAP = 8
;({}).apOperatingIllegalChannel = 9
;({}).standaloneAPwithUnexpectedConfig = 10
;({}).unexpectedWDSDeviceOnNetwork = 11
;({}).unmanagedAPOnWiredNetwork = 12
;({}).rogueDetectedTrapInterval = 13
;({}).wiredNetworkDetectionInterval = 14
;({}).apDeAuthenticationAttack = 15
function apWidsSecurityGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.apwidssecurityGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, L2_3
end
function apWidsSecuritySet(A0_4)
  local L1_5
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for lanQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_4 = util.removePrefix(A0_4, "apWidsSecurity.")
  A0_4.administratorConfiguredRogueAP = 1
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE1_) do
    if A0_4[_FORV_5_] == nil then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    else
      A0_4[_FORV_5_] = tonumber(A0_4[_FORV_5_])
    end
  end
  L1_5 = _UPVALUE2_.apwidssecuritySet(A0_4)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apWidsSecurity page" .. L1_5)
  end
  return L1_5
end
