local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.networkProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/networkprofilesshow_web")
L0_0 = require
L0_0("teamf1lualib/networkprofilesconfig_web")
L0_0 = require
L0_0("teamf1lualib/vlan_captivePortal")
L0_0 = require
L0_0("teamf1lualib/captivePortal_networkProfiles_bl")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wlan.networkProfilesInfo")
;({}).networkId = 1
;({}).ssid = 2
;({}).vlanId = 3
;({}).hideSsid = 4
;({}).security = 5
;({}).redirect = 6
networkProfilesList = {}
networkProfilesList.TXNresult = 1
networkProfilesList.networkId = 2
networkProfilesList.ssid = 3
networkProfilesList.hide = 4
networkProfilesList.denyBrcast = 5
networkProfilesList.vlan = 6
networkProfilesList.macAuthMode = 7
networkProfilesList.redirectMode = 8
networkProfilesList.redirectUrl = 9
networkProfilesList.arpsupressionMode = 10
networkProfilesList.l2TunnelMode = 11
networkProfilesList.RadServerStatus = 12
networkProfilesList.radiusUseConfig = 13
networkProfilesList.security = 14
networkProfilesList.wepSecurityMode = 15
networkProfilesList.wpaSecurityMode = 16
networkProfilesList.openSystem = 17
networkProfilesList.sharedKey = 18
networkProfilesList.wepKeyType = 19
networkProfilesList.wepKeyLength = 20
networkProfilesList.wepKeyIndex = 21
networkProfilesList.staticWepKey1 = 22
networkProfilesList.staticWepKey2 = 23
networkProfilesList.staticWepKey3 = 24
networkProfilesList.staticWepKey4 = 25
networkProfilesList.wpaVersion = 26
networkProfilesList.wpa2Version = 27
networkProfilesList.cipherTKIP = 28
networkProfilesList.cipherCCMP = 29
networkProfilesList.wpaKey = 30
networkProfilesList.wpaPreAuthMode = 31
networkProfilesList.wpaPreAuthLimit = 32
networkProfilesList.wpa2KeyCachingHoldTime = 33
networkProfilesList.groupKeyRefreshRate = 34
networkProfilesList.sessionKeyRefreshRate = 35
networkProfilesList.radiusServerName = 36
networkProfilesList.radiusAccountingServerName = 37
networkProfilesList.radiusAccountingServerStatus = 38
networkProfilesList.RadAccServerEnable = 39
captivePortalTypeList = {
  "Free",
  "SLA",
  "Permanent",
  "Temporary"
}
authTypeList = {
  "local",
  "radius",
  "ldap",
  "pop3"
}
authSubTypeList = {
  "pap",
  "chap",
  "ms-chap",
  "ms-chapv2"
}
function networkProfileListGet1()
  local L0_1, L1_2, L2_3
  L1_2 = {}
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.networkprofilesShow1Get()
  for _FORV_6_, _FORV_7_ in pairs(L1_2) do
    L2_3[_FORV_6_] = {}
    for _FORV_11_, _FORV_12_ in pairs(_UPVALUE1_) do
      if _FORV_11_ == "networkId" and tonumber(_FORV_7_[_FORV_12_]) ~= nil then
        L0_1, cookie, networkId, vlanId, _UPVALUE2_, intfNum, captivePortalType, authenticationType, authenticationSubType, loginProfile = _UPVALUE3_.networkProfileCaptivePortalGet(_FORV_7_[_FORV_12_])
        L2_3[_FORV_6_].captivePortalType = captivePortalTypeList[tonumber(captivePortalType)]
        L2_3[_FORV_6_].authServer = authTypeList[tonumber(authenticationType)]
      end
      L2_3[_FORV_6_][_FORV_11_] = _FORV_7_[_FORV_12_]
    end
  end
  return L0_1, L2_3
