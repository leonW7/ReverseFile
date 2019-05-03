local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.apwidsclientsecurity", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/widsclient_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).notPresentinOUI = 2
;({}).notPresentinKnownClient = 3
;({}).authRateTest = 4
;({}).probeRequestsRateTest = 5
;({}).deAuthRequestsRateTest = 6
;({}).maxAuthFailuresTest = 7
;({}).authWithUnknownAP = 8
;({}).clientThreatMitigation = 9
;({}).knownClientDatabaseLookupMethod = 10
;({}).knownClientDatabaseRadiusServerName = 11
;({}).rogueDetectedTrapInterval = 12
;({}).deAuthRequestsThresholdInterval = 13
;({}).deAuthRequestsThresholdValue = 14
;({}).authRequestsThresholdInterval = 15
;({}).authRequestsThresholdValue = 16
;({}).probeRequestsThresholdInterval = 17
;({}).probeRequestsThresholdValue = 18
;({}).authFailureThresholdValue = 19
function widsClientSecurityGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.widsclientGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, L2_3
end
function widsClientSecuritySet(A0_4)
  local L1_5
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for lanQos page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  A0_4 = util.removePrefix(A0_4, "apWidsClientSecurity.")
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE1_) do
    if A0_4[_FORV_5_] == nil then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    elseif _FORV_5_ ~= "knownClientDatabaseRadiusServerName" then
      A0_4[_FORV_5_] = tonumber(A0_4[_FORV_5_])
    end
  end
  L1_5 = _UPVALUE2_.widsclientSet(A0_4)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apWidsClientSecurity page" .. L1_5)
  end
  return L1_5
end
