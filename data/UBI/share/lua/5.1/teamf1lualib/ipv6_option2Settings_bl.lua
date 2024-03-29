local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = module
L1_1 = "com.teamf1.bl.ipv6.wan.option2"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/ipv6_wanclients_dhcp"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/ipv6_wanclients_static"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/ipv6_wanclients_pppoe"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_client"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.ipv6_wanclients.static"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.ipv6_wanclients.dhcp"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.ipv6_wanclients.pppoe"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "com.teamf1.core.wan.client"
L4_4 = L4_4(L5_5)
L5_5 = require
L6_6 = "com.teamf1.core.config"
L5_5 = L5_5(L6_6)
L6_6, L7_7 = nil, nil
if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
  require("teamf1lualib/vlan_on_wan_core")
  L6_6 = require("com.teamf1.core.vlanOn.wan")
else
  require("teamf1lualib/wan_vlanOverWan")
  L7_7 = require("com.teamf1.core.wan.vlanOverWan")
end
;({}).wanPort = "LogicalIfName"
;({}).profileName = "ProfileName"
;({}).idleTimeFlag = "IdleTimeOutFlag"
conTypeMap = {}
conTypeMap["1"] = "dhcp6c"
conTypeMap["2"] = "ifStatic6"
conTypeMap["3"] = "pppoe6"
conTypeValMap = {}
conTypeValMap.dhcp6c = "1"
conTypeValMap.ifStatic6 = "2"
conTypeValMap.pppoe6 = "3"
function option2SectionGet()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20
  L0_8 = _UPVALUE0_
  L0_8 = L0_8.connectionTypeGet
  L1_9 = "WAN2"
  L2_10 = "10"
  L2_10 = L0_8(L1_9, L2_10)
  L3_11 = nil
  if L2_10 == "dhcp6c" then
    L4_12, L5_13, L6_14 = nil, nil, nil
    L7_15 = _UPVALUE1_
    L7_15 = L7_15.dhcpIpGroupGetNext
    L8_16 = 1
    L11_19 = L7_15(L8_16)
    L6_14 = L11_19
    L5_13 = L10_18
    L4_12 = L9_17
    L1_9 = L8_16
    L0_8 = L7_15
    L7_15 = {}
    L8_16 = conTypeValMap
    L8_16 = L8_16[L2_10]
    L7_15["option2Settings.conType"] = L8_16
    L7_15["option2Settings.wanPort"] = L4_12
    L7_15["option2Settings.statelessMode"] = L5_13
    L7_15["option2Settings.prefixDelegation"] = L6_14
    L3_11 = L7_15
    L7_15 = L0_8
    L8_16 = L1_9
    L9_17 = L3_11
    return L7_15, L8_16, L9_17
  end
  if L2_10 == "ifStatic6" then
    L4_12, L5_13, L6_14, L7_15, L8_16, L9_17 = nil, nil, nil, nil, nil, nil
    L10_18 = _UPVALUE2_
    L10_18 = L10_18.staticIpGroupGetNext
    L5_13, L6_14, L7_15, L8_16, L9_17, L10_18 = nil, nil, nil, nil, nil, L10_18()
    L5_13, L6_14, L7_15, L8_16, L9_17, L11_19 = nil, nil, nil, nil, nil, L10_18()
    L5_13, L6_14, L7_15, L8_16, L9_17, L12_20 = nil, nil, nil, nil, nil, L10_18()
    L4_12 = L12_20
    L1_9 = L11_19
    L0_8 = L10_18
    L10_18 = {}
    L11_19 = conTypeValMap
    L11_19 = L11_19[L2_10]
    L10_18["option2Settings.conType"] = L11_19
    L10_18["option2Settings.wanPort"] = L4_12
    L10_18["option2Settings.ipAddress"] = L5_13
    L10_18["option2Settings.gateway"] = L6_14
    L10_18["option2Settings.prefixLength"] = L7_15
    L10_18["option2Settings.primaryDNS"] = L8_16
    L10_18["option2Settings.secondaryDNS"] = L9_17
    L3_11 = L10_18
    L10_18 = L0_8
    L11_19 = L1_9
    L12_20 = L3_11
    return L10_18, L11_19, L12_20
  end
  if L2_10 == "pppoe6" then
    L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19 = nil, nil, nil, nil, nil, nil, nil, nil
    L12_20 = _UPVALUE3_
    L12_20 = L12_20.pppoeConnectionGetNext
    L1_9, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20 = 2, L10_18()
    L0_8 = L12_20
    L12_20 = tonumber
    L12_20 = L12_20(L11_19)
    if L12_20 == 2 then
      L12_20 = _UPVALUE4_
      L12_20 = L12_20.wanPort
      L12_20 = L12_20 .. " = 'WAN2' AND " .. _UPVALUE4_.profileName .. " = 'pppoeProfile1'"
      if db.getRowWhere(_UPVALUE5_, L12_20) == _UPVALUE6_.NIL then
        return _UPVALUE6_.FAILURE
      end
      L5_13 = db.getRowWhere(_UPVALUE5_, L12_20)["PppoeProfile.UserName"]
      L6_14 = db.getRowWhere(_UPVALUE5_, L12_20)["PppoeProfile.Password"]
    end
    L12_20 = {}
    L12_20["option2Settings.conType"] = conTypeValMap[L2_10]
    L12_20["option2Settings.wanPort"] = L4_12
    L12_20["option2Settings.userName"] = L5_13
    L12_20["option2Settings.password"] = L6_14
    L12_20["option2Settings.primaryDns"] = L7_15
    L12_20["option2Settings.secondaryDns"] = L8_16
    L12_20["option2Settings.authenticationOptions"] = L9_17
    L12_20["option2Settings.dhcpOptions"] = L10_18
    L12_20["option2Settings.pppoeSessions"] = L11_19
    L3_11 = L12_20
    L12_20 = L0_8
    return L12_20, L1_9, L3_11
  end
  L4_12 = _UPVALUE6_
  L4_12 = L4_12.SUCCESS
  if L0_8 ~= L4_12 then
    return L0_8
  end