end
function networkProfileListGetCur(A0_4)
  local L1_5, L2_6, L3_7
  L2_6 = {}
  L3_7 = {}
  L1_5, L2_6 = _UPVALUE0_.networkprofilesConfigGet(tonumber(A0_4))
  if L1_5 ~= _UPVALUE1_.SUCCESS then
    return L1_5
  end
  for _FORV_7_, _FORV_8_ in pairs(networkProfilesList) do
    if L2_6[_FORV_8_] ~= nil then
      if _FORV_7_ == "security" then
        if L2_6[_FORV_8_] == 0 then
          L2_6[_FORV_8_] = "1"
        elseif L2_6[_FORV_8_] == 1 then
          L2_6[_FORV_8_] = "2"
        elseif L2_6[_FORV_8_] == 2 then
          L2_6[_FORV_8_] = "3"
        end
      end
      if _FORV_7_ == "wpaSecurityMode" then
        if L2_6[_FORV_8_] == 0 then
          L2_6[_FORV_8_] = "1"
        elseif L2_6[_FORV_8_] == 1 then
          L2_6[_FORV_8_] = "2"
        end
      end
      if _FORV_7_ == "wepSecurityMode" then
        if L2_6[_FORV_8_] == 0 then
          L2_6[_FORV_8_] = "1"
        elseif L2_6[_FORV_8_] == 1 then
          L2_6[_FORV_8_] = "2"
        end
      end
      if _FORV_7_ == "wepKeyLength" then
        if L2_6[_FORV_8_] == 0 then
          L2_6[_FORV_8_] = 1
        elseif L2_6[_FORV_8_] == 1 then
          L2_6[_FORV_8_] = 2
        end
      end
      if _FORV_7_ == "radiusAuthserverstatus" then
        if L2_6[_FORV_8_] == 0 then
          L2_6[_FORV_8_] = "Disabled"
        elseif L2_6[_FORV_8_] == 1 then
          L2_6[_FORV_8_] = "Enabled"
        end
      end
    end
    L3_7[_FORV_7_] = L2_6[_FORV_8_]
  end
  return L1_5, L3_7
end
function networkProfileListSet(A0_8)
  local L1_9
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L1_9("Detected unauthorized access")
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.UNAUTHORIZED
    return L1_9
  end
  L1_9 = A0_8["networkProfileConfig.security"]
  if L1_9 == "1" then
    A0_8["networkProfileConfig.security"] = 0
  else
    L1_9 = A0_8["networkProfileConfig.security"]
    if L1_9 == "2" then
      A0_8["networkProfileConfig.security"] = 1
    else
      L1_9 = A0_8["networkProfileConfig.security"]
      if L1_9 == "3" then
        A0_8["networkProfileConfig.security"] = 2
      end
    end
  end
  L1_9 = A0_8["networkProfileConfig.wpaSecurityMode"]
  if L1_9 == "1" then
    A0_8["networkProfileConfig.wpaSecurityMode"] = 0
  else
    L1_9 = A0_8["networkProfileConfig.wpaSecurityMode"]
    if L1_9 == "2" then
      A0_8["networkProfileConfig.wpaSecurityMode"] = 1
    end
  end
  L1_9 = A0_8["networkProfileConfig.wepSecurityMode"]
  if L1_9 == "1" then
    A0_8["networkProfileConfig.wepSecurityMode"] = 0
  else
    L1_9 = A0_8["networkProfileConfig.wepSecurityMode"]
    if L1_9 == "2" then
      A0_8["networkProfileConfig.wepSecurityMode"] = 1
    end
  end
  L1_9 = A0_8["networkProfileConfig.wepKeyLength"]
  if L1_9 == "1" then
    A0_8["networkProfileConfig.wepKeyLength"] = 0
  else
    L1_9 = A0_8["networkProfileConfig.wepKeyLength"]
    if L1_9 == "2" then
      A0_8["networkProfileConfig.wepKeyLength"] = 1
    end
  end
  L1_9 = vlanCheck
  L1_9 = L1_9(A0_8["networkProfileConfig.vlan"])
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    L1_9 = _UPVALUE1_
    L1_9 = L1_9.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
    return L1_9
  end
  L1_9 = _UPVALUE2_
  L1_9 = L1_9.networkprofilesConfigSet
  L1_9 = L1_9(A0_8)
  if L1_9 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values  " .. L1_9)
    if L1_9 == _UPVALUE3_ then
      return _UPVALUE4_.VAP_SECURITY_MODE_DENIED
    elseif L1_9 == _UPVALUE5_ then
      return _UPVALUE4_.NETWORK_WPA_CIPHER_SUITE_DENIED
    else
      return L1_9
    end
  end
  return L1_9
end
function networkProfilesCreate(A0_10)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for network profiles ")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_10["networkProfileConfig.security"] == "1" then
    A0_10["networkProfileConfig.security"] = 0
  elseif A0_10["networkProfileConfig.security"] == "2" then
    A0_10["networkProfileConfig.security"] = 1
  elseif A0_10["networkProfileConfig.security"] == "3" then
    A0_10["networkProfileConfig.security"] = 2
  end
  if A0_10["networkProfileConfig.wpaSecurityMode"] == "1" then
    A0_10["networkProfileConfig.wpaSecurityMode"] = 0
  elseif A0_10["networkProfileConfig.wpaSecurityMode"] == "2" then
    A0_10["networkProfileConfig.wpaSecurityMode"] = 1
  end
  if A0_10["networkProfileConfig.wepSecurityMode"] == "1" then
    A0_10["networkProfileConfig.wepSecurityMode"] = 0
  elseif A0_10["networkProfileConfig.wepSecurityMode"] == "2" then
    A0_10["networkProfileConfig.wepSecurityMode"] = 1
  end
  if A0_10["networkProfileConfig.wepKeyLength"] == "1" then
    A0_10["networkProfileConfig.wepKeyLength"] = 0
  elseif A0_10["networkProfileConfig.wepKeyLength"] == "2" then
    A0_10["networkProfileConfig.wepKeyLength"] = 1
  end
  if vlanCheck(A0_10["networkProfileConfig.vlan"]) ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
  end
  returnCode, cookie = _UPVALUE2_.networkprofilesConfigAdd(A0_10)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in network profiles page" .. returnCode)
    return returnCode, cookie
  end
  return returnCode, cookie
