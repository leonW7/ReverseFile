local L0_0
L0_0 = module
L0_0("com.teamf1.ul.filter.content", package.seeall)
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.filter.content")
function contentFilteringEnable()
  local L0_1, L1_2
  L1_2 = _UPVALUE0_.featureEnable()
  if _UPVALUE1_.SUCCESS ~= L1_2 then
    return L1_2
  end
  return _UPVALUE1_.SUCCESS, cookie
end
function contentFilteringDisable()
  local L0_3, L1_4
  L1_4 = _UPVALUE0_.featureDisable()
  if _UPVALUE1_.SUCCESS ~= L1_4 then
    return L1_4
  end
  return _UPVALUE1_.SUCCESS, cookie
end
