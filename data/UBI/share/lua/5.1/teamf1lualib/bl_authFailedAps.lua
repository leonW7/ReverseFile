local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.authfailedaplist", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/authfailedaplist_web")
L0_0 = require
L0_0("teamf1lualib/apdetails_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
authFailedAps = {}
authFailedAps.controllerType = 1
authFailedAps.macAddress = 2
authFailedAps.ipAddress = 3
authFailedAps.lastFailed = 4
authFailedAps.age = 5
;({}).ipAddress = 1
;({}).lastFailureType = 2
;({}).controllerMACAddress = 3
;({}).reportingController = 4
;({}).controllerIPAddress = 5
;({}).softwareVersion = 6
;({}).vendorID = 7
;({}).protocolVersion = 8
;({}).hardwareType = 9
;({}).age = 10
;({}).validationFailures = 11
;({}).authenticationFailures = 12
function authFailedApsGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = {}
  L1_2, L2_3 = nil, nil
  L3_4 = 1
  L1_2, L2_3 = _UPVALUE0_.authfailedaplistGet()
  if L1_2 ~= _UPVALUE1_.SUCCESS then
    if L1_2 == _UPVALUE2_.AUTH_FAILED_ENTRY_NIL then
      return _UPVALUE1_.SUCCESS
    else
      return L1_2
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L2_3) do
    L0_1[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(authFailedAps) do
      L0_1[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L1_2, L0_1
end
function authFailedApsDetailGet(A0_5)
  local L1_6, L2_7, L3_8
  L3_8 = {}
  apMacAddress = A0_5.MAC
  if apMacAddress == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L2_7, L1_6 = _UPVALUE1_.apdetailsGet(_UPVALUE2_, apMacAddress)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    return L2_7
  end
  for _FORV_7_, _FORV_8_ in pairs(_UPVALUE3_) do
    if _FORV_8_ == _UPVALUE4_ then
      L3_8[_FORV_7_] = _UPVALUE5_[L1_6[_FORV_8_] + _UPVALUE6_]
    else
      L3_8[_FORV_7_] = L1_6[_FORV_8_]
    end
  end
  return L2_7, L3_8
end
function authFailedApsDelete()
  local L0_9
  L0_9 = _UPVALUE0_.apDelete()
  if L0_9 ~= _UPVALUE1_.SUCCESS then
    return L0_9
  end
  return _UPVALUE1_.SUCCESS
end
