local L0_0
L0_0 = require
L0_0("teamf1lualib/sslvpn")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/sslAdmin")
L0_0 = require
L0_0("teamf1lualib/userdb")
L0_0 = require
L0_0("teamf1lualib/sslVpnPortalLayouts_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/sslvpn_portalLayout")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
else
end
if MODEL_ID == "DWC-1000" then
  require("teamf1lualib/validations_cli")
end
function getStatusMsgFromCode(A0_1)
  local L1_2
  if A0_1 == nil then
    L1_2 = " "
    statusMsg = L1_2
  elseif A0_1 == "10187" then
    L1_2 = "Administrator privileges are required"
    statusMsg = L1_2
  elseif A0_1 == "11434" then
    L1_2 = "No Objects Configured for the selected Resource"
    statusMsg = L1_2
  elseif A0_1 == "12265" then
    L1_2 = "Operation Succeeded"
    statusMsg = L1_2
  elseif A0_1 == "12224" then
    L1_2 = "SSLVPN Policy Configuration Failed"
    statusMsg = L1_2
  elseif A0_1 == "12830" then
    L1_2 = "SSLVPN Policy Delete Failed"
    statusMsg = L1_2
  elseif A0_1 == "11818" then
    L1_2 = "PortalLayout(s) Configuration Failed"
    statusMsg = L1_2
  elseif A0_1 == "11819" then
    L1_2 = "PortalLayout(s) Deleted Successfully"
    statusMsg = L1_2
  elseif A0_1 == "13315" then
    L1_2 = "Portal Layout cannot be deleted if it contains Group(s)"
    statusMsg = L1_2
  elseif A0_1 == "10740" then
    L1_2 = "End IP address must greater than or equal to the start IP address"
    statusMsg = L1_2
  elseif A0_1 == "11094" then
    L1_2 = "IP/subnet is in conflict with LAN or WAN or VLANs. Please configure different pool"
    statusMsg = L1_2
  elseif A0_1 == "12220" then
    L1_2 = "SSLVPN Client Config Failed"
    statusMsg = L1_2
  elseif A0_1 == "12213" then
    L1_2 = "SSL VPN client routes configuration failed"
    statusMsg = L1_2
  elseif A0_1 == "11820" then
    L1_2 = "PortForwarding Config Failed"
    statusMsg = L1_2
  elseif A0_1 == "12225" then
    L1_2 = "SSLVPN Resource(s) Configuration Failed"
    statusMsg = L1_2
  elseif A0_1 == "11974" then
    L1_2 = "Resource in use, Cannot delete the Resource"
    statusMsg = L1_2
  elseif A0_1 == "12829" then
    L1_2 = "Resource Object Delete Failed"
    statusMsg = L1_2
  elseif A0_1 == "11973" then
    L1_2 = "Resource delete failed"
    statusMsg = L1_2
  elseif A0_1 == "12097" then
    L1_2 = "selected Resources Deleted"
    statusMsg = L1_2
  elseif A0_1 == "10529" then
    L1_2 = "Deleting the Only resourceObject of a resource will make the corresponding policy IN EFFECTIVE"
    statusMsg = L1_2
  end
  L1_2 = statusMsg
  L1_2 = L1_2 or A0_1
  return L1_2
