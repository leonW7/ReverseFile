local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.dhcpserver", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vipsecure.returnCodes")
dhcpserverTable = "IPsecDhcpClientIPRange"
;({}).startIpAddress = "StartIPAddress"
;({}).endIpAddress = "EndIPAddress"
;({}).subnetmask = "SubnetMask"
;({}).dmz_interface = "LogicalIfName"
;({}).dmz_ip = "StaticIp"
;({}).dmz_netmask = "NetMask"
;({}).wan_ipAddress = "ipAddress"
;({}).wan_subnet = "subnetMask"
;({}).ipsec_startIPAddress = "StartIPAddress"
;({}).ipsec_subnetMask = "SubnetMask"
;({}).interfaceName = "LogicalIfName"
;({}).addressFamily = "addressFamily"
;({}).multiWanMode = "Wanmode"
function startIpAddressGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(dhcpserverTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.startIpAddress)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_1
end
function startIpAddressGetNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function startIpAddressSet(A0_5, A1_6)
  local L2_7
  if A1_6 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_7 = _UPVALUE1_.ipAddressCheck("2", A1_6)
  if L2_7 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpserverTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.startIpAddress, A1_6) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function endIpAddressGet()
  local L0_8
  L0_8 = db
  L0_8 = L0_8.getAttribute
  L0_8 = L0_8(dhcpserverTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.endIpAddress)
  if L0_8 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_8
end
function endIpAddressGetNext(A0_9)
  local L2_10, L3_11
  L2_10 = _UPVALUE0_
  L2_10 = L2_10.NOT_SUPPORTED
  L3_11 = 0
  return L2_10, L3_11, 0
end
function endIpAddressSet(A0_12, A1_13)
  local L2_14
  if A1_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_14 = _UPVALUE1_.ipAddressCheck("2", A1_13)
  if L2_14 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpserverTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.endIpAddress, A1_13) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_12
  end
  return _UPVALUE0_.SUCCESS, A0_12
end
function subnetmaskGet()
  local L0_15
  L0_15 = db
  L0_15 = L0_15.getAttribute
  L0_15 = L0_15(dhcpserverTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.subnetmask)
  if L0_15 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L0_15
end
function subnetmaskGetNext(A0_16)
  local L2_17, L3_18
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NOT_SUPPORTED
  L3_18 = 0
  return L2_17, L3_18, 0
end
function subnetmaskSet(A0_19, A1_20)
  local L2_21
  if A1_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L2_21 = _UPVALUE1_.ipAddressCheck("2", A1_20)
  if L2_21 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(dhcpserverTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.subnetmask, A1_20) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function dhcpserverConfigGet()
  local L0_22, L1_23, L2_24, L3_25
  L0_22 = db
  L0_22 = L0_22.getRow
  L1_23 = dhcpserverTable
  L2_24 = _UPVALUE0_
  L3_25 = _UPVALUE1_
  L0_22 = L0_22(L1_23, L2_24, L3_25)
  L1_23 = _UPVALUE2_
  L1_23 = L1_23.NIL
  if L0_22 == L1_23 then
    L1_23 = _UPVALUE2_
    L1_23 = L1_23.FAILURE
    return L1_23
  end
  L1_23, L2_24, L3_25 = nil, nil, nil
  L1_23 = L0_22[dhcpserverTable .. "." .. _UPVALUE3_.startIpAddress]
  L2_24 = L0_22[dhcpserverTable .. "." .. _UPVALUE3_.endIpAddress]
  L3_25 = L0_22[dhcpserverTable .. "." .. _UPVALUE3_.subnetmask]
  return _UPVALUE2_.SUCCESS, 1, L1_23, L2_24, L3_25
end
function dhcpserverConfigGetNext(A0_26)
  local L2_27, L3_28
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NOT_SUPPORTED
  L3_28 = 0
  return L2_27, L3_28, 0
