local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwApplicationRules")
L0_0 = require
L0_0("teamf1lualib/fwApplicationRulesUl")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function applicationRulesStatusGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = fw.ul.portTriggerStatus.GetAll()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function applicationRulesStatusGet()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9
  L6_9 = fw
  L6_9 = L6_9.core
  L6_9 = L6_9.portTriggerStatus
  L6_9 = L6_9.Get
  L5_8, L1_4, L2_5, L3_6, L4_7, L6_9 = nil, nil, nil, nil, nil, L6_9()
  L0_3 = L6_9
  L6_9 = _UPVALUE0_
  L6_9 = L6_9.SUCCESS
  if L0_3 ~= L6_9 then
    return L0_3
  end
  L6_9 = {}
  L6_9.lanIpAddr = L1_4
  L6_9.openPortRangeStart = L2_5
  L6_9.openPortRangeEnd = L3_6
  L6_9.timeRemaining = L4_7
  return L0_3, L5_8, L6_9
end
function applicationRulesStatusGetNext(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18
  L1_11 = A0_10["applicationRulesStatus.cookie"]
  if L1_11 == nil then
    L2_12 = util
    L2_12 = L2_12.appendDebugOut
    L3_13 = "GetNext : Invalid Cookie"
    L2_12(L3_13)
    L2_12 = _UPVALUE0_
    L2_12 = L2_12.BAD_PARAMETER
    return L2_12
  end
  L2_12, L3_13, L4_14, L5_15, L6_16, L7_17 = nil, nil, nil, nil, nil, nil
  L8_18 = fw
  L8_18 = L8_18.core
  L8_18 = L8_18.portTriggerStatus
  L8_18 = L8_18.GetNext
  L7_17, L3_13, L4_14, L5_15, L6_16, L8_18 = L1_11, nil, nil, nil, nil, L8_18(L1_11)
  L2_12 = L8_18
  L8_18 = _UPVALUE0_
  L8_18 = L8_18.SUCCESS
  if L2_12 ~= L8_18 then
    return L2_12
  end
  L8_18 = {}
  L8_18.returnCode = L2_12
  L8_18.cookie = L7_17
  L8_18.lanIpAddr = L3_13
  L8_18.openPortRangeStart = L4_14
  L8_18.openPortRangeEnd = L5_15
  L8_18.timeRemaining = L6_16
  return L2_12, L7_17, L8_18
end
function applicationRulesStatusSet(A0_19)
  return _UPVALUE0_.NOT_SUPPORTED
end
function applicationRulesStatusDelete(A0_20)
  return _UPVALUE0_.NOT_SUPPORTED
end
function applicationRulesStatusDefaultsGet()
  local L1_21
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NOT_SUPPORTED
  return L1_21
end
function applicationRulesStatusCreate(A0_22)
  return _UPVALUE0_.NOT_SUPPORTED
end