end
function option2ModeCheck()
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page ipv6Option2Settings.html")
    return _UPVALUE0_.UNAUTHORIZED
  end
  return (_UPVALUE1_.option2ModeCheck())
end
function option2SectionSet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29, L9_30, L10_31, L11_32, L12_33, L13_34, L14_35, L15_36, L16_37, L17_38, L18_39, L19_40, L20_41
  L4_25 = option2SectionGet
  L6_27 = L4_25()
  L3_24 = L6_27
  L2_23 = L5_26
  L1_22 = L4_25
  L4_25 = {}
  L5_26 = {}
  L6_27 = ACCESS_LEVEL
  if L6_27 ~= 0 then
    L6_27 = util
    L6_27 = L6_27.appendDebugOut
    L7_28 = "Detected Unauthorized access for page ipv6Option2Settings.html"
    L6_27(L7_28)
    L6_27 = _UPVALUE0_
    L6_27 = L6_27.UNAUTHORIZED
    return L6_27
  end
  L6_27, L7_28 = nil, nil
  L8_29 = A0_21["option2Settings.conType"]
  L9_30 = conTypeMap
  L9_30 = L9_30[L8_29]
  if L9_30 ~= "dhcp6c" then
    L9_30 = conTypeMap
    L9_30 = L9_30[L8_29]
    if L9_30 ~= "pppoe6" then
      L9_30 = conTypeMap
      L9_30 = L9_30[L8_29]
      if L9_30 ~= "ifStatic6" then
        L9_30 = _UPVALUE0_
        L9_30 = L9_30.BAD_PARAMETER
        return L9_30
      end
    end
  end
  L9_30 = _UPVALUE1_
  L9_30 = L9_30.start
  L9_30()
  L9_30 = conTypeMap
  L9_30 = L9_30[L8_29]
  if L9_30 == "dhcp6c" then
    L9_30 = A0_21["option2Settings.statelessMode"]
    L10_31 = A0_21["option2Settings.prefixDelegation"]
    if L9_30 == nil or L10_31 == nil then
      L11_32 = util
      L11_32 = L11_32.appendDebugOut
      L12_33 = "GetNext : Invalid Cookie"
      L11_32(L12_33)
      L11_32 = _UPVALUE0_
      L11_32 = L11_32.BAD_PARAMETER
      return L11_32
    end
    L11_32 = _UPVALUE2_
    L11_32 = L11_32.dhcpIpGroupSet
    L12_33 = "WAN2"
    L13_34 = L9_30
    L14_35 = L10_31
    L12_33 = L11_32(L12_33, L13_34, L14_35)
    L7_28 = L12_33
    L6_27 = L11_32
    L11_32 = _UPVALUE0_
    L11_32 = L11_32.SUCCESS
    if L6_27 ~= L11_32 then
      L11_32 = util
      L11_32 = L11_32.appendDebugOut
      L12_33 = "Error in configuring values in page ipv6Option2Settings.html"
      L13_34 = L6_27
      L12_33 = L12_33 .. L13_34
      L11_32(L12_33)
      L11_32 = _UPVALUE1_
      L11_32 = L11_32.abort
      L11_32()
      L11_32 = L6_27
      L12_33 = L7_28
      return L11_32, L12_33
    end
  end
  L9_30 = conTypeMap
  L9_30 = L9_30[L8_29]
  if L9_30 == "ifStatic6" then
    L9_30 = A0_21["option2Settings.ipAddress"]
    L10_31 = A0_21["option2Settings.gateway"]
    L11_32 = A0_21["option2Settings.prefixLength"]
    L12_33 = A0_21["option2Settings.primaryDNS"]
    L13_34 = A0_21["option2Settings.secondaryDNS"]
    if L9_30 == nil or L10_31 == nil or L11_32 == nil or L12_33 == nil or L13_34 == nil then
      L14_35 = util
      L14_35 = L14_35.appendDebugOut
      L15_36 = "GetNext : Invalid Cookie"
      L14_35(L15_36)
      L14_35 = _UPVALUE0_
      L14_35 = L14_35.BAD_PARAMETER
      return L14_35
    end
    L14_35 = _UPVALUE3_
    L14_35 = L14_35.staticIpGroupSet
    L15_36 = 7
    L16_37 = "WAN2"
    L17_38 = L9_30
    L18_39 = L10_31
    L19_40 = L11_32
    L20_41 = L12_33
    L15_36 = L14_35(L15_36, L16_37, L17_38, L18_39, L19_40, L20_41, L13_34)
    L7_28 = L15_36
    L6_27 = L14_35
    L14_35 = _UPVALUE0_
    L14_35 = L14_35.SUCCESS
    if L6_27 ~= L14_35 then
      L14_35 = util
      L14_35 = L14_35.appendDebugOut
      L15_36 = "Error in configuring values in page ipv6Option2Settings.html"
      L16_37 = L6_27
      L15_36 = L15_36 .. L16_37
      L14_35(L15_36)
      L14_35 = _UPVALUE1_
      L14_35 = L14_35.abort
      L14_35()
      L14_35 = L6_27
      L15_36 = curCookie
      return L14_35, L15_36
    end
  end
  L9_30 = conTypeMap
  L9_30 = L9_30[L8_29]
  if L9_30 == "pppoe6" then
    L9_30 = A0_21["option2Settings.userName"]
    L10_31 = A0_21["option2Settings.password"]
    L11_32 = A0_21["option2Settings.primaryDns"]
    L12_33 = A0_21["option2Settings.secondaryDns"]
    L13_34 = A0_21["option2Settings.authenticationOptions"]
    L14_35 = A0_21["option2Settings.dhcpOptions"]
    L15_36 = A0_21["option2Settings.pppoeSessions"]
    L16_37 = tonumber
    L17_38 = L15_36
    L16_37 = L16_37(L17_38)
    if L16_37 == 2 then
      L16_37 = "LogicalIfName = 'WAN2' AND AddressFamily='2'"
      L17_38 = ""
      L18_39 = db
      L18_39 = L18_39.getRowWhere
      L19_40 = "NimfConf"
      L20_41 = L16_37
      L18_39 = L18_39(L19_40, L20_41)
      L19_40 = _UPVALUE0_
      L19_40 = L19_40.NIL
      if L18_39 == L19_40 then
        L19_40 = _UPVALUE0_
        L19_40 = L19_40.FAILURE
        return L19_40
      end
      L17_38 = L18_39["NimfConf.ConnectionType"]
      if L17_38 ~= "pppoe" then
        L19_40 = _UPVALUE0_
        L19_40 = L19_40.CONFIGURED_IPV4_ISP_PPPOE
        return L19_40
      end
      L19_40 = nil
      L20_41 = _UPVALUE4_
      L20_41 = L20_41.wanPort
      L20_41 = L20_41 .. " = 'WAN2' AND " .. _UPVALUE4_.profileName .. " = 'pppoeProfile1'"
      L19_40 = db.getAttributeWhere(_UPVALUE5_, L20_41, _UPVALUE4_.idleTimeFlag)
      if tonumber(L19_40) ~= 0 then
        return _UPVALUE0_.CONFIGURED_IPV4_PPPOE_IDLE
      end
      L16_37 = _UPVALUE4_.wanPort .. " = 'WAN2'"
      L18_39 = db.getRowWhere("Pppoe6", L16_37)
      if L18_39 == _UPVALUE0_.NIL then
        return _UPVALUE0_.FAILURE
      end
      L9_30 = L18_39["Pppoe6.UserName"]
      L10_31 = L18_39["Pppoe6.Password"]
    end
    if L9_30 == nil or L10_31 == nil or L13_34 == nil or L14_35 == nil then
      L16_37 = util
      L16_37 = L16_37.appendDebugOut
      L17_38 = "GetNext : Invalid Cookie"
      L16_37(L17_38)
      L16_37 = _UPVALUE0_
      L16_37 = L16_37.BAD_PARAMETER
      return L16_37
    end
    L16_37 = _UPVALUE6_
    L16_37 = L16_37.pppoeConnectionSet
    L17_38 = 2
    L18_39 = "WAN2"
    L19_40 = L9_30
    L20_41 = L10_31
    L17_38 = L16_37(L17_38, L18_39, L19_40, L20_41, L11_32, L12_33, L13_34, L14_35, L15_36)
    L7_28 = L17_38
    L6_27 = L16_37
    L16_37 = _UPVALUE0_
    L16_37 = L16_37.SUCCESS
    if L6_27 ~= L16_37 then
      L16_37 = util
      L16_37 = L16_37.appendDebugOut
      L17_38 = "Error in configuring values in page ipv6Option2Settings.html"
      L18_39 = L6_27
      L17_38 = L17_38 .. L18_39
      L16_37(L17_38)
      L16_37 = _UPVALUE1_
      L16_37 = L16_37.abort
      L16_37()
      L16_37 = L6_27
      L17_38 = curCookie
      return L16_37, L17_38
    end
  end
  L9_30 = _UPVALUE7_
  L9_30 = L9_30.connectionTypeSet
  L10_31 = "WAN2"
  L11_32 = "10"
  L12_33 = conTypeMap
  L12_33 = L12_33[L8_29]
  L11_32 = L9_30(L10_31, L11_32, L12_33)
  L4_25 = L11_32
  L7_28 = L10_31
  L6_27 = L9_30
  L9_30 = _UPVALUE0_
  L9_30 = L9_30.SUCCESS
  if L6_27 ~= L9_30 then
    L9_30 = util
    L9_30 = L9_30.appendDebugOut
    L10_31 = "Error in configuring values in page ipv6Option2Settings.html"
    L11_32 = L6_27
    L10_31 = L10_31 .. L11_32
    L9_30(L10_31)
    L9_30 = _UPVALUE1_
    L9_30 = L9_30.abort
    L9_30()
    L9_30 = L6_27
    L10_31 = L7_28
    return L9_30, L10_31
  end
  L9_30 = PRODUCT_ID
  if L9_30 ~= "DSR-1000AC_Ax" then
    L9_30 = PRODUCT_ID
    if L9_30 ~= "DSR-500AC_Ax" then
      L9_30 = PRODUCT_ID
      if L9_30 ~= "DSR-1000_Bx" then
        L9_30 = PRODUCT_ID
        if L9_30 ~= "DSR-500_Bx" then
          L9_30 = _UPVALUE8_
          L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
          L10_31 = L4_25
          L9_30 = L9_30(L10_31)
          L6_27 = L9_30
          L9_30 = _UPVALUE0_
          L9_30 = L9_30.SUCCESS
          if L6_27 ~= L9_30 then
            L9_30 = util
            L9_30 = L9_30.appendDebugOut
            L10_31 = "Error in configuring values in page "
            L11_32 = "internetConnectionWizardForm"
            L12_33 = L6_27
            L10_31 = L10_31 .. L11_32 .. L12_33
            L9_30(L10_31)
            L9_30 = _UPVALUE1_
            L9_30 = L9_30.abort
            L9_30()
            L9_30 = L6_27
            L10_31 = curCookie
            return L9_30, L10_31
          end
        end
      end
    end
  else
    L9_30 = _UPVALUE9_
    L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
    L10_31 = L4_25
    L9_30 = L9_30(L10_31)
    L6_27 = L9_30
    L9_30 = _UPVALUE0_
    L9_30 = L9_30.SUCCESS
    if L6_27 ~= L9_30 then
      L9_30 = util
      L9_30 = L9_30.appendDebugOut
      L10_31 = "Error in configuring values in page "
      L11_32 = "internetConnectionWizardForm"
      L12_33 = L6_27
      L10_31 = L10_31 .. L11_32 .. L12_33
      L9_30(L10_31)
      L9_30 = _UPVALUE1_
      L9_30 = L9_30.abort
      L9_30()
      L9_30 = L6_27
      L10_31 = curCookie
      return L9_30, L10_31
    end
  end
  L9_30 = tonumber
  L10_31 = A0_21["option2Settings.pppoeSessions"]
  L9_30 = L9_30(L10_31)
  if L9_30 == 2 then
    L9_30 = _UPVALUE7_
    L9_30 = L9_30.connectionTypeSet
    L10_31 = "WAN2"
    L11_32 = "2"
    L12_33 = "pppoe"
    L11_32 = L9_30(L10_31, L11_32, L12_33)
    L5_26 = L11_32
    L7_28 = L10_31
    L6_27 = L9_30
    L9_30 = _UPVALUE0_
    L9_30 = L9_30.SUCCESS
    if L6_27 == L9_30 then
      L9_30 = _UPVALUE0_
      L9_30 = L9_30.NIL
    elseif L5_26 == L9_30 then
      L9_30 = util
      L9_30 = L9_30.appendDebugOut
      L10_31 = "Error in configuring values in page "
      L11_32 = "ipv6Option2Settings.html"
      L12_33 = L6_27
      L10_31 = L10_31 .. L11_32 .. L12_33
      L9_30(L10_31)
      L9_30 = _UPVALUE1_
      L9_30 = L9_30.abort
      L9_30()
      L9_30 = L6_27
      L10_31 = L7_28
      return L9_30, L10_31
    end
    L9_30 = PRODUCT_ID
    if L9_30 ~= "DSR-1000AC_Ax" then
      L9_30 = PRODUCT_ID
      if L9_30 ~= "DSR-500AC_Ax" then
        L9_30 = PRODUCT_ID
        if L9_30 ~= "DSR-1000_Bx" then
          L9_30 = PRODUCT_ID
          if L9_30 ~= "DSR-500_Bx" then
            L9_30 = _UPVALUE8_
            L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
            L10_31 = L5_26
            L9_30 = L9_30(L10_31)
            L6_27 = L9_30
            L9_30 = _UPVALUE8_
            L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
            L10_31 = L4_25
            L9_30 = L9_30(L10_31)
            L6_27 = L9_30
          end
        end
      end
    else
      L9_30 = _UPVALUE9_
      L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
      L10_31 = L5_26
      L9_30 = L9_30(L10_31)
      L6_27 = L9_30
      L9_30 = _UPVALUE9_
      L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
      L10_31 = L4_25
      L9_30 = L9_30(L10_31)
      L6_27 = L9_30
    end
    L9_30 = _UPVALUE0_
    L9_30 = L9_30.SUCCESS
    if L6_27 ~= L9_30 then
      L9_30 = util
      L9_30 = L9_30.appendDebugOut
      L10_31 = "Error in configuring values in page "
      L11_32 = "internetConnectionWizardForm"
      L12_33 = L6_27
      L10_31 = L10_31 .. L11_32 .. L12_33
      L9_30(L10_31)
      L9_30 = _UPVALUE1_
      L9_30 = L9_30.abort
      L9_30()
      L9_30 = L6_27
      L10_31 = curCookie
      return L9_30, L10_31
    end
  else
    L9_30 = tonumber
    L10_31 = L3_24["option2Settings.pppoeSessions"]
    L9_30 = L9_30(L10_31)
    if L9_30 == 2 then
      L9_30 = conTypeMap
      L9_30 = L9_30[L8_29]
      if L9_30 ~= "pppoe6" then
        L9_30 = "LogicalIfName = 'WAN2'"
        L10_31 = db
        L10_31 = L10_31.setAttributeWhere
        L11_32 = "Pppoe6"
        L12_33 = L9_30
        L13_34 = "PppoeSessions"
        L14_35 = "1"
        L10_31 = L10_31(L11_32, L12_33, L13_34, L14_35)
        L6_27 = L10_31
        if L6_27 == false then
          L10_31 = _UPVALUE1_
          L10_31 = L10_31.abort
          L10_31()
          return L6_27
        end
        L10_31 = db
        L10_31 = L10_31.setAttributeWhere
        L11_32 = "Pppoe6"
        L12_33 = L9_30
        L13_34 = "Dhcpv6Opt"
        L14_35 = "0"
        L10_31 = L10_31(L11_32, L12_33, L13_34, L14_35)
        L6_27 = L10_31
        if L6_27 == false then
          L10_31 = _UPVALUE1_
          L10_31 = L10_31.abort
          L10_31()
          return L6_27
        end
        L9_30 = "LogicalIfName = 'WAN2PPPOE6'"
        L10_31 = db
        L10_31 = L10_31.setAttributeWhere
        L11_32 = "dhcpv6c"
        L12_33 = L9_30
        L13_34 = "isEnabled"
        L14_35 = "0"
        L10_31 = L10_31(L11_32, L12_33, L13_34, L14_35)
        L6_27 = L10_31
        if L6_27 == false then
          L10_31 = _UPVALUE1_
          L10_31 = L10_31.abort
          L10_31()
          return L6_27
        end
      end
      L9_30 = _UPVALUE7_
      L9_30 = L9_30.connectionTypeSet
      L10_31 = "WAN2"
      L11_32 = "2"
      L12_33 = "pppoe"
      L11_32 = L9_30(L10_31, L11_32, L12_33)
      L5_26 = L11_32
      L7_28 = L10_31
      L6_27 = L9_30
      L9_30 = _UPVALUE0_
      L9_30 = L9_30.SUCCESS
      if L6_27 == L9_30 then
        L9_30 = _UPVALUE0_
        L9_30 = L9_30.NIL
      elseif L5_26 == L9_30 then
        L9_30 = util
        L9_30 = L9_30.appendDebugOut
        L10_31 = "Error in configuring values in page "
        L11_32 = "ipv6Option2Settings.html"
        L12_33 = L6_27
        L10_31 = L10_31 .. L11_32 .. L12_33
        L9_30(L10_31)
        L9_30 = _UPVALUE1_
        L9_30 = L9_30.abort
        L9_30()
        L9_30 = L6_27
        L10_31 = L7_28
        return L9_30, L10_31
      end
      L9_30 = PRODUCT_ID
      if L9_30 ~= "DSR-1000AC_Ax" then
        L9_30 = PRODUCT_ID
        if L9_30 ~= "DSR-500AC_Ax" then
          L9_30 = PRODUCT_ID
          if L9_30 ~= "DSR-1000_Bx" then
            L9_30 = PRODUCT_ID
            if L9_30 ~= "DSR-500_Bx" then
              L9_30 = _UPVALUE8_
              L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
              L10_31 = L5_26
              L9_30 = L9_30(L10_31)
              L6_27 = L9_30
            end
          end
        end
      else
        L9_30 = _UPVALUE9_
        L9_30 = L9_30.WAN_ConnType_nimfTblUpdate
        L10_31 = L5_26
        L9_30 = L9_30(L10_31)
        L6_27 = L9_30
      end
      L9_30 = _UPVALUE0_
      L9_30 = L9_30.SUCCESS
      if L6_27 ~= L9_30 then
        L9_30 = util
        L9_30 = L9_30.appendDebugOut
        L10_31 = "Error in configuring values in page "
        L11_32 = "internetConnectionWizardForm"
        L12_33 = L6_27
        L10_31 = L10_31 .. L11_32 .. L12_33
        L9_30(L10_31)
        L9_30 = _UPVALUE1_
        L9_30 = L9_30.abort
        L9_30()
        L9_30 = L6_27
        L10_31 = curCookie
        return L9_30, L10_31
      end
    end
  end
  L9_30 = _UPVALUE1_
  L9_30 = L9_30.complete
  L9_30()
  L9_30 = _UPVALUE1_
  L9_30 = L9_30.save
  L9_30()
  L9_30 = _UPVALUE0_
  L9_30 = L9_30.SUCCESS
  L10_31 = L7_28
  return L9_30, L10_31
end
