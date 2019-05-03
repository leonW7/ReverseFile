local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.sslvpn.currentusers", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_currentUsers")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.currentusers")
function activeSslVpnsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20
  L0_1, L4_5, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20 = _UPVALUE0_.userGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L4_5, L2_3, L7_8, L9_10, L11_12, L12_13
end
function activeSslVpnsSectionGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L21_42
  L1_22 = A0_21["activeSslVpns.cookie"]
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L2_23 = util
    L2_23 = L2_23.appendDebugOut
    L3_24 = "GetNext : Invalid Cookie"
    L2_23(L3_24)
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.BAD_PARAMETER
    return L2_23
  end
  L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L21_42 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_23, L6_27, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L21_42 = _UPVALUE1_.userGetNext(L1_22)
  if L2_23 ~= _UPVALUE0_.SUCCESS then
    return L2_23
  end
  return L2_23, L6_27, L4_25, L9_30, L11_32, L13_34, L14_35
end
function activeSslVpnsSectionGetAll()
  local L0_43, L1_44
  L1_44 = {}
  L0_43, L1_44 = _UPVALUE0_.usersGetAll()
  if L0_43 ~= _UPVALUE1_.SUCCESS then
    return L0_43
  end
  return L0_43, L1_44
end
function connectionStatusSet(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50
  L1_46 = ACCESS_LEVEL
  if L1_46 ~= 0 then
    L1_46 = util
    L1_46 = L1_46.appendDebugOut
    L2_47 = "Detected Unauthorized access for page activeSslVpns PAGE"
    L1_46(L2_47)
    L1_46 = _UPVALUE0_
    L1_46 = L1_46.UNAUTHORIZED
    return L1_46
  end
  L1_46 = A0_45["activeSslVpns.cookie"]
  L2_47 = _UPVALUE0_
  L2_47 = L2_47.NIL
  if L1_46 == L2_47 then
    L2_47 = util
    L2_47 = L2_47.appendDebugOut
    L3_48 = "Set : Invalid Cookie"
    L2_47(L3_48)
    L2_47 = _UPVALUE0_
    L2_47 = L2_47.BAD_PARAMETER
    return L2_47
  end
  L2_47, L3_48 = nil, nil
  L4_49 = cgilua
  L4_49 = L4_49.cookies
  L4_49 = L4_49.get
  L5_50 = "TeamF1Login"
  L4_49 = L4_49(L5_50)
  L5_50 = _UPVALUE0_
  L5_50 = L5_50.NIL
  if L4_49 ~= L5_50 then
    L5_50 = db
    L5_50 = L5_50.escape
    L5_50 = L5_50(L4_49)
    L4_49 = L5_50
  end
  L5_50 = "ipaddr = '"
  L5_50 = L5_50 .. SAPI.Request.servervariable("REMOTE_ADDR") .. "' AND cookie = '" .. L4_49 .. "'"
  _UPVALUE1_.start()
  L2_47, L3_48 = _UPVALUE2_.connectionStateSet(L1_46)
  if L2_47 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page activeVpns PAGE" .. L2_47)
    _UPVALUE1_.abort()
    return L2_47, L1_46
  end
  L2_47, redirectPage = _UPVALUE2_.isSessionTimedOut(L5_50)
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, redirectPage
end
function sslTunnelStatusGet()
  local L0_51
  L0_51 = _UPVALUE0_
  L0_51 = L0_51.tunnelStatusGet
  L0_51 = L0_51()
  if tonumber(L0_51) == 0 then
    return 0
  else
    return -1
  end
end
