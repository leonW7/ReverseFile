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
L0_0("teamf1lualib/threeg_smsEvent")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).receiverInfo = "ReceiverInfo"
;({}).wanStatusInfo = "WANStatusInfo"
;({}).vpnStatusInfo = "VPNStatusInfo"
;({}).cpuUsageInfo = "CPUUtilizationInfo"
function smsEventGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.smsEventInfoGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2, L2_3
  end
  return _UPVALUE1_.SUCCESS, L1_2, L2_3
end
function smsEventCreate(A0_4)
  local L1_5, L2_6
  L1_5 = {}
  L2_6 = _UPVALUE0_
  L2_6 = L2_6 .. "." .. _UPVALUE1_.receiverInfo
  L1_5[L2_6] = A0_4["smsEvent.receiver"]
  L2_6 = _UPVALUE0_
  L2_6 = L2_6 .. "." .. _UPVALUE1_.wanStatusInfo
  L1_5[L2_6] = A0_4["smsEvent.WANStatusInfo"]
  L2_6 = _UPVALUE0_
  L2_6 = L2_6 .. "." .. _UPVALUE1_.vpnStatusInfo
  L1_5[L2_6] = A0_4["smsEvent.VPNStatusInfo"]
  L2_6 = _UPVALUE0_
  L2_6 = L2_6 .. "." .. _UPVALUE1_.cpuUsageInfo
  L1_5[L2_6] = A0_4["smsEvent.CPUUtilizationInfo"]
  L2_6 = nil
  _UPVALUE2_.start()
  L2_6 = _UPVALUE3_.smsEventSet(L1_5)
  if L2_6 ~= _UPVALUE4_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page smsEvent" .. L2_6)
    _UPVALUE2_.abort()
    return L2_6
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE4_.SUCCESS
end
