local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.knownclient", package.seeall)
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/knownclientsshow_web")
L0_0 = require
L0_0("teamf1lualib/knownclientsglobal_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).macAddress = 1
;({}).name = 2
;({}).authType = 3
function listTypeGet()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.knownclientsglobalGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function knownClientsGet()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8
  L3_6 = {}
  L4_7 = {}
  L5_8 = 1
  L0_3, L1_4 = listTypeGet()
  if L0_3 ~= _UPVALUE0_.SUCCESS then
    return L0_3
  end
  L0_3, L2_5 = _UPVALUE1_.knownclientsShowGet()
  if L0_3 ~= _UPVALUE0_.SUCCESS then
    if _UPVALUE2_.NO_KNOWN_CLIENT_ENTRY_EXIST == L0_3 then
      return _UPVALUE0_.SUCCESS
    else
      return L0_3
    end
  end
  if L1_4 == _UPVALUE3_ then
    for _FORV_9_, _FORV_10_ in pairs(L2_5) do
      L4_7[L5_8] = {}
      for _FORV_14_, _FORV_15_ in pairs(_UPVALUE4_) do
        if _UPVALUE5_ == _FORV_15_ then
          L4_7[L5_8][_FORV_14_] = _UPVALUE6_[_UPVALUE7_ + _FORV_10_[_FORV_15_]]
        else
          L4_7[L5_8][_FORV_14_] = _FORV_10_[_FORV_15_]
        end
      end
      L5_8 = L5_8 + 1
    end
  elseif L1_4 == _UPVALUE8_ then
    for _FORV_9_, _FORV_10_ in pairs(L2_5) do
      L3_6[L5_8] = {}
      for _FORV_14_, _FORV_15_ in pairs(_UPVALUE4_) do
        if _UPVALUE5_ == _FORV_15_ then
          L3_6[L5_8][_FORV_14_] = _UPVALUE6_[_UPVALUE7_ + _FORV_10_[_FORV_15_]]
        else
          L3_6[L5_8][_FORV_14_] = _FORV_10_[_FORV_15_]
        end
      end
      L5_8 = L5_8 + 1
    end
  end
  return L0_3, L3_6, L4_7
end
function knownClientsCurGet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L6_14
  L3_12 = 1
  L4_13 = {}
  L6_14 = false
  if A0_9.configRowId == _UPVALUE0_.NIL then
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_10, L2_11 = _UPVALUE1_.knownclientsShowGet()
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    return L1_10
  end
  for _FORV_10_, _FORV_11_ in pairs(L2_11) do
    if _FORV_11_[_UPVALUE2_] == A0_9.configRowId then
      L6_14 = true
      for _FORV_15_, _FORV_16_ in pairs(_UPVALUE3_) do
        L4_13[_FORV_15_] = _FORV_11_[_FORV_16_]
      end
    end
  end
  if not L6_14 then
    return _UPVALUE0_.FAILURE
  end
  return L1_10, L4_13
end
function knownClientsAdd(A0_15)
  local L1_16
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for knownClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE1_) do
    if A0_15[_FORV_5_] == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if _FORV_6_ == _UPVALUE2_ then
      A0_15[_FORV_5_] = tonumber(A0_15[_FORV_5_])
    end
  end
  L1_16 = _UPVALUE3_.knownclientsShowAdd(A0_15)
  if L1_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in knownClients page" .. L1_16)
    return L1_16
  end
  return L1_16
end
function knownClientsEdit(A0_17)
  local L1_18
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for knownClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  for _FORV_5_, _FORV_6_ in pairs(_UPVALUE1_) do
    if A0_17[_FORV_5_] == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    end
    if _FORV_6_ == _UPVALUE2_ then
      A0_17[_FORV_5_] = tonumber(A0_17[_FORV_5_])
    end
  end
  L1_18 = _UPVALUE3_.knownclientsShowEdit(A0_17)
  if L1_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in knownClients page" .. L1_18)
    return L1_18
  end
  return L1_18
end
function knownClientsDelete(A0_19)
  local L1_20
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for knownClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_19 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L1_20 = _UPVALUE1_.knownclientsShowDelete(A0_19)
  if L1_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in knownClients page" .. L1_20)
    return L1_20
  end
  return L1_20
end
function knownClientsDeleteAll()
  local L0_21
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for knownClients page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_21 = _UPVALUE1_.knownclientsShowDeleteAll()
  if L0_21 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in managedAps page" .. L0_21)
    return L0_21
  end
  return L0_21
end