end
function networkProfilesDelete(A0_11)
  local L1_12
  if A0_11 == nil then
    util.appendDebugOut("GetNext : Invalid Cookie ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L1_12 = _UPVALUE1_.networkprofilesShowDelete(tonumber(A0_11))
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_12
end
function captivePortalSsidListGet()
  local L0_13, L1_14
  L1_14 = {}
  L0_13, L1_14 = _UPVALUE0_.captivePortalSsidGetAll()
  if L0_13 ~= _UPVALUE1_.SUCCESS then
    return L0_13
  end
  return L0_13, L1_14
end
function captivePortalSectionCreate(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20
  L1_16 = ACCESS_LEVEL
  if L1_16 ~= 0 then
    L1_16 = util
    L1_16 = L1_16.appendDebugOut
    L2_17 = "Detected unauthorized access"
    L1_16(L2_17)
    L1_16 = _UPVALUE0_
    L1_16 = L1_16.UNAUTHORIZED
    return L1_16
  end
  L1_16 = A0_15["networkProfileConfig.captivePortalType"]
  L2_17 = A0_15["networkProfileConfig.vlan"]
  L3_18 = A0_15["networkProfileConfig.authServer"]
  L4_19 = A0_15["networkProfileConfig.authType"]
  L5_20 = A0_15["networkProfileConfig.loginProfile"]
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.captivePortalSsidCreate(L2_17, L1_16, L3_18, L4_19, L5_20)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, curCookie
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, cookie
end
function captivePortalSsidSectionSet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  L1_22 = ACCESS_LEVEL
  if L1_22 ~= 0 then
    L1_22 = util
    L1_22 = L1_22.appendDebugOut
    L2_23 = "Detected unauthorized access"
    L1_22(L2_23)
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.UNAUTHORIZED
    return L1_22
  end
  L1_22 = A0_21["networkProfileConfig.captivePortalType"]
  L2_23 = A0_21.networkId
  L3_24 = A0_21["networkProfileConfig.authServer"]
  L4_25 = A0_21["networkProfileConfig.authType"]
  L5_26 = A0_21["networkProfileConfig.loginProfile"]
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.captivePortalSsidSet(L2_23, L1_22, L3_24, L4_25, L5_26)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, curCookie
  end
  _UPVALUE1_.complete()
  return _UPVALUE0_.SUCCESS, cookie
end
function captivePortalSsidListGetCur(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32
  L2_29 = {}
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.captivePortalSsidGetCur
  authenticationType, authenticationSubType, loginProfile, L3_30 = nil, nil, nil, L3_30(L4_31)
  captivePortalType = L5_32
  A0_27 = L4_31
  L1_28 = L3_30
  L3_30 = nil
  for _FORV_7_, _FORV_8_ in L4_31(L5_32) do
    if _FORV_8_ == captivePortalType then
      L3_30 = _FORV_7_
    end
  end
  for _FORV_8_, _FORV_9_ in L5_32(authTypeList) do
  end
  for _FORV_9_, _FORV_10_ in pairs(authSubTypeList) do
  end
  if L1_28 ~= _UPVALUE1_.SUCCESS then
    return L1_28
  end
  ;({}).captivePortalType = captivePortalType
  ;({}).authenticationType = authenticationType
  ;({}).authenticationSubType = authenticationSubType
  ;({}).loginProfile = loginProfile
  return L1_28, A0_27, captivePortalType, authenticationType, authenticationSubType, loginProfile
end
function vlanCheck(A0_33)
  local L1_34, L2_35
  L1_34 = _UPVALUE0_
  L1_34 = L1_34.vlanIdGetAll
  L2_35 = L1_34()
  if L1_34 ~= _UPVALUE1_.SUCCESS then
    return L1_34
  end
  for _FORV_6_, _FORV_7_ in pairs(L2_35) do
    if tonumber(L2_35[_FORV_6_].vlanId) == tonumber(A0_33) then
      return _UPVALUE1_.SUCCESS
    end
  end
  return _UPVALUE1_.FAILURE
end
