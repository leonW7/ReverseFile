local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.adhoc", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wlanassociatedadhocclients_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).apMacAddress = 2
;({}).apLocation = 3
;({}).apRadio = 4
;({}).detectMode = 5
;({}).age = 6
function adHocClientsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.wlanassociatedadhocclientsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in configuring values in adHocClients page" .. L0_1)
    if L0_1 == _UPVALUE2_.NO_ASSOCIATED_ADHOC_CLIENT then
      return _UPVALUE1_.SUCCESS
    else
      return L0_1
    end
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function adHocClientsAllow(A0_5)
  local L1_6, L2_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for adHocClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_7 = A0_5["adHocClients.checkbox"]
  if L2_7 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_6 = _UPVALUE1_.wlanassociatedadhocclientsAllow(L2_7)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in adHocClients page" .. L1_6)
  end
  return L1_6
end
function adHocClientsDeny(A0_8)
  local L1_9, L2_10
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for adHocClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L2_10 = A0_8["adHocClients.checkbox"]
  if L2_10 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_9 = _UPVALUE1_.wlanassociatedadhocclientsDeny(L2_10)
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in adHocClients page" .. L1_9)
  end
  return L1_9
end
function adHocClientsDeleteAll()
  local L0_11
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for adHocClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_11 = _UPVALUE1_.wlanassociatedadhocclientsDelete()
  if L0_11 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in adHocClients page" .. L0_11)
  end
  return L0_11
end