end
function dhcpserverConfigSet(A0_29, A1_30, A2_31, A3_32)
  local L4_33, L5_34, L6_35
  L5_34 = {}
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.NIL
  if A1_30 == L6_35 then
    L6_35 = _UPVALUE0_
    L6_35 = L6_35.INVALID_ARGUMENT
    return L6_35
  end
  L6_35 = _UPVALUE1_
  L6_35 = L6_35.ipAddressCheck
  L6_35 = L6_35("2", A1_30)
  L4_33 = L6_35
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.SUCCESS
  if L4_33 ~= L6_35 then
    L6_35 = _UPVALUE2_
    L6_35 = L6_35.VIPSECURE_DHCP_STARTIP_INVALID
    return L6_35
  end
  L6_35 = dhcpserverTable
  L6_35 = L6_35 .. "." .. _UPVALUE3_.startIpAddress
  L5_34[L6_35] = A1_30
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.NIL
  if A2_31 == L6_35 then
    L6_35 = _UPVALUE0_
    L6_35 = L6_35.INVALID_ARGUMENT
    return L6_35
  end
  L6_35 = _UPVALUE1_
  L6_35 = L6_35.ipAddressCheck
  L6_35 = L6_35("2", A2_31)
  L4_33 = L6_35
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.SUCCESS
  if L4_33 ~= L6_35 then
    L6_35 = _UPVALUE2_
    L6_35 = L6_35.VIPSECURE_DHCP_ENDIP_INVALID
    return L6_35
  end
  L6_35 = dhcpserverTable
  L6_35 = L6_35 .. "." .. _UPVALUE3_.endIpAddress
  L5_34[L6_35] = A2_31
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.NIL
  if A3_32 == L6_35 then
    L6_35 = _UPVALUE0_
    L6_35 = L6_35.INVALID_ARGUMENT
    return L6_35
  end
  L6_35 = _UPVALUE1_
  L6_35 = L6_35.ipAddressCheck
  L6_35 = L6_35("2", A3_32)
  L4_33 = L6_35
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.SUCCESS
  if L4_33 ~= L6_35 then
    L6_35 = _UPVALUE2_
    L6_35 = L6_35.VIPSECURE_DHCP_SUBNETMASK_INVALID
    return L6_35
  end
  L6_35 = dhcpserverTable
  L6_35 = L6_35 .. "." .. _UPVALUE3_.subnetmask
  L5_34[L6_35] = A3_32
  L6_35 = _UPVALUE1_
  L6_35 = L6_35.ipv4SingleMaskCheck
  L6_35 = L6_35(A1_30, A2_31, A3_32)
  L4_33 = L6_35
  L6_35 = _UPVALUE0_
  L6_35 = L6_35.SUCCESS
  if L4_33 ~= L6_35 then
    L6_35 = _UPVALUE0_
    L6_35 = L6_35.INVALID_ARGUMENT
    return L6_35
  end
  L6_35 = staticIpSubnetCheck
  L6_35 = L6_35(A1_30, A3_32)
  if L6_35 ~= _UPVALUE0_.SUCCESS then
    return L6_35
  end
  L6_35 = staticIpSubnetCheck(A2_31, A3_32)
  if L6_35 ~= _UPVALUE0_.SUCCESS then
    return L6_35
  end
  if db.update(dhcpserverTable, L5_34, A0_29) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_29
  end
  return _UPVALUE0_.SUCCESS, A0_29
end
function dhcpserverConfigCreate(A0_36, A1_37, A2_38)
  local L4_39
  L4_39 = _UPVALUE0_
  L4_39 = L4_39.NOT_SUPPORTED
  return L4_39, 0
end
function dhcpserverConfigDelete(A0_40)
  local L2_41
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NOT_SUPPORTED
  return L2_41, 0
