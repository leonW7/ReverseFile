local L0_0
L0_0 = module
L0_0("com.teamf1.core.lanqos.autovoip", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/lanqos_qosOnLan")
L0_0 = require
L0_0("teamf1lualib/qos_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
autovoipTable = "autoVoip"
;({}).feature = "autoVoip"
function isfeatureEnabled()
  local L0_1
  L0_1 = db.getAttribute(autovoipTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function featureEnable()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L1_5 = _UPVALUE0_
  L2_6, L3_7, L4_8 = nil, nil, nil
  L2_6, L3_7, L4_8 = _UPVALUE1_.isfeatureEnabled()
  if L2_6 ~= _UPVALUE2_.SUCCESS or _UPVALUE3_ ~= L4_8 then
    return _UPVALUE4_.LANQOS_DISABLED
  end
  L0_4 = db.setAttribute(autovoipTable, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.feature, _UPVALUE3_)
  if not L0_4 then
    return _UPVALUE2_.FAILURE, L1_5
  end
  return _UPVALUE2_.SUCCESS, L1_5
end
function featureDisable()
  local L0_9, L1_10, L2_11, L3_12, L4_13
  L1_10 = _UPVALUE0_
  L2_11, L3_12, L4_13 = nil, nil, nil
  L2_11, L3_12, L4_13 = _UPVALUE1_.isfeatureEnabled()
  if L2_11 ~= _UPVALUE2_.SUCCESS or _UPVALUE3_ ~= L4_13 then
    return _UPVALUE4_.LANQOS_DISABLED
  end
  L0_9 = db.setAttribute(autovoipTable, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.feature, _UPVALUE8_)
  if not L0_9 then
    return _UPVALUE2_.FAILURE, L1_10
  end
  return _UPVALUE2_.SUCCESS, L1_10
end
