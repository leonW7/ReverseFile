local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.l2tpclient", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.returnCodes")
function l2tpClientSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13 = _UPVALUE0_.l2tpVpnClientGet()
  L10_11 = tostring(tonumber(L10_11) + 1)
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13
end
function l2tpClientSectionSet(A0_14)
  local L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27, L14_28
  L1_15 = ACCESS_LEVEL
  if L1_15 ~= 0 then
    L1_15 = util
    L1_15 = L1_15.appendDebugOut
    L2_16 = "Detected Unauthorized access for page l2tpClient"
    L1_15(L2_16)
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.UNAUTHORIZED
    return L1_15
  end
  L1_15 = A0_14["l2tpClient.cookie"]
  L2_16 = A0_14["l2tpClient.feature"]
  L3_17 = A0_14["l2tpClient.serverIpAddress"]
  L4_18 = A0_14["l2tpClient.remoteNetwork"]
  L5_19 = A0_14["l2tpClient.remoteNetmask"]
  L6_20 = A0_14["l2tpClient.userName"]
  L7_21 = A0_14["l2tpClient.password"]
  L8_22 = A0_14["l2tpClient.idleTimeOut"]
  L9_23 = A0_14["l2tpClient.useMppe"]
  L10_24 = A0_14["l2tpClient.reconnectMode"]
  L11_25 = A0_14["l2tpClient.action"]
  L12_26 = A0_14["l2tpClient.time"]
  L13_27 = _UPVALUE0_
  L13_27 = L13_27.NIL
  if L1_15 == L13_27 then
    L13_27 = util
    L13_27 = L13_27.appendDebugOut
    L14_28 = "Set : Invalid Cookie"
    L13_27(L14_28)
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.BAD_PARAMETER
    return L13_27
  end
  L13_27 = _UPVALUE1_
  if L2_16 == L13_27 then
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L3_17 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : serverIpAddress"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L4_18 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid remoteNetwork"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L5_19 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid remoteNetmask"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L6_20 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid userName"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L7_21 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid password"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L10_24 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid reconnect mode"
      L13_27(L14_28)
    end
    if L10_24 == "2" then
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.NIL
      if L8_22 == L13_27 then
        L13_27 = util
        L13_27 = L13_27.appendDebugOut
        L14_28 = "Set : Invalid idleTimeOut"
        L13_27(L14_28)
        L13_27 = _UPVALUE0_
        L13_27 = L13_27.BAD_PARAMETER
        return L13_27
      end
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L9_23 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid useMppe"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = _UPVALUE0_
    L13_27 = L13_27.NIL
    if L11_25 == L13_27 then
      L13_27 = util
      L13_27 = L13_27.appendDebugOut
      L14_28 = "Set : Invalid time"
      L13_27(L14_28)
      L13_27 = _UPVALUE0_
      L13_27 = L13_27.BAD_PARAMETER
      return L13_27
    end
    L13_27 = tostring
    L14_28 = tonumber
    L14_28 = L14_28(L10_24)
    L14_28 = L14_28 - 1
    L13_27 = L13_27(L14_28)
    L10_24 = L13_27
  end
  L13_27, L14_28 = nil, nil
  _UPVALUE2_.start()
  L13_27, L14_28 = _UPVALUE3_.l2tpVpnClientSet(L1_15, L2_16, L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26)
  if L13_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page l2tpClient" .. L13_27)
    _UPVALUE2_.abort()
    return L13_27, L1_15
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L14_28
end
