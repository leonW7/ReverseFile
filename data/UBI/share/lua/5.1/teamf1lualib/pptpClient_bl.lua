local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.pptpclient", package.seeall)
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
L0_0 = L0_0("com.teamf1.core.returnCodes")
function pptpClientSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12 = _UPVALUE0_.pptpVpnClientGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
end
function pptpClientSectionSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page pptpClient"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["pptpClient.cookie"]
  L2_15 = A0_13["pptpClient.feature"]
  L3_16 = A0_13["pptpClient.serverIpAddress"]
  L4_17 = A0_13["pptpClient.remoteNetwork"]
  L5_18 = A0_13["pptpClient.remoteNetmask"]
  L6_19 = A0_13["pptpClient.userName"]
  L7_20 = A0_13["pptpClient.password"]
  L8_21 = A0_13["pptpClient.idleTimeOut"]
  L9_22 = A0_13["pptpClient.useMppe"]
  L10_23 = A0_13["pptpClient.action"]
  L11_24 = A0_13["pptpClient.time"]
  L12_25 = _UPVALUE0_
  L12_25 = L12_25.NIL
  if L1_14 == L12_25 then
    L12_25 = util
    L12_25 = L12_25.appendDebugOut
    L13_26 = "Set : Invalid Cookie"
    L12_25(L13_26)
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.BAD_PARAMETER
    return L12_25
  end
  L12_25 = _UPVALUE1_
  if L2_15 == L12_25 then
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L3_16 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : serverIpAddress"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L4_17 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid remoteNetwork"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L5_18 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid remoteNetmask"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L6_19 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid userName"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L7_20 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid password"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L8_21 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid idleTimeOut"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L9_22 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid useMppe"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
    L12_25 = _UPVALUE0_
    L12_25 = L12_25.NIL
    if L10_23 == L12_25 then
      L12_25 = util
      L12_25 = L12_25.appendDebugOut
      L13_26 = "Set : Invalid action"
      L12_25(L13_26)
      L12_25 = _UPVALUE0_
      L12_25 = L12_25.BAD_PARAMETER
      return L12_25
    end
  end
  L12_25, L13_26 = nil, nil
  _UPVALUE2_.start()
  L12_25, L13_26 = _UPVALUE3_.pptpVpnClientSet(L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24)
  if L12_25 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page pptpClient" .. L12_25)
    _UPVALUE2_.abort()
    return L12_25, L1_14
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L13_26
end
