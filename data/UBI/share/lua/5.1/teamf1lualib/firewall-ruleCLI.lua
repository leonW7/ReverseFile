local L0_0
L0_0 = require
L0_0("teamf1lualib/fwView")
L0_0 = require
L0_0("teamf1lualib/fwRules")
L0_0 = require
L0_0("teamf1lualib/algs")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = "PriorityId != 'NULL' and PriorityId !='0'"
if UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
end
function snatInterfacesGet()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2 = UNIT_NAME
  if L1_2 ~= "DSR-250N" then
    L1_2 = UNIT_NAME
    if L1_2 ~= "DSR-250" then
      L1_2 = UNIT_NAME
      if L1_2 ~= "DSR-150N" then
        L1_2 = UNIT_NAME
      end
    end
  else
    if L1_2 == "DSR-150" then
      L0_1[1] = "WAN"
  end
  else
    L0_1[1] = "WAN1"
  end
  L1_2 = nil
  L2_3 = UNIT_NAME
  if L2_3 ~= "DSR-500N" then
    L2_3 = UNIT_NAME
    if L2_3 ~= "DSR-500" then
      L2_3 = UNIT_NAME
      if L2_3 ~= "DSR-1000N" then
        L2_3 = UNIT_NAME
        if L2_3 ~= "DSR-1000" then
          L2_3 = UNIT_NAME
          if L2_3 ~= "DSR-1000AC" then
            L2_3 = UNIT_NAME
          end
        end
      end
    end
  else
    if L2_3 == "DSR-500AC" then
      L0_1[2] = "WAN2"
      L2_3 = UNIT_NAME
      if L2_3 ~= "DSR-1000N" then
        L2_3 = UNIT_NAME
        if L2_3 ~= "DSR-1000" then
          L2_3 = UNIT_NAME
        end
      else
        if L2_3 == "DSR-1000AC" then
          L0_1[3] = "WAN3_(3G_Internet)"
          L1_2 = 4
      end
      else
        L1_2 = 3
      end
  end
  else
    L1_2 = 2
  end
  L2_3 = db
  L2_3 = L2_3.getTable
  L2_3 = L2_3("ifStaticIPAlias", false)
  for _FORV_6_, _FORV_7_ in pairs(L2_3) do
    L0_1[L1_2] = _FORV_7_.LogicalIfName .. "-" .. _FORV_7_.IPAddress
    L1_2 = L1_2 + 1
  end
  return L0_1
end
function availInterfacesGet()
  local L0_4
  L0_4 = printLabel
  L0_4("Available Interfaces:")
  L0_4 = 0
  index = L0_4
  L0_4 = snatInterfacesGet
  L0_4 = L0_4()
  for _FORV_4_, _FORV_5_ in pairs(L0_4) do
    index = index + 1
    print(L0_4[index])
  end
end
function externalIpAddressGet()
  local L0_5
  L0_5 = printLabel
  L0_5("Available external ip addresses:")
  L0_5 = 0
  index = L0_5
  L0_5 = dnatInterfacesGet
  L0_5 = L0_5()
  for _FORV_4_, _FORV_5_ in pairs(L0_5) do
    index = index + 1
    print(L0_5[index])
  end
end
function dnatInterfacesGet()
  local L0_6, L1_7, L2_8
  L0_6 = {}
  L0_6[1] = "DEDICATED_WAN"
  L1_7 = nil
  L2_8 = UNIT_NAME
  if L2_8 ~= "DSR-500N" then
    L2_8 = UNIT_NAME
    if L2_8 ~= "DSR-500" then
      L2_8 = UNIT_NAME
      if L2_8 ~= "DSR-1000N" then
        L2_8 = UNIT_NAME
        if L2_8 ~= "DSR-1000" then
          L2_8 = UNIT_NAME
          if L2_8 ~= "DSR-1000AC" then
            L2_8 = UNIT_NAME
          end
        end
      end
    end
  else
    if L2_8 == "DSR-500AC" then
      L0_6[2] = "CONFIGURABLE_WAN"
      L2_8 = UNIT_NAME
      if L2_8 ~= "DSR-1000N" then
        L2_8 = UNIT_NAME
        if L2_8 ~= "DSR-1000" then
          L2_8 = UNIT_NAME
        end
      else
        if L2_8 == "DSR-1000AC" then
          L0_6[3] = "WAN3_(3G_Internet)"
          L1_7 = 4
      end
      else
        L1_7 = 3
      end
  end
  else
    L0_6[2] = "ROLLOVER_WAN(3G_INTERNET)"
    L1_7 = 3
  end
  L2_8 = db
  L2_8 = L2_8.getTable
  L2_8 = L2_8("ifStaticIPAlias", false)
  for _FORV_6_, _FORV_7_ in pairs(L2_8) do
    if _FORV_7_.LogicalIfName == "WAN1" then
      _FORV_7_.LogicalIfName = "DEDICATED_WAN"
    elseif _FORV_7_.LogicalIfName == "WAN2" then
      _FORV_7_.LogicalIfName = "CONFIGURABLE_WAN"
    end
    L0_6[L1_7] = _FORV_7_.LogicalIfName .. "-" .. _FORV_7_.IPAddress
    L1_7 = L1_7 + 1
  end
  return L0_6
end
function firewallSettings4CfgInit(A0_9)
  local L1_10, L2_11, L3_12, L4_13
  L1_10 = A0_9[1]
  L2_11 = {}
  L2_11["Ipv4.DefaultPolicyStatus"] = L1_10
  L2_11["Ipv6.DefaultPolicyStatus"] = nil
  L2_11["Ipv4._ROWID_"] = "1"
  L3_12 = L2_11["Ipv4._ROWID_"]
  L4_13 = L2_11
  return L3_12, L4_13
