local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.ipsecMode", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_modeConfig")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function ipsecModeConfigSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.ipsecModeConfigGet
  L13_14 = L0_1()
  L14_15 = _UPVALUE1_
  L14_15 = L14_15.SUCCESS
  if L0_1 ~= L14_15 then
    return L0_1
  end
  L14_15 = {}
  L14_15["tunnelMode.tunnelMode"] = L3_4
  L14_15["tunnelMode.firstPoolStartIP"] = L4_5
  L14_15["tunnelMode.firstPoolEndIP"] = L5_6
  L14_15["tunnelMode.primaryDns"] = L12_13
  L14_15["tunnelMode.secondaryDns"] = L13_14
  L14_15["tunnelMode.primaryWINS"] = L10_11
  L14_15["tunnelMode.secondaryWINS"] = L11_12
  L15_16 = L0_1
  return L15_16, cookie, L14_15
end
function ipsecModeConfigSectionSet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27
  L3_20 = ACCESS_LEVEL
  if L3_20 ~= 0 then
    L3_20 = util
    L3_20 = L3_20.appendDebugOut
    L4_21 = "Detected Unauthorized access for page tunnelMode"
    L3_20(L4_21)
    L3_20 = _UPVALUE0_
    L3_20 = L3_20.UNAUTHORIZED
    return L3_20
  end
  L3_20 = A0_17["tunnelMode.cookie"]
  L4_21 = A0_17["tunnelMode.tunnelMode"]
  L5_22 = A0_17["tunnelMode.firstPoolStartIP"]
  L6_23 = A0_17["tunnelMode.firstPoolEndIP"]
  L7_24 = A0_17["tunnelMode.primaryDns"]
  L8_25 = A0_17["tunnelMode.secondaryDns"]
  L9_26 = A0_17["tunnelMode.primaryWINS"]
  L10_27 = A0_17["tunnelMode.secondaryWINS"]
  if L3_20 == nil then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L4_21 == nil or L5_22 == nil or L6_23 == nil then
    util.appendDebugOut("Set : Invalid Parameters")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if L7_24 == _UPVALUE0_.NIL or L7_24 == "" then
    L7_24 = "0.0.0.0"
  end
  if L8_25 == _UPVALUE0_.NIL or L8_25 == "" then
    L8_25 = "0.0.0.0"
  end
  if L9_26 == _UPVALUE0_.NIL or L9_26 == "" then
    L9_26 = "0.0.0.0"
  end
  if L10_27 == _UPVALUE0_.NIL or L10_27 == "" then
    L10_27 = "0.0.0.0"
  end
  _UPVALUE1_.start()
  L1_18, L2_19 = _UPVALUE2_.ipsecModeConfigSet(L3_20, "modeConfig", L4_21, L5_22, L6_23, "0.0.0.0", "0.0.0.0", "0.0.0.0", "0.0.0.0", L9_26, L10_27, L7_24, L8_25)
  if L1_18 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page tunnelMode" .. L1_18)
    _UPVALUE1_.abort()
    return L1_18, L3_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_19
end
