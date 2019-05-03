local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.activesessions", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_activeSessions")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("loginLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.system.activesessions")
function activeSessionsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10 = _UPVALUE0_.activeSessionConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L3_4, L4_5, L2_3, L5_6
end
function activeSessionsSectionGetNext(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L1_12 = A0_11["activeSessions.cookie"]
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NIL
  if L1_12 == L2_13 then
    L2_13 = util
    L2_13 = L2_13.appendDebugOut
    L3_14 = "GetNext : Invalid Cookie"
    L2_13(L3_14)
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.BAD_PARAMETER
    return L2_13
  end
  L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22 = _UPVALUE1_.activeSessionConfigGetNext(L1_12)
  if L2_13 ~= _UPVALUE0_.SUCCESS then
    return L2_13
  end
  return L2_13, L3_14, L5_16, L6_17, L4_15, L7_18
end
function activeSessionsSectionGetAll()
  local L0_23, L1_24, L2_25, L3_26, L4_27
  L0_23 = _UPVALUE0_
  L0_23 = L0_23.NIL
  L1_24 = tostring
  L2_25 = loginLib
  L2_25 = L2_25.getRandom
  L4_27 = L2_25()
  L1_24 = L1_24(L2_25, L3_26, L4_27, L2_25())
  L2_25 = "/tmp/"
  L3_26 = L1_24
  L4_27 = ""
  L2_25 = L2_25 .. L3_26 .. L4_27
  L3_26 = _UPVALUE1_
  L4_27 = " "
  L3_26 = L3_26 .. L4_27 .. _UPVALUE2_ .. " " .. L2_25
  L4_27 = {}
  util.appendDebugOut("Exec = " .. os.execute(L3_26) .. "<br>")
  L0_23, L4_27 = _UPVALUE3_.getAllActiveSessions(L2_25)
  if L0_23 ~= _UPVALUE0_.SUCCESS then
    return L0_23
  end
  return L0_23, L4_27
end