end
function firewallSettings4CfgSave(A0_14)
  local L1_15, L2_16, L3_17
  L1_15 = "Error"
  L2_16 = ""
  L3_17 = ""
  L1_15, L2_16 = fwView.defaultPolicyEdit(A0_14)
  L3_17 = db.getAttribute("stringsMap", "stringId", L2_16, LANGUAGE)
  if L1_15 == "OK" then
    db.save()
  else
    L1_15 = "ERROR"
    L3_17 = "Default outbound rule not found for IPv4 Firewall Rules."
  end
  return L1_15, L3_17
end
function accessControlRuleInfoGet(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35, L18_36, L19_37
  L1_19 = db
  L1_19 = L1_19.getTable
  L2_20 = "FirewallRules"
  L1_19 = L1_19(L2_20)
  L2_20 = {}
  L3_21 = nil
  L4_22 = "0"
  L5_23 = printLabel
  L6_24 = "Default Outbound Policy"
  L5_23(L6_24)
  L5_23 = db
  L5_23 = L5_23.getRow
  L6_24 = "fwDefaultOutBoundPolicy"
  L7_25 = "Ipmode"
  L8_26 = "1"
  L5_23 = L5_23(L6_24, L7_25, L8_26)
  defRow = L5_23
  L5_23 = defRow
  L5_23 = L5_23["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
  if L5_23 == "1" then
    L5_23 = print
    L6_24 = "For IPv4 : Allow Always\n"
    L5_23(L6_24)
  else
    L5_23 = defRow
    L5_23 = L5_23["fwDefaultOutBoundPolicy.DefaultPolicyStatus"]
    if L5_23 == "0" then
      L5_23 = print
      L6_24 = "For IPv4 : Block Always"
      L5_23(L6_24)
    end
  end
  L5_23 = "RuleType = 'SECURE_INSECURE'"
  L6_24 = L5_23
  L7_25 = " or RuleType = 'INSECURE_SECURE'"
  L5_23 = L6_24 .. L7_25
  L6_24 = L5_23
  L7_25 = " or RuleType = 'PUBLIC_SECURE'"
  L5_23 = L6_24 .. L7_25
  L6_24 = L5_23
  L7_25 = " or RuleType = 'SECURE_PUBLIC'"
  L5_23 = L6_24 .. L7_25
  L6_24 = L5_23
  L7_25 = " or RuleType = 'INSECURE_PUBLIC'"
  L5_23 = L6_24 .. L7_25
  L6_24 = L5_23
  L7_25 = " or RuleType = 'PUBLIC_INSECURE'"
  L5_23 = L6_24 .. L7_25
  L6_24 = L5_23
  L7_25 = " or RuleType = 'SECURE_SECURE'"
  L5_23 = L6_24 .. L7_25
  L6_24 = db
  L6_24 = L6_24.getRowsWhere
  L7_25 = "FirewallRules"
  L8_26 = L5_23
  L6_24 = L6_24(L7_25, L8_26)
  L7_25 = db
  L7_25 = L7_25.getAttribute
  L8_26 = "fwPriorityMap"
  L9_27 = "RuleType"
  L10_28 = "ALL"
  L7_25 = L7_25(L8_26, L9_27, L10_28, L11_29)
  L7_25 = L7_25 or ""
  L8_26 = {}
  L9_27 = {}
  L10_28 = printLabel
  L10_28(L11_29)
  if L7_25 ~= nil and L7_25 ~= "" then
    L10_28 = util
    L10_28 = L10_28.split
    L10_28 = L10_28(L11_29, L12_30)
    if L10_28 ~= false then
      if L11_29 ~= 0 then
        for L15_33, L16_34 in L12_30(L13_31) do
          for _FORV_20_, _FORV_21_ in L17_35(L18_36) do
            if _FORV_21_["FirewallRules.PriorityId"] == L16_34 then
              L9_27[L11_29] = _FORV_21_
              break
            end
          end
        end
      end
    end
  end
  L10_28 = 0
  for L14_32, L15_33 in L11_29(L12_30) do
    L10_28 = L10_28 + 1
    L16_34 = L9_27[L10_28]
    if L16_34["FirewallRules.Status"] == "0" then
    else
    end
    if L16_34["FirewallRules.FromZoneType"] == "SECURE" then
    elseif L16_34["FirewallRules.FromZoneType"] == "INSECURE" then
    else
    end
    if L16_34["FirewallRules.ToZoneType"] == "SECURE" then
    elseif L16_34["FirewallRules.ToZoneType"] == "INSECURE" then
    else
    end
    if L16_34["FirewallRules.Action"] == "ACCEPT" then
    elseif L16_34["FirewallRules.Action"] == "DROP" then
    elseif L16_34["FirewallRules.Action"] == "DROP_BY_SCHED_MATCH" then
    else
    end
    if L16_34["FirewallRules.SourceAddressType"] == "0" then
    elseif L16_34["FirewallRules.SourceAddressType"] == "1" then
    elseif L16_34["FirewallRules.SourceAddressType"] == "2" then
    end
    if L16_34["FirewallRules.DestinationAddressType"] == "0" then
    elseif L16_34["FirewallRules.DestinationAddressType"] == "1" then
    elseif L16_34["FirewallRules.DestinationAddressType"] == "2" then
    end
    if L16_34["FirewallRules.LogLevel"] == "1" then
      logLevel = "Never"
    elseif L16_34["FirewallRules.LogLevel"] == "2" then
      logLevel = "Always"
    end
    if L16_34["FirewallRules.FromZoneVlanId"] ~= "0" and L16_34["FirewallRules.FromZoneVlanId"] ~= nil then
      L18_36 = db.getAttribute("vlan", "vlanId", L16_34["FirewallRules.FromZoneVlanId"], "vlanName") or ""
    end
    if L16_34["FirewallRules.ToZoneVlanId"] ~= "0" and L16_34["FirewallRules.ToZoneVlanId"] ~= nil then
      L19_37 = db.getAttribute("vlan", "vlanId", L16_34["FirewallRules.ToZoneVlanId"], "vlanName") or ""
    end
    if L16_34["FirewallRules.RuleType"] == "INSECURE_SECURE" or L16_34["FirewallRules.RuleType"] == "INSECURE_PUBLIC" then
    end
    resTab.insertField(L8_26, "ROW ID", L16_34["FirewallRules._ROWID_"] or "")
    resTab.insertField(L8_26, "Status", "Enabled" or "")
    resTab.insertField(L8_26, "From Zone", L18_36)
    resTab.insertField(L8_26, "To Zone", L19_37)
    resTab.insertField(L8_26, "Service", L16_34["FirewallRules.ServiceName"] or "")
    resTab.insertField(L8_26, "Action", "Allow by schedule,otherwise Block" or "")
    resTab.insertField(L8_26, "Source Hosts", L16_34["FirewallRules.SourceAddressStart"] .. " - " .. L16_34["FirewallRules.SourceAddressEnd"] or "")
    resTab.insertField(L8_26, "Destination Hosts", L16_34["FirewallRules.DestinationAddressStart"] .. " - " .. L16_34["FirewallRules.DestinationAddressEnd"] or "")
    resTab.insertField(L8_26, "Local Server", L16_34["FirewallRules.DNATAddress"] or "" or "")
    resTab.insertField(L8_26, "Internet Dest", L16_34["FirewallRules.DestinationPublicInterface"] or "" or "")
    resTab.insertField(L8_26, "Log", logLevel or "")
  end
  L11_29(L12_30, L13_31)
end
function accessControlRuleModify(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43, L6_44
  L1_39 = "Error"
  L2_40 = ""
  L3_41 = ""
  L4_42 = "FirewallRules"
  DBTable = L4_42
  L4_42 = {}
  L5_43 = A0_38[1]
  L4_42.rowId = L5_43
  L5_43 = A0_38[2]
  L6_44 = L4_42.rowId
  if tonumber(L6_44) > 0 and tonumber(L6_44) < 19 then
    printCLIError("The IPV4 Firewall Rules from rowId 1 to 18 are default" .. " and cannot be " .. A0_38[2] .. "d.")
    return false
  end
  if db.existsRow(DBTable, "_ROWID_", L6_44) == false then
    printCLIError("Configured Row ID does not exist.")
    return false
  end
  L1_39, L3_41 = fwView.modifyRules(L4_42, L5_43)
  if L1_39 == "OK" then
    db.save()
    if L5_43 == "delete" then
      print("Firewall rule(s) has been deleted.")
    elseif L5_43 == "enable" then
      print("Firewall rule(s) has been enabled.")
    elseif L5_43 == "disable" then
      print("Firewall rule(s) has been disabled.")
    end
  end
  accessControlRuleInfoGet()
  return L1_39, L3_41
end
function accessControlRuleCfgInit(A0_45)
  local L1_46, L2_47
  L1_46 = A0_45[1]
  L2_47 = {}
  if L1_46 == nil then
    _UPVALUE0_ = "add"
    L2_47["FirewallRules.Status"] = "1"
  else
    _UPVALUE0_ = "edit"
    if tonumber(L1_46) > 0 and tonumber(L1_46) < 19 then
      print("The Firewall Rules from rows 1 to 18 are default and are not Editable")
      return -1
    end
    L2_47 = db.getRow("FirewallRules", "_ROWID_", L1_46)
    if L2_47 == nil then
      print("Row does not exist")
      return -1
    end
    _UPVALUE1_ = tonumber(L1_46)
    if L2_47["FirewallRules.FromZoneVlanId"] ~= "0" then
      L2_47["FirewallRules.FromZoneVlanName"] = db.getAttribute("vlan", "vlanId", L2_47["FirewallRules.FromZoneVlanId"], "vlanName")
      print("FromZoneVlanName: ", L2_47["FirewallRules.FromZoneVlanName"])
      L2_47["FirewallRules.FromZoneType"] = "SECURE_VLAN"
    end
    if L2_47["FirewallRules.ToZoneVlanId"] ~= "0" then
      L2_47["FirewallRules.ToZoneVlanName"] = db.getAttribute("vlan", "vlanId", L2_47["FirewallRules.ToZoneVlanId"], "vlanName")
      print("ToZoneVlanName: ", L2_47["FirewallRules.ToZoneVlanName"])
      L2_47["FirewallRules.ToZoneType"] = "SECURE_VLAN"
    end
  end
  return -1, L2_47
end
function accessControlRuleCfgSave(A0_48)
  local L1_49, L2_50, L3_51
  L1_49 = "Error"
  L2_50 = ""
  L3_51 = ""
  DBTable = "FirewallRules"
  if A0_48["FirewallRules.FromZoneType"] == "SECURE" then
    A0_48["FirewallRules.FromZoneVlanId"] = "0"
    A0_48["FirewallRules.FromZoneVlanName"] = ""
  end
  if A0_48["FirewallRules.ToZoneType"] == "SECURE" then
    A0_48["FirewallRules.ToZoneVlanId"] = "0"
    A0_48["FirewallRules.ToZoneVlanName"] = ""
  end
  if A0_48["FirewallRules.SNATInterface"] ~= nil then
    snatRow = util.split(A0_48["FirewallRules.SNATInterface"], "-")
    if snatRow[1] == "WAN" then
      snatRow[1] = "WAN1"
    end
    if snatRow[2] ~= nil then
      A0_48["FirewallRules.SNATInterface"] = snatRow[1]
      A0_48["FirewallRules.SNATAddress"] = snatRow[2]
      A0_48["FirewallRules.SNATAddressType"] = "10"
    elseif A0_48["FirewallRules.SNATInterface"] == "WAN3_(3G_Internet)" then
      A0_48["FirewallRules.SNATInterface"] = "WAN3"
      A0_48["FirewallRules.SNATAddressType"] = "7"
    else
      A0_48["FirewallRules.SNATInterface"] = snatRow[1]
      A0_48["FirewallRules.SNATAddressType"] = "7"
    end
  end
  A0_48["FirewallRules.RuleType"] = nil
  if A0_48["FirewallRules._ROWID_"] == nil then
    if A0_48["FirewallRules.DNATPortEnable"] == nil then
      A0_48["FirewallRules.DNATPortEnable"] = "0"
    end
    if A0_48["FirewallRules.DestinationPublicInterface"] ~= nil then
      dnatRow = util.split(A0_48["FirewallRules.DestinationPublicInterface"], "-")
      if dnatRow[1] == "ROLLOVER_WAN(3G_INTERNET)" then
        dnatRow[1] = "WAN2"
      elseif dnatRow[1] == "DEDICATED_WAN" then
        dnatRow[1] = "WAN1"
      elseif dnatRow[1] == "CONFIGURABLE_WAN" then
        dnatRow[1] = "WAN2"
      else
        dnatRow[1] = "WAN3"
      end
      if dnatRow[2] == nil then
        A0_48["FirewallRules.DestinationPublicInterface"] = dnatRow[1]
      else
        A0_48["FirewallRules.DestinationPublicAddress"] = dnatRow[2]
        A0_48["FirewallRules.DestinationPublicInterface"] = "OTHER"
      end
    end
    A0_48["FirewallRules.RuleType"] = nil
    L1_49, L3_51 = fwView.firewallRulesConfig(A0_48, "-1", "add")
  else
    if A0_48["FirewallRules.DNATPortEnable"] == nil then
      A0_48["FirewallRules.DNATPortEnable"] = "0"
    end
    if A0_48["FirewallRules.DestinationPublicInterface"] ~= nil then
      dnatRow = util.split(A0_48["FirewallRules.DestinationPublicInterface"], "-")
      if dnatRow[1] == "ROLLOVER_WAN(3G_INTERNET)" then
        dnatRow[1] = "WAN2"
      elseif dnatRow[1] == "DEDICATED_WAN" then
        dnatRow[1] = "WAN1"
      elseif dnatRow[1] == "CONFIGURABLE_WAN" then
        dnatRow[1] = "WAN2"
      else
        dnatRow[1] = "WAN3"
      end
      if dnatRow[2] == nil then
        A0_48["FirewallRules.DestinationPublicInterface"] = dnatRow[1]
      else
        A0_48["FirewallRules.DestinationPublicAddress"] = dnatRow[2]
        A0_48["FirewallRules.DestinationPublicInterface"] = "OTHER"
      end
    end
    L1_49, L3_51 = fwView.firewallRulesConfig(A0_48, A0_48["FirewallRules._ROWID_"], "edit")
  end
  if L1_49 == "OK" then
    db.save()
    if A0_48["FirewallRules._ROWID_"] == nil then
      print("Firewall rule(s) has been added.")
    else
      print("Firewall rule(s) has been eddited.")
    end
  end
  return L1_49, L3_51
end
function accessControlRuleCfgInputVal(A0_52)
  local L1_53, L2_54, L3_55, L4_56, L5_57, L6_58, L7_59
  L4_56 = A0_52["FirewallRules.FromZoneType"]
  if L4_56 ~= "" then
    L4_56 = A0_52["FirewallRules.FromZoneType"]
  elseif L4_56 == nil then
    L4_56 = printCLIError
    L5_57 = "please enter proper From Zone type"
    L4_56(L5_57)
    L4_56 = false
    return L4_56
  end
  L4_56 = A0_52["FirewallRules.ToZoneType"]
  if L4_56 ~= "" then
    L4_56 = A0_52["FirewallRules.ToZoneType"]
  elseif L4_56 == nil then
    L4_56 = printCLIError
    L5_57 = "please enter proper To Zone type"
    L4_56(L5_57)
    L4_56 = false
    return L4_56
  end
  L4_56 = A0_52["FirewallRules.FromZoneType"]
  L5_57 = "_"
  L6_58 = A0_52["FirewallRules.ToZoneType"]
  L4_56 = L4_56 .. L5_57 .. L6_58
  L5_57 = db
  L5_57 = L5_57.getRowsWhere
  L6_58 = "FirewallRules"
  L7_59 = _UPVALUE0_
  L5_57 = L5_57(L6_58, L7_59)
  L6_58 = #L5_57
  L7_59 = _UPVALUE1_
  if L6_58 >= L7_59 then
    L6_58 = _UPVALUE2_
    if L6_58 == "add" then
      L6_58 = printCLIError
      L7_59 = "Maximum Firewall Rule Limit Exceeded"
      L6_58(L7_59)
      L6_58 = false
      return L6_58
    end
  elseif L4_56 == "SECURE_INSECURE" or L4_56 == "PUBLIC_INSECURE" or L4_56 == "SECURE_VLAN_INSECURE" then
    L6_58 = _UPVALUE2_
    if L6_58 == "add" then
      L6_58 = _UPVALUE0_
      L7_59 = " and (ruleType == "
      L3_55 = L6_58 .. L7_59 .. "'SECURE_INSECURE' or " .. "ruleType == 'PUBLIC_INSECURE')"
    else
      L6_58 = _UPVALUE2_
      if L6_58 == "edit" then
        L6_58 = "rowid != "
        L7_59 = _UPVALUE3_
        L1_53 = L6_58 .. L7_59
        L6_58 = _UPVALUE0_
        L7_59 = " and (ruleType == "
        L3_55 = L6_58 .. L7_59 .. "'SECURE_INSECURE' or " .. "ruleType == 'PUBLIC_INSECURE') and " .. L1_53
      end
    end
    L6_58 = db
    L6_58 = L6_58.getRowsWhere
    L7_59 = "FirewallRules"
    L6_58 = L6_58(L7_59, L3_55)
    L5_57 = L6_58
    L6_58 = #L5_57
    L7_59 = _UPVALUE4_
    if L6_58 >= L7_59 then
      L6_58 = printCLIError
      L7_59 = "Outbound Firewall Rule Limit Exceeded"
      L6_58(L7_59)
      L6_58 = false
      return L6_58
    end
  elseif L4_56 == "INSECURE_SECURE" or L4_56 == "INSECURE_PUBLIC" or L4_56 == "INSECURE_SECURE_VLAN" then
    L6_58 = _UPVALUE2_
    if L6_58 == "add" then
      L6_58 = _UPVALUE0_
      L7_59 = " and (ruleType == "
      L2_54 = L6_58 .. L7_59 .. "'INSECURE_SECURE' or " .. "ruleType == 'INSECURE_PUBLIC')"
    else
      L6_58 = _UPVALUE2_
      if L6_58 == "edit" then
        L6_58 = "rowid != "
        L7_59 = _UPVALUE3_
        L1_53 = L6_58 .. L7_59
        L6_58 = _UPVALUE0_
        L7_59 = " and (ruleType == "
        L2_54 = L6_58 .. L7_59 .. "'INSECURE_SECURE' or " .. "ruleType == 'INSECURE_PUBLIC') and " .. L1_53
      end
    end
    L6_58 = db
    L6_58 = L6_58.getRowsWhere
    L7_59 = "FirewallRules"
    L6_58 = L6_58(L7_59, L2_54)
    L5_57 = L6_58
    L6_58 = #L5_57
    L7_59 = _UPVALUE5_
    if L6_58 >= L7_59 then
      L6_58 = printCLIError
      L7_59 = "Inbound Firewall Rule Limit Exceeded"
      L6_58(L7_59)
      L6_58 = false
      return L6_58
    end
  end
  L6_58 = nil
  L7_59 = A0_52["FirewallRules.ServiceName"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.ServiceName"]
  elseif L7_59 == nil then
    L7_59 = printCLIError
    L7_59("Please first enter proper service name")
    L7_59 = false
    return L7_59
  end
  L7_59 = A0_52["FirewallRules.ServiceName"]
  if L7_59 then
    L7_59 = "ServiceName = '"
    L7_59 = L7_59 .. A0_52["FirewallRules.ServiceName"] .. "'"
    if db.existsRowWhere("Services", L7_59) == false then
      printCLIError("Invalid service name")
      return false
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneVlanName"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.FromZoneType"]
    if L7_59 ~= "SECURE_VLAN" then
      L7_59 = A0_52["FirewallRules.FromZoneVlanId"]
      if L7_59 == "0" then
        L7_59 = printCLIError
        L7_59("you cannot enter vlan name if from zone is not selected as SECURE_VLAN")
        L7_59 = false
        return L7_59
      end
    end
    L7_59 = db
    L7_59 = L7_59.getAttribute
    L7_59 = L7_59("vlan", "vlanName", A0_52["FirewallRules.FromZoneVlanName"], "portName")
    if L7_59 ~= "dummy" then
      printCLIError("the from zone vlan name you have entered is not correct")
      return false
    end
  end
  L7_59 = A0_52["FirewallRules.ToZoneVlanName"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.ToZoneType"]
    if L7_59 ~= "SECURE_VLAN" then
      L7_59 = A0_52["FirewallRules.ToZoneVlanId"]
      if L7_59 == "0" then
        L7_59 = printCLIError
        L7_59("you cannot enter vlan name if to zone is not selected as SECURE_VLAN")
        L7_59 = false
        return L7_59
      end
    end
    L7_59 = db
    L7_59 = L7_59.getAttribute
    L7_59 = L7_59("vlan", "vlanName", A0_52["FirewallRules.ToZoneVlanName"], "portName")
    if L7_59 ~= "dummy" then
      printCLIError("the to zone vlan name you have entered is not correct")
      return false
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.FromZoneType"]
  elseif L7_59 == "" then
    L7_59 = printCLIError
    L7_59("Invalid from_zone")
    L7_59 = false
    return L7_59
  end
  L7_59 = A0_52["FirewallRules.ToZoneType"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.ToZoneType"]
  elseif L7_59 == "" then
    L7_59 = printCLIError
    L7_59("Invalid to_zone")
    L7_59 = false
    return L7_59
  end
  L7_59 = A0_52["FirewallRules.ToZoneType"]
  if L7_59 == A0_52["FirewallRules.FromZoneType"] then
    L7_59 = A0_52["FirewallRules.FromZoneType"]
    if L7_59 ~= "SECURE_VLAN" then
      L7_59 = A0_52["FirewallRules.FromZoneVlanId"]
      if L7_59 == "0" then
        L7_59 = A0_52["FirewallRules.ToZoneVlanId"]
        if L7_59 == "0" then
          L7_59 = printCLIError
          L7_59("from_zone and to_zone are expected to be different values")
          L7_59 = false
          return L7_59
        end
      end
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "SECURE_VLAN" then
    L7_59 = A0_52["FirewallRules.FromZoneVlanName"]
    if L7_59 ~= "" then
      L7_59 = A0_52["FirewallRules.FromZoneVlanName"]
    elseif L7_59 == nil then
      L7_59 = printCLIError
      L7_59("you have selected from zone as SECURE_VLAN so please enter from_zone_vlan")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.ToZoneType"]
  if L7_59 == "SECURE_VLAN" then
    L7_59 = A0_52["FirewallRules.ToZoneVlanName"]
    if L7_59 ~= "" then
      L7_59 = A0_52["FirewallRules.ToZoneVlanName"]
    elseif L7_59 == nil then
      L7_59 = printCLIError
      L7_59("you have selected to zone as SECURE_VLAN so please enter to_zone_vlan")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneVlanName"]
  if L7_59 == A0_52["FirewallRules.ToZoneVlanName"] then
    L7_59 = A0_52["FirewallRules.FromZoneVlanName"]
    if L7_59 ~= nil then
      L7_59 = printCLIError
      L7_59("from_zone_vlan and to_zone_vlan are expected to be different values")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.Action"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.Action"]
  elseif L7_59 == "" then
    L7_59 = printCLIError
    L7_59("Invalid action value")
    L7_59 = false
    return L7_59
  end
  L7_59 = A0_52["FirewallRules.SourceAddressType"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.SourceAddressType"]
  elseif L7_59 == "" then
    L7_59 = printCLIError
    L7_59("Invalid source_address_type")
    L7_59 = false
    return L7_59
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "SECURE" then
    L7_59 = A0_52["FirewallRules.DestinationAddressType"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SourceAddressType"]
    elseif L7_59 == "" then
      L7_59 = printCLIError
      L7_59("Invalid destination_address_type")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.SourceAddressType"]
  if L7_59 == "1" then
    L7_59 = A0_52["FirewallRules.SourceAddressStart"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SourceAddressStart"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.SourceAddressStart"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid source_address_start")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.SourceAddressStart"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.SourceAddressType"]
  if L7_59 == "2" then
    L7_59 = A0_52["FirewallRules.SourceAddressStart"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SourceAddressStart"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.SourceAddressStart"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid source_address_start")
      L7_59 = false
      return L7_59
    end
    L7_59 = A0_52["FirewallRules.SourceAddressEnd"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SourceAddressEnd"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.SourceAddressEnd"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid source_address_end")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.SourceAddressStart"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.SourceAddressEnd"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Source End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.ipv4AddressesCompare
    L7_59 = L7_59(A0_52["FirewallRules.SourceAddressStart"], A0_52["FirewallRules.SourceAddressEnd"])
    L6_58 = L7_59
    if L6_58 == 0 or L6_58 == 3 then
      L7_59 = printCLIError
      L7_59(" Source End address should be higher than or equal to Start address")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.DestinationAddressType"]
  if L7_59 == "1" then
    L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid destination_address_start")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.DestinationAddressStart"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Destination Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.DestinationAddressType"]
  if L7_59 == "2" then
    L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.DestinationAddressStart"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid destination_address_start")
      L7_59 = false
      return L7_59
    end
    L7_59 = A0_52["FirewallRules.DestinationAddressEnd"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.DestinationAddressEnd"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.DestinationAddressEnd"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid destination_address_end")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.DestinationAddressStart"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Destination Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.checkFirewallIPAddress
    L7_59 = L7_59(A0_52["FirewallRules.DestinationAddressEnd"])
    if L7_59 ~= true then
      L7_59 = printCLIError
      L7_59("Source End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L7_59 = false
      return L7_59
    end
    L7_59 = _UPVALUE6_
    L7_59 = L7_59.ipv4AddressesCompare
    L7_59 = L7_59(A0_52["FirewallRules.DestinationAddressStart"], A0_52["FirewallRules.DestinationAddressEnd"])
    L6_58 = L7_59
    if L6_58 == 0 or L6_58 == 3 then
      L7_59 = printCLIError
      L7_59(" Destination End address should be higher than or equal to Start address")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "SECURE" then
    L7_59 = A0_52["FirewallRules.ToZoneType"]
    if L7_59 == "INSECURE" then
      L7_59 = A0_52["FirewallRules.TypeOfService"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.TypeOfService"]
      elseif L7_59 == nil then
        L7_59 = printCLIError
        L7_59("Invalid qos_priority")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "SECURE" then
    L7_59 = A0_52["FirewallRules.ToZoneType"]
    if L7_59 == "INSECURE" then
      L7_59 = A0_52["FirewallRules.Action"]
      if L7_59 ~= "DROP" then
        L7_59 = A0_52["FirewallRules.SNATAddressType"]
        if L7_59 ~= nil then
          L7_59 = A0_52["FirewallRules.SNATAddressType"]
        elseif L7_59 == "" then
          L7_59 = printCLIError
          L7_59("Invalid snat_address_type")
          L7_59 = false
          return L7_59
        end
      end
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddressType"]
  if L7_59 ~= "7" then
    L7_59 = A0_52["FirewallRules.SNATAddressType"]
  elseif L7_59 == "10" then
    L7_59 = A0_52["FirewallRules.SNATInterface"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SNATInterface"]
    elseif L7_59 == "" then
      L7_59 = printCLIError
      L7_59("Invalid  wan_interface")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddressType"]
  if L7_59 == "10" then
    L7_59 = A0_52["FirewallRules.SNATInterface"]
    if L7_59 == "OTHER" then
      L7_59 = printCLIError
      L7_59("OTHER is not a valid  wan_interface")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddressType"]
  if L7_59 ~= "7" then
    L7_59 = A0_52["FirewallRules.SNATAddressType"]
  elseif L7_59 == "10" then
    L7_59 = snatInterfacesGet
    L7_59 = L7_59()
    for _FORV_13_, _FORV_14_ in pairs(L7_59) do
    end
    if true == false then
      printCLIError("Please select from available interfaces")
      return false
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddressType"]
  if L7_59 == "1" then
    L7_59 = A0_52["FirewallRules.SNATAddress"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SNATAddress"]
      if L7_59 ~= "" then
        L7_59 = A0_52["FirewallRules.SNATAddress"]
      end
    elseif L7_59 == "0.0.0.0" then
      L7_59 = printCLIError
      L7_59("Invalid snat_address")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.Action"]
  if L7_59 ~= "DROP_BY_SCHED_MATCH" then
    L7_59 = A0_52["FirewallRules.Action"]
  elseif L7_59 == "ACCEPT_BY_SCHED_MATCH" then
    L7_59 = A0_52["FirewallRules.ScheduleName"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.ScheduleName"]
    elseif L7_59 == "" then
      L7_59 = printCLIError
      L7_59("Invalid schedule")
      L7_59 = false
      return L7_59
    end
    L7_59 = string
    L7_59 = L7_59.find
    L7_59 = L7_59(A0_52["FirewallRules.ScheduleName"], "%s")
    if L7_59 ~= nil then
      L7_59 = "\""
      L7_59 = L7_59 .. A0_52["FirewallRules.ScheduleName"] .. "\""
      A0_52["FirewallRules.ScheduleName"] = L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "INSECURE" then
    L7_59 = A0_52["FirewallRules.DestinationPublicInterface"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.DestinationPublicInterface"]
    elseif L7_59 == "" then
      L7_59 = printCLIError
      L7_59("Invalid dnat_ipaddress")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
  elseif L7_59 == nil then
    L7_59 = A0_52["FirewallRules.DestinationPublicInterface"]
    if L7_59 == "OTHER" then
      L7_59 = printCLIError
      L7_59("Enter alias_DNAT_ipAddress")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.DestinationPublicInterface"]
      if L7_59 ~= "OTHER" then
        L7_59 = printCLIError
        L7_59("Select OTHER as dnat_ipaddress")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "INSECURE" then
    L7_59 = dnatInterfacesGet
    L7_59 = L7_59()
    for _FORV_13_, _FORV_14_ in pairs(L7_59) do
    end
    if true == false then
      printCLIError("Please select dnat_ipaddress from available external ip addresses")
      return false
    end
  end
  L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.DestinationPublicAddress"]
    if L7_59 ~= nil then
      L7_59 = db
      L7_59 = L7_59.existsRow
      L7_59 = L7_59("ifStaticIPAlias", "IPAddress", A0_52["FirewallRules.DestinationPublicAddress"])
      if L7_59 == false then
        L7_59 = printCLIError
        L7_59("Ip is not existing in created Ip_Aliasing")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.SNATAddress"]
  elseif L7_59 == nil then
    L7_59 = A0_52["FirewallRules.SNATAddressType"]
    if L7_59 == "10" then
      L7_59 = printCLIError
      L7_59("Enter alias_SNAT_ipAddress")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.SNATAddress"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SNATAddressType"]
      if L7_59 ~= "10" then
        L7_59 = printCLIError
        L7_59("Select OTHER as snat_address_type")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.SNATAddress"]
    if L7_59 ~= nil then
      L7_59 = db
      L7_59 = L7_59.existsRow
      L7_59 = L7_59("ifStaticIPAlias", "IPAddress", A0_52["FirewallRules.SNATAddress"])
      if L7_59 == false then
        L7_59 = printCLIError
        L7_59("Ip is not existing in created Ip_Aliasing")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.SNATAddress"]
  if L7_59 ~= "" then
    L7_59 = A0_52["FirewallRules.SNATAddress"]
    if L7_59 ~= nil then
      L7_59 = A0_52["FirewallRules.SNATInterface"]
      if L7_59 ~= db.getAttribute("ifStaticIPAlias", "IPAddress", A0_52["FirewallRules.SNATAddress"], "LogicalIfName") then
        L7_59 = printCLIError
        L7_59("Ip and wan_interface is not matching in created Ip_Aliasing")
        L7_59 = false
        return L7_59
      end
    end
  end
  L7_59 = A0_52["FirewallRules.FromZoneType"]
  if L7_59 == "INSECURE" then
    L7_59 = A0_52["FirewallRules.Action"]
    if L7_59 ~= "DROP" then
      L7_59 = A0_52["FirewallRules.DNATAddress"]
      if L7_59 ~= nil then
        L7_59 = A0_52["FirewallRules.DNATAddress"]
        if L7_59 ~= "" then
          L7_59 = A0_52["FirewallRules.DNATAddress"]
        end
      elseif L7_59 == "0.0.0.0" then
        L7_59 = printCLIError
        L7_59("Invalid internal_ip_address")
        L7_59 = false
        return L7_59
      end
      L7_59 = A0_52["FirewallRules.ToZoneType"]
      if L7_59 == "SECURE_VLAN" then
        L7_59 = db
        L7_59 = L7_59.getAttribute
        L7_59 = L7_59("vlan", "vlanName", A0_52["FirewallRules.ToZoneVlanName"], "vlanId")
        if dnatValidation(A0_52["FirewallRules.DNATAddress"], L7_59) == false then
          printCLIError("DNAT Ip Address should be in network of selected VLAN")
          return false
        end
      end
      L7_59 = A0_52["FirewallRules.ToZoneType"]
      if L7_59 == "PUBLIC" then
        L7_59 = dnatValidation
        L7_59 = L7_59(A0_52["FirewallRules.DNATAddress"], A0_52["FirewallRules.ToZoneType"])
        if L7_59 == false then
          printCLIError("DNAT Ip Address should be in network of selected DMZ")
          return false
        end
      end
    end
  end
  L7_59 = A0_52["FirewallRules.LogLevel"]
  if L7_59 ~= nil then
    L7_59 = A0_52["FirewallRules.LogLevel"]
  elseif L7_59 == "" then
    L7_59 = printCLIError
    L7_59("Inavlid log value")
    L7_59 = false
    return L7_59
  end
  L7_59 = tonumber
  L7_59 = L7_59(A0_52["FirewallRules.DNATPortEnable"])
  if L7_59 == 1 then
    L7_59 = tonumber
    L7_59 = L7_59(A0_52["FirewallRules.DNATPort"])
    if L7_59 ~= nil then
      L7_59 = tonumber
      L7_59 = L7_59(A0_52["FirewallRules.DNATPort"])
    elseif L7_59 == 0 then
      L7_59 = printCLIError
      L7_59("Please Configure DNAT Port value")
      L7_59 = false
      return L7_59
    end
  end
  L7_59 = true
  return L7_59
end
function ruleReorderInit(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65, L6_66, L7_67
  L1_61 = {}
  L2_62 = {}
  L3_63 = 0
  L4_64 = A0_60[1]
  L1_61["RuleToMove.rowIds"] = L4_64
  L4_64 = util
  L4_64 = L4_64.split
  L5_65 = A0_60[1]
  L6_66 = ","
  L4_64 = L4_64(L5_65, L6_66)
  L2_62 = L4_64
  L4_64 = db
  L4_64 = L4_64.getAttribute
  L5_65 = "FirewallRules"
  L6_66 = "_ROWID_"
  L7_67 = L2_62[1]
  L4_64 = L4_64(L5_65, L6_66, L7_67, "PriorityId")
  L3_63 = L4_64 or ""
  if L3_63 == nil or L3_63 == "" then
    L4_64 = printCLIError
    L5_65 = "Invalid rowid"
    L4_64(L5_65)
    L4_64 = -1
    L5_65 = nil
    return L4_64, L5_65
  end
  L4_64 = nil
  L5_65 = db
  L5_65 = L5_65.getRow
  L6_66 = "fwPriorityMap"
  L7_67 = "RuleType"
  L5_65 = L5_65(L6_66, L7_67, "ALL")
  if L5_65 ~= nil then
    L6_66 = L5_65["fwPriorityMap.PriorityStr"]
    L4_64 = L6_66 or ""
  end
  if L4_64 == nil or L4_64 == "" then
    L6_66 = -1
    L7_67 = nil
    return L6_66, L7_67
  end
  L6_66 = util
  L6_66 = L6_66.split
  L7_67 = L4_64
  L6_66 = L6_66(L7_67, ",")
  L7_67 = 0
  if L6_66 ~= false then
    for _FORV_11_, _FORV_12_ in pairs(L6_66) do
      L7_67 = L7_67 + 1
      if _FORV_12_ == L3_63 then
        L1_61["RuleToMove.pos"] = L7_67
        break
      end
    end
  end
  print("curPos", L7_67)
  return -1, L1_61
end
function ruleReorderSave(A0_68)
  local L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76
  L1_69 = "Error"
  L2_70 = ""
  L3_71 = {}
  L3_71 = L4_72
  for L7_75, L8_76 in L4_72(L5_73) do
    print("k", L7_75)
    print("v", L8_76)
  end
  L2_70 = L5_73
  L1_69 = L4_72
  if L1_69 == "OK" then
    L4_72()
  end
  return L4_72, L5_73
end
function ruleReorderInVal(A0_77)
  local L1_78, L2_79, L3_80, L4_81, L5_82, L6_83
  L1_78 = {}
  L1_78 = L2_79
  for L5_82, L6_83 in L2_79(L3_80) do
    rowValid = db.existsRow("FirewallRules", "ROWID", L6_83)
    if rowValid == false then
      printCLIError(L6_83, " is not a valid ROWID")
      return false
    end
  end
  return L2_79
end
function FirewalALGsInit(A0_84)
  configRow = db.getRow("AlgConf", "_ROWID_", "1")
  if configRow == nil then
    configRow = {}
  end
  return -1, configRow
end
function FirewalALGsSave(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = "ERROR"
  L2_87 = ""
  L3_88 = ""
  DBTable = "AlgConf"
  if A0_85 ~= {} then
    L1_86, L2_87 = algs.alg_config(A0_85, "1", "edit")
  end
  if L1_86 == "OK" then
    db.save()
  end
  L3_88 = db.getAttribute("stringsMap", "stringId", L2_87, LANGUAGE)
  return L1_86, L3_88
end
function FirewalALGsInputVal(A0_89)
  local L1_90
end
function FirewalALGsGet(A0_91)
  local L1_92
  L1_92 = {}
  printLabel("ALGs")
  if db.getRow("AlgConf", "_ROWID_", "1") ~= nil then
    if db.getRow("AlgConf", "_ROWID_", "1")["AlgConf.Rtsp"] == "1" then
      resTab.insertField(L1_92, "Rtsp", "Enabled")
    else
      resTab.insertField(L1_92, "Rtsp", "Disabled")
    end
    if db.getRow("AlgConf", "_ROWID_", "1")["AlgConf.Sip"] == "1" then
      resTab.insertField(L1_92, "Sip", "Enabled")
    else
      resTab.insertField(L1_92, "Sip", "Disabled")
    end
    if db.getRow("AlgConf", "_ROWID_", "1")["AlgConf.H323"] == "1" then
      resTab.insertField(L1_92, "H323", "Enabled")
    else
      resTab.insertField(L1_92, "H323", "Disabled")
    end
    if db.getRow("AlgConf", "_ROWID_", "1")["AlgConf.Tftp"] == "1" then
      resTab.insertField(L1_92, "Tftp", "Enabled")
    else
      resTab.insertField(L1_92, "Tftp", "Disabled")
    end
    resTab.print(L1_92, 0)
  end
end
function dnatValidation(A0_93, A1_94)
  local L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102
  if A1_94 == "PUBLIC" then
    L2_95 = "logicalIfName = 'DMZ'"
  else
    L3_96 = "logicalIfName = 'LAN"
    L2_95 = L3_96 .. L4_97 .. L5_98
  end
  L3_96 = db
  L3_96 = L3_96.getRowsWhere
  L3_96 = L3_96(L4_97, L5_98)
  for L7_100, L8_101 in L4_97(L5_98) do
    L9_102 = L8_101["dhcp.startAddress"]
    if tonumber(util.split(L9_102, ".")[3]) == tonumber(util.split(A0_93, ".")[3]) and tonumber(util.split(A0_93, ".")[4]) >= 0 and tonumber(util.split(A0_93, ".")[4]) <= 255 then
      return true
    end
  end
  return L4_97
end
