local L0_0
L0_0 = require
L0_0("teamf1lualib/vlan")
L0_0 = require
L0_0("teamf1lualib/captivePortal")
L0_0 = require
L0_0("teamf1lualib/vlanConfig")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/sharePort")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/authentication_radius")
L0_0 = require
L0_0("teamf1lualib/accounting_core")
L0_0 = require
L0_0("teamf1lualib/vlan_vlan")
L0_0 = require
L0_0("teamf1lualib/ipv6_dhcpv6ServerVlan")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.authentication.radius")
accessType = {}
accessType.free = "0"
accessType.SLA = "1"
accessType.permanent = "2"
accessType.temporary = "3"
authMode = {}
authMode.localUser = "0"
authMode.radiusServer = "1"
authMode.LDAPServer = "2"
authMode.POP3 = "3"
authType = {}
authType.PAP = "1"
authType.CHAP = "2"
authType.MSCHAP = "3"
authType.MSCHAPv2 = "4"
authServerId = {}
authServerId.localDatabaseUser = "0"
authServerId.radiusPAP = "11"
authServerId.radiusCHAP = "12"
authServerId.radiusMSCHAP = "13"
authServerId.radiusMSCHAPv2 = "14"
authServerId.LDAP = "20"
authServerId.POP3 = "50"
authServerId.activeDirectory = "30"
authServerId.NTdomain = "40"
if MODEL_ID == "DSR-1000AC" or MODEL_ID == "DSR-500AC" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
  LAN_INTF_PHY_NAME = "agl0"
else
  LAN_INTF_PHY_NAME = "eth0"
