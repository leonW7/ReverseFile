local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.wmm", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_wmm")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function wmmSectionGetCur(A0_1, A1_2)
  local L2_3, L3_4, L4_5
  L2_3 = {}
  L3_4, L4_5 = nil, nil
  L3_4, L4_5, L2_3 = _UPVALUE0_.wmmGet(A0_1, A1_2)
  if L3_4 ~= _UPVALUE1_.SUCCESS then
    return L3_4
  end
  return _UPVALUE1_.SUCCESS, L4_5, L2_3
end
function wmmSectionSet(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = util
    L1_7 = L1_7.appendDebugOut
    L2_8 = "Detected Unauthorized access for page wmm"
    L1_7(L2_8)
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.UNAUTHORIZED
    return L1_7
  end
  L1_7, L2_8, L3_9, L4_10 = nil, nil, nil, nil
  L5_11 = {}
  curCookie = L6_12
  L2_8 = A0_6["wmm.profileName"]
  L3_9 = A0_6["wmm.enableWmm"]
  L4_10 = A0_6["wmm.defaultCos"]
  for L9_15 = 0, 64 do
    L5_11["dscpCosMap" .. L9_15] = A0_6["wmm.dscpCosMap" .. L9_15]
  end
  L6_12()
  L9_15 = L4_10
  L1_7 = L7_13
  returnCode = L6_12
  if L6_12 ~= L7_13 then
    L6_12(L7_13)
    L6_12()
    return L6_12
  end
  L6_12()
  L6_12()
  return L6_12, L7_13
end
