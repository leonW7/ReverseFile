local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.peerconfiguration", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/peerconfiguration_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).global = 1
;({}).discovery = 2
;({}).channelOrPower = 3
;({}).apDatabase = 4
;({}).apProfiles = 5
;({}).knownClient = 6
;({}).captivePortal = 7
;({}).radiusClient = 8
function peerConfigurationGet()
  local L0_1, L1_2, L2_3
  L1_2 = {}
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.peerconfigurationGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, L2_3
end
function peerConfigurationSet(A0_4)
  local L1_5, L2_6
  L2_6 = {}
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_4 = util.removePrefix(A0_4, "peerConfiguration.")
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
    if A0_4[_FORV_6_] == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
    L2_6[_FORV_6_] = tonumber(A0_4[_FORV_6_])
  end
  L1_5 = _UPVALUE2_.peerconfigurationSet(L2_6)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in peerConfiguration page" .. L1_5)
  end
  return L1_5
end
