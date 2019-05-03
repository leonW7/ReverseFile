local L0_0
L0_0 = module
L0_0("com.teamf1.bl.setLanguage", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/pkg_language")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function languageSettingsSectionGetAll()
  local L0_1, L1_2
  L1_2 = {}
  L0_1, L1_2 = _UPVALUE0_.languageSettingsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function languageSecttingsSectionSet(A0_3)
  local L1_4, L2_5
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for page setLanguage"
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4, L2_5 = nil, nil
  languageId = A0_3["setLanguage.languageId"]
  _UPVALUE1_.start()
  L1_4, L2_5 = _UPVALUE2_.languageSettingsSet(languageId)
  if L1_4 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page setLanguage" .. L1_4)
    _UPVALUE1_.abort()
    return L1_4
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_5
end