end
function staticIpSubnetCheck(A0_42, A1_43)
  local L2_44, L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L12_54, L13_55, L14_56, L15_57, L16_58, L17_59, L18_60
  L12_54 = _UPVALUE0_
  L13_55 = _UPVALUE1_
  L13_55 = L13_55.vlanGet
  L14_56 = L12_54
  L7_49, L9_51, L10_52, L11_53, L13_55 = nil, nil, nil, nil, L13_55(L14_56)
  L7_49, L9_51, L10_52, L11_53, L14_56 = nil, nil, nil, nil, L13_55(L14_56)
  L7_49, L9_51, L10_52, L11_53, L15_57 = nil, nil, nil, nil, L13_55(L14_56)
  L7_49, L9_51, L10_52, L11_53, L16_58 = nil, nil, nil, nil, L13_55(L14_56)
  L7_49, L9_51, L10_52, L11_53, L17_59 = nil, nil, nil, nil, L13_55(L14_56)
  L7_49, L9_51, L10_52, L11_53, L18_60 = nil, nil, nil, nil, L13_55(L14_56)
  L3_45 = L18_60
  L6_48 = L17_59
  L5_47 = L16_58
  L4_46 = L15_57
  L8_50 = L14_56
  L2_44 = L13_55
  L13_55 = _UPVALUE2_
  L13_55 = L13_55.SUCCESS
  if L2_44 ~= L13_55 then
    L13_55 = _UPVALUE3_
    L13_55 = L13_55.SUBNET_CHECK_FAILED
    return L13_55
  end
  L13_55 = _UPVALUE4_
  L13_55 = L13_55.ipv4DualMaskCheck
  L14_56 = L3_45
  L15_57 = L7_49
  L16_58 = A0_42
  L17_59 = A1_43
  L13_55 = L13_55(L14_56, L15_57, L16_58, L17_59)
  L2_44 = L13_55
  L13_55 = _UPVALUE2_
  L13_55 = L13_55.SUCCESS
  if L2_44 == L13_55 then
    L13_55 = _UPVALUE3_
    L13_55 = L13_55.SAME_SUBNET_LAN
    return L13_55
  end
  L13_55 = _UPVALUE1_
  L13_55 = L13_55.vlanGetNext
  L14_56 = L8_50
  L7_49, L9_51, L10_52, L11_53, L18_60 = L13_55(L14_56)
  L3_45 = L18_60
  L6_48 = L17_59
  L5_47 = L16_58
  L4_46 = L15_57
  L8_50 = L14_56
  L2_44 = L13_55
  while true do
    L13_55 = _UPVALUE2_
    L13_55 = L13_55.NEXT_ROWID_INVALID
    if L2_44 ~= L13_55 then
      L13_55 = _UPVALUE2_
      L13_55 = L13_55.SUCCESS
      if L2_44 ~= L13_55 then
        L13_55 = _UPVALUE3_
        L13_55 = L13_55.SUBNET_CHECK_FAILED
        return L13_55
      end
      L13_55 = _UPVALUE4_
      L13_55 = L13_55.ipv4DualMaskCheck
      L14_56 = L3_45
      L15_57 = L7_49
      L16_58 = A0_42
      L17_59 = A1_43
      L13_55 = L13_55(L14_56, L15_57, L16_58, L17_59)
      L2_44 = L13_55
      L13_55 = _UPVALUE2_
      L13_55 = L13_55.SUCCESS
      if L2_44 == L13_55 then
        L13_55 = _UPVALUE3_
        L13_55 = L13_55.SAME_SUBNET_VLAN
        return L13_55
      end
      L13_55 = _UPVALUE1_
      L13_55 = L13_55.vlanGetNext
      L14_56 = L8_50
      L7_49, L9_51, L10_52, L11_53, L18_60 = L13_55(L14_56)
      L3_45 = L18_60
      L6_48 = L17_59
      L5_47 = L16_58
      L4_46 = L15_57
      L8_50 = L14_56
      L2_44 = L13_55
    end
  end
  L13_55 = db
  L13_55 = L13_55.getAttribute
  L14_56 = _UPVALUE5_
  L15_57 = _UPVALUE6_
  L15_57 = L15_57.dmz_interface
  L16_58 = _UPVALUE7_
  L17_59 = _UPVALUE6_
  L17_59 = L17_59.dmz_ip
  L13_55 = L13_55(L14_56, L15_57, L16_58, L17_59)
  L14_56 = db
  L14_56 = L14_56.getAttribute
  L15_57 = _UPVALUE5_
  L16_58 = _UPVALUE6_
  L16_58 = L16_58.dmz_interface
  L17_59 = _UPVALUE7_
  L18_60 = _UPVALUE6_
  L18_60 = L18_60.dmz_netmask
  L14_56 = L14_56(L15_57, L16_58, L17_59, L18_60)
  L15_57 = _UPVALUE2_
  L15_57 = L15_57.NIL
  if L13_55 ~= L15_57 then
    L15_57 = _UPVALUE8_
    if L13_55 ~= L15_57 then
      L15_57 = _UPVALUE2_
      L15_57 = L15_57.NIL
      if L14_56 ~= L15_57 then
        L15_57 = _UPVALUE8_
        if L14_56 ~= L15_57 then
          L15_57 = _UPVALUE4_
          L15_57 = L15_57.ipv4DualMaskCheck
          L16_58 = L13_55
          L17_59 = L14_56
          L18_60 = A0_42
          L15_57 = L15_57(L16_58, L17_59, L18_60, A1_43)
          L2_44 = L15_57
          L15_57 = _UPVALUE2_
          L15_57 = L15_57.SUCCESS
          if L2_44 == L15_57 then
            L15_57 = _UPVALUE3_
            L15_57 = L15_57.SAME_SUBNET_DMZ
            return L15_57
          end
        end
      end
    end
  end
  L15_57 = _UPVALUE4_
  L15_57 = L15_57.ipv4DualMaskCheck
  L16_58 = _UPVALUE9_
  L17_59 = _UPVALUE10_
  L18_60 = A0_42
  L15_57 = L15_57(L16_58, L17_59, L18_60, A1_43)
  L2_44 = L15_57
  L15_57 = _UPVALUE2_
  L15_57 = L15_57.SUCCESS
  if L2_44 == L15_57 then
    L15_57 = _UPVALUE3_
    L15_57 = L15_57.SAME_SUBNET_LOCAL_IP
    return L15_57
  end
  L15_57 = db
  L15_57 = L15_57.getAttributeWhere
  L16_58 = _UPVALUE11_
  L17_59 = _UPVALUE6_
  L17_59 = L17_59.interfaceName
  L18_60 = " = '"
  L17_59 = L17_59 .. L18_60 .. _UPVALUE12_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE13_
  L18_60 = _UPVALUE6_
  L18_60 = L18_60.wan_ipAddress
  L15_57 = L15_57(L16_58, L17_59, L18_60)
  L16_58 = db
  L16_58 = L16_58.getAttributeWhere
  L17_59 = _UPVALUE11_
  L18_60 = _UPVALUE6_
  L18_60 = L18_60.interfaceName
  L18_60 = L18_60 .. " = '" .. _UPVALUE12_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE13_
  L16_58 = L16_58(L17_59, L18_60, _UPVALUE6_.wan_subnet)
  L17_59 = _UPVALUE2_
  L17_59 = L17_59.NIL
  if L15_57 ~= L17_59 then
    L17_59 = _UPVALUE8_
    if L15_57 ~= L17_59 then
      L17_59 = _UPVALUE2_
      L17_59 = L17_59.NIL
      if L16_58 ~= L17_59 then
        L17_59 = _UPVALUE8_
        if L16_58 ~= L17_59 then
          L17_59 = _UPVALUE4_
          L17_59 = L17_59.ipv4DualMaskCheck
          L18_60 = L15_57
          L17_59 = L17_59(L18_60, L16_58, A0_42, A1_43)
          L2_44 = L17_59
          L17_59 = _UPVALUE2_
          L17_59 = L17_59.SUCCESS
          if L2_44 == L17_59 then
            L17_59 = _UPVALUE3_
            L17_59 = L17_59.SAME_SUBNET_WAN2
            return L17_59
          end
        end
      end
    end
  end
  L17_59 = db
  L17_59 = L17_59.getAttributeWhere
  L18_60 = _UPVALUE11_
  L17_59 = L17_59(L18_60, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE14_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE13_, _UPVALUE6_.wan_ipAddress)
  L18_60 = db
  L18_60 = L18_60.getAttributeWhere
  L18_60 = L18_60(_UPVALUE11_, _UPVALUE6_.interfaceName .. " = '" .. _UPVALUE14_ .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. _UPVALUE13_, _UPVALUE6_.wan_subnet)
  if L17_59 ~= _UPVALUE2_.NIL and L17_59 ~= _UPVALUE8_ and L18_60 ~= _UPVALUE2_.NIL and L18_60 ~= _UPVALUE8_ then
    L2_44 = _UPVALUE4_.ipv4DualMaskCheck(L17_59, L18_60, A0_42, A1_43)
    if L2_44 == _UPVALUE2_.SUCCESS then
      return _UPVALUE3_.SAME_SUBNET_WAN1
    end
  end
  return _UPVALUE2_.SUCCESS
end
