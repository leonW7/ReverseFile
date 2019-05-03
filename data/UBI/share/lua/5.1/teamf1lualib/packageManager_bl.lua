local L0_0
L0_0 = module
L0_0("com.teamf1.bl.pkg.driver", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/pkg_drivers")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function threegDriverSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = {}
  L1_2 = {}
  L2_3, L3_4 = nil, nil
  L2_3, L0_1, L1_2 = _UPVALUE0_.threeGdriversGet()
  if L2_3 ~= _UPVALUE1_.SUCCESS then
    return L2_3, L0_1, L1_2
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function threegDriverHistorySectionGet()
  local L0_5, L1_6, L2_7
  L1_6, L0_5 = _UPVALUE0_.threeGdriversHistoryGet()
  if L1_6 ~= _UPVALUE1_.SUCCESS then
    return L1_6
  end
  return _UPVALUE1_.SUCCESS, L0_5
end
function threegDriverInstallManuallySet(A0_8)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page packageManager")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.threeGdriversManuallyInstall(A0_8)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page packagemanager" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function threegSectionActionSet(A0_9, A1_10, A2_11)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page packageManager")
    return _UPVALUE0_.UNAUTHORIZED
  end
  returnCode, cookie = _UPVALUE1_.threeGdriversAction(A0_9, A1_10, A2_11)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page packagemanager" .. returnCode)
    _UPVALUE2_.abort()
    return returnCode
  end
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
