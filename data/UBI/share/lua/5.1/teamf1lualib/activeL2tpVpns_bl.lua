local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.active_l2tp_vpn", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_l2tpClient")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("l2tpClientLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function activeL2tpVpnsAutoDialStatusGet()
  local L0_1
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.NIL
  L0_1 = db.getAttribute("autodiall2tpvpn", "_ROWID_", "1", "action")
  L0_1 = tonumber(L0_1)
  return L0_1
end
function activeL2tpVpnsSectionGet()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L9_11 = _UPVALUE0_
  L9_11 = L9_11.activeL2tpVpnClientsGet
  L4_6, L5_7, L9_11 = nil, nil, L9_11()
  L4_6, L5_7, L10_12 = nil, nil, L9_11()
  L4_6, L5_7, L11_13 = nil, nil, L9_11()
  L3_5 = L11_13
  L1_3 = L10_12
  L0_2 = L9_11
  L9_11 = _UPVALUE1_
  L9_11 = L9_11.SUCCESS
  if L0_2 ~= L9_11 then
    return L0_2
  end
  L9_11 = _UPVALUE0_
  L9_11 = L9_11.l2tpVpnClientConnectionStatusGet
  L11_13 = L9_11()
  L8_10 = L11_13
  L7_9 = L10_12
  L0_2 = L9_11
  L9_11 = _UPVALUE0_
  L9_11 = L9_11.isfeatureEnabled
  L11_13 = L9_11()
  L6_8 = L11_13
  L1_3 = L10_12
  L0_2 = L9_11
  L9_11 = _UPVALUE1_
  L9_11 = L9_11.SUCCESS
  if L0_2 ~= L9_11 then
    return L0_2
  end
  L9_11, L10_12, L11_13 = nil, nil, nil
  if L6_8 == _UPVALUE2_ then
    L9_11 = _UPVALUE3_
  end
  if L5_7 ~= _UPVALUE1_.NIL and L5_7 == _UPVALUE4_ then
    if tonumber(L7_9) == 0 then
      L11_13 = _UPVALUE5_
      L10_12 = _UPVALUE6_
    else
      L11_13 = _UPVALUE7_
      L10_12 = _UPVALUE8_
    end
  elseif tonumber(L7_9) ~= _UPVALUE2_ then
    L11_13 = _UPVALUE7_
    L10_12 = _UPVALUE8_
  else
    L11_13 = _UPVALUE5_
    L10_12 = _UPVALUE6_
  end
  if tonumber(L7_9) == 0 then
    L7_9 = _UPVALUE9_
  elseif tonumber(L7_9) == 12 and tonumber(L8_10) == 1 then
    L7_9 = _UPVALUE10_
  elseif tonumber(L7_9) == 19 then
    L7_9 = _UPVALUE11_
  else
    L7_9 = _UPVALUE12_
  end
  return L0_2, L1_3, L7_9, L11_13, L10_12, L9_11
end
function activeL2tpVpnsSectionSet(A0_14)
  local L1_15, L2_16, L3_17, L4_18
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page activeL2tpVpns"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["activeL2tpVpns.cookie"]
  L2_16 = A0_14["activeL2tpVpns.action"]
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.NIL
  if L1_15 == L3_17 then
    L3_17 = util
    L3_17 = L3_17.appendDebugOut
    L4_18 = "Set : Invalid Cookie"
    L3_17(L4_18)
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.BAD_PARAMETER
    return L3_17
  end
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.NIL
  if L2_16 == L3_17 then
    L3_17 = util
    L3_17 = L3_17.appendDebugOut
    L4_18 = "Set : Invalid action"
    L3_17(L4_18)
    L3_17 = _UPVALUE0_
    L3_17 = L3_17.BAD_PARAMETER
    return L3_17
  end
  L3_17 = _UPVALUE1_
  if L2_16 ~= L3_17 then
    L3_17 = _UPVALUE2_
    if L2_16 ~= L3_17 then
      L3_17 = util
      L3_17 = L3_17.appendDebugOut
      L4_18 = "Set : Invalid action"
      L3_17(L4_18)
      L3_17 = _UPVALUE0_
      L3_17 = L3_17.BAD_PARAMETER
      return L3_17
    end
  end
  L3_17, L4_18 = nil, nil
  _UPVALUE3_.start()
  if L2_16 == _UPVALUE1_ then
    L3_17, L4_18 = _UPVALUE4_.actionEnable(L1_15)
  else
    L3_17, L4_18 = _UPVALUE4_.actionDisable(L1_15)
  end
  if L3_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page activeL2tpVpns" .. L3_17)
    _UPVALUE3_.abort()
    return L3_17, L1_15
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L4_18
end
