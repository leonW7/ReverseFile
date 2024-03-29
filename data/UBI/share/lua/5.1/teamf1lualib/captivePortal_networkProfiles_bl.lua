local L0_0
L0_0 = module
L0_0("com.teamf1.bl.captivePortal.networkProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/networkProfile_captivePortal")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverVLAN")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverDMZ")
L0_0 = require
L0_0("teamf1lualib/dhcp_serverLAN")
L0_0 = require
L0_0("teamf1lualib/captiveportal_loginProfile")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
lanSettingsPageName = "lanSettings"
RELAY_STATUS = "lanSettings.DhcpRelayStatus"
SERVER_STATUS = "lanSettings.dhcpEnabled"
ENABLE = "1"
DISABLE = "0"
SERVER_ATTRIBUTE = lanSettingsPageName .. ".dhcpType"
;({}).interfaceName = "LogicalIfName"
;({}).vlanId = "vlanId"
vlanTable = "vlan"
intervlanTable = "interVLANRouting"
subnetTable = "ifStatic"
dhcpTable = "dhcp"
dhcpRelayTable = "DhcpRelay"
networkInterfaceTable = "networkInterface"
captiveportalTable = "CaptivePortalVlan"
dhcpWorkType = {}
dhcpWorkType.none = "None"
dhcpWorkType.server = "Server"
dhcpWorkType.relay = "Relay"
vlanTypeList = {
  "None",
  "Server",
  "Relay"
}
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
interVLanAccessTypeFREE = "0"
interVLanAccessTypeSLA = "1"
interVLanAccessTypePermanent = "2"
interVLanAccessTypeTemporary = "3"
function vlanSettingsCaptivePortalProfileGetAll()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_
  L0_1 = L0_1.loginProfilesGetAll
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function vlanSettingsCaptivePortalSlaProfileGetAll()
  local L0_3, L1_4
  L0_3 = _UPVALUE0_
  L0_3 = L0_3.loginProfilesSlaGetAll
  L1_4 = L0_3()
  if L0_3 ~= _UPVALUE1_.SUCCESS then
    return L0_3
  end
  return L0_3, L1_4
end
function networkProfileCaptivePortalGet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.captivePortalGet
  L2_7 = A0_5
  L13_18 = L1_6(L2_7)
  L14_19 = _UPVALUE1_
  L14_19 = L14_19.SUCCESS
  if L1_6 ~= L14_19 then
    L14_19 = _UPVALUE1_
    L14_19 = L14_19.FAILURE
    return L14_19, L15_20
  end
  L14_19 = nil
  for _FORV_18_, _FORV_19_ in L15_20(L16_21) do
    if _FORV_19_ == L7_12 then
      L14_19 = _FORV_18_
    end
  end
  for _FORV_19_, _FORV_20_ in L16_21(authTypeList) do
  end
  for _FORV_20_, _FORV_21_ in pairs(authSubTypeList) do
  end
  return _UPVALUE1_.SUCCESS, L2_7, L3_8, L6_11, L4_9, L5_10, tostring(L14_19), tostring(L15_20), tostring(L16_21), L10_15, L11_16, L12_17, L13_18
end
function networkProfileCaptivePortalSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["networkProfileConfig.cookie"]
  L2_24 = A0_22["networkProfileConfig.vlan"]
  L3_25 = A0_22["networkProfileConfig.networkId"]
  L4_26 = A0_22["networkProfileConfig.ssid"]
  L5_27 = A0_22["networkProfileConfig.intfNum"]
  L6_28 = captivePortalTypeList
  L7_29 = tonumber
  L8_30 = A0_22["networkProfileConfig.captivePortalType"]
  L7_29 = L7_29(L8_30)
  L6_28 = L6_28[L7_29]
  L7_29 = authTypeList
  L8_30 = tonumber
  L9_31 = A0_22["networkProfileConfig.authServer"]
  L8_30 = L8_30(L9_31)
  L7_29 = L7_29[L8_30]
  L8_30 = authSubTypeList
  L9_31 = tonumber
  L10_32 = A0_22["networkProfileConfig.authType"]
  L9_31 = L9_31(L10_32)
  L8_30 = L8_30[L9_31]
  L9_31 = A0_22["networkProfileConfig.loginProfile"]
  L10_32 = A0_22["networkProfileConfig.enableRedirect"]
  L11_33 = A0_22["networkProfileConfig.url"]
  L12_34 = A0_22["networkProfileConfig.loginProfileSla"]
  L13_35, L14_36 = nil, nil
  if vlanCheck(L2_24) ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.COMP_CAPTIVEPORTAL_VLAN_VLANID_INVALID
  end
  _UPVALUE2_.start()
  L13_35, L14_36 = _UPVALUE3_.captivePortalSet(L1_23, L3_25, L2_24, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34)
  if L13_35 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L13_35)
    _UPVALUE2_.abort()
    return L13_35, L1_23
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L14_36
end
function vlanCheck(A0_37)
  local L1_38, L2_39
  L1_38 = _UPVALUE0_
  L1_38 = L1_38.vlanIdGetAll
  L2_39 = L1_38()
  if L1_38 ~= _UPVALUE1_.SUCCESS then
    return L1_38
  end
  for _FORV_6_, _FORV_7_ in pairs(L2_39) do
    if tonumber(L2_39[_FORV_6_].vlanId) == tonumber(A0_37) then
      return _UPVALUE1_.SUCCESS
    end
  end
  return _UPVALUE1_.FAILURE
end