end
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" then
else
end
function vlanCfgInit(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = tonumber
  L2_3 = A0_1[1]
  L1_2 = L1_2(L2_3)
  L2_3 = -1
  L3_4 = db
  L3_4 = L3_4.getRow
  L3_4 = L3_4("vlan", "vlanId", L1_2)
  if L3_4 == nil then
    if A0_1[2] == "edit" then
      printCLIError("No Row exist with this Vlan ID")
      return -1, {}
    else
      L3_4 = {}
      L3_4["vlan.vlanId"] = L1_2
      L3_4["vlan.portName"] = "dummy"
      L3_4["vlan._ROWID_"] = "-1"
      L3_4.add = "1"
    end
  elseif A0_1[2] == "edit" then
    L2_3 = L3_4["vlan._ROWID_"]
    L3_4.edit = "1"
  else
    L3_4.add = "1"
  end
  return L2_3, L3_4
end
function vlanCfgSave(A0_5)
  local L1_6, L2_7
  L1_6 = "OK"
  L2_7 = ""
  if A0_5["vlan._ROWID_"] == "-1" then
    inputTable_all = {}
    inputTable_all["vlan.vlanId"] = tonumber(A0_5["vlan.vlanId"])
    inputTable_all["vlan.vlanName"] = A0_5["vlan.vlanName"]
    inputTable_all["vlan.portName"] = "dummy"
    inputTable_all["interVLANRouting.status"] = A0_5["interVLANRouting.status"]
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" then
      inputTable_all["interVLANRouting.accessType"] = A0_5["interVLANRouting.accessType"]
      inputTable_all["CaptivePortalVLAN.vlanId"] = tonumber(A0_5["vlan.vlanId"])
      inputTable_all["CaptivePortalVLAN.vlanName"] = A0_5["vlan.vlanName"]
      if A0_5["interVLANRouting.accessType"] == "2" or A0_5["interVLANRouting.accessType"] == "3" then
        if A0_5["interVLANRouting.accessType"] == "2" then
          if A0_5["CaptivePortalVLAN.authType"] then
            inputTable_all["CaptivePortalVLAN.authServerId"] = A0_5["CaptivePortalVLAN.authMode"] * 10 + A0_5["CaptivePortalVLAN.authType"]
          elseif A0_5["CaptivePortalVLAN.authMode"] then
            inputTable_all["CaptivePortalVLAN.authServerId"] = A0_5["CaptivePortalVLAN.authMode"] * 10
          end
        end
        inputTable_all["CaptivePortalVLAN.profileId"] = A0_5["CaptivePortalVLAN.profileId"]
        inputTable_all["CaptivePortalVLAN.redirectType"] = A0_5["CaptivePortalVLAN.redirectType"]
      end
    end
    if A0_5["interVLANRouting.accessType"] == nil then
      inputTable_all["interVLANRouting.accessType"] = "0"
    end
    inputTable_all.insertRpt = "0"
    L1_6, L2_7 = vlanConfig.vlanConfig(inputTable_all, "-1", "add")
    inputTable_all = {}
    inputTable_all["vlan.vlanId"] = tonumber(A0_5["vlan.vlanId"])
    inputTable_all["vlan.vlanName"] = ""
    inputTable_all["vlan.portName"] = "port10"
    inputTable_all["interVLANRouting.status"] = A0_5["interVLANRouting.status"]
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" then
      inputTable_all["interVLANRouting.accessType"] = A0_5["interVLANRouting.accessType"]
    end
    inputTable_all.insertRpt = "1"
    L1_6, L2_7 = vlanConfig.vlanConfig(inputTable_all, "-1", "add")
    if L1_6 == "OK" or L1_6 == 0 then
      inputTab1 = {}
      inputTab1["SharePortVlan.vlanId"] = tonumber(A0_5["vlan.vlanId"])
      inputTab1["SharePortVlan.vlanName"] = A0_5["vlan.vlanName"]
      err, stat = sharePort.vlanConfig(inputTab1, "add")
    end
  else
    DBTable = ""
    if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" then
      if A0_5["interVLANRouting.accessType"] == "2" or A0_5["interVLANRouting.accessType"] == "3" then
        if A0_5["interVLANRouting.accessType"] == "2" then
          if A0_5["CaptivePortalVLAN.authType"] then
            A0_5["CaptivePortalVLAN.authServerId"] = A0_5["CaptivePortalVLAN.authMode"] * 10 + A0_5["CaptivePortalVLAN.authType"]
          elseif A0_5["CaptivePortalVLAN.authMode"] then
            A0_5["CaptivePortalVLAN.authServerId"] = A0_5["CaptivePortalVLAN.authMode"] * 10
          end
        end
        A0_5["CaptivePortalVLAN.profileId"] = A0_5["CaptivePortalVLAN.profileId"]
        A0_5["CaptivePortalVLAN.redirectType"] = A0_5["CaptivePortalVLAN.redirectType"]
      elseif A0_5["interVLANRouting.accessType"] == "1" then
        A0_5["CaptivePortalVLAN.authServerId"] = NULL
        A0_5["CaptivePortalVLAN.profileId"] = NULL
        A0_5["CaptivePortalVLAN.redirectType"] = "2"
      end
    end
    L1_6, L2_7 = vlanConfig.vlanConfig(A0_5, A0_5["vlan._ROWID_"], "edit")
  end
  if L1_6 == "OK" then
    db.save()
    db.commitTransaction(true)
  end
  return L1_6, db.getAttribute("stringsMap", "stringId", L2_7, LANGUAGE) or "" or ""
end
function vlanCfgInputVal(A0_8)
  local L1_9
  if A0_8["vlan.vlanId"] == nil then
    printCLIError("Vlan Id is not Valid")
    return false
  end
  if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" then
    if tonumber(A0_8["vlan.vlanId"]) == 4093 then
      printCLIError("Configured VLANID is reserved when LAN port 8 is set as DMZ\n")
      return false
    end
  elseif (UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150") and (tonumber(A0_8["vlan.vlanId"]) == 13 or tonumber(A0_8["vlan.vlanId"]) == 4093) then
    printCLIError("Configured VLANID is reserved when LAN port 8 is set as DMZ\n")
    return false
  end
  if db.getRow("VlanStatus", "_ROWID_", "1")["VlanStatus.VlanState"] == "0" then
    printCLIError("Please enable vlan to configure available vlans")
    return false
  end
  if A0_8.add == "1" and #db.getRows("vlan", "portName", "dummy") >= _UPVALUE0_ then
    printCLIError("Maximum limit for VLANs reached.")
    return false
  end
  if A0_8.add == "1" and A0_8["vlan.vlanId"] ~= nil then
    if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
      L1_9 = "vlanId = '" .. A0_8["vlan.vlanId"] .. "'"
    else
      L1_9 = "vlanId = '" .. A0_8["vlan.vlanId"] .. "' AND portName = 'dummy'"
    end
    if db.getAttributeWhere("vlan", L1_9, "_ROWID_") ~= nil then
      printCLIError("Vlan ID already exists")
      return false
    end
  end
  if A0_8["vlan.vlanName"] == nil and A0_8.add == "1" then
    print("Please enter vlan Name")
    return false
  end
  if string.find(A0_8["vlan.vlanName"], "%s") or string.find(A0_8["vlan.vlanName"], "%'") then
    print("Empty space and single quotes are not supported for this field.")
    return false
  end
  if A0_8.add == "1" and A0_8["vlan.vlanName"] ~= nil and db.getAttribute("vlan", "vlanName", A0_8["vlan.vlanName"], "_ROWID_") ~= nil then
    print("VLAN name already in use.")
    return false
  end
  if A0_8.edit == "1" and A0_8["vlan.vlanName"] ~= nil and db.getAttribute("vlan", "vlanName", A0_8["vlan.vlanName"], "_ROWID_") == nil then
    print("VLAN name change is not allowed in edit")
    return false
  end
  if (db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N") and A0_8["interVLANRouting.accessType"] == nil and A0_8.add == "1" then
    print("Please configure captive-portal-enable value.")
    return false
  end
  if A0_8["interVLANRouting.status"] == nil and A0_8.add == "1" then
    print("Please enter inter-vlan Routing status for Vlan")
    return false
  end
  if db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000N" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-1000AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500AC" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500" or db.getAttribute("unitInfo", "_ROWID_", "1", "modelId") == "DSR-500N" then
    if A0_8["interVLANRouting.accessType"] == accessType.permanent then
      if A0_8["CaptivePortalVLAN.profileId"] == nil then
        print("Please enter Captive Portal ProfileId")
        return false
      end
      if captivePortal.getCPprofileIdRow(A0_8["CaptivePortalVLAN.profileId"]) == nil then
        print("Given Captive Profile Id doesn't exists,give a valid CP-profile Id,use showCP-profiles command to get the list of CP Profiles")
        return false
      end
    end
    if A0_8["interVLANRouting.accessType"] == accessType.permanent and A0_8["CaptivePortalVLAN.authMode"] == nil then
      print("Please enter Authentication Mode for authenticating user")
      return false
    end
    if A0_8["interVLANRouting.accessType"] == accessType.permanent and A0_8["CaptivePortalVLAN.authMode"] == authMode.radiusServer and A0_8["CaptivePortalVLAN.authType"] == nil then
      print("Please enter Authentication type for Radius Server")
      return false
    end
    if (A0_8["interVLANRouting.accessType"] == accessType.SLA or A0_8["interVLANRouting.accessType"] == accessType.free) and A0_8["CaptivePortalVLAN.profileId"] ~= nil then
      print("Incorrect Access Type,only permanent or temperory users can have CP Profile settings.")
      return false
    end
    if A0_8["interVLANRouting.accessType"] ~= accessType.permanent and (A0_8["CaptivePortalVLAN.authMode"] ~= nil or A0_8["CaptivePortalVLAN.authType"] ~= nil) then
      print("Incorrect Access Type,Please enable captive portal to configure authentication mode or authentication type settings.")
      return false
    end
    if A0_8["CaptivePortalVLAN.authType"] ~= nil and A0_8["CaptivePortalVLAN.authMode"] ~= authMode.radiusServer then
      print("Incorrect settings,authentication type is supported in Radius mode only")
      return false
    end
    if A0_8["interVLANRouting.accessType"] == accessType.permanent and A0_8["CaptivePortalVLAN.redirectType"] == nil then
      print("Please enter Redirect-Type for captive-portal user.")
      return false
    end
  end
  return true
end
function portVlanInit(A0_10)
  local L1_11, L2_12
  L1_11 = A0_10[1]
  L2_12 = {}
  if A0_10[2] == "edit" then
    if db.getAttribute("VlanPortMgmt", "PortName", L1_11, "_ROWID_") == nil then
      printCLIError("No Row exist with this Vlan Name ")
      return -1, {}
    else
      L2_12["VlanPortMgmt._ROWID_"], L2_12 = db.getAttribute("VlanPortMgmt", "PortName", L1_11, "_ROWID_"), db.getRow("VlanPortMgmt", "PortName", L1_11)
      L2_12.edit = "1"
    end
  end
  if L2_12["VlanPortMgmt.PortType"] == "VAP-DISABLED" then
    printCLIError("Please enable the SSID in order to configure")
    return -1, {}
  end
  return 1, L2_12
end
function portVlanSave(A0_13)
  local L1_14, L2_15, L3_16, L4_17
  L2_15 = ""
  L3_16 = nil
  L4_17 = "VlanPortMgmt"
  DBTable = L4_17
  L4_17 = db
  L4_17 = L4_17.getRow
  L4_17 = L4_17("VlanPortMgmt", "_ROWID_", A0_13["VlanPortMgmt._ROWID_"])
  rowId = A0_13["VlanPortMgmt._ROWID_"]
  L4_17["VlanPortMgmt.DefaultPVID"] = A0_13["VlanPortMgmt.DefaultPVID"]
  L4_17["VlanPortMgmt.PortVlanMode"] = A0_13["VlanPortMgmt.PortVlanMode"]
  if A0_13["VlanPortMgmt.PortVlanMode"] == "2" then
    L4_17["VlanPortMgmt.DefaultPVID"] = "1"
  end
  L1_14, L2_15 = vlanConfig.portVlanEditCheck(rowId)
  if L1_14 == "OK" then
    db.save()
    L1_14, L2_15 = vlanConfig.vlanConfig(L4_17, rowId, "edit")
    if L1_14 == "OK" then
      db.save()
    end
  end
  L3_16 = db.getAttribute("stringsMap", "stringId", L2_15, LANGUAGE) or L2_15
  return L1_14, L3_16
end
function portVlanInputVal(A0_18)
  local L1_19, L2_20
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L2_20 = "igmpSnooping"
  L1_19 = L1_19(L2_20, "_ROWID_", "1", "status")
  L2_20 = A0_18["VlanPortMgmt._ROWID_"]
  if L2_20 == nil then
    print("No Row exist with this port Name.THe Given SSID Name is invalid for Not Enabled")
    return false
  end
  if L1_19 == "1" and tonumber(L2_20) < 9 then
    printCLIError("Please disable IGMP Snopping to configure Port VLAN Settings")
    return false
  end
  if A0_18["VlanPortMgmt.PortType"] == "VAP-DISABLED" then
    print("Please Enable  the SSID in order to configure")
    return false
  end
  if A0_18["VlanPortMgmt.PortVlanMode"] == nil and A0_18["VlanPortMgmt.DefaultPVID"] == nil then
    print("Enter Mode or PVID for Vlan Port")
    return false
  end
  if A0_18["VlanPortMgmt.DefaultPVID"] ~= nil then
    if tonumber(A0_18["VlanPortMgmt.DefaultPVID"]) < 1 or tonumber(A0_18["VlanPortMgmt.DefaultPVID"]) > 4094 then
      print("Invalid range for PVID")
      return false
    end
    if A0_18["VlanPortMgmt.PortVlanMode"] ~= "2" and db.getRow("vlan", "vlanId", A0_18["VlanPortMgmt.DefaultPVID"]) == nil then
      print("Entered VLAN Id does not exists")
      return false
    end
  end
  if (MODEL_ID == "DSR-150N" or MODEL_ID == "DSR-150" or MODEL_ID == "DSR-250N" or MODEL_ID == "DSR-250") and A0_18["VlanPortMgmt.PortName"] == "OptionalPort" then
    returnCode, cookie, configPortUsage = _UPVALUE0_.configPortUsageGet()
    if configPortUsage == "DMZ" then
      print("Configuration cannot be saved as DMZ is enabled on Port8/OptionalPort.")
      return false
    end
  end
  return true
end
function vlanMembershipInit(A0_21)
  local L1_22, L2_23, L3_24
  L1_22 = A0_21[1]
  L2_23 = {}
  L3_24 = db
  L3_24 = L3_24.getAttribute
  L3_24 = L3_24("VlanPortMgmt", "PortName", L1_22, "_ROWID_")
  if L3_24 == nil then
    printCLIError("No Row exist with this port Name ")
    return -1, {}
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L2_23["VlanPortMgmt.PortName"] = L1_22
    L2_23["VlanPortMgmt.PortLogicalName"] = db.getAttribute("VlanPortMgmt", "PortName", L1_22, "PortLogicalName")
  else
    if db.getAttribute("VlanPortMgmt", "PortName", L1_22, "PortType") == "VAP-DISABLED" then
      printCLIError("Please enable the SSID in order to configure")
      return -1, {}
    end
    L2_23["VlanPortMgmt.PortName"] = L1_22
  end
  return L3_24, L2_23
end
function vlanMembershipInputVal(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L2_27 = "igmpSnooping"
  L1_26 = L1_26(L2_27, L3_28, L4_29, L5_30)
  L2_27 = ""
  if L3_28 == nil then
    L3_28(L4_29)
    return L3_28
  end
  if L3_28 ~= "DSR-150N" then
  elseif L3_28 == "DSR-250" then
    if L3_28 == "OptionalPort" then
      configPortUsage = L5_30
      cookie = L4_29
      returnCode = L3_28
      if L3_28 == "DMZ" then
        L3_28(L4_29)
        return L3_28
      end
    end
  end
  if L3_28 == nil then
    if L3_28 == nil then
      L3_28(L4_29)
      return L3_28
    end
  end
  if L3_28 ~= nil then
    L2_27 = A0_25["vlan.vlanIds1"]
  else
    L2_27 = A0_25["vlan.vlanIds2"]
  end
  for L6_31 in L3_28(L4_29, L5_30) do
    A0_25["vlan.new_vlanId_" .. L6_31] = L6_31
    check = db.getRow("vlan", "vlanId", L6_31)
    if check == nil then
      print("VLAN Id " .. L6_31 .. " does not exists")
      return false
    end
  end
  L6_31 = A0_25["VlanPortMgmt.PortName"]
  if L3_28 == "0" then
    L4_29(L5_30)
    return L4_29
  end
  L6_31 = "PortName"
  if L1_26 == "1" then
    L6_31 = L4_29
    if L5_30 < 9 then
      L6_31 = "Please disable IGMP Snopping to configure VLAN Membership"
      L5_30(L6_31)
      return L5_30
    end
  end
  return L5_30
end
function vlanMembershipSave(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42, L11_43, L12_44, L13_45, L14_46, L15_47, L16_48
  L2_34 = ""
  L3_35 = nil
  L4_36 = ""
  L5_37 = A0_32["vlan.vlanIds1"]
  if L5_37 == nil then
    L4_36 = A0_32["vlan.vlanIds2"]
    A0_32.add = 0
  else
    L4_36 = A0_32["vlan.vlanIds1"]
    A0_32.add = 1
  end
  L5_37 = db
  L5_37 = L5_37.getTable
  L6_38 = "vlan"
  L5_37 = L5_37(L6_38)
  L6_38 = db
  L6_38 = L6_38.getAttribute
  L7_39 = "VlanPortMgmt"
  L8_40 = "PortName"
  L9_41 = A0_32["VlanPortMgmt.PortName"]
  L10_42 = "PortLogicalName"
  L6_38 = L6_38(L7_39, L8_40, L9_41, L10_42)
  A0_32["VlanPortMgmt.PortLogicalName"] = L6_38
  L7_39 = 0
  L8_40 = ","
  L9_41 = 0
  L10_42 = ""
  L11_43 = ","
  for L15_47, L16_48 in L12_44(L13_45) do
    L7_39 = L7_39 + 1
    if L5_37[L7_39]["vlan.portName"] == A0_32["VlanPortMgmt.PortLogicalName"] then
      L11_43 = L5_37[L7_39]["vlan.vlanId"]
    end
    if L11_43 ~= nil then
      L8_40 = L8_40 .. L11_43 .. ","
    end
    L11_43 = ","
  end
  if L12_44 == 1 then
    L10_42 = L12_44 .. L13_45
  else
    for L15_47 in L12_44(L13_45, L14_46) do
      L9_41 = 0
      for _FORV_19_ in L16_48(L4_36, "%d+") do
        if L15_47 == _FORV_19_ then
          L9_41 = 1
        end
      end
      if L9_41 == 0 then
        L10_42 = L16_48 .. L15_47 .. ","
      end
    end
  end
  DBTable = L12_44
  rowId = L12_44
  A0_32[L12_44] = L13_45
  L2_34 = L14_46
  L1_33 = L13_45
  if L1_33 == "OK" then
    L13_45()
    for L16_48 in L13_45(L14_46, L15_47) do
      L12_44["vlan.new_vlanId_" .. L16_48] = L16_48
    end
    L12_44["VlanPortMgmt.DefaultPVID"] = L13_45
    L12_44["VlanPortMgmt.PortVlanMode"] = L13_45
    L12_44[L13_45] = L14_46
    L2_34 = L14_46
    L1_33 = L13_45
    if L1_33 == "OK" then
      L13_45()
    end
  end
  L3_35 = L13_45 or L2_34
  return L13_45, L14_46
end
function portWVlanInit(A0_49)
  local L1_50, L2_51, L3_52
  L1_50 = A0_49[1]
  L2_51 = {}
  L3_52 = db
  L3_52 = L3_52.existsRow
  L3_52 = L3_52("VlanPortMgmt", "PortNumber", tonumber(L1_50))
  if L3_52 == false then
    printCLIError("No port number exist with this Vlan Name ")
    return -1, {}
  else
    L2_51 = db.getRow("VlanPortMgmt", "PortNumber", L1_50)
    L2_51["VlanPortMgmt.PortNumber"] = tonumber(L1_50)
    L2_51.edit = "1"
  end
  if L2_51["VlanPortMgmt.PortType"] == "VAP-DISABLED" then
    printCLIError("Please enable the SSID in order to configure")
    return -1, {}
  end
  return 1, L2_51
end
function portWVlanSave(A0_53)
  local L1_54, L2_55, L3_56, L4_57
  L2_55 = ""
  L3_56 = nil
  L4_57 = "VlanPortMgmt"
  DBTable = L4_57
  L4_57 = db
  L4_57 = L4_57.getRow
  L4_57 = L4_57("VlanPortMgmt", "PortNumber", A0_53["VlanPortMgmt.PortNumber"])
  rowId = A0_53["VlanPortMgmt.PortNumber"]
  L4_57["VlanPortMgmt.DefaultPVID"] = A0_53["VlanPortMgmt.DefaultPVID"]
  L4_57["VlanPortMgmt.PortVlanMode"] = A0_53["VlanPortMgmt.PortVlanMode"]
  if A0_53["VlanPortMgmt.PortVlanMode"] == "2" then
    L4_57["VlanPortMgmt.DefaultPVID"] = "1"
  end
  L1_54, L2_55 = vlanConfig.portVlanEditCheck(rowId)
  if L1_54 == "OK" then
    db.save()
    L1_54, L2_55 = vlanConfig.vlanConfig(L4_57, rowId, "edit")
    if L1_54 == "OK" then
      db.save()
    end
  end
  L3_56 = db.getAttribute("stringsMap", "stringId", L2_55, LANGUAGE) or L2_55
  return L1_54, L3_56
end
function portWVlanInputVal(A0_58)
  local L1_59, L2_60
  L1_59 = db
  L1_59 = L1_59.getAttribute
  L2_60 = "VlanPortMgmt"
  L1_59 = L1_59(L2_60, "PortNumber", A0_58["VlanPortMgmt.PortNumber"], "PortName")
  A0_58["VlanPortMgmt.PortName"] = L1_59
  L2_60 = A0_58["VlanPortMgmt.PortNumber"]
  if L2_60 == nil then
    print("No SSID exist with this port Name.")
    return false
  end
  if tonumber(L2_60) < 10 then
    print("Please gave valid port number to edit w-vlan")
    return false
  end
  if A0_58["VlanPortMgmt.PortType"] == "VAP-DISABLED" then
    print("Please Enable  the SSID in order to configure")
    return false
  end
  if A0_58["VlanPortMgmt.PortVlanMode"] == nil and A0_58["VlanPortMgmt.DefaultPVID"] == nil then
    print("Enter Mode or PVID for Vlan Port")
    return false
  end
  if A0_58["VlanPortMgmt.DefaultPVID"] ~= nil then
    if tonumber(A0_58["VlanPortMgmt.DefaultPVID"]) < 1 or tonumber(A0_58["VlanPortMgmt.DefaultPVID"]) > 4094 then
      print("Invalid range for PVID")
      return false
    end
    if A0_58["VlanPortMgmt.PortVlanMode"] ~= "2" and db.getRow("vlan", "vlanId", A0_58["VlanPortMgmt.DefaultPVID"]) == nil then
      print("Entered VLAN Id does not exists")
      return false
    end
  end
  if (MODEL_ID == "DSR-150N" or MODEL_ID == "DSR-150" or MODEL_ID == "DSR-250N" or MODEL_ID == "DSR-250") and A0_58["VlanPortMgmt.PortName"] == "OptionalPort" then
    returnCode, cookie, configPortUsage = _UPVALUE0_.configPortUsageGet()
    if configPortUsage == "DMZ" then
      print("Configuration cannot be saved as DMZ is enabled on Port8/OptionalPort.")
      return false
    end
  end
  return true
end
function wvlanMembershipInit(A0_61)
  local L1_62, L2_63, L3_64
  L1_62 = A0_61[1]
  L2_63 = {}
  L3_64 = db
  L3_64 = L3_64.existsRow
  L3_64 = L3_64("VlanPortMgmt", "PortNumber", tonumber(L1_62))
  if L3_64 == false then
    printCLIError("No ssid exist with this port number")
    return -1, {}
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L2_63["VlanPortMgmt.PortName"], L2_63["VlanPortMgmt.PortNumber"] = db.getAttribute("VlanPortMgmt", "PortNumber", L1_62, "PortName"), tonumber(L1_62)
    L2_63["VlanPortMgmt.PortLogicalName"] = db.getAttribute("VlanPortMgmt", "PortNumber", L1_62, "PortLogicalName")
    if db.getAttribute("VlanPortMgmt", "PortNumber", L1_62, "PortType") == "VAP-DISABLED" then
      printCLIError("Please enable the SSID in order to configure")
      return -1, {}
    end
  else
    if db.getAttribute("VlanPortMgmt", "PortNumber", L1_62, "PortType") == "VAP-DISABLED" then
      printCLIError("Please enable the SSID in order to configure")
      return -1, {}
    end
    L2_63["VlanPortMgmt.PortName"], L2_63["VlanPortMgmt.PortNumber"] = db.getAttribute("VlanPortMgmt", "PortNumber", L1_62, "PortName"), tonumber(L1_62)
  end
  return L3_64, L2_63
end
function wvlanMembershipInputVal(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70
  L1_66 = ""
  if L2_67 == nil then
    L2_67(L3_68)
    return L2_67
  end
  if L2_67 < 10 then
    L2_67(L3_68)
    return L2_67
  end
  if L2_67 ~= "DSR-150N" then
  elseif L2_67 == "DSR-250" then
    if L2_67 == "OptionalPort" then
      configPortUsage = L4_69
      cookie = L3_68
      returnCode = L2_67
      if L2_67 == "DMZ" then
        L2_67(L3_68)
        return L2_67
      end
    end
  end
  if L2_67 == nil then
    if L2_67 == nil then
      L2_67(L3_68)
      return L2_67
    end
  end
  if L2_67 ~= nil then
    L1_66 = A0_65["vlan.vlanIds1"]
  else
    L1_66 = A0_65["vlan.vlanIds2"]
  end
  for L5_70 in L2_67(L3_68, L4_69) do
    A0_65["vlan.new_vlanId_" .. L5_70] = L5_70
    check = db.getRow("vlan", "vlanId", L5_70)
    if check == nil then
      print("VLAN Id " .. L5_70 .. " does not exists")
      return false
    end
  end
  L5_70 = A0_65["VlanPortMgmt.PortNumber"]
  if L2_67 == "0" then
    L3_68(L4_69)
    return L3_68
  end
  return L4_69
end
function wvlanMembershipSave(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84, L14_85, L15_86, L16_87
  L2_73 = ""
  L3_74 = nil
  L4_75 = ""
  L5_76 = A0_71["vlan.vlanIds1"]
  if L5_76 == nil then
    L4_75 = A0_71["vlan.vlanIds2"]
    A0_71.add = 0
  else
    L4_75 = A0_71["vlan.vlanIds1"]
    A0_71.add = 1
  end
  L5_76 = db
  L5_76 = L5_76.getTable
  L6_77 = "vlan"
  L5_76 = L5_76(L6_77)
  L6_77 = db
  L6_77 = L6_77.getAttribute
  L7_78 = "VlanPortMgmt"
  L8_79 = "PortNumber"
  L9_80 = A0_71["VlanPortMgmt.PortNumber"]
  L10_81 = "PortLogicalName"
  L6_77 = L6_77(L7_78, L8_79, L9_80, L10_81)
  A0_71["VlanPortMgmt.PortLogicalName"] = L6_77
  L7_78 = 0
  L8_79 = ","
  L9_80 = 0
  L10_81 = ""
  L11_82 = ","
  for L15_86, L16_87 in L12_83(L13_84) do
    L7_78 = L7_78 + 1
    if L5_76[L7_78]["vlan.portName"] == A0_71["VlanPortMgmt.PortLogicalName"] then
      L11_82 = L5_76[L7_78]["vlan.vlanId"]
    end
    if L11_82 ~= nil then
      L8_79 = L8_79 .. L11_82 .. ","
    end
    L11_82 = ","
  end
  if L12_83 == 1 then
    L10_81 = L12_83 .. L13_84
  else
    for L15_86 in L12_83(L13_84, L14_85) do
      L9_80 = 0
      for _FORV_19_ in L16_87(L4_75, "%d+") do
        if L15_86 == _FORV_19_ then
          L9_80 = 1
        end
      end
      if L9_80 == 0 then
        L10_81 = L16_87 .. L15_86 .. ","
      end
    end
  end
  DBTable = L12_83
  rowId = L12_83
  A0_71[L12_83] = L13_84
  L2_73 = L14_85
  L1_72 = L13_84
  if L1_72 == "OK" then
    L13_84()
    for L16_87 in L13_84(L14_85, L15_86) do
      L12_83["vlan.new_vlanId_" .. L16_87] = L16_87
    end
    L12_83["VlanPortMgmt.DefaultPVID"] = L13_84
    L12_83["VlanPortMgmt.PortVlanMode"] = L13_84
    L12_83[L13_84] = L14_85
    L2_73 = L14_85
    L1_72 = L13_84
    if L1_72 == "OK" then
      L13_84()
    end
  end
  L3_74 = L13_84 or L2_73
  return L13_84, L14_85
end
function vlanIPv6CfgInit(A0_88)
  local L1_89, L2_90, L3_91
  L1_89 = A0_88[1]
  L2_90 = db
  L2_90 = L2_90.getAttribute
  L3_91 = "vlan"
  L2_90 = L2_90(L3_91, "vlanId", L1_89, "_ROWID_")
  if L2_90 == nil then
    L3_91 = printCLIError
    L3_91("This row id doesn't exist")
    L3_91 = -1
    return L3_91, {}
  end
  L3_91 = db
  L3_91 = L3_91.getRow
  L3_91 = L3_91("vlan", "_ROWID_", L2_90)
  return L1_89, L3_91
end
function vlanIPv6CfgInputVal(A0_92)
  local L1_93, L2_94
  L1_93 = db
  L1_93 = L1_93.getRow
  L2_94 = "networkInfo"
  L1_93 = L1_93(L2_94, "_ROWID_", "1")
  L2_94 = L1_93["networkInfo.netWorkMode"]
  if L2_94 == "1" then
    L2_94 = printCLIError
    L2_94("Please Set IP Mode to IPv4/IPv6 to configure IPv6 LAN Configurations.")
    L2_94 = false
    return L2_94
  end
  L2_94 = A0_92["ifStatic.PrefixLength"]
  if L2_94 == nil then
    L2_94 = A0_92["ifStatic.StaticIp"]
    if L2_94 == nil then
      L2_94 = A0_92["dhcpv6s.statelessMode"]
      if L2_94 == nil then
        L2_94 = A0_92["dhcpv6s.domainName"]
        if L2_94 == nil then
          L2_94 = A0_92["dhcpv6s.serverPreference"]
          if L2_94 == nil then
            L2_94 = A0_92["dhcpv6s.useDNSServersFrom"]
            if L2_94 == nil then
              L2_94 = A0_92["dhcpv6s.leaseTime"]
              if L2_94 == nil then
                L2_94 = A0_92["dhcpv6s.isEnabled"]
              end
            end
          end
        end
      end
    end
  elseif L2_94 ~= nil then
    L2_94 = A0_92["ifStatic.isEnabled"]
    if L2_94 ~= "1" then
      L2_94 = printCLIError
      L2_94("please Enable IPv6 Vlan First.\n")
      L2_94 = false
      return L2_94
    end
  end
  L2_94 = A0_92["ifStatic.isEnabled"]
  if L2_94 == "1" then
    L2_94 = A0_92["ifStatic.PrefixLength"]
    if L2_94 ~= nil then
      L2_94 = tonumber
      L2_94 = L2_94(A0_92["ifStatic.PrefixLength"])
      if not (L2_94 < 0) then
        L2_94 = tonumber
        L2_94 = L2_94(A0_92["ifStatic.PrefixLength"])
      end
    elseif L2_94 > 128 then
      L2_94 = printCLIError
      L2_94("Invalid Prefix. Please enter a value between 0 and 128.")
      L2_94 = false
      return L2_94
    end
    L2_94 = A0_92["ifStatic.StaticIp"]
    if L2_94 ~= "" then
      L2_94 = A0_92["ifStatic.StaticIp"]
    elseif L2_94 == nil then
      L2_94 = printCLIError
      L2_94("Please Enter valid IPv6 End Address.")
      L2_94 = false
      return L2_94
    end
    L2_94 = nil
    a, b, c = validations.ipv6AddrValidate(A0_92["ifStatic.StaticIp"], "", "")
    if b ~= "OK" then
      L2_94 = db.getAttribute("stringsMap", "stringId", b, "en_US")
      print(L2_94 .. " for LAN.")
      return false
    end
    L2_94 = validations.ipv6LoopBackCheck(A0_92["ifStatic.StaticIp"])
    if L2_94 ~= "OK" then
      printCLIError(L2_94 .. " for LAN.")
      return false
    end
    if _UPVALUE0_.ipAddressCheck("10", A0_92["ifStatic.StaticIp"]) ~= 0 then
      printCLIError("please check the number of octets for ipv6 address\n")
      return false
    end
    if _UPVALUE0_.checkVlanIPV6RangeCheck(A0_92["ifStatic.StaticIp"], A0_92["ifStatic.PrefixLength"], A0_92["vlan.vlanId"]) == _UPVALUE1_.SUCCESS then
      printCLIError("LAN/VLAN IPv6 ADDRESS is ALREADY CONFIGURED, Use different ipv6 address.")
      return false
    end
    if A0_92["dhcpv6s.useDNSServersFrom"] ~= "3" and (A0_92["dhcpv6s.primaryDNSServer"] ~= nil or A0_92["dhcpv6s.secondaryDNSServer"] ~= nil) then
      printCLIError("please select correct dns type.\n")
      return false
    end
    if (A0_92["dhcpv6s.statelessMode"] ~= nil or A0_92["dhcpv6s.domainName"] ~= nil or A0_92["dhcpv6s.serverPreference"] ~= nil or A0_92["dhcpv6s.useDNSServersFrom"] ~= nil or A0_92["dhcpv6s.leaseTime"] ~= nil) and A0_92["dhcpv6s.isEnabled"] ~= "1" then
      printCLIError("please Enable DHCPv6.\n")
      return false
    end
    if A0_92["dhcpv6s.isEnabled"] == "1" then
      if A0_92["dhcpv6s.statelessMode"] == nil or A0_92["dhcpv6s.domainName"] == nil or A0_92["dhcpv6s.serverPreference"] == nil or A0_92["dhcpv6s.useDNSServersFrom"] == nil or A0_92["dhcpv6s.leaseTime"] == nil or A0_92["dhcpv6s.statelessMode"] == "" or A0_92["dhcpv6s.domainName"] == "" or A0_92["dhcpv6s.serverPreference"] == "" or A0_92["dhcpv6s.useDNSServersFrom"] == "" or A0_92["dhcpv6s.leaseTime"] == "" then
        printCLIError("please configure the dhcpv6 configuration properly.\n")
        return false
      end
      if A0_92["dhcpv6s.useDNSServersFrom"] == "3" and (A0_92["dhcpv6s.primaryDNSServer"] == nil or A0_92["dhcpv6s.secondaryDNSServer"] == nil or A0_92["dhcpv6s.primaryDNSServer"] == "" or A0_92["dhcpv6s.secondaryDNSServer"] == "") then
        printCLIError("please configure primary/secondary dns for dns selected.\n")
        return false
      end
      if A0_92["dhcpv6s.statelessMode"] == "1" and (A0_92["dhcpv6s.prefixDelegation"] == nil or A0_92["dhcpv6s.prefixDelegation"] == "") then
        printCLIError("please select enable/disable for prefix delegation.\n")
        return false
      end
      if A0_92["dhcpv6s.statelessMode"] == "0" then
        A0_92["dhcpv6s.prefixDelegation"] = ""
      end
    end
  end
  L2_94 = true
  return L2_94
end
function vlanIPv6CfgSave(A0_95)
  local L1_96, L2_97, L3_98, L4_99, L5_100, L6_101, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107, L13_108, L14_109
  L1_96 = ""
  errorFlag = L1_96
  L1_96 = ""
  statusCode = L1_96
  L1_96 = ""
  statusMessage = L1_96
  L1_96 = nil
  L2_97 = A0_95["vlan.vlanId"]
  L3_98 = A0_95["ifStatic.isEnabled"]
  L4_99 = A0_95["ifStatic.StaticIp"]
  L5_100 = A0_95["ifStatic.PrefixLength"]
  L6_101 = A0_95["dhcpv6s.isEnabled"]
  L7_102 = A0_95["dhcpv6s.statelessMode"]
  L8_103 = A0_95["dhcpv6s.domainName"]
  L9_104 = A0_95["dhcpv6s.serverPreference"]
  L10_105 = A0_95["dhcpv6s.useDNSServersFrom"]
  L11_106 = A0_95["dhcpv6s.primaryDNSServer"]
  L12_107 = A0_95["dhcpv6s.secondaryDNSServer"]
  L13_108 = A0_95["dhcpv6s.leaseTime"]
  L14_109 = A0_95["dhcpv6s.prefixDelegation"]
  errorFlag, L1_96 = _UPVALUE0_.dhcpv6ServerVLANSet(L2_97, L3_98, L6_101, L4_99, L5_100, L7_102, L8_103, L9_104, L10_105, L11_106, L12_107, L13_108, L14_109)
  statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function MultivlanSubInit(A0_110)
  local L1_111, L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120
  L1_111 = A0_110[1]
  L2_112 = db
  L2_112 = L2_112.getAttribute
  L3_113 = "vlan"
  L4_114 = "vlanId"
  L5_115 = L1_111
  L6_116 = "_ROWID_"
  L2_112 = L2_112(L3_113, L4_114, L5_115, L6_116)
  if L2_112 == nil then
    L3_113 = printCLIError
    L4_114 = "This row id doesn't exist"
    L3_113(L4_114)
    L3_113 = -1
    L4_114 = {}
    return L3_113, L4_114
  end
  L3_113 = db
  L3_113 = L3_113.getRow
  L4_114 = "vlan"
  L5_115 = "_ROWID_"
  L6_116 = L2_112
  L3_113 = L3_113(L4_114, L5_115, L6_116)
  L4_114 = L3_113["vlan.portName"]
  if L4_114 == "dummy" then
    L4_114 = L3_113["vlan.vlanId"]
    L5_115 = L3_113["vlan.vlanName"]
    if L4_114 == "1" then
      L4_114 = ""
    end
    L6_116 = db
    L6_116 = L6_116.getRow
    L7_117 = "ifStatic"
    L8_118 = "LogicalIfName"
    L9_119 = "LAN"
    L10_120 = L4_114
    L9_119 = L9_119 .. L10_120
    L6_116 = L6_116(L7_117, L8_118, L9_119)
    L6_116 = L6_116 or {}
    L7_117 = util
    L7_117 = L7_117.tableAppend
    L8_118 = L3_113
    L9_119 = L6_116
    L7_117 = L7_117(L8_118, L9_119)
    L3_113 = L7_117
    L7_117 = db
    L7_117 = L7_117.getRow
    L8_118 = "networkInterface"
    L9_119 = "LogicalIfName"
    L10_120 = "LAN"
    L10_120 = L10_120 .. L4_114
    L7_117 = L7_117(L8_118, L9_119, L10_120)
    L7_117 = L7_117 or {}
    L8_118 = util
    L8_118 = L8_118.tableAppend
    L9_119 = L3_113
    L10_120 = L7_117
    L8_118 = L8_118(L9_119, L10_120)
    L3_113 = L8_118
    L8_118 = db
    L8_118 = L8_118.getRow
    L9_119 = "dhcp"
    L10_120 = "logicalIfName"
    L8_118 = L8_118(L9_119, L10_120, "LAN" .. L4_114)
    L8_118 = L8_118 or {}
    L9_119 = util
    L9_119 = L9_119.tableAppend
    L10_120 = L3_113
    L9_119 = L9_119(L10_120, L8_118)
    L3_113 = L9_119
    L9_119 = db
    L9_119 = L9_119.getRow
    L10_120 = "DhcpRelay"
    L9_119 = L9_119(L10_120, "LogicalIfName", "LAN" .. L4_114)
    L9_119 = L9_119 or {}
    L10_120 = util
    L10_120 = L10_120.tableAppend
    L10_120 = L10_120(L3_113, L9_119)
    L3_113 = L10_120
    L10_120 = db
    L10_120 = L10_120.getRow
    L10_120 = L10_120("interVLANRouting", "vlanId", L4_114)
    L10_120 = L10_120 or {}
    L3_113 = util.tableAppend(L3_113, L10_120)
  else
    L4_114 = printCLIError
    L5_115 = "This Row cannot be edited"
    L4_114(L5_115)
    L4_114 = -1
    L5_115 = {}
    return L4_114, L5_115
  end
  L4_114 = L1_111
  L5_115 = L3_113
  return L4_114, L5_115
end
function MultivlanSubSave(A0_121)
  local L1_122, L2_123, L3_124, L4_125, L5_126, L6_127, L7_128, L8_129, L9_130, L10_131, L11_132, L12_133, L13_134, L14_135
  L2_123 = ""
  L3_124 = nil
  L4_125 = ""
  L5_126 = A0_121["vlan.vlanId"]
  if L5_126 == "1" then
    L5_126 = ""
  end
  L6_127 = "LAN"
  L7_128 = L5_126
  L6_127 = L6_127 .. L7_128
  L7_128 = "LogicalIfName = '"
  L8_129 = L6_127
  L9_130 = "' and AddressFamily = 2"
  L7_128 = L7_128 .. L8_129 .. L9_130
  L8_129 = db
  L8_129 = L8_129.existsRowWhere
  L9_130 = "ifStatic"
  L10_131 = L7_128
  L8_129 = L8_129(L9_130, L10_131)
  L9_130 = db
  L9_130 = L9_130.getAttribute
  L10_131 = "ifStatic"
  L11_132 = "LogicalIfName"
  L12_133 = L6_127
  L13_134 = "StaticIp"
  L9_130 = L9_130(L10_131, L11_132, L12_133, L13_134)
  L10_131 = db
  L10_131 = L10_131.getAttribute
  L11_132 = "ifStatic"
  L12_133 = "_ROWID_"
  L13_134 = "1"
  L10_131 = L10_131(L11_132, L12_133, L13_134, L14_135)
  A0_121["Lan.OldIpAddress"] = L9_130
  A0_121["Lan.ServerIpAddress"] = L10_131
  L11_132 = lan
  L11_132 = L11_132.ipv4LanConfig
  L12_133 = A0_121
  L13_134 = A0_121["ifStatic._ROWID_"]
  L12_133 = L11_132(L12_133, L13_134, L14_135)
  L4_125 = L12_133
  L1_122 = L11_132
  if L1_122 == "OK" then
    L11_132 = db
    L11_132 = L11_132.existsRowWhere
    L12_133 = "vlan"
    L13_134 = "vlanId="
    L13_134 = L13_134 .. L14_135 .. " and portName='dummy'"
    L11_132 = L11_132(L12_133, L13_134)
    L12_133 = db
    L12_133 = L12_133.getAttribute
    L13_134 = "vlan"
    L12_133 = L12_133(L13_134, L14_135, L11_132, "vlanName")
    L13_134 = db
    L13_134 = L13_134.getRowsWhere
    L13_134 = L13_134(L14_135, "vlanName= '" .. L12_133 .. "'")
    for _FORV_17_, _FORV_18_ in L14_135(L13_134) do
      serviceRoute = L13_134[_FORV_17_]
      serviceRoute["ServicesRouteMgmt" .. "." .. "sourceIPAddress"] = A0_121["ifStatic.StaticIp"]
    end
    db.save()
    L1_122, L4_125 = dhcp.dhcpConfigWrap(A0_121, L6_127)
    if L1_122 == "OK" then
      db.save()
    end
  end
  L11_132 = db
  L11_132 = L11_132.getAttribute
  L12_133 = "stringsMap"
  L13_134 = "stringId"
  L11_132 = L11_132(L12_133, L13_134, L14_135, LANGUAGE)
  L3_124 = L11_132 or L4_125
  L11_132 = L1_122
  L12_133 = L3_124
  return L11_132, L12_133
end
function MultivlanSubInputVal(A0_136)
  local L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152
  L8_144 = A0_136["vlan.vlanId"]
  if L8_144 == nil then
    L8_144 = printCLIError
    L9_145 = "This Vlan id doesn't exist. Please configure multi vlan subnet configuration with valid Vlan ID."
    L8_144(L9_145)
    L8_144 = false
    return L8_144
  end
  L8_144 = db
  L8_144 = L8_144.getRow
  L9_145 = "DhcpRelay"
  L10_146 = "DhcpRelay._ROWID_"
  L11_147 = 1
  L8_144 = L8_144(L9_145, L10_146, L11_147)
  L9_145 = A0_136["ifStatic.StaticIp"]
  if L9_145 == nil then
    L9_145 = printCLIError
    L10_146 = "please enter a valid ip address"
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = UNIT_NAME
  if L9_145 ~= "DSR-1000AC" then
    L9_145 = UNIT_NAME
    if L9_145 ~= "DSR-1000N" then
      L9_145 = UNIT_NAME
    end
  else
    if L9_145 == "DSR-1000" then
      L7_143 = "1024"
  end
  else
    L9_145 = UNIT_NAME
    if L9_145 ~= "DSR-500AC" then
      L9_145 = UNIT_NAME
      if L9_145 ~= "DSR-500N" then
        L9_145 = UNIT_NAME
      end
    else
      if L9_145 == "DSR-500" then
        L7_143 = "512"
    end
    else
      L9_145 = UNIT_NAME
      if L9_145 ~= "DSR-250N" then
        L9_145 = UNIT_NAME
      else
        if L9_145 == "DSR-250" then
          L7_143 = "256"
      end
      else
        L7_143 = "128"
      end
    end
  end
  L9_145 = util
  L9_145 = L9_145.split
  L10_146 = A0_136["ifStatic.StaticIp"]
  L11_147 = "."
  L9_145 = L9_145(L10_146, L11_147)
  L2_138 = L9_145
  if L2_138 ~= nil then
    L9_145 = tonumber
    L10_146 = L2_138[1]
    L9_145 = L9_145(L10_146)
    if L9_145 ~= 224 then
      L9_145 = tonumber
      L10_146 = L2_138[1]
      L9_145 = L9_145(L10_146)
      if not (L9_145 > 224) then
        L9_145 = tonumber
        L10_146 = L2_138[1]
        L9_145 = L9_145(L10_146)
        if L9_145 ~= 0 then
          L9_145 = A0_136["ifStatic.StaticIp"]
        end
      end
    end
  elseif L9_145 == "0.0.0.0" then
    L9_145 = printCLIError
    L10_146 = "Invalid Gateway IP address. Please enter a valid IP address."
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L2_138 = A0_136["ifStatic.StaticIp"]
  L9_145 = validationsLuaLib
  L9_145 = L9_145.ipv4AddrAsciiToNum
  L10_146 = L2_138
  L10_146 = L9_145(L10_146)
  L5_141 = L10_146
  _UPVALUE0_ = L9_145
  L9_145 = _UPVALUE0_
  if L9_145 == -1 then
    L9_145 = printCLIError
    L10_146 = "Invalid IP address. Please enter a valid IP address."
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = A0_136["ifStatic.StaticIp"]
  L10_146 = _UPVALUE1_
  L10_146 = L10_146.NIL
  if L9_145 ~= L10_146 then
    L9_145 = _UPVALUE2_
    L9_145 = L9_145.ipv4SingleMaskCheck
    L10_146 = _UPVALUE3_
    L11_147 = A0_136["ifStatic.StaticIp"]
    L12_148 = _UPVALUE4_
    L9_145 = L9_145(L10_146, L11_147, L12_148)
    L10_146 = _UPVALUE1_
    L10_146 = L10_146.SUCCESS
    if L9_145 == L10_146 then
      L9_145 = printCLIError
      L10_146 = "Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet."
      L9_145(L10_146)
      L9_145 = false
      return L9_145
    end
  end
  L9_145 = A0_136["ifStatic.NetMask"]
  if L9_145 == nil then
    L9_145 = printCLIError
    L10_146 = "please enter a valid subnet mask"
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = A0_136["ifStatic.NetMask"]
  if L9_145 == "0.0.0.0" then
    L9_145 = printCLIError
    L10_146 = "Please enter valid CIDR subnet mask."
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = _UPVALUE2_
  L9_145 = L9_145.checkSubnetMask
  L10_146 = A0_136["ifStatic.NetMask"]
  L9_145 = L9_145(L10_146)
  L10_146 = _UPVALUE1_
  L10_146 = L10_146.FAILURE
  if L9_145 == L10_146 then
    L9_145 = printCLIError
    L10_146 = "Please enter valid subnet Mask"
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = validationsLuaLib
  L9_145 = L9_145.ipv4AddressParametersGet
  L10_146 = A0_136["ifStatic.StaticIp"]
  L11_147 = A0_136["ifStatic.NetMask"]
  L13_149 = L9_145(L10_146, L11_147)
  L1_137 = L13_149
  L6_142 = L12_148
  L4_140 = L11_147
  L3_139 = L10_146
  _UPVALUE0_ = L9_145
  L9_145 = _UPVALUE0_
  if L9_145 == -1 then
    L9_145 = printCLIError
    L10_146 = "Error occured while calculating the Network address."
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = util
  L9_145 = L9_145.split
  L10_146 = L3_139
  L11_147 = "."
  L9_145 = L9_145(L10_146, L11_147)
  L2_138 = L9_145
  L9_145 = tonumber
  L10_146 = L2_138[1]
  L9_145 = L9_145(L10_146)
  if L9_145 == 0 then
    L9_145 = printCLIError
    L10_146 = "Combination of IP address/Subnet Mask is pointing to invalid network."
    L9_145(L10_146)
    L9_145 = false
    return L9_145
  end
  L9_145 = A0_136["ifStatic.StaticIp"]
  L10_146 = A0_136["ifStatic.NetMask"]
  L11_147 = A0_136["ifStatic.StaticIp"]
  if L3_139 ~= L11_147 then
    L11_147 = A0_136["ifStatic.StaticIp"]
  elseif L4_140 == L11_147 then
    L11_147 = printCLIError
    L12_148 = "Configured IP address cannot be a network/broadcast address."
    L11_147(L12_148)
    L11_147 = false
    return L11_147
  end
  L11_147 = nil
  L12_148 = _UPVALUE2_
  L12_148 = L12_148.checkWanSubnetRange
  L13_149 = L9_145
  L14_150 = L10_146
  L12_148 = L12_148(L13_149, L14_150)
  L11_147 = L12_148
  L12_148 = _UPVALUE1_
  L12_148 = L12_148.SUCCESS
  if L11_147 == L12_148 then
    L12_148 = UNIT_NAME
    if L12_148 ~= "DSR-1000N" then
      L12_148 = UNIT_NAME
      if L12_148 ~= "DSR-1000" then
        L12_148 = UNIT_NAME
        if L12_148 ~= "DSR-500N" then
          L12_148 = UNIT_NAME
        end
      end
    else
      if L12_148 == "DSR-500" then
        L12_148 = printCLIError
        L13_149 = "WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
        L12_148(L13_149)
    end
    else
      L12_148 = printCLIError
      L13_149 = "WAN ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
      L12_148(L13_149)
    end
    L12_148 = false
    return L12_148
  end
  L12_148 = HIGH_SEC
  if L12_148 == "HIGH" then
    L12_148 = _UPVALUE2_
    L12_148 = L12_148.checkSslClientRange
    L13_149 = L9_145
    L14_150 = L10_146
    L12_148 = L12_148(L13_149, L14_150)
    L11_147 = L12_148
    L12_148 = _UPVALUE1_
    L12_148 = L12_148.SUCCESS
    if L11_147 == L12_148 then
      L12_148 = printCLIError
      L13_149 = "SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet."
      L12_148(L13_149)
      L12_148 = false
      return L12_148
    end
  end
  L12_148 = _UPVALUE2_
  L12_148 = L12_148.checkDmzSubnetRange
  L13_149 = L9_145
  L14_150 = L10_146
  L12_148 = L12_148(L13_149, L14_150)
  L11_147 = L12_148
  L12_148 = _UPVALUE1_
  L12_148 = L12_148.SUCCESS
  if L11_147 == L12_148 then
    L12_148 = printCLIError
    L13_149 = "DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L12_148(L13_149)
    L12_148 = false
    return L12_148
  end
  L12_148 = _UPVALUE2_
  L12_148 = L12_148.checkVlanSubnetRange
  L13_149 = A0_136["ifStatic.StaticIp"]
  L14_150 = A0_136["ifStatic.NetMask"]
  L15_151 = A0_136["vlan.vlanId"]
  L12_148 = L12_148(L13_149, L14_150, L15_151)
  returnCode = L12_148
  L12_148 = returnCode
  L13_149 = _UPVALUE1_
  L13_149 = L13_149.SUCCESS
  if L12_148 == L13_149 then
    L12_148 = printCLIError
    L13_149 = "Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L12_148(L13_149)
    L12_148 = false
    return L12_148
  end
  L12_148 = _UPVALUE2_
  L12_148 = L12_148.checkOpenVpnSubnetRange
  L13_149 = A0_136["ifStatic.StaticIp"]
  L14_150 = A0_136["ifStatic.NetMask"]
  L12_148 = L12_148(L13_149, L14_150)
  L13_149 = _UPVALUE1_
  L13_149 = L13_149.SUCCESS
  if L12_148 == L13_149 then
    L12_148 = printCLIError
    L13_149 = "OPENVPN Network/Remote Network is already configured"
    L14_150 = " in same subnet. Please specify IP address in different subnet."
    L13_149 = L13_149 .. L14_150
    L12_148(L13_149)
    L12_148 = false
    return L12_148
  end
  L12_148, L13_149 = nil, nil
  L14_150 = _UPVALUE2_
  L14_150 = L14_150.checkIpSecSubnetRange
  L15_151 = A0_136["ifStatic.StaticIp"]
  L16_152 = A0_136["ifStatic.NetMask"]
  L14_150 = L14_150(L15_151, L16_152)
  L12_148 = L14_150
  L14_150 = _UPVALUE1_
  L14_150 = L14_150.SUCCESS
  if L12_148 == L14_150 then
    L14_150 = printCLIError
    L15_151 = "DHCP Range Over IpSec is in the same subnet.Please specify IP address in a different subnet."
    L14_150(L15_151)
    L14_150 = false
    return L14_150
  end
  L14_150 = _UPVALUE2_
  L14_150 = L14_150.checkPptpSeverSubnetRange
  L15_151 = A0_136["ifStatic.StaticIp"]
  L16_152 = A0_136["ifStatic.NetMask"]
  L14_150 = L14_150(L15_151, L16_152)
  L12_148 = L14_150
  L14_150 = _UPVALUE1_
  L14_150 = L14_150.SUCCESS
  if L12_148 == L14_150 then
    L14_150 = printCLIError
    L15_151 = "PPTP Server range already configured in same subnet.Please specify IP address in a different subnet."
    L14_150(L15_151)
    L14_150 = false
    return L14_150
  end
  L14_150 = _UPVALUE2_
  L14_150 = L14_150.checkL2tpSeverSubnetRange
  L15_151 = A0_136["ifStatic.StaticIp"]
  L16_152 = A0_136["ifStatic.NetMask"]
  L14_150 = L14_150(L15_151, L16_152)
  L12_148 = L14_150
  L14_150 = _UPVALUE1_
  L14_150 = L14_150.SUCCESS
  if L12_148 == L14_150 then
    L14_150 = printCLIError
    L15_151 = "L2TP Server range already configured in same subnet.Please specify IP address in a different subnet."
    L14_150(L15_151)
    L14_150 = false
    return L14_150
  end
  L14_150 = A0_136["dhcp.dhcpEnabled"]
  if L14_150 == "3" then
    L14_150 = A0_136["DhcpRelay.RelayGateway"]
    if L14_150 ~= nil then
      L14_150 = A0_136["DhcpRelay.RelayGateway"]
      if L14_150 ~= "" then
        L14_150 = A0_136["DhcpRelay.RelayGateway"]
      end
    elseif L14_150 == "0.0.0.0" then
      L14_150 = printCLIError
      L15_151 = "Invalid relay gateway"
      L14_150(L15_151)
      L14_150 = false
      return L14_150
    end
    L14_150 = util
    L14_150 = L14_150.split
    L15_151 = A0_136["DhcpRelay.RelayGateway"]
    L16_152 = "."
    L14_150 = L14_150(L15_151, L16_152)
    Octet = L14_150
    L14_150 = tonumber
    L15_151 = Octet
    L15_151 = L15_151[1]
    L14_150 = L14_150(L15_151)
    if L14_150 ~= 224 then
      L14_150 = tonumber
      L15_151 = Octet
      L15_151 = L15_151[1]
      L14_150 = L14_150(L15_151)
      if L14_150 ~= 0 then
        L14_150 = tonumber
        L15_151 = Octet
        L15_151 = L15_151[1]
        L14_150 = L14_150(L15_151)
      end
    elseif L14_150 > 224 then
      L14_150 = printCLIError
      L15_151 = "Invalid Relay GW IP address. Please enter a value between 1 - 223 for octet 1"
      L14_150(L15_151)
      L14_150 = false
      return L14_150
    end
    L14_150 = tonumber
    L15_151 = Octet
    L15_151 = L15_151[4]
    L14_150 = L14_150(L15_151)
    if L14_150 ~= 255 then
      L14_150 = tonumber
      L15_151 = Octet
      L15_151 = L15_151[4]
      L14_150 = L14_150(L15_151)
      if not (L14_150 > 254) then
        L14_150 = tonumber
        L15_151 = Octet
        L15_151 = L15_151[4]
        L14_150 = L14_150(L15_151)
      end
    elseif L14_150 == 0 then
      L14_150 = printCLIError
      L15_151 = "Invalid Relay GW IP address. Please enter a value between 1 - 254 for octet 4"
      L14_150(L15_151)
      L14_150 = false
      return L14_150
    end
  end
  L14_150 = A0_136["vlan.vlanId"]
  if L14_150 == "1" then
    L14_150 = ""
  end
  L15_151 = "LAN"
  L16_152 = L14_150
  L15_151 = L15_151 .. L16_152
  L16_152 = "LogicalIfName = '"
  L16_152 = L16_152 .. L15_151 .. "' and AddressFamily = 2"
  if db.getRow("ifStatic", "StaticIp", A0_136["ifStatic.StaticIp"]) ~= nil and db.existsRowWhere("ifStatic", L16_152) ~= nil and db.existsRowWhere("ifStatic", L16_152) ~= db.getRow("ifStatic", "StaticIp", A0_136["ifStatic.StaticIp"])["ifStatic._ROWID_"] then
    printCLIError("Configured IP Address already in use")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and L8_144["DhcpRelay.DhcpRelayStatus"] == "1" then
    printCLIError("Disable DHCP Relay before enabling DHCP Server")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and (A0_136["dhcp.startAddress"] == nil or A0_136["dhcp.startAddress"] == "" or A0_136["dhcp.startAddress"] == "0.0.0.0") then
    printCLIError("Invalid Start IP address")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" then
    if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_136["dhcp.startAddress"], _UPVALUE4_) == _UPVALUE1_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    L2_138 = util.split(A0_136["dhcp.startAddress"], ".")
    if L2_138 == nil or tonumber(L2_138[1]) == 224 or tonumber(L2_138[1]) > 224 or tonumber(L2_138[1]) == 0 or A0_136["dhcp.startAddress"] == "0.0.0.0" then
      printCLIError("Invalid start IP address. Please enter a valid IP address.")
      return false
    end
    L2_138 = A0_136["dhcp.startAddress"]
    _UPVALUE0_, L5_141 = validationsLuaLib.ipv4AddrAsciiToNum(L2_138)
    if _UPVALUE0_ == -1 then
      printCLIError("Invalid start IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(A0_136["ifStatic.StaticIp"], A0_136["dhcp.startAddress"], A0_136["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
      printCLIError("Start IP should be in same subnet")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_136["dhcp.endAddress"], _UPVALUE4_) == _UPVALUE1_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    L2_138 = util.split(A0_136["dhcp.endAddress"], ".")
    if L2_138 == nil or tonumber(L2_138[1]) == 224 or tonumber(L2_138[1]) > 224 or tonumber(L2_138[1]) == 0 or A0_136["dhcp.endAddress"] == "0.0.0.0" then
      printCLIError("Invalid end IP address. Please enter a valid IP address.")
      return false
    end
    L2_138 = A0_136["dhcp.endAddress"]
    _UPVALUE0_, L5_141 = validationsLuaLib.ipv4AddrAsciiToNum(L2_138)
    if _UPVALUE0_ == -1 then
      printCLIError("Invalid end IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(A0_136["ifStatic.StaticIp"], A0_136["dhcp.endAddress"], A0_136["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
      printCLIError("END IP should be in same subnet")
      return false
    end
    _UPVALUE0_ = _UPVALUE2_.ipv4AddressesCompare(A0_136["dhcp.startAddress"], A0_136["dhcp.endAddress"])
    if _UPVALUE0_ == 0 or _UPVALUE0_ == 3 then
      printCLIError("End address should be higher than or equal to Start address")
      return false
    end
    if L3_139 == A0_136["dhcp.startAddress"] or L4_140 == A0_136["dhcp.startAddress"] then
      printCLIError("Configured start IP address cannot be a network/broadcast address.")
      return false
    end
    if L3_139 == A0_136["dhcp.endAddress"] or L4_140 == A0_136["dhcp.endAddress"] then
      printCLIError("Configured end IP address cannot be a network/broadcast address.")
      return false
    end
    _UPVALUE0_, range = validationsLuaLib.ipv4TotalAddressesGet(A0_136["dhcp.startAddress"], A0_136["dhcp.endAddress"])
    if _UPVALUE0_ == 0 then
      printCLIError("Invalid Start/End address")
      return false
    end
    if range > tonumber(L7_143) - 1 then
      printCLIError("upto " .. L7_143 .. " addresses are allowed to be configured.")
      return false
    end
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and (A0_136["dhcp.endAddress"] == nil or A0_136["dhcp.endAddress"] == "" or A0_136["dhcp.endAddress"] == "0.0.0.0") then
    printCLIError("Invalid End IP address")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and (A0_136["dhcp.defaultGw"] == nil or A0_136["dhcp.defaultGw"] == "" or A0_136["dhcp.defaultGw"] == "0.0.0.0") then
    printCLIError("Invalid  default gateway")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" then
    if _UPVALUE2_.ipv4SingleMaskCheck(_UPVALUE3_, A0_136["dhcp.defaultGw"], _UPVALUE4_) == _UPVALUE1_.SUCCESS then
      printCLIError("Local Interface IP address is in the same subnet. Please specify Ip address in a different subnet.")
      return false
    end
    L2_138 = util.split(A0_136["dhcp.defaultGw"], ".")
    if L2_138 == nil or tonumber(L2_138[1]) == 224 or tonumber(L2_138[1]) > 224 or tonumber(L2_138[1]) == 0 or A0_136["dhcp.defaultGw"] == "0.0.0.0" then
      printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
      return false
    end
    L2_138 = A0_136["dhcp.defaultGw"]
    _UPVALUE0_, L5_141 = validationsLuaLib.ipv4AddrAsciiToNum(L2_138)
    if _UPVALUE0_ == -1 then
      printCLIError("Invalid Gateway IP address. Please enter a valid IP address.")
      return false
    end
    if _UPVALUE2_.ipv4SingleMaskCheck(A0_136["ifStatic.StaticIp"], A0_136["dhcp.defaultGw"], A0_136["ifStatic.NetMask"]) ~= _UPVALUE1_.SUCCESS then
      printCLIError("DEFAULT Gateway IP should be in same subnet.")
      return false
    end
    if L3_139 == A0_136["dhcp.defaultGw"] or L4_140 == A0_136["dhcp.defaultGw"] then
      printCLIError("Configured default gateway IP address cannot be a network/broadcast address.")
      return false
    end
    if A0_136["dhcp.primaryDnsServer"] ~= nil and A0_136["dhcp.primaryDnsServer"] ~= "" then
      Octet = util.split(A0_136["dhcp.primaryDnsServer"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_136["dhcp.primaryDnsServer"] == "0.0.0.0" then
        printCLIError("Invalid Primary DNS server IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid Primary DNS Server IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
    if A0_136["dhcp.secondaryDnsServer"] ~= nil and A0_136["dhcp.secondaryDnsServer"] ~= "" then
      Octet = util.split(A0_136["dhcp.secondaryDnsServer"], ".")
      if tonumber(Octet[1]) == 224 or 224 < tonumber(Octet[1]) or tonumber(Octet[1]) == 0 or A0_136["dhcp.secondaryDnsServer"] == "0.0.0.0" then
        printCLIError("Invalid Secondary DNS server IP address. Please enter a value between 1 - 223 for octet 1")
        return false
      end
      if tonumber(Octet[4]) == 255 or tonumber(Octet[4]) > 254 or tonumber(Octet[4]) == 0 then
        printCLIError("Invalid Secondary DNS server IP address. Please enter a value between 1 - 254 for octet 4")
        return false
      end
    end
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and A0_136["dhcp.leaseTime"] == nil then
    printCLIError("Invalid lease Time")
    return false
  end
  if A0_136["dhcp.dhcpEnabled"] == "1" and A0_136["dhcp.enableDnsProxy"] == nil then
    printCLIError("Invalid DNS Proxy status")
    return false
  end
  if A0_136["dhcp.domainName"] == nil or A0_136["dhcp.domainName"] == "" then
    A0_136["dhcp.domainName"] = ""
  else
    status, errStr = validationsLuaLib.domainNameValidation(A0_136["dhcp.domainName"])
    if tonumber(status) ~= 0 then
      printCLIError(errStr)
      return false
    end
  end
  return true
end
function vlanShow()
  local L0_153, L1_154, L2_155, L3_156, L4_157, L5_158, L6_159, L7_160, L8_161, L9_162, L10_163, L11_164, L12_165, L13_166, L14_167, L15_168, L16_169, L17_170, L18_171, L19_172, L20_173, L21_174, L22_175, L23_176, L24_177, L25_178, L26_179
  L0_153 = {}
  L1_154 = nil
  L2_155 = 0
  L3_156, L4_157 = nil, nil
  L5_158 = db
  L5_158 = L5_158.getTable
  L6_159 = "vlan"
  L5_158 = L5_158(L6_159)
  L6_159 = db
  L6_159 = L6_159.getTable
  L7_160 = "captivePortalVlan"
  L6_159 = L6_159(L7_160)
  L7_160 = db
  L7_160 = L7_160.getTable
  L8_161 = "interVlanRouting"
  L7_160 = L7_160(L8_161)
  L8_161 = 0
  L9_162 = 0
  L10_163 = Modelid
  if L10_163 ~= "DSR-1000AC" then
    L10_163 = Modelid
  else
    if L10_163 == "DSR-500AC" then
      L10_163 = printLabel
      L11_164 = "-------------CP Vlan Configuration----------------\n"
      L10_163(L11_164)
  end
  else
    L10_163 = printLabel
    L11_164 = "-------------Vlan Configuration----------------\n"
    L10_163(L11_164)
  end
  L10_163 = "_ROWID_ = 1"
  L11_164 = db
  L11_164 = L11_164.getRowWhere
  L12_165 = "VlanStatus"
  L11_164 = L11_164(L12_165, L13_166)
  L12_165 = db
  L12_165 = L12_165.getAttribute
  L16_169 = "modelId"
  L12_165 = L12_165(L13_166, L14_167, L15_168, L16_169)
  if L13_166 == "1" then
    L13_166(L14_167)
  else
    L13_166(L14_167)
  end
  if L5_158 == nil then
    L13_166(L14_167)
  else
    for L16_169, L17_170 in L13_166(L14_167) do
      L8_161 = L8_161 + 1
      L18_171 = L5_158[L8_161]
      if L12_165 == "DSR-1000AC" or L12_165 == "DSR-500AC" then
        L19_172 = ""
      end
      L19_172 = L18_171["vlan.portName"]
      if L19_172 == "dummy" then
        L19_172 = ""
        L9_162 = L9_162 + 1
        L20_173 = L18_171["vlan.vlanId"]
        vlanIdd = L20_173
        L20_173 = L18_171["vlan.vlanName"]
        vlanNam = L20_173
        L20_173 = ""
        L21_174 = ""
        L22_175 = db
        L22_175 = L22_175.getRow
        L23_176 = "interVlanRouting"
        L24_177 = "vlanId"
        L25_178 = L18_171["vlan.vlanId"]
        L22_175 = L22_175(L23_176, L24_177, L25_178)
        intervlanrow = L22_175
        L22_175 = intervlanrow
        L20_173 = L22_175["interVlanRouting.status"]
        if L20_173 == "1" then
          L21_174 = "Enabled"
        else
          L21_174 = "Disabled"
        end
        if L12_165 == "DSR-1000" or L12_165 == "DSR-1000N" or L12_165 == "DSR-1000AC" or L12_165 == "DSR-500AC" or L12_165 == "DSR-500" or L12_165 == "DSR-500N" then
          L22_175 = intervlanrow
          L22_175 = L22_175["interVlanRouting.accessType"]
          if L22_175 == "2" then
            L22_175 = db
            L22_175 = L22_175.getAttribute
            L23_176 = "CaptivePortalVlan"
            L24_177 = "vlanId"
            L25_178 = vlanIdd
            L26_179 = "authServerId"
            L22_175 = L22_175(L23_176, L24_177, L25_178, L26_179)
            if L22_175 == "0" then
              L19_172 = "Local User Database"
            elseif L22_175 == "11" then
              L19_172 = "Radius-PAP"
            elseif L22_175 == "12" then
              L19_172 = "Radius-CHAP"
            elseif L22_175 == "13" then
              L19_172 = "Radius-MSCHAP"
            elseif L22_175 == "14" then
              L19_172 = "Radius-MSCHAPV2"
            elseif L22_175 == "20" then
              L19_172 = "LDAP"
            elseif L22_175 == "50" then
              L19_172 = "POP3"
            elseif L22_175 == "30" then
              L19_172 = "Active Directory"
            elseif L22_175 == "40" then
              L19_172 = "NT-Domain"
            else
              L19_172 = ""
            end
          else
            L22_175 = intervlanrow
            L22_175 = L22_175["interVlanRouting.accessType"]
            if L22_175 ~= "1" then
              L22_175 = intervlanrow
              L22_175 = L22_175["interVlanRouting.accessType"]
            else
              if L22_175 == "3" then
                L19_172 = "None"
            end
            else
              L19_172 = "None"
            end
          end
          L22_175 = ""
          L23_176 = db
          L23_176 = L23_176.getRow
          L24_177 = "captivePortalVlan"
          L25_178 = "vlanId"
          L26_179 = L18_171["vlan.vlanId"]
          L23_176 = L23_176(L24_177, L25_178, L26_179)
          cpvlanrow = L23_176
          L23_176 = cpvlanrow
          if L23_176 then
            L23_176 = cpvlanrow
            L22_175 = L23_176["captivePortalVlan.accessType"]
            if L22_175 == "0" then
              L4_157 = "Disabled"
              L19_172 = "None"
            elseif L22_175 == "1" or L22_175 == "3" then
              L4_157 = "Enabled"
              L19_172 = "None"
            elseif L22_175 == nil then
              L4_157 = "Disabled"
            else
              L4_157 = "Enabled"
            end
          else
            L4_157 = "Disabled"
          end
        end
        L22_175 = resTab
        L22_175 = L22_175.insertField
        L23_176 = L0_153
        L24_177 = "Vlan-Id"
        L25_178 = vlanIdd
        L25_178 = L25_178 or ""
        L22_175(L23_176, L24_177, L25_178)
        L22_175 = resTab
        L22_175 = L22_175.insertField
        L23_176 = L0_153
        L24_177 = "VlanName"
        L25_178 = vlanNam
        L25_178 = L25_178 or ""
        L22_175(L23_176, L24_177, L25_178)
        L22_175 = resTab
        L22_175 = L22_175.insertField
        L23_176 = L0_153
        L24_177 = "interVlanRouting"
        L25_178 = L21_174 or ""
        L22_175(L23_176, L24_177, L25_178)
        if L12_165 == "DSR-1000" or L12_165 == "DSR-1000N" or L12_165 == "DSR-1000AC" or L12_165 == "DSR-500AC" or L12_165 == "DSR-500" or L12_165 == "DSR-500N" then
          L22_175 = resTab
          L22_175 = L22_175.insertField
          L23_176 = L0_153
          L24_177 = "CaptivePortal"
          L25_178 = L4_157 or ""
          L22_175(L23_176, L24_177, L25_178)
          L22_175 = resTab
          L22_175 = L22_175.insertField
          L23_176 = L0_153
          L24_177 = "AuthServer"
          L25_178 = L19_172 or ""
          L22_175(L23_176, L24_177, L25_178)
        end
        L22_175 = db
        L22_175 = L22_175.getRow
        L23_176 = "networkInfo"
        L24_177 = "_ROWID_"
        L25_178 = "1"
        L22_175 = L22_175(L23_176, L24_177, L25_178)
        L23_176 = L22_175["networkInfo.netWorkMode"]
        if L23_176 == "3" then
          L23_176 = vlanIdd
          if L23_176 == "1" then
            L23_176 = ""
          end
          L24_177 = "LAN"
          L25_178 = L23_176
          L24_177 = L24_177 .. L25_178
          L25_178 = "LogicalIfName = '"
          L26_179 = L24_177
          L25_178 = L25_178 .. L26_179 .. "' and AddressFamily = 10"
          L26_179 = db
          L26_179 = L26_179.existsRowWhere
          L26_179 = L26_179("ifStatic", L25_178)
          if db.getRow("ifStatic", "_ROWID_", L26_179) ~= nil then
            resTab.insertField(L0_153, "IPv6 Address", db.getRow("ifStatic", "_ROWID_", L26_179)["ifStatic.StaticIp"] or "")
            resTab.insertField(L0_153, "IPv6 Prefix Length", db.getRow("ifStatic", "_ROWID_", L26_179)["ifStatic.PrefixLength"] or "")
          end
        end
      end
    end
    L13_166(L14_167, L15_168)
  end
end
function captivePortalShowProfile()
  local L0_180, L1_181
  L0_180 = db
  L0_180 = L0_180.getTable
  L1_181 = "CaptivePortalPageDetails"
  L0_180 = L0_180(L1_181)
  L1_181 = {}
  printLabel("-------------Captive Portal Profiles----------------\n")
  if L0_180 == nil then
    print("There are no entries in system")
  else
    for _FORV_9_, _FORV_10_ in pairs(L0_180) do
      if L0_180[0 + 1] ~= nil then
        profileId = L0_180[0 + 1]["CaptivePortalPageDetails.profileId"] or ""
        profileName = L0_180[0 + 1]["CaptivePortalPageDetails.configurationName"] or ""
        resTab.insertField(L1_181, "Profile-Id", profileId or "")
        resTab.insertField(L1_181, "Profile Name", profileName or "")
      end
    end
    resTab.print(L1_181, 0)
  end
end
function vlanAvailableDelete(A0_182)
  local L1_183, L2_184, L3_185, L4_186, L5_187, L6_188, L7_189
  L1_183 = db
  L1_183 = L1_183.getRow
  L2_184 = "VlanStatus"
  L3_185 = "_ROWID_"
  L4_186 = "1"
  L1_183 = L1_183(L2_184, L3_185, L4_186)
  L2_184 = L1_183["VlanStatus.VlanState"]
  if L2_184 == "0" then
    L2_184 = printCLIError
    L3_185 = "Please enable vlan before deleting available vlans"
    L2_184(L3_185)
    L2_184 = false
    return L2_184
  end
  L2_184 = nil
  L3_185 = ""
  L4_186 = nil
  L5_187 = "vlan"
  DBTable = L5_187
  L5_187 = db
  L5_187 = L5_187.getAttribute
  L6_188 = "vlan"
  L7_189 = "vlan.vlanId"
  L5_187 = L5_187(L6_188, L7_189, A0_182[1], "_ROWID_")
  if L5_187 == nil then
    L6_188 = printCLIError
    L7_189 = "No vlan exist with this given Rowid"
    L6_188(L7_189)
    L6_188 = false
    return L6_188
  else
    L6_188 = db
    L6_188 = L6_188.getRow
    L7_189 = "vlan"
    L6_188 = L6_188(L7_189, "vlan._ROWID_", L5_187)
    L7_189 = L6_188["vlan.vlanId"]
    if L7_189 ~= "1" then
      L7_189 = L6_188["vlan.vlanName"]
    elseif L7_189 == "Default" then
      L7_189 = printCLIError
      L7_189("This vlan is default it cannot be deleted")
    end
    L7_189 = {}
    L7_189["vlan.vlanId"] = L6_188["vlan.vlanId"]
    L7_189["1"] = L6_188["vlan.vlanId"]
    L2_184, L3_185 = vlanConfig.vlanDeleteCheck(L7_189)
    if L2_184 == "OK" then
      L2_184, L3_185 = vlanConfig.vlanConfig(L7_189, "-1", "delete")
      _UPVALUE0_.accountingVlanServerDelete(L6_188["vlan.vlanId"])
      _UPVALUE1_.authenticatingVlanServerDelete(L6_188["vlan.vlanId"])
    end
  end
  if L2_184 == "OK" then
    L6_188 = db
    L6_188 = L6_188.save
    L6_188()
  else
    L6_188 = printCLIError
    L7_189 = "VLANID is in use"
    L6_188(L7_189)
  end
  L6_188 = db
  L6_188 = L6_188.getAttribute
  L7_189 = "stringsMap"
  L6_188 = L6_188(L7_189, "stringId", L3_185, LANGUAGE)
  L4_186 = L6_188 or L3_185
  L6_188 = L2_184
  L7_189 = L4_186
  return L6_188, L7_189
end
function vlanConfigEnable()
  local L0_190, L1_191, L2_192, L3_193, L4_194
  L1_191 = ""
  L2_192 = nil
  L3_193 = "1"
  L4_194 = "VlanStatus"
  DBTable = L4_194
  L4_194 = {}
  if db.existsRow("VlanStatus", "VlanState", L3_193) == false then
    L4_194["VlanStatus.VlanState"] = L3_193
  else
    printCLIError("Vlan configuration already in same state")
  end
  L0_190, L1_191 = vlanConfig.vlanStatusConfig(L4_194, "1", "edit")
  if L0_190 == "OK" then
    db.save()
  end
  L2_192 = db.getAttribute("stringsMap", "stringId", L1_191, LANGUAGE)
  return L0_190, L2_192
end
function vlanConfigDisable()
  local L0_195, L1_196, L2_197, L3_198, L4_199
  L1_196 = ""
  L2_197 = nil
  L3_198 = "0"
  L4_199 = "VlanStatus"
  DBTable = L4_199
  L4_199 = {}
  if db.existsRow("VlanStatus", "VlanState", L3_198) == false then
    L4_199["VlanStatus.VlanState"] = L3_198
  else
    printCLIError("Vlan configuration already in same state")
  end
  L0_195, L1_196 = vlanConfig.vlanStatusConfig(L4_199, "1", "edit")
  if L0_195 == "OK" then
    db.save()
  end
  L2_197 = db.getAttribute("stringsMap", "stringId", L1_196, LANGUAGE)
  return L0_195, L2_197
end
function MultiVlanSubGet()
  local L0_200, L1_201, L2_202, L3_203, L4_204, L5_205, L6_206, L7_207, L8_208, L9_209, L10_210, L11_211
  L0_200 = {}
  L1_201 = db
  L1_201 = L1_201.getTable
  L2_202 = "vlan"
  L1_201 = L1_201(L2_202)
  L2_202 = nil
  L3_203 = "0"
  L4_204 = ""
  L5_205(L6_206)
  for L8_208, L9_209 in L5_205(L6_206) do
    L3_203 = L3_203 + 1
    L2_202 = L1_201[L3_203]
    if L3_203 ~= nil then
      L10_210 = L2_202["vlan.portName"]
      if L10_210 == "dummy" then
        L10_210 = resTab
        L10_210 = L10_210.insertField
        L11_211 = L0_200
        L10_210(L11_211, "Vlan ID", L2_202["vlan.vlanId"])
        L10_210 = L2_202["vlan.vlanId"]
        if L10_210 == "1" then
          L4_204 = "LAN"
        else
          L10_210 = "LAN"
          L11_211 = L2_202["vlan.vlanId"]
          L4_204 = L10_210 .. L11_211
        end
        L10_210 = "LogicalIfName='"
        L11_211 = L4_204
        L10_210 = L10_210 .. L11_211 .. "' and AddressFamily=2"
        L11_211 = db
        L11_211 = L11_211.getRowWhere
        L11_211 = L11_211("ifStatic", L10_210)
        if L11_211 == nil then
          L11_211 = {}
        end
        resTab.insertField(L0_200, "IP Address ", L11_211["ifStatic.StaticIp"] or "192.168.10.1")
        resTab.insertField(L0_200, "Subnet Mask ", L11_211["ifStatic.NetMask"] or "255.255.255.0")
      end
    end
  end
  L5_205(L6_206, L7_207)
end
function PortvlanCfgGet()
  local L0_212, L1_213, L2_214, L3_215, L4_216, L5_217, L6_218, L7_219, L8_220, L9_221, L10_222, L11_223, L12_224, L13_225, L14_226, L15_227, L16_228, L17_229, L18_230, L19_231, L20_232, L21_233, L22_234
  L0_212 = {}
  L1_213 = db
  L1_213 = L1_213.getTable
  L2_214 = "VlanPortMgmt"
  L1_213 = L1_213(L2_214)
  L2_214 = 0
  L3_215 = 0
  L4_216 = 0
  L5_217 = 0
  L6_218 = 0
  L7_219 = {}
  L7_219[0] = "null"
  L8_220 = db
  L8_220 = L8_220.getRow
  L9_221 = "VlanStatus"
  L8_220 = L8_220(L9_221, L10_222, L11_223)
  L9_221 = L8_220["VlanStatus.VlanState"]
  L9_221 = L9_221 == "1"
  for L13_225, L14_226 in L10_222(L11_223) do
    L5_217 = L5_217 + 1
    L3_215 = L3_215 + 1
    L15_227 = L1_213[L3_215]
    L16_228 = db
    L16_228 = L16_228.getAttribute
    L17_229 = "networkInterface"
    L18_230 = "interfaceName"
    L19_231 = L15_227["VlanPortMgmt.PhyInterfaceName"]
    L20_232 = "ifType"
    L16_228 = L16_228(L17_229, L18_230, L19_231, L20_232)
    if L16_228 ~= "dot11" then
      L17_229 = ""
      if L9_221 ~= false then
        L18_230 = L15_227["VlanPortMgmt.PortVlanMode"]
      else
        if L18_230 == "0" then
          L17_229 = "Access"
      end
      else
        L18_230 = L15_227["VlanPortMgmt.PortVlanMode"]
        if L18_230 == "1" then
          L17_229 = "General"
        else
          L18_230 = L15_227["VlanPortMgmt.PortVlanMode"]
          if L18_230 == "2" then
            L17_229 = "Trunk"
          end
        end
      end
      L18_230 = ""
      L19_231 = "Edit Port VLAN Configuration"
      if L9_221 == false then
        L18_230 = "disabled"
        L19_231 = "Disabled"
      else
        L20_232 = editAllow
        if L20_232 ~= "" then
          L20_232 = L15_227["VlanPortMgmt.PortType"]
          if L20_232 ~= "LAN" then
            L20_232 = L15_227["VlanPortMgmt.PortType"]
            if L20_232 ~= "BRIDGE" then
              L18_230 = editAllow
              L19_231 = "Disabled"
            end
          end
        end
      end
      L20_232 = "vlan."
      L21_233 = "portName"
      L20_232 = L20_232 .. L21_233
      L21_233 = ""
      L22_234 = db
      L22_234 = L22_234.getTable
      L22_234 = L22_234("vlan")
      for _FORV_27_, _FORV_28_ in pairs(L22_234) do
        if L22_234[0 + 1]["vlan.portName"] == "dummy" then
          for _FORV_34_, _FORV_35_ in pairs(L22_234) do
            if L22_234[0 + 1]["vlan.portName"] == L15_227["VlanPortMgmt.PortLogicalName"] and L22_234[0 + 1]["vlan.vlanId"] == L22_234[0 + 1]["vlan.vlanId"] then
              if L9_221 == false then
                L21_233 = "1"
              elseif L21_233 == "" then
                L21_233 = L22_234[0 + 1]["vlan.vlanId"]
              else
                L21_233 = L21_233 .. ", " .. L22_234[0 + 1]["vlan.vlanId"]
              end
            end
          end
        end
      end
      if L15_227["VlanPortMgmt.PortName"] ~= "dummy" and L15_227["VlanPortMgmt.PortType"] == "LAN" and L15_227["VlanPortMgmt.PhyInterfaceName"] == LAN_INTF_PHY_NAME then
        for _FORV_27_ = 0, L5_217 do
          if L7_219[_FORV_27_] == L15_227["VlanPortMgmt.PortName"] then
            L6_218 = 1
          end
        end
        if L6_218 == 0 then
          L2_214 = L2_214 + 1
          if string.find(L15_227["VlanPortMgmt.PortName"], "Port") ~= nil then
            if string.find(L15_227["VlanPortMgmt.PortName"], "Port") == 0 or string.find(L15_227["VlanPortMgmt.PortName"], "Port") == 1 then
              L15_227["VlanPortMgmt.PortName"] = string.gsub(L15_227["VlanPortMgmt.PortName"], "Port", "Port ")
            else
              L15_227["VlanPortMgmt.PortName"] = string.gsub(L15_227["VlanPortMgmt.PortName"], "Port", " Port")
            end
          else
            L15_227["VlanPortMgmt.PortName"] = string.gsub(L15_227["VlanPortMgmt.PortName"], "WAN", " WAN")
          end
          resTab.insertField(L0_212, "Port Name", L15_227["VlanPortMgmt.PortName"] or "")
          resTab.insertField(L0_212, "MODE", L17_229 or "")
          resTab.insertField(L0_212, "PVID", L15_227["VlanPortMgmt.DefaultPVID"] or "")
          resTab.insertField(L0_212, "Vlan Membership", L21_233 or "")
          L7_219[L4_216] = L15_227["VlanPortMgmt.PortName"]
          L4_216 = L4_216 + 1
        end
        L6_218 = 0
      end
    end
  end
  L10_222(L11_223, L12_224)
end
function PortWvlanCfgGet()
  local L0_235, L1_236, L2_237, L3_238, L4_239, L5_240, L6_241, L7_242, L8_243, L9_244, L10_245, L11_246, L12_247, L13_248, L14_249, L15_250, L16_251, L17_252
  L0_235 = {}
  L1_236 = db
  L1_236 = L1_236.getTable
  L2_237 = "VlanPortMgmt"
  L1_236 = L1_236(L2_237)
  L2_237 = 0
  L3_238 = 0
  L4_239 = 0
  L5_240 = 0
  L6_241 = db
  L6_241 = L6_241.getRow
  L6_241 = L6_241(L7_242, L8_243, L9_244)
  for L10_245, L11_246 in L7_242(L8_243) do
    L4_239 = L4_239 + 1
    L3_238 = L3_238 + 1
    L12_247 = L1_236[L3_238]
    L13_248 = db
    L13_248 = L13_248.getAttribute
    L14_249 = "networkInterface"
    L15_250 = "interfaceName"
    L16_251 = L12_247["VlanPortMgmt.PhyInterfaceName"]
    L17_252 = "ifType"
    L13_248 = L13_248(L14_249, L15_250, L16_251, L17_252)
    if L13_248 == "dot11" then
      L14_249 = ""
      L15_250 = L6_241["VlanStatus.VlanState"]
      if L15_250 ~= "0" then
        L15_250 = L12_247["VlanPortMgmt.PortVlanMode"]
      else
        if L15_250 == "0" then
          L14_249 = "Access"
      end
      else
        L15_250 = L12_247["VlanPortMgmt.PortVlanMode"]
        if L15_250 == "1" then
          L14_249 = "General"
        else
          L15_250 = L12_247["VlanPortMgmt.PortVlanMode"]
          if L15_250 == "2" then
            L14_249 = "Trunk"
          end
        end
      end
      L15_250 = "vlan."
      L16_251 = "portName"
      L15_250 = L15_250 .. L16_251
      L16_251 = ""
      L17_252 = db
      L17_252 = L17_252.getTable
      L17_252 = L17_252("vlan")
      for _FORV_22_, _FORV_23_ in pairs(L17_252) do
        if L17_252[0 + 1]["vlan.portName"] == "dummy" then
          for _FORV_29_, _FORV_30_ in pairs(L17_252) do
            if L17_252[0 + 1]["vlan.portName"] == L12_247["VlanPortMgmt.PortLogicalName"] and L17_252[0 + 1]["vlan.vlanId"] == L17_252[0 + 1]["vlan.vlanId"] then
              if L6_241["VlanStatus.VlanState"] == "0" then
                L16_251 = "1"
              elseif L16_251 == "" then
                L16_251 = L17_252[0 + 1]["vlan.vlanId"]
              else
                L16_251 = L16_251 .. ", " .. L17_252[0 + 1]["vlan.vlanId"]
              end
            end
          end
        end
      end
      if L12_247["VlanPortMgmt.PortName"] ~= "dummy" and L5_240 == 0 then
        if L12_247["VlanPortMgmt.PortType"] ~= "VAP-DISABLED" then
          L2_237 = L2_237 + 1
          if string.find(L12_247["VlanPortMgmt.PortName"], "Port") ~= nil then
            if string.find(L12_247["VlanPortMgmt.PortName"], "Port") == 0 or string.find(L12_247["VlanPortMgmt.PortName"], "Port") == 1 then
              L12_247["VlanPortMgmt.PortName"] = string.gsub(L12_247["VlanPortMgmt.PortName"], "Port", "Port ")
            else
              L12_247["VlanPortMgmt.PortName"] = string.gsub(L12_247["VlanPortMgmt.PortName"], "Port", " Port")
            end
          else
            L12_247["VlanPortMgmt.PortName"] = string.gsub(L12_247["VlanPortMgmt.PortName"], "WAN", " WAN")
          end
          if UNIT_NAME == "DSR-1000AC" then
            if db.getAttribute("dot11Interface", "interfaceName", L12_247["VlanPortMgmt.PhyInterfaceName"], "radioNo") == "1" then
            else
            end
          end
          resTab.insertField(L0_235, "PORT NO.", L12_247["VlanPortMgmt.PortNumber"] or "")
          resTab.insertField(L0_235, "SSID", L12_247["VlanPortMgmt.PortName"] or "")
          resTab.insertField(L0_235, "MODE", L14_249 or "")
          resTab.insertField(L0_235, "PVID", L12_247["VlanPortMgmt.DefaultPVID"] or "")
          resTab.insertField(L0_235, "Vlan Membership", L16_251 or "")
          if UNIT_NAME == "DSR-1000AC" then
            resTab.insertField(L0_235, "Radio Type Description", "2.4 Ghz" or "")
          end
        end
        L5_240 = 0
      end
    end
  end
  L7_242(L8_243, L9_244)
end
