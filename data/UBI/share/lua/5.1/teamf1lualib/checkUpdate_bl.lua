local L0_0
L0_0 = module
L0_0("com.teamf1.bl.maintenance.checkUpdate", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_management")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function checkUpdateSectionGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.firmwareCheckGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
function checkUpdateSectionSet(A0_4)
  local L1_5
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L1_5("Detected Unauthorized access for page checkUpdate")
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = nil
  curCookie = A0_4["checkUpdate.cookie"]
  _UPVALUE1_.start()
  returnCode, L1_5 = _UPVALUE2_.firmwareCheckSet(curCookie)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page checkUpdate" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L1_5
end