end
function sslvpnportallayoutCfgInit(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4 = {}
  L2_5, L3_6, L4_7 = nil, nil, nil
  if A0_3[1] ~= nil then
    L1_4 = db.getRow("SSLVPNPortalLayout", "SSLVPNPortalLayout._ROWID_", A0_3[1])
    if L1_4 == nil then
      printCLIError("Row does not exist")
      return -1, {}
    else
      L2_5, L3_6, L4_7 = _UPVALUE0_.sslDomainGetCur(A0_3[1])
      if L2_5 ~= _UPVALUE1_.SUCCESS then
        return -1, {}
      else
        if L3_6 == nil or L4_7 == nil then
          L3_6 = "local"
          L4_7 = "None"
        end
        L1_4["SSLVPNPortalLayout.sslAuthType"] = L3_6
        L1_4["SSLVPNPortalLayout.sslGroupName"] = L4_7
      end
      return 1, L1_4
    end
  else
    L1_4["SSLVPNPortalLayout.DisplayBanner"] = "0"
    L1_4["SSLVPNPortalLayout.EnableHTTPMetaTags"] = "0"
    L1_4["SSLVPNPortalLayout.EnableActiveXWebCacheCleaner"] = "0"
    L1_4["SSLVPNPortalLayout.EnableVPNTunnel"] = "1"
    L1_4["SSLVPNPortalLayout.EnablePortForwarding"] = "0"
    L1_4["SSLVPNPortalLayout.profileName"] = db.getAttribute("LoginProfiles", "_ROWID_", "1", "configurationName")
    L1_4["SSLVPNPortalLayout.sslAuthType"] = "local"
    L1_4["SSLVPNPortalLayout.sslGroupName"] = "None"
    return 1, L1_4
  end
end
function sslvpnportallayoutCfgSave(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20, L13_21, L14_22, L15_23, L16_24, L17_25, L18_26, L19_27
  L1_9 = "ERROR"
  L2_10 = ""
  L3_11 = ""
  L4_12 = "SSLVPNPortalLayout"
  DBTable = L4_12
  L4_12 = A0_8["SSLVPNPortalLayout._ROWID_"]
  RowId = L4_12
  L4_12 = db
  L4_12 = L4_12.getTable
  L5_13 = DBTable
  L4_12 = L4_12(L5_13)
  if L4_12 ~= nil then
    L5_13 = #L4_12
    L6_14 = _UPVALUE0_
    if L5_13 >= L6_14 then
      L3_11 = "Maximum limit for SSL VPN portal layouts is reached."
      L5_13 = "ERROR"
      L6_14 = L3_11
      return L5_13, L6_14
    end
  end
  L5_13 = A0_8["SSLVPNPortalLayout.DisplayBanner"]
  L6_14 = A0_8["SSLVPNPortalLayout.EnableHTTPMetaTags"]
  L7_15 = A0_8["SSLVPNPortalLayout.EnableActiveXWebCacheCleaner"]
  L8_16 = A0_8["SSLVPNPortalLayout.EnableVPNTunnel"]
  L9_17 = A0_8["SSLVPNPortalLayout.EnablePortForwarding"]
  L10_18 = A0_8["SSLVPNPortalLayout.profileName"]
  L11_19 = A0_8["SSLVPNPortalLayout.sslAuthType"]
  L12_20 = A0_8["SSLVPNPortalLayout.sslGroupName"]
  L13_21 = A0_8["SSLVPNPortalLayout.PortalLayoutName"]
  L14_22 = "0"
  L15_23 = A0_8["SSLVPNPortalLayout.PortalSiteTitle"]
  L16_24 = A0_8["SSLVPNPortalLayout.BannerTitle"]
  L17_25 = A0_8["SSLVPNPortalLayout.BannerMessage"]
  L18_26, L19_27 = nil, nil
  _UPVALUE1_.start()
  if RowId == nil or RowId == "" then
    L18_26, L19_27 = _UPVALUE2_.portalCreate(L13_21, L14_22, L15_23, L16_24, L17_25, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20)
  else
    row = db.getRow("SSLVPNPortalLayout", "SSLVPNPortalLayout._ROWID_", RowId)
    if row == nil then
      _UPVALUE1_.abort()
      return L1_9, "Row does not exist"
    end
    L18_26, L19_27 = _UPVALUE2_.portalSet(RowId, L13_21, L14_22, L15_23, L16_24, L17_25, L5_13, L6_14, L7_15, L8_16, L9_17, L10_18, L11_19, L12_20)
  end
  if L18_26 ~= _UPVALUE3_.SUCCESS then
    L3_11 = _UPVALUE4_.errorStringGet(L18_26)
    printCLIError("Failure in configuration")
    L1_9 = "ERROR"
    _UPVALUE1_.abort()
    return L1_9, L3_11
  else
    L1_9 = "OK"
    _UPVALUE1_.complete()
    _UPVALUE1_.save()
    return L1_9, L3_11
  end
end
function sslvpnportallayoutCfgInputVal(A0_28)
  local L1_29
  if A0_28 == nil then
    L1_29 = false
    return L1_29
  end
  L1_29 = A0_28["SSLVPNPortalLayout.PortalLayoutName"]
  if L1_29 ~= nil then
    L1_29 = A0_28["SSLVPNPortalLayout.PortalLayoutName"]
  elseif L1_29 == "" then
    L1_29 = printCLIError
    L1_29("Invalid portal_name value")
    L1_29 = false
    return L1_29
  end
  L1_29 = A0_28["SSLVPNPortalLayout.profileName"]
  if L1_29 ~= nil then
    L1_29 = db
    L1_29 = L1_29.getRow
    L1_29 = L1_29("LoginProfiles", "configurationName", A0_28["SSLVPNPortalLayout.profileName"])
    if L1_29 == nil then
      L1_29 = printCLIError
      L1_29("Invalid profile_name value.")
      L1_29 = false
      return L1_29
    end
  end
  L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
  if L1_29 == "ntdomain" then
    L1_29 = db
    L1_29 = L1_29.existsRow
    L1_29 = L1_29("NTDomainSettings", "ProfileName", "Default")
    if not L1_29 then
      L1_29 = printCLIError
      L1_29("NTDOMAIN Settings are not configured. Please Configure NTDOMAIN Settings.")
      L1_29 = false
      return L1_29
    end
  else
    L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
    if L1_29 == "active-directory" then
      L1_29 = db
      L1_29 = L1_29.existsRow
      L1_29 = L1_29("ActiveDirectorySettings", "ProfileName", "Default")
      if not L1_29 then
        L1_29 = printCLIError
        L1_29("Active Directory Settings are not configured. Please Configure Active Directory Settings.")
        L1_29 = false
        return L1_29
      end
    else
      L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
      if L1_29 == "ldap" then
        L1_29 = db
        L1_29 = L1_29.existsRow
        L1_29 = L1_29("LDAPSettings", "ProfileName", "Default")
        if not L1_29 then
          L1_29 = printCLIError
          L1_29("LDAP Settings are not configured. Please Configure LDAP Settings.")
          L1_29 = false
          return L1_29
        end
      else
        L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
        if L1_29 == "pop" then
          L1_29 = db
          L1_29 = L1_29.existsRow
          L1_29 = L1_29("POPProfiles", "ProfileName", "Default")
          if not L1_29 then
            L1_29 = printCLIError
            L1_29("POP3 Settings are not configured. Please Configure POP3 Settings.")
            L1_29 = false
            return L1_29
          end
        end
      end
    end
  end
  L1_29 = A0_28["SSLVPNPortalLayout.sslGroupName"]
  if L1_29 ~= nil then
    L1_29 = A0_28["SSLVPNPortalLayout.sslGroupName"]
    if L1_29 ~= "None" then
      L1_29 = db
      L1_29 = L1_29.existsRow
      L1_29 = L1_29("UserGroups", "GroupName", A0_28["SSLVPNPortalLayout.sslGroupName"])
      if not L1_29 then
        L1_29 = printCLIError
        L1_29("Group does not exist.Use command 'show system group all' to see all groups on system")
        L1_29 = false
        return L1_29
      else
        L1_29 = db
        L1_29 = L1_29.getAttribute
        L1_29 = L1_29("UserGroups", "GroupName", A0_28["SSLVPNPortalLayout.sslGroupName"], "Capabilities")
        if not users.isUserType(L1_29, "0") then
          printCLIError("The selected group does not have SSLVPN privilege")
          return false
        end
      end
    end
  end
  L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
  if L1_29 ~= nil then
    L1_29 = A0_28["SSLVPNPortalLayout.sslAuthType"]
    if L1_29 ~= "local" then
      L1_29 = A0_28["SSLVPNPortalLayout.sslGroupName"]
      if L1_29 ~= "None" then
        L1_29 = printCLIError
        L1_29("SSL group should be configured for only Local authentication type.")
        L1_29 = false
        return L1_29
      end
    end
  end
  L1_29 = db
  L1_29 = L1_29.typeAndRangeValidate
  return L1_29(A0_28)
end
function sslvpnportallayoutCfgDel(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35
  L1_31 = "ERROR"
  L2_32 = ""
  L3_33 = ""
  L4_34, L5_35 = nil, nil
  rows = {
    A0_30[1]
  }
  tabRow = db.getRow("SSLVPNPortalLayout", "_ROWID_", A0_30[1])
  if tabRow == nil then
    printCLIError("Row does not exist")
    return L1_31, "Row does not exist"
  elseif tabRow["SSLVPNPortalLayout.PortalLayoutName"] == "SSLVPN" and tabRow["SSLVPNPortalLayout._ROWID_"] == "1" then
    printCLIError("Cannot delete default SSL VPN portal")
    return L1_31, "Cannot delete default SSL VPN portal"
  end
  _UPVALUE0_.start()
  L5_35, L4_34 = _UPVALUE1_.portalDelete(tabRow["SSLVPNPortalLayout._ROWID_"])
  if L5_35 ~= _UPVALUE2_.SUCCESS then
    printCLIError("Error in Delete Opetation in sslVpnPortalLayouts page ")
    _UPVALUE0_.abort()
    return L5_35, "Error in Delete Opetation in sslVpnPortalLayouts page"
  end
  _UPVALUE0_.complete()
  _UPVALUE0_.save()
  L3_33 = _UPVALUE3_.errorStringGet(L5_35)
  L1_31 = "OK"
  return L1_31, L3_33
end
function sslvpnportforwardingappsCfgInit(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = {}
  L2_38 = 1
  L3_39 = L1_37
  return L2_38, L3_39
end
function sslvpnportforwardingappsCfgSave(A0_40)
  local L1_41, L2_42, L3_43
  L1_41 = "ERROR"
  L2_42 = ""
  L3_43 = ""
  DBTable = "SSLVPNPortForwardingAppsMap"
  L1_41, L2_42 = sslvpn.portForwardConfig(A0_40, -1, "add")
  if L1_41 == "OK" then
    db.save()
  end
  L3_43 = getStatusMsgFromCode(L2_42)
  printCLIError(L3_43 or L2_42)
  return L1_41, L3_43
end
function sslvpnportforwardingappsCfgInputVal(A0_44)
  if A0_44["SSLVPNPortForwardingAppsMap.ServerIP"] == nil or A0_44["SSLVPNPortForwardingAppsMap.ServerIP"] == "" then
    printCLIError("Invalid serverip value")
    return false
  end
  if A0_44["SSLVPNPortForwardingAppsMap.Port"] == nil or A0_44["SSLVPNPortForwardingAppsMap.Port"] == "" then
    printCLIError("Invalid port value")
    return false
  end
  return validations.ipAddressValidate(A0_44["SSLVPNPortForwardingAppsMap.ServerIP"], "", "IP Address error") and validations.rangeValidate(1, 65535, A0_44["SSLVPNPortForwardingAppsMap.Port"], "", "TCP Port error")
end
function sslvpnportforwardingappsCfgDel(A0_45)
  local L1_46, L2_47, L3_48
  L1_46 = {L2_47}
  L2_47 = A0_45[1]
  rows = L1_46
  L1_46 = "ERROR"
  L2_47 = ""
  L3_48 = ""
  DBTable = "SSLVPNPortForwardingAppsMap"
  if db.getRow("SSLVPNPortForwardingAppsMap", "_ROWID_", A0_45[1]) == nil then
    printCLIError("Row does not exist")
    return L1_46, "Row does not exist"
  end
  L1_46, L2_47 = sslvpn.portForwardConfig(rows, "-1", "delete")
  if L1_46 == "OK" then
    db.save()
  end
  L3_48 = getStatusMsgFromCode(L2_47)
  printCLIError(L3_48 or L2_47)
  return L1_46, L3_48
end
function sslvpnportforwardinghostCfgInit(A0_49)
  local L1_50, L2_51, L3_52
  L1_50 = {}
  L2_51 = 1
  L3_52 = L1_50
  return L2_51, L3_52
end
function sslvpnportforwardinghostCfgSave(A0_53)
  local L1_54, L2_55, L3_56
  L1_54 = "ERROR"
  L2_55 = ""
  L3_56 = ""
  DBTable = "SSLVPNPortForwardingFQDNMap"
  L1_54, L2_55 = sslvpn.portForwardConfig(A0_53, -1, "add")
  if L1_54 == "OK" then
    db.save()
  end
  L3_56 = getStatusMsgFromCode(L2_55)
  printCLIError(L3_56 or L2_55)
  return L1_54, L3_56
end
function sslvpnportforwardinghostCfgInputVal(A0_57)
  if A0_57["SSLVPNPortForwardingFQDNMap.ServerIP"] == nil or A0_57["SSLVPNPortForwardingFQDNMap.ServerIP"] == "" then
    printCLIError("Invalid serverip value")
    return false
  end
  if A0_57["SSLVPNPortForwardingFQDNMap.FQDNName"] == nil or A0_57["SSLVPNPortForwardingFQDNMap.FQDNName"] == "" then
    printCLIError("Invalid domain_name value")
    return false
  end
  return validations.ipAddressValidate(A0_57["SSLVPNPortForwardingFQDNMap.ServerIP"], "", "IP Address error")
end
function sslvpnportforwardinghostCfgDel(A0_58)
  local L1_59, L2_60, L3_61
  L1_59 = {L2_60}
  L2_60 = A0_58[1]
  rows = L1_59
  L1_59 = "ERROR"
  L2_60 = ""
  L3_61 = ""
  DBTable = "SSLVPNPortForwardingFQDNMap"
  if db.getRow("SSLVPNPortForwardingFQDNMap", "_ROWID_", A0_58[1]) == nil then
    printCLIError("Row does not exist")
    return L1_59, "Row does not exist"
  end
  L1_59, L2_60 = sslvpn.portForwardConfig(rows, "-1", "delete")
  if L1_59 == "OK" then
    db.save()
  end
  L3_61 = getStatusMsgFromCode(L2_60)
  printCLIError(L3_61 or L2_60)
  return L1_59, L3_61
end
function sslvpnresourceCfgInit(A0_62)
  local L1_63, L2_64, L3_65
  L1_63 = {}
  L1_63["SSLVPNResource.ServiceType"] = "VIRTUAL-PASSAGE"
  L2_64 = 1
  L3_65 = L1_63
  return L2_64, L3_65
end
function sslvpnresourceCfgSave(A0_66)
  local L1_67, L2_68, L3_69
  L1_67 = "ERROR"
  L2_68 = ""
  L3_69 = ""
  DBTable = "SSLVPNResource"
  if db.getTable(DBTable) ~= nil and #db.getTable(DBTable) >= _UPVALUE0_ then
    L3_69 = "Maximum limit for SSL VPN resources is reached."
    return "ERROR", L3_69
  end
  L1_67, L2_68 = sslvpn.resourceConfig(A0_66, -1, "add")
  L3_69 = getStatusMsgFromCode(L2_68)
  if L1_67 == "OK" then
    db.save()
    printCLIError(L3_69 or L2_68)
  end
  return L1_67, L3_69
end
function sslvpnresourceCfgInputVal(A0_70)
  if A0_70["SSLVPNResource.ResourceName"] == nil or A0_70["SSLVPNResource.ResourceName"] == "" then
    printCLIError("Invalid resource_name value")
    return false
  end
  if A0_70["SSLVPNResource.ServiceType"] == nil or A0_70["SSLVPNResource.ServiceType"] == "" then
    printCLIError("Invalid service_type value")
    return false
  end
  return true
end
function sslvpnresourceCfgDel(A0_71)
  local L1_72, L2_73, L3_74
  L1_72 = {L2_73}
  L2_73 = A0_71[1]
  rows = L1_72
  L1_72 = "ERROR"
  L2_73 = ""
  L3_74 = ""
  if db.getRow("SSLVPNResource", "_ROWID_", A0_71[1]) == nil then
    printCLIError("Row does not exist")
    return L1_72, "Row does not exist"
  end
  L1_72, L2_73 = sslvpn.deleteResources(rows)
  L3_74 = getStatusMsgFromCode(L2_73)
  printCLIError(L3_74 or L2_73)
  return L1_72, L3_74
end
function sslvpnresourceobjectCfgInit(A0_75)
  local L1_76
  L1_76 = {}
  L1_76["SSLVPNResourceObject.ResourceName"] = A0_75[1]
  if db.getRow("SSLVPNResource", "ResourceName", L1_76["SSLVPNResourceObject.ResourceName"]) == nil then
    printCLIError("Please enter correct resource name ")
    return -1, {}
  end
  L1_76["SSLVPNResourceObject.ObjectType"] = 1
  L1_76["SSLVPNResourceObject.IcmpBlock"] = "no"
  return 1, L1_76
end
function sslvpnresourceobjectCfgSave(A0_77)
  local L1_78, L2_79, L3_80
  L1_78 = "ERROR"
  L2_79 = ""
  L3_80 = ""
  DBTable = "SSLVPNResourceObject"
  L1_78, L2_79 = sslvpn.resourceConfig(A0_77, -1, "add")
  L3_80 = getStatusMsgFromCode(L2_79)
  if L1_78 == "OK" then
    db.save()
    printCLIError(L3_80 or L2_79)
  end
  return L1_78, L3_80
end
function sslvpnresourceobjectCfgInputVal(A0_81)
  if A0_81["SSLVPNResourceObject.ObjectType"] == nil or A0_81["SSLVPNResourceObject.ObjectType"] == "" then
    printCLIError("Invalid object_type value")
    return false
  end
  if A0_81["SSLVPNResourceObject.ObjectAddress"] == nil or A0_81["SSLVPNResourceObject.ObjectAddress"] == "" then
    printCLIError("Invalid object_address value")
    return false
  end
  if A0_81["SSLVPNResourceObject.StartPort"] == nil or A0_81["SSLVPNResourceObject.StartPort"] == "" then
    printCLIError("Invalid start_port value")
    return false
  end
  if A0_81["SSLVPNResourceObject.EndPort"] == nil or A0_81["SSLVPNResourceObject.EndPort"] == "" then
    printCLIError("Invalid end_port value")
    return false
  end
  if A0_81["SSLVPNResourceObject.ObjectType"] == "2" and (A0_81["SSLVPNResourceObject.MaskLength"] == nil or A0_81["SSLVPNResourceObject.MaskLength"] == "") then
    printCLIError("Invalid mask_length value")
    return false
  end
  return db.typeAndRangeValidate(A0_81)
end
function sslvpnresourceobjectCfgDel(A0_82)
  local L1_83, L2_84, L3_85
  L1_83 = {L2_84}
  L2_84 = A0_82[1]
  rows = L1_83
  L1_83 = db
  L1_83 = L1_83.getAttribute
  L2_84 = "SSLVPNResourceObject"
  L3_85 = "_ROWID_"
  L1_83 = L1_83(L2_84, L3_85, A0_82[1], "ResourceName")
  rName = L1_83
  L1_83 = "ERROR"
  L2_84 = ""
  L3_85 = ""
  DBTable = "SSLVPNResourceObject"
  if db.getRow("SSLVPNResourceObject", "_ROWID_", A0_82[1]) == nil then
    printCLIError("Row does not exist")
    return L1_83, "Row does not exist"
  end
  L1_83, L2_84 = sslvpn.deleteDefinedResource(rows, rName)
  if L1_83 == "OK" then
    db.save()
  end
  L3_85 = getStatusMsgFromCode(L2_84)
  printCLIError(L3_85 or L2_84)
  return L1_83, L3_85
end
function sslvpnpolicyCfgInit(A0_86)
  local L1_87
  L1_87 = {}
  if A0_86[1] ~= nil then
    L1_87 = db.getRow("SSLVPNPolicy", "SSLVPNPolicy._ROWID_", A0_86[1])
    if L1_87 == nil then
      printCLIError("Row does not exist")
      return -1, {}
    else
      return 1, L1_87
    end
  else
    L1_87["SSLVPNPolicy.Permission"] = "Permit"
    L1_87["SSLVPNPolicy.IcmpBlock"] = "no"
    return 1, L1_87
  end
end
function sslvpnpolicyCfgSave(A0_88)
  local L1_89, L2_90, L3_91
  L1_89 = "ERROR"
  L2_90 = ""
  L3_91 = ""
  DBTable = "SSLVPNPolicy"
  RowId = A0_88["SSLVPNPolicy._ROWID_"]
  if db.getTable(DBTable) ~= nil and #db.getTable(DBTable) >= _UPVALUE0_ then
    L3_91 = "Maximum limit for SSL VPN server policies is reached."
    return "ERROR", L3_91
  end
  if RowId == nil or RowId == "" then
    L1_89, L2_90 = sslvpn.policyConfig(A0_88, RowId, "add")
  else
    if db.getRow("SSLVPNPolicy", "SSLVPNPolicy._ROWID_", RowId) == nil then
      printCLIError("Row does not exist")
      return L1_89, "Row does not exist"
    end
    L1_89, L2_90 = sslvpn.policyConfig(A0_88, RowId, "edit")
  end
  L3_91 = getStatusMsgFromCode(L2_90)
  if L1_89 == "OK" then
    db.save()
    printCLIError(L3_91 or L2_90)
  end
  return L1_89, L3_91
end
function sslvpnpolicyCfgInputVal(A0_92)
  local L1_93
  L1_93 = A0_92["SSLVPNPolicy.PolicyType"]
  if L1_93 ~= nil then
    L1_93 = A0_92["SSLVPNPolicy.PolicyType"]
  elseif L1_93 == "" then
    L1_93 = printCLIError
    L1_93("Invalid policy_type value")
    L1_93 = false
    return L1_93
  end
  L1_93 = A0_92["SSLVPNPolicy.PolicyType"]
  if L1_93 ~= "group" then
    L1_93 = A0_92["SSLVPNPolicy.PolicyType"]
  elseif L1_93 == "user" then
    L1_93 = A0_92["SSLVPNPolicy.PolicyOwnerName"]
    if L1_93 ~= nil then
      L1_93 = A0_92["SSLVPNPolicy.PolicyOwnerName"]
    elseif L1_93 == "" then
      L1_93 = printCLIError
      L1_93("Invalid policy_owner value")
      L1_93 = false
      return L1_93
    end
  end
  L1_93 = A0_92["SSLVPNPolicy.PolicyOwnerName"]
  if A0_92["SSLVPNPolicy.PolicyType"] == "group" then
    row = db.getRow("UserGroups", "GroupName", L1_93)
    if row == nil then
      printCLIError("Invalid policy_owner value. No such group found")
      return false
    elseif users.isSslvpnUser(row["UserGroups.Capabilities"]) == false then
      printCLIError("Invalid policy_owner value. Select sslvpn user group")
      return false
    end
  elseif A0_92["SSLVPNPolicy.PolicyType"] == "user" then
    row = db.getRow("Users", "UserName", L1_93)
    if row == nil then
      printCLIError("Invalid policy_owner value. No such user found")
      return false
    elseif users.verifyUserType(row["Users.UserName"], "0") == false then
      printCLIError("Invalid policy_owner value. Select sslvpn user")
      return false
    end
  end
  if A0_92["SSLVPNPolicy.DestinationObjectType"] == nil or A0_92["SSLVPNPolicy.DestinationObjectType"] == "" then
    printCLIError("Invalid destination_objecttype value")
    return false
  end
  if A0_92["SSLVPNPolicy.PolicyName"] == nil or A0_92["SSLVPNPolicy.PolicyName"] == "" then
    printCLIError("Invalid policy_name value")
    return false
  end
  if A0_92["SSLVPNPolicy.DestinationObjectType"] == "1" then
    if A0_92["SSLVPNPolicy.ResourceName"] == nil or A0_92["SSLVPNPolicy.ResourceName"] == "" then
      printCLIError("Invalid resource_name value")
      return false
    end
  elseif A0_92["SSLVPNPolicy.DestinationObjectType"] == "2" then
    if A0_92["SSLVPNPolicy.Address"] == nil or A0_92["SSLVPNPolicy.Address"] == "" then
      printCLIError("Invalid policy_address value")
      return false
    end
    if A0_92["SSLVPNPolicy.StartPort"] == nil or A0_92["SSLVPNPolicy.StartPort"] == "" then
      printCLIError("Invalid start_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.EndPort"] == nil or A0_92["SSLVPNPolicy.EndPort"] == "" then
      printCLIError("Invalid end_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.ServiceType"] == nil or A0_92["SSLVPNPolicy.ServiceType"] == "" then
      printCLIError("Invalid service_type value")
      return false
    end
  elseif A0_92["SSLVPNPolicy.DestinationObjectType"] == "3" then
    if A0_92["SSLVPNPolicy.Address"] == nil or A0_92["SSLVPNPolicy.Address"] == "" then
      printCLIError("Invalid policy_address value")
      return false
    end
    if A0_92["SSLVPNPolicy.MaskLength"] == nil or A0_92["SSLVPNPolicy.MaskLength"] == "" then
      printCLIError("Invalid policy_masklength value")
      return false
    end
    if A0_92["SSLVPNPolicy.StartPort"] == nil or A0_92["SSLVPNPolicy.StartPort"] == "" then
      printCLIError("Invalid start_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.EndPort"] == nil or A0_92["SSLVPNPolicy.EndPort"] == "" then
      printCLIError("Invalid end_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.ServiceType"] == nil or A0_92["SSLVPNPolicy.ServiceType"] == "" then
      printCLIError("Invalid service_type value")
      return false
    end
  elseif A0_92["SSLVPNPolicy.DestinationObjectType"] == "4" then
    if A0_92["SSLVPNPolicy.StartPort"] == nil or A0_92["SSLVPNPolicy.StartPort"] == "" then
      printCLIError("Invalid start_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.EndPort"] == nil or A0_92["SSLVPNPolicy.EndPort"] == "" then
      printCLIError("Invalid end_port value")
      return false
    end
    if A0_92["SSLVPNPolicy.ServiceType"] == nil or A0_92["SSLVPNPolicy.ServiceType"] == "" then
      printCLIError("Invalid service_type value")
      return false
    end
  end
  if A0_92["SSLVPNPolicy.Permission"] == nil or A0_92["SSLVPNPolicy.Permission"] == "" then
    printCLIError("Invalid policy_permission value")
    return false
  end
  return validations.isEmpty(A0_92["SSLVPNPolicy.PolicyName"], "Policy Name error") and validations.checkboxValidate(A0_92["SSLVPNPolicy.DestinationObjectType"], "2", 2) and validations.ipAddressValidate(A0_92["SSLVPNPolicy.Address"], "", "IP Address error") and validations.rangeValidate(0, 65535, A0_92["SSLVPNPolicy.StartPort"], A0_92["SSLVPNPolicy.EndPort"], "Port start/end error") and validations.checkboxValidate(A0_92["SSLVPNPolicy.DestinationObjectType"], "3", 3) and validations.ipAddressValidate(A0_92["SSLVPNPolicy.Address"], "", "IP address error") and validations.rangeValidate(0, 32, A0_92["SSLVPNPolicy.MaskLength"], "", "Mask Length error") and validations.rangeValidate(0, 65535, A0_92["SSLVPNPolicy.StartPort"], A0_92["SSLVPNPolicy.EndPort"], "Port start/end error") and validations.checkboxValidate(A0_92["SSLVPNPolicy.DestinationObjectType"], "4", 1) and validations.rangeValidate(0, 65535, A0_92["SSLVPNPolicy.StartPort"], A0_92["SSLVPNPolicy.EndPort"], "Port start/end error")
end
function sslvpnpolicyCfgDel(A0_94)
  local L1_95, L2_96, L3_97
  L1_95 = {L2_96}
  L2_96 = A0_94[1]
  rows = L1_95
  L1_95 = "ERROR"
  L2_96 = ""
  L3_97 = ""
  DBTable = "SSLVPNPolicy"
  if db.getRow("SSLVPNPolicy", "_ROWID_", A0_94[1]) == nil then
    printCLIError("Row does not exist")
    return L1_95, "Row does not exist"
  end
  L1_95, L2_96 = sslvpn.deletePolicy(rows)
  if L1_95 == "OK" then
    db.save()
  end
  L3_97 = getStatusMsgFromCode(L2_96)
  printCLIError(L3_97 or L2_96)
  return L1_95, L3_97
end
function sslvpnclientCfgInit(A0_98)
  configRow = db.getRow("SSLVPNClientConf", "_ROWID_", "1")
  return 1, configRow
end
function sslvpnclientCfgSave(A0_99)
  local L1_100, L2_101, L3_102
  L1_100 = "ERROR"
  L2_101 = ""
  L3_102 = ""
  DBTable = "SSLVPNClientConf"
  inputTable = db.getRow("SSLVPNClientConf", "_ROWID_", "1")
  if inputTable == nil then
    L1_100, L2_101 = sslvpn.sslVpnClientConfig(A0_99, "-1", "add")
  else
    L1_100, L2_101 = sslvpn.sslVpnClientConfig(A0_99, "1", "edit")
  end
  L3_102 = getStatusMsgFromCode(L2_101)
  if L1_100 == "OK" then
    db.save()
    printCLIError(L3_102 or L2_101)
  end
  return L1_100, L3_102
end
function sslvpnclientCfgInputVal(A0_103)
  local L1_104, L2_105
  L1_104 = A0_103["SSLVPNClientConf.EnableFullTunnel"]
  if L1_104 ~= nil then
    L1_104 = A0_103["SSLVPNClientConf.EnableFullTunnel"]
  elseif L1_104 == "" then
    L1_104 = printCLIError
    L2_105 = "Invalid enable_fulltunnel value"
    L1_104(L2_105)
    L1_104 = false
    return L1_104
  end
  L1_104 = MODEL_ID
  if L1_104 == "DWC-1000" then
    L1_104 = A0_103["SSLVPNClientConf.BeginClientAddress"]
    if L1_104 ~= nil then
      L1_104 = A0_103["SSLVPNClientConf.BeginClientAddress"]
      if L1_104 ~= "" then
        L1_104 = A0_103["SSLVPNClientConf.BeginClientAddress"]
      end
    elseif L1_104 == "0.0.0.0" then
      L1_104 = printCLIError
      L2_105 = "Invalid begin_clientaddress value"
      L1_104(L2_105)
      L1_104 = false
      return L1_104
    end
    L1_104 = A0_103["SSLVPNClientConf.EndClientAddress"]
    if L1_104 ~= nil then
      L1_104 = A0_103["SSLVPNClientConf.EndClientAddress"]
      if L1_104 ~= "" then
        L1_104 = A0_103["SSLVPNClientConf.EndClientAddress"]
      end
    elseif L1_104 == "0.0.0.0" then
      L1_104 = printCLIError
      L2_105 = "Invalid end_clientaddress value"
      L1_104(L2_105)
      L1_104 = false
      return L1_104
    end
  else
    L1_104 = A0_103["SSLVPNClientConf.BeginClientAddress"]
    if L1_104 ~= nil then
      L1_104 = A0_103["SSLVPNClientConf.BeginClientAddress"]
    elseif L1_104 == "" then
      L1_104 = printCLIError
      L2_105 = "Invalid begin_clientaddress value"
      L1_104(L2_105)
      L1_104 = false
      return L1_104
    end
    L1_104 = A0_103["SSLVPNClientConf.EndClientAddress"]
    if L1_104 ~= nil then
      L1_104 = A0_103["SSLVPNClientConf.EndClientAddress"]
    elseif L1_104 == "" then
      L1_104 = printCLIError
      L2_105 = "Invalid end_clientaddress value"
      L1_104(L2_105)
      L1_104 = false
      return L1_104
    end
  end
  L1_104 = A0_103["SSLVPNClientConf.lcpTimeout"]
  if L1_104 ~= nil then
    L1_104 = A0_103["SSLVPNClientConf.lcpTimeout"]
  elseif L1_104 == "" then
    L1_104 = printCLIError
    L2_105 = "Invalid lcp_timeout value"
    L1_104(L2_105)
    L1_104 = false
    return L1_104
  end
  L1_104 = MODEL_ID
  if L1_104 == "DWC-1000" then
    L1_104 = "255.255.255.0"
    L2_105 = A0_103["SSLVPNClientConf.BeginClientAddress"]
    result = validations_comm.checkWanSubnetRange(L2_105, L1_104)
    if result == _UPVALUE0_.SUCCESS then
      printCLIError("OPTION1/OPTION2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
    result = validations_comm.checkIpSecSubnetRange(L2_105, L1_104)
    if result == _UPVALUE0_.SUCCESS then
      printCLIError("IPSEC ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
    result = validations_comm.checkLanVlanSubnetRange(L2_105, L1_104)
    if result == _UPVALUE0_.SUCCESS then
      printCLIError("Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
    result = validations_comm.checkDmzSubnetRange(L2_105, L1_104)
    if result == _UPVALUE0_.SUCCESS then
      printCLIError("DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
  end
  L1_104 = validations
  L1_104 = L1_104.ipAddressValidate
  L2_105 = A0_103["SSLVPNClientConf.PrimaryDNSServer"]
  L1_104 = L1_104(L2_105, "", "Primary DNS Error", "skip")
  if L1_104 then
    L1_104 = validations
    L1_104 = L1_104.ipAddressValidate
    L2_105 = A0_103["SSLVPNClientConf.SecondaryDNSServer"]
    L1_104 = L1_104(L2_105, "", "Secondary DNS error", "skip")
    if L1_104 then
      L1_104 = validations
      L1_104 = L1_104.ipRangeValidate
      L2_105 = A0_103["SSLVPNClientConf.BeginClientAddress"]
      L1_104 = L1_104(L2_105, A0_103["SSLVPNClientConf.EndClientAddress"], "Start/End IP error")
    end
  end
  return L1_104
end
function sslvpnrouteCfgInit(A0_106)
  local L1_107
  L1_107 = {}
  if db.getAttribute("SSLVPNClientConf", "_ROWID_", "1", "EnableFullTunnel") == "1" then
    printCLIError("Enable Split Tunnel Support to configure Client Routes")
    return -1, {}
  end
  return 1, L1_107
end
function sslvpnrouteCfgSave(A0_108)
  local L1_109, L2_110, L3_111
  L1_109 = "ERROR"
  L2_110 = ""
  L3_111 = ""
  DBTable = "SSLVPNClientRoute"
  if db.getTable(DBTable) ~= nil and #db.getTable(DBTable) >= _UPVALUE0_ then
    L3_111 = "Maximum limit for SSL VPN routes is reached."
    return "ERROR", L3_111
  end
  L1_109, L2_110 = sslvpn.sslClientRouteConfig(A0_108, "-1", "add")
  if L1_109 == "OK" then
    db.save()
  end
  L3_111 = getStatusMsgFromCode(L2_110)
  printCLIError(L3_111 or L2_110)
  return L1_109, L3_111
end
function sslvpnrouteCfgInputVal(A0_112)
  if A0_112["SSLVPNClientRoute.DestinationNetwork"] == nil or A0_112["SSLVPNClientRoute.DestinationNetwork"] == "" then
    printCLIError("Invalid destination_network value")
    return false
  end
  if A0_112["SSLVPNClientRoute.SubnetMask"] == nil or A0_112["SSLVPNClientRoute.SubnetMask"] == "" then
    printCLIError("Invalid subnet_mask value")
    return false
  end
  return validations.ipAddressValidate(A0_112["SSLVPNClientRoute.DestinationNetwork"], A0_112["SSLVPNClientRoute.SubnetMask"], "IP/Subnet Mask Error")
end
function sslvpnrouteCfgDel(A0_113)
  local L1_114, L2_115, L3_116
  L1_114 = {L2_115}
  L2_115 = A0_113[1]
  rows = L1_114
  L1_114 = "ERROR"
  L2_115 = ""
  L3_116 = ""
  DBTable = "SSLVPNClientRoute"
  if db.getRow("SSLVPNClientRoute", "_ROWID_", A0_113[1]) == nil then
    printCLIError("Row does not exist")
    return L1_114, "Row does not exist"
  elseif db.getAttribute("SSLVPNClientConf", "_ROWID_", "1", "EnableFullTunnel") == "1" then
    printCLIError("Enable Split Tunnel Support to configure Client Routes")
    return L1_114, "Enable Split Tunnel Support to configure Client Routes"
  end
  L1_114, L2_115 = sslvpn.sslClientRouteConfig(rows, "-1", "delete")
  if L1_114 == "OK" then
    db.save()
  end
  L3_116 = getStatusMsgFromCode(L2_115)
  printCLIError(L3_116 or L2_115)
  return L1_114, L3_116
end
function sslvpnClientShow(A0_117)
  local L1_118
  L1_118 = db
  L1_118 = L1_118.getRow
  L1_118 = L1_118("SSLVPNClientConf", "_ROWID_", "1")
  configRow = L1_118
  L1_118 = configRow
  if L1_118 == nil then
    L1_118 = db
    L1_118 = L1_118.getDefaults
    L1_118 = L1_118(true, "SSLVPNClientConf")
    configRow = L1_118
  end
  L1_118 = {}
  resTab.insertField(L1_118, "Enable Split Tunnel Support", (configRow["SSLVPNClientConf.EnableFullTunnel"] or "") == "0" and "Yes" or "No")
  resTab.insertField(L1_118, "DNS Suffix", configRow["SSLVPNClientConf.DNSSuffix"] or "")
  resTab.insertField(L1_118, "Primary DNS Server", configRow["SSLVPNClientConf.PrimaryDNSServer"] or "")
  resTab.insertField(L1_118, "Secondary DNS Server", configRow["SSLVPNClientConf.SecondaryDNSServer"] or "")
  resTab.insertField(L1_118, "Client Address Range Begin", configRow["SSLVPNClientConf.BeginClientAddress"] or "")
  resTab.insertField(L1_118, "Client Address Range End", configRow["SSLVPNClientConf.EndClientAddress"] or "")
  resTab.insertField(L1_118, "LCP Timeout", configRow["SSLVPNClientConf.lcpTimeout"] or "")
  printLabel("SSL VPN Client")
  resTab.print(L1_118, 0)
end
function sslvpnRouteShow(A0_119)
  local L1_120, L2_121
  L1_120 = db
  L1_120 = L1_120.getTable
  L2_121 = "SSLVPNClientRoute"
  L1_120 = L1_120(L2_121)
  L2_121 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_120) do
    resTab.insertField(L2_121, "Row Id", _FORV_8_["SSLVPNClientRoute._ROWID_"])
    resTab.insertField(L2_121, "Destination Network", _FORV_8_["SSLVPNClientRoute.DestinationNetwork"] or "")
    resTab.insertField(L2_121, "Subnet Mask", _FORV_8_["SSLVPNClientRoute.SubnetMask"] or "")
  end
  printLabel("Configured Client Routes")
  resTab.print(L2_121, 0)
end
function sslvpnActiveConnectionsShow(A0_122)
  local L1_123, L2_124
  L1_123 = sslvpn
  L1_123 = L1_123.sslvpnTunnelStatsGet
  L1_123()
  L1_123 = db
  L1_123 = L1_123.getTable
  L2_124 = "SSLVPNActiveUsers"
  L1_123 = L1_123(L2_124)
  L2_124 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_123) do
    if _FORV_8_["SSLVPNActiveUsers.PPPInterface"] ~= nil and _FORV_8_["SSLVPNActiveUsers.PPPInterface"] ~= "" then
      resTab.insertField(L2_124, "User Name", _FORV_8_["SSLVPNActiveUsers.UserName"] or "")
      resTab.insertField(L2_124, "IP Address", _FORV_8_["SSLVPNActiveUsers.LoginAddress"] or "")
      resTab.insertField(L2_124, "Local PPP Interface", _FORV_8_["SSLVPNActiveUsers.PPPInterface"] or "")
      resTab.insertField(L2_124, "Peer PPP Interface IP", _FORV_8_["SSLVPNActiveUsers.PeerPPPInterfaceIP"] or "")
    end
  end
  printLabel("Active SSL VPN Connections")
  resTab.print(L2_124, 0)
end
function sslvpnPolicyShow(A0_125)
  local L1_126, L2_127
  L1_126 = db
  L1_126 = L1_126.getTable
  L2_127 = "SSLVPNPolicy"
  L1_126 = L1_126(L2_127)
  L2_127 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_126) do
    resTab.insertField(L2_127, "Row Id", _FORV_8_["SSLVPNPolicy._ROWID_"])
    resTab.insertField(L2_127, "Policy Name", _FORV_8_["SSLVPNPolicy.PolicyName"] or "")
    resTab.insertField(L2_127, "Service Type", _FORV_8_["SSLVPNPolicy.ServiceType"] or "")
    resTab.insertField(L2_127, "Destination Object", _FORV_8_["SSLVPNPolicy.DestinationObject"] or "")
    resTab.insertField(L2_127, "Permission", _FORV_8_["SSLVPNPolicy.Permission"] or "")
  end
  printLabel("SSL VPN Policies")
  resTab.print(L2_127, 0)
end
function sslvpnPortalShow(A0_128)
  local L1_129, L2_130, L3_131, L4_132, L5_133, L6_134, L7_135, L8_136, L9_137, L10_138, L11_139, L12_140, L13_141, L14_142, L15_143, L16_144, L17_145, L18_146, L19_147
  L1_129 = db
  L1_129 = L1_129.getTable
  L2_130 = "SSLVPNPortalLayout"
  L1_129 = L1_129(L2_130)
  L2_130 = {}
  L3_131 = 0
  for L7_135, L8_136 in L4_132(L5_133) do
    L3_131 = L3_131 + 1
    L9_137 = L1_129[L3_131]
    L10_138 = resTab
    L10_138 = L10_138.insertField
    L11_139 = L2_130
    L12_140 = "Row Id"
    L13_141 = L9_137["SSLVPNPortalLayout._ROWID_"]
    L10_138(L11_139, L12_140, L13_141)
    L10_138 = L9_137["SSLVPNPortalLayout.PortalLayoutName"]
    L11_139 = "0.0.0.0"
    L12_140 = db
    L12_140 = L12_140.getRow
    L13_141 = "WanMode"
    L14_142 = "_ROWID_"
    L15_143 = "1"
    L12_140 = L12_140(L13_141, L14_142, L15_143)
    L13_141 = "WAN1"
    if L12_140 ~= nil then
      L14_142 = L12_140["WanMode.Wanmode"]
      if L14_142 ~= "0" then
        L14_142 = L12_140["WanMode.Wanmode"]
      elseif L14_142 == "2" then
        L13_141 = L12_140["WanMode.DedicatedLogicalIfName"]
      end
    end
    if L13_141 == nil then
      L13_141 = "WAN1"
    end
    L14_142 = db
    L14_142 = L14_142.getRowWhere
    L15_143 = "ipAddressTable"
    L16_144 = "LogicalIfName='"
    L17_145 = L13_141
    L18_146 = "' and addressFamily=2"
    L16_144 = L16_144 .. L17_145 .. L18_146
    L14_142 = L14_142(L15_143, L16_144)
    if L14_142 ~= nil then
      L15_143 = L14_142["ipAddressTable.ipAddress"]
      L11_139 = L15_143 or L11_139
    end
    L15_143 = "https://"
    L16_144 = L11_139
    L17_145 = "/portal/"
    L18_146 = L9_137["SSLVPNPortalLayout.PortalLayoutName"]
    L15_143 = L15_143 .. L16_144 .. L17_145 .. L18_146
    L16_144 = ""
    L17_145 = ""
    L18_146 = L9_137["SSLVPNPortalLayout.PortalLayoutName"]
    L19_147 = L15_143
    if #L18_146 > 32 then
      L17_145 = L9_137["SSLVPNPortalLayout.PortalLayoutName"]
      L16_144 = "https://" .. L11_139 .. "/portal/" .. L9_137["SSLVPNPortalLayout.PortalLayoutName"]
      L18_146 = string.sub(L18_146, 1, 16) .. "..."
      L19_147 = "https://" .. L11_139 .. "/portal/" .. L18_146
    end
    resTab.insertField(L2_130, "Portal Name", L18_146)
    resTab.insertField(L2_130, "URL", L19_147)
  end
  L4_132(L5_133)
  L4_132(L5_133, L6_134)
end
function sslvpnAppconfigShow(A0_148)
  local L1_149, L2_150
  L1_149 = db
  L1_149 = L1_149.getTable
  L2_150 = "SSLVPNPortForwardingAppsMap"
  L1_149 = L1_149(L2_150)
  L2_150 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_149) do
    resTab.insertField(L2_150, "Row Id", _FORV_8_["SSLVPNPortForwardingAppsMap._ROWID_"])
    resTab.insertField(L2_150, "Server IP", _FORV_8_["SSLVPNPortForwardingAppsMap.ServerIP"] or "")
    resTab.insertField(L2_150, "Port", _FORV_8_["SSLVPNPortForwardingAppsMap.Port"] or "")
  end
  printLabel("Port Forwarding Application Configuration")
  resTab.print(L2_150, 0)
end
function sslvpnHostconfigShow(A0_151)
  local L1_152, L2_153
  L1_152 = db
  L1_152 = L1_152.getTable
  L2_153 = "SSLVPNPortForwardingFQDNMap"
  L1_152 = L1_152(L2_153)
  L2_153 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_152) do
    resTab.insertField(L2_153, "Row Id", _FORV_8_["SSLVPNPortForwardingFQDNMap._ROWID_"])
    resTab.insertField(L2_153, "Server IP", _FORV_8_["SSLVPNPortForwardingFQDNMap.ServerIP"] or "")
    resTab.insertField(L2_153, "FQDN Name", _FORV_8_["SSLVPNPortForwardingFQDNMap.FQDNName"] or "")
  end
  printLabel("Port Forwarding Host Configuration")
  resTab.print(L2_153, 0)
end
function sslvpnResourceShow(A0_154)
  local L1_155, L2_156
  L1_155 = db
  L1_155 = L1_155.getTable
  L2_156 = "SSLVPNResource"
  L1_155 = L1_155(L2_156)
  L2_156 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_155) do
    resTab.insertField(L2_156, "Row Id", _FORV_8_["SSLVPNResource._ROWID_"])
    resTab.insertField(L2_156, "Resource Name", _FORV_8_["SSLVPNResource.ResourceName"] or "")
    resTab.insertField(L2_156, "Service", _FORV_8_["SSLVPNResource.ServiceType"] or "")
    resTab.insertField(L2_156, "Use Count", _FORV_8_["SSLVPNResource.UseCount"] or "")
  end
  printLabel("RESOURCES")
  resTab.print(L2_156, 0)
end
function sslvpnResourceObjectShow(A0_157)
  local L1_158, L2_159, L3_160, L4_161, L5_162, L6_163, L7_164, L8_165, L9_166, L10_167
  L1_158 = string
  L1_158 = L1_158.format
  L2_159 = [[
                                 SELECT *, _ROWID_ AS _ROWID_ FROM SSLVPNResourceObject WHERE ResourceName = '%s'
	                          ]]
  L3_160 = A0_157[1]
  L1_158 = L1_158(L2_159, L3_160)
  L2_159 = db
  L2_159 = L2_159.getTable
  L3_160 = "SSLVPNResourceObject"
  L4_161 = true
  L2_159 = L2_159(L3_160, L4_161, L5_162)
  L3_160 = {}
  L4_161 = 0
  L8_165 = A0_157[1]
  if L5_162 == nil then
    L5_162(L6_163)
    return
  end
  for L8_165, L9_166 in L5_162(L6_163) do
    L4_161 = L4_161 + 1
    L10_167 = L9_166["SSLVPNResourceObject.ObjectType"]
    L10_167 = L10_167 or ""
    if L10_167 == "1" then
      L10_167 = "IP Address"
    elseif L10_167 == "2" then
      L10_167 = "IP Network"
    else
      L10_167 = "UNKNOWN"
    end
    resTab.insertField(L3_160, "Row Id", L9_166["SSLVPNResourceObject._ROWID_"])
    resTab.insertField(L3_160, "Object Type", L10_167)
    resTab.insertField(L3_160, "Object Address", L9_166["SSLVPNResourceObject.ObjectAddress"] or "")
    resTab.insertField(L3_160, "Mask Length", L9_166["SSLVPNResourceObject.MaskLength"] or "")
    resTab.insertField(L3_160, "Start Port", L9_166["SSLVPNResourceObject.StartPort"] or "")
    resTab.insertField(L3_160, "End Port", L9_166["SSLVPNResourceObject.EndPort"] or "")
  end
  L5_162(L6_163)
  L5_162(L6_163, L7_164)
end
function sslvpnEditValidate(A0_168, A1_169, A2_170)
  if __CLISH_CUR_CONFIG_ROW["SSLVPNPortalLayout.PortalLayoutName"] == "SSLVPN" and __CLISH_CUR_CONFIG_ROW["SSLVPNPortalLayout._ROWID_"] == "1" then
    printCLIError("Only group name can be modified in Default portal")
    return "ERROR", ""
  else
    clishCfgObjAdd(A0_168, A1_169, A2_170)
  end
end
