local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.wps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_wps")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function wpsSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = _UPVALUE0_.wpsSettingsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2, L2_3, L3_4
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3, L3_4
end
function isWpsEnabled()
  local L0_5
  L0_5 = "0"
  returnCode, cookie, L0_5 = _UPVALUE0_.iswpsStatusEnabled()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    L0_5 = "0"
  end
  return L0_5
end
function wpsSectionSet(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = util
    L1_7 = L1_7.appendDebugOut
    L2_8 = "Detected Unauthorized access for page wps"
    L1_7(L2_8)
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.UNAUTHORIZED
    return L1_7
  end
  L1_7, L2_8, L3_9 = nil, nil, nil
  curCookie = "1"
  L2_8 = A0_6["wps.vapName"]
  L3_9 = A0_6["wps.wpsStatus"]
  _UPVALUE1_.start()
  returnCode, L1_7 = _UPVALUE2_.wpsSettingsSet(curCookie, L2_8, L3_9)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page wps" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_7
end
function wpsPinSectionSet(A0_10)
  local L1_11, L2_12
  L1_11 = ACCESS_LEVEL
  if L1_11 ~= 0 then
    L1_11 = util
    L1_11 = L1_11.appendDebugOut
    L2_12 = "Detected Unauthorized access for page wps"
    L1_11(L2_12)
    L1_11 = _UPVALUE0_
    L1_11 = L1_11.UNAUTHORIZED
    return L1_11
  end
  L1_11, L2_12 = nil, nil
  L2_12 = A0_10["wps.wpsStationPin"]
  returnCode, L1_11 = _UPVALUE1_.wpsPinSet(L2_12)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page wps" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode
  end
  return _UPVALUE0_.SUCCESS, L1_11
end
function wpsPbcSectionSet()
  local L0_13
  L0_13 = ACCESS_LEVEL
  if L0_13 ~= 0 then
    L0_13 = util
    L0_13 = L0_13.appendDebugOut
    L0_13("Detected Unauthorized access for page wps")
    L0_13 = _UPVALUE0_
    L0_13 = L0_13.UNAUTHORIZED
    return L0_13
  end
  L0_13 = nil
  returnCode, L0_13 = _UPVALUE1_.wpsPbcSet()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page wps" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode
  end
  return _UPVALUE0_.SUCCESS, L0_13
end
function profileRowGetCur(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.profileRowGet
  L2_16 = A0_14
  L2_16 = L1_15(L2_16)
  return _UPVALUE1_.SUCCESS, L2_16
end
function wpsprofileNameGetCur(A0_17)
  local L1_18, L2_19
  L1_18 = _UPVALUE0_
  L1_18 = L1_18.profileNameGet
  L2_19 = A0_17
  L2_19 = L1_18(L2_19)
  return L1_18, L2_19
end
function wpsFieldGetCur(A0_20, A1_21, A2_22, A3_23)
  local L4_24, L5_25
  L4_24 = _UPVALUE0_
  L4_24 = L4_24.fieldNameGet
  L5_25 = A0_20
  L5_25 = L4_24(L5_25, A1_21, A2_22, A3_23)
  return _UPVALUE1_.SUCCESS, L5_25
end
