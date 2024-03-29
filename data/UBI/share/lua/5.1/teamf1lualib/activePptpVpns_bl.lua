local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.active_pptp_vpn", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_pptpClient")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("pptpClientLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function activePptpVpnsAutoDialStatusGet()
  local L0_1
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.NIL
  L0_1 = db.getAttribute("autodialpptpvpn", "_ROWID_", "1", "action")
  L0_1 = tonumber(L0_1)
  return L0_1
end
function activePptpVpnsSectionGet()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L8_10 = _UPVALUE0_
  L8_10 = L8_10.activePptpVpnClientsGet
  L4_6, L5_7, L8_10 = nil, nil, L8_10()
  L4_6, L5_7, L9_11 = nil, nil, L8_10()
  L4_6, L5_7, L10_12 = nil, nil, L8_10()
  L3_5 = L10_12
  L1_3 = L9_11
  L0_2 = L8_10
  L8_10 = _UPVALUE1_
  L8_10 = L8_10.SUCCESS
  if L0_2 ~= L8_10 then
    return L0_2
  end
  L8_10 = _UPVALUE0_
  L8_10 = L8_10.pptpVpnClientConnectionStatusGet
  L9_11 = L8_10()
  L7_9 = L9_11
  L0_2 = L8_10
  L8_10 = _UPVALUE0_
  L8_10 = L8_10.isfeatureEnabled
  L10_12 = L8_10()
  L6_8 = L10_12
  L1_3 = L9_11
  L0_2 = L8_10
  L8_10 = _UPVALUE1_
  L8_10 = L8_10.SUCCESS
  if L0_2 ~= L8_10 then
    return L0_2
  end
  L8_10, L9_11, L10_12 = nil, nil, nil
  if L6_8 == _UPVALUE2_ then
    L8_10 = _UPVALUE3_
  end
  if L5_7 ~= _UPVALUE1_.NIL and L5_7 == _UPVALUE4_ then
    if tonumber(L7_9) == _UPVALUE5_ then
      L10_12 = _UPVALUE6_
      L9_11 = _UPVALUE7_
    else
      L10_12 = _UPVALUE8_
      L9_11 = _UPVALUE9_
    end
  elseif tonumber(L7_9) ~= _UPVALUE2_ then
    L10_12 = _UPVALUE8_
    L9_11 = _UPVALUE9_
  else
    L10_12 = _UPVALUE6_
    L9_11 = _UPVALUE7_
  end
  if tonumber(L7_9) == _UPVALUE5_ then
    L7_9 = _UPVALUE10_
  else
    L7_9 = _UPVALUE11_
  end
  return L0_2, L1_3, L7_9, L10_12, L9_11, L8_10
end
function activePptpVpnsSectionSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page activePptpVpns"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["activePptpVpns.cookie"]
  L2_15 = A0_13["activePptpVpns.action"]
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L1_14 == L3_16 then
    L3_16 = util
    L3_16 = L3_16.appendDebugOut
    L4_17 = "Set : Invalid Cookie"
    L3_16(L4_17)
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.BAD_PARAMETER
    return L3_16
  end
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  if L2_15 == L3_16 then
    L3_16 = util
    L3_16 = L3_16.appendDebugOut
    L4_17 = "Set : Invalid action"
    L3_16(L4_17)
    L3_16 = _UPVALUE0_
    L3_16 = L3_16.BAD_PARAMETER
    return L3_16
  end
  L3_16 = _UPVALUE1_
  if L2_15 ~= L3_16 then
    L3_16 = _UPVALUE2_
    if L2_15 ~= L3_16 then
      L3_16 = util
      L3_16 = L3_16.appendDebugOut
      L4_17 = "Set : Invalid action"
      L3_16(L4_17)
      L3_16 = _UPVALUE0_
      L3_16 = L3_16.BAD_PARAMETER
      return L3_16
    end
  end
  L3_16, L4_17 = nil, nil
  _UPVALUE3_.start()
  if L2_15 == _UPVALUE1_ then
    L3_16, L4_17 = _UPVALUE4_.actionEnable(L1_14)
  else
    L3_16, L4_17 = _UPVALUE4_.actionDisable(L1_14)
  end
  if L3_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page activePptpVpns" .. L3_16)
    _UPVALUE3_.abort()
    return L3_16, L1_14
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L4_17
end
