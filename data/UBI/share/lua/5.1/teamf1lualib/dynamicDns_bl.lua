local L0_0
L0_0 = module
L0_0("com.teamf1.bl.services.ddns", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/services_ddns")
L0_0 = require
L0_0("teamf1lualib/wan_multiwan")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wan_status")
L0_0 = require
L0_0("teamf1lualib/ddns_returnCodes")
L0_0 = "0"
WANMODE0 = L0_0
L0_0 = "1"
WANMODE1 = L0_0
L0_0 = "2"
WANMODE2 = L0_0
L0_0 = "3"
WANMODE3 = L0_0
L0_0 = "ddns.interfaceName"
DDNS_INTERFACE_NAME = L0_0
L0_0 = "ddns.ddnsService"
DDNS_SERVICE_NAME = L0_0
L0_0 = "WAN"
WAN_NAME = L0_0
L0_0 = "Option"
OPTION_NAME = L0_0
L0_0 = "WAN1"
WAN1_NAME = L0_0
L0_0 = "WAN2"
WAN2_NAME = L0_0
L0_0 = "WAN3"
WAN3_NAME = L0_0
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function optionModeGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1, L1_2, L2_3 = _UPVALUE0_.multiWanModeGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  if L2_3 == WANMODE2 then
    L0_1, L1_2, L5_6 = _UPVALUE0_.primaryWanPortGet()
    if L5_6 == WAN1_NAME then
      L3_4 = "Auto-Rollover using WAN port WAN1"
      L4_5 = "WAN1"
    elseif L5_6 == WAN2_NAME then
      L3_4 = "Auto-Rollover using WAN port WAN2"
      L4_5 = "WAN2"
    elseif L5_6 == WAN3_NAME then
      L3_4 = "Auto-Rollover using WAN port WAN3"
      L4_5 = "WAN3"
    end
    return L0_1, L1_2, L3_4, L4_5, L2_3
  elseif L2_3 == WANMODE1 then
    L3_4 = "Load-balancing-Round Robin"
  elseif L2_3 == WANMODE3 then
    L3_4 = "Load-balancing-Spillovermode"
  elseif L2_3 == WANMODE0 then
    L0_1, L1_2, multiWanName = _UPVALUE0_.defaultWanPortGet()
    if multiWanName == WAN1_NAME then
      L6_7 = WAN1_NAME
      L3_4 = "use only single WAN port WAN1"
    elseif multiWanName == WAN2_NAME then
      L6_7 = WAN2_NAME
      L3_4 = "use only single WAN port WAN2"
    elseif multiWanName == WAN3_NAME then
      L6_7 = WAN3_NAME
      L3_4 = "use only single WAN port WAN3"
    end
    return L0_1, L1_2, L3_4, L6_7, L2_3
  end
  return L0_1, L1_2, L3_4
end
function ddnsSectionGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19
  L0_8, L1_9, L2_10, L3_11, L5_13, L6_14, L7_15, L8_16, L10_18 = _UPVALUE0_.ddnsConfigGet()
  if L0_8 ~= _UPVALUE1_.SUCCESS then
    return L0_8
  end
  return L0_8, L1_9, L2_10, L3_11, L5_13, L6_14, L7_15, L8_16, L10_18
end
function ddnsSectionGetNext(A0_20)
  local L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32
  L1_21 = A0_20["dynamicDns.cookie"]
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.NIL
  if L1_21 == L2_22 then
    L2_22 = util
    L2_22 = L2_22.appendDebugOut
    L3_23 = "GetNext : Invalid Cookie"
    L2_22(L3_23)
    L2_22 = _UPVALUE0_
    L2_22 = L2_22.BAD_PARAMETER
    return L2_22
  end
  L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_22, L3_23, L4_24, L5_25, L7_27, L8_28, L9_29, L10_30, L12_32 = _UPVALUE1_.ddnsConfigGetNext(L1_21)
  if L2_22 ~= _UPVALUE0_.SUCCESS then
    return L2_22
  end
  return L2_22, L3_23, L4_24, L5_25, L7_27, L8_28, L9_29, L10_30, L12_32
end
function ddnsSectionSet(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47
  L1_34 = ACCESS_LEVEL
  if L1_34 ~= 0 then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Detected Unauthorized access for page  dynamicDns"
    L1_34(L2_35)
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.UNAUTHORIZED
    return L1_34
  end
  L1_34 = A0_33["dynamicDns.cookie"]
  L2_35 = A0_33["dynamicDns.ddnsService"]
  L3_36 = A0_33["dynamicDns.dynDNSServer"]
  L4_37 = A0_33["dynamicDns.userName"]
  L5_38 = A0_33["dynamicDns.password"]
  L6_39 = A0_33["dynamicDns.hostName"]
  L7_40 = A0_33["dynamicDns.zoneName"]
  L8_41 = A0_33["dynamicDns.type"]
  L9_42 = A0_33["dynamicDns.wildcard"]
  L10_43 = A0_33["dynamicDns.externalIpCheck"]
  L11_44 = A0_33["dynamicDns.forceUpdateInterval"]
  L12_45 = A0_33["dynamicDns.url"]
  L13_46 = A0_33["dynamicDns.additionalDDNS"]
  L14_47 = A0_33["dynamicDns.uploadKey"]
  if L1_34 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.ddnsConfigSet(L1_34, L2_35, L3_36, L4_37, L5_38, L6_39, L7_40, L8_41, L9_42, L10_43, L11_44, L12_45, L13_46, L14_47)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page dynamicDns" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, L1_34
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function dynamicDnsOption2GetAll()
  local L0_48, L1_49, L2_50, L3_51
  L0_48 = "/pfrm2.0/bin/ddnsView"
  L1_49 = "/tmp/system.db"
  if L0_48 ~= nil then
    L2_50 = util
    L2_50 = L2_50.appendDebugOut
    L3_51 = "Exec = "
    L3_51 = L3_51 .. os.execute(L0_48 .. " " .. L1_49 .. " > /dev/null") .. "<br>"
    L2_50(L3_51)
  end
  L2_50 = {}
  L3_51 = {}
  returnCode, cookie, L2_50, L3_51 = _UPVALUE0_.ddnsOption2GetAll()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L2_50, L3_51
end
function dynamicDnsGetAll()
  local L0_52, L1_53, L2_54, L3_55
  L0_52 = "/pfrm2.0/bin/ddnsView"
  L1_53 = "/tmp/system.db"
  if L0_52 ~= nil then
    L2_54 = util
    L2_54 = L2_54.appendDebugOut
    L3_55 = "Exec = "
    L3_55 = L3_55 .. os.execute(L0_52 .. " " .. L1_53 .. " > /dev/null") .. "<br>"
    L2_54(L3_55)
  end
  L2_54 = {}
  L3_55 = {}
  returnCode, cookie, L2_54, L3_55 = _UPVALUE0_.ddnsOption1GetAll()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L2_54, L3_55
end
function dynamicDnsWizardGet()
  local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61, L6_62, L7_63
  returnCode, L1_57, L2_58, L5_61 = _UPVALUE0_.ddnsOption1GetAll()
  returnCode, L1_57, L3_59, L6_62 = _UPVALUE0_.ddnsOption2GetAll()
  returnCode, L1_57, L4_60, L7_63 = _UPVALUE0_.ddnsWan3GetAll()
  if L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNDNS then
    L2_58[DDNS_SERVICE_NAME] = "DynDNS"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ORAY then
    L2_58[DDNS_SERVICE_NAME] = "Oray"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DLINKDNS then
    L2_58[DDNS_SERVICE_NAME] = "D-Link DDNS"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DISABLE then
    L2_58[DDNS_SERVICE_NAME] = "Disable"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_FREEDNS then
    L2_58[DDNS_SERVICE_NAME] = "FreeDNS"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_NOIP then
    L2_58[DDNS_SERVICE_NAME] = "NO-IP"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_3322ORG then
    L2_58[DDNS_SERVICE_NAME] = "3322.org"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_CUSTOM then
    L2_58[DDNS_SERVICE_NAME] = "Custom"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ZONEEDIT then
    L2_58[DDNS_SERVICE_NAME] = "ZoneEdit"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_EASYDNS then
    L2_58[DDNS_SERVICE_NAME] = "EasyDNS"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_TZOCOM then
    L2_58[DDNS_SERVICE_NAME] = "TZO.com"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNSIP then
    L2_58[DDNS_SERVICE_NAME] = "DynSip"
  elseif L2_58[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNAMICUPDATE then
    L2_58[DDNS_SERVICE_NAME] = "Dynamic Update"
  end
  if L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNDNS then
    L3_59[DDNS_SERVICE_NAME] = "DynDNS"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ORAY then
    L3_59[DDNS_SERVICE_NAME] = "Oray"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DLINKDNS then
    L3_59[DDNS_SERVICE_NAME] = "D-Link DDNS"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DISABLE then
    L3_59[DDNS_SERVICE_NAME] = "Disable"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_FREEDNS then
    L3_59[DDNS_SERVICE_NAME] = "FreeDNS"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_NOIP then
    L3_59[DDNS_SERVICE_NAME] = "NO-IP"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_3322ORG then
    L3_59[DDNS_SERVICE_NAME] = "3322.org"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_CUSTOM then
    L3_59[DDNS_SERVICE_NAME] = "Custom"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ZONEEDIT then
    L3_59[DDNS_SERVICE_NAME] = "ZoneEdit"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_EASYDNS then
    L3_59[DDNS_SERVICE_NAME] = "EasyDNS"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_TZOCOM then
    L3_59[DDNS_SERVICE_NAME] = "TZO.com"
  elseif L3_59[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNSIP then
    L3_59[DDNS_SERVICE_NAME] = "DynSip"
  end
  if L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNDNS then
    L4_60[DDNS_SERVICE_NAME] = "DynDNS"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ORAY then
    L4_60[DDNS_SERVICE_NAME] = "Oray"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DLINKDNS then
    L4_60[DDNS_SERVICE_NAME] = "D-Link DDNS"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DISABLE then
    L4_60[DDNS_SERVICE_NAME] = "Disable"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_FREEDNS then
    L4_60[DDNS_SERVICE_NAME] = "FreeDNS"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_NOIP then
    L4_60[DDNS_SERVICE_NAME] = "NO-IP"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_3322ORG then
    L4_60[DDNS_SERVICE_NAME] = "3322.org"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_CUSTOM then
    L4_60[DDNS_SERVICE_NAME] = "Custom"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_ZONEEDIT then
    L4_60[DDNS_SERVICE_NAME] = "ZoneEdit"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_EASYDNS then
    L4_60[DDNS_SERVICE_NAME] = "EasyDNS"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_TZOCOM then
    L4_60[DDNS_SERVICE_NAME] = "TZO.com"
  elseif L4_60[DDNS_SERVICE_NAME] == _UPVALUE0_.SERVICE_DYNSIP then
    L4_60[DDNS_SERVICE_NAME] = "DynSip"
  end
  return _UPVALUE1_.SUCCESS, L2_58, L3_59, L4_60
end
function optionStatusGet()
  local L0_64, L1_65, L2_66
  L0_64, L1_65 = _UPVALUE0_.optionStatusGet(WAN1_NAME)
  if L0_64 ~= _UPVALUE1_.SUCCESS then
    return L0_64
  end
  L0_64, L2_66 = _UPVALUE0_.optionStatusGet(WAN2_NAME)
  if L0_64 ~= _UPVALUE1_.SUCCESS then
    return L0_64
  end
  return L0_64, L1_65, L2_66
end
function dynamicDnsWan3GetAll()
  local L0_67, L1_68, L2_69, L3_70
  L0_67 = "/pfrm2.0/bin/ddnsView"
  L1_68 = "/tmp/system.db"
  if L0_67 ~= nil then
    L2_69 = util
    L2_69 = L2_69.appendDebugOut
    L3_70 = "Exec = "
    L3_70 = L3_70 .. os.execute(L0_67 .. " " .. L1_68 .. " > /dev/null") .. "<br>"
    L2_69(L3_70)
  end
  L2_69 = {}
  L3_70 = {}
  returnCode, cookie, L2_69, L3_70 = _UPVALUE0_.ddnsWan3GetAll()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, cookie, L2_69, L3_70
end
function ddnsWan1Check()
  returnCode, cookie, optionMode, wanInfo, wanMode = optionModeGet()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    statusErrorMessage = errorMap.errorStringGet(returnCode)
  end
  if wanMode == WANMODE0 then
    if WAN1_NAME ~= wanInfo then
      return _UPVALUE1_.WAN_NOTDEDICATED
    else
      return _UPVALUE0_.SUCCESS
    end
  elseif wanMode == WANMODE2 and WAN1_NAME ~= wanInfo then
    return _UPVALUE1_.WAN_INVALID
  else
    return _UPVALUE0_.SUCCESS
  end
end
function ddnsWan2Check()
  returnCode, cookie, optionMode, wanInfo, wanMode = optionModeGet()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    statusErrorMessage = errorMap.errorStringGet(returnCode)
  end
  if wanMode == WANMODE0 then
    if WAN2_NAME ~= wanInfo then
      return _UPVALUE1_.WAN_NOTDEDICATED
    else
      return _UPVALUE0_.SUCCESS
    end
  elseif wanMode == WANMODE2 and WAN2_NAME ~= wanInfo then
    return _UPVALUE1_.WAN_INVALID
  else
    return _UPVALUE0_.SUCCESS
  end
end
function ddnsWan3Check()
  returnCode, cookie, optionMode, wanInfo, wanMode = optionModeGet()
  if returnCode ~= _UPVALUE0_.SUCCESS then
    statusErrorMessage = errorMap.errorStringGet(returnCode)
  end
  if wanMode == WANMODE0 then
    if WAN3_NAME ~= wanInfo then
      return _UPVALUE1_.WAN_NOTDEDICATED
    else
      return _UPVALUE0_.SUCCESS
    end
  elseif wanMode == WANMODE2 and WAN3_NAME ~= wanInfo then
    return _UPVALUE1_.WAN_INVALID
  else
    return _UPVALUE0_.SUCCESS
  end
end
