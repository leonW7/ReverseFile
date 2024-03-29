local L0_0
L0_0 = module
L0_0("com.teamf1.bl.sslvpn.resourceConfig", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_resourceConfig")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function sslvpnResourceConfigSectionGetAll()
  local L0_1, L1_2
  L1_2 = {}
  L0_1, L1_2 = _UPVALUE0_.resourceConfigurationGetAll()
  if L1_2 == _UPVALUE1_.NIL then
    L1_2 = {}
  end
  for _FORV_5_, _FORV_6_ in pairs(L1_2) do
    if L1_2[_FORV_5_].ServiceType == _UPVALUE2_ then
      L1_2[_FORV_5_].ServiceType = "VPN Tunnel"
    elseif L1_2[_FORV_5_].ServiceType == _UPVALUE3_ then
      L1_2[_FORV_5_].ServiceType = "Port Forwarding"
    elseif L1_2[_FORV_5_].ServiceType == _UPVALUE4_ then
      L1_2[_FORV_5_].ServiceType = "All"
    end
  end
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1, L1_2
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function sslvpnResourceConfigSectionCreate(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for page sslvpnResourceConfig"
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4 = A0_3["sslvpnResourceConfig.resourceName"]
  L2_5 = A0_3["sslvpnResourceConfig.serviceType"]
  L3_6 = A0_3["sslvpnResourceConfig.objectType"]
  L4_7 = A0_3["sslvpnResourceConfig.objectAddress"]
  L5_8 = A0_3["sslvpnResourceConfig.maskLength"]
  L6_9 = A0_3["sslvpnResourceConfig.startPort"]
  L7_10 = A0_3["sslvpnResourceConfig.endPort"]
  L8_11 = A0_3["sslvpnResourceConfig.icmp"]
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L1_4 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid resourceName"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L2_5 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid serviceType"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L3_6 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid objectType"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L4_7 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid objectAddress"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L6_9 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid startPort"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12 = _UPVALUE0_
  L9_12 = L9_12.NIL
  if L7_10 == L9_12 then
    L9_12 = util
    L9_12 = L9_12.appendDebugOut
    L10_13 = "Set : Invalid endPort"
    L9_12(L10_13)
    L9_12 = _UPVALUE0_
    L9_12 = L9_12.BAD_PARAMETER
    return L9_12
  end
  L9_12, L10_13 = nil, nil
  if L2_5 == _UPVALUE1_[1] then
    L2_5 = _UPVALUE2_
  elseif L2_5 == _UPVALUE1_[2] then
    L2_5 = _UPVALUE3_
  elseif L2_5 == _UPVALUE1_[3] then
    L2_5 = _UPVALUE4_
  end
  _UPVALUE5_.start()
  L9_12, L10_13 = _UPVALUE6_.resourceConfigurationCreate(L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11)
  if L9_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page sslvpnResourceConfig" .. L9_12)
    _UPVALUE5_.abort()
    return L9_12
  end
  _UPVALUE5_.complete()
  _UPVALUE5_.save()
  return _UPVALUE0_.SUCCESS, L10_13
end
function sslvpnResourceConfigSectionDelete(A0_14)
  local L1_15, L2_16
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResourceConfig PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_15 = A0_14["sslvpnResourceConfig.cookie"]
  if L1_15 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_16, cookie = _UPVALUE2_.resourceConfigurationDelete(L1_15)
  if L2_16 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResourceConfig page " .. L2_16)
    _UPVALUE1_.abort()
    return L2_16
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_16, cookie
end
function sslvpnResourcesSectionDeleteAll()
  local L0_17
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for sslvpnResourceConfig PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L0_17 = _UPVALUE2_.resourceConfigurationDeleteAll()
  if L0_17 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in sslvpnResourceConfig page " .. L0_17)
    _UPVALUE1_.abort()
    return L0_17
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L0_17
end
