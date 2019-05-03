local L0_0
L0_0 = require
L0_0("teamf1lualib/igmp")
L0_0 = require
L0_0("teamf1lualib/igmpSnooping_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.network.igmpSnooping")
function IgmpCfgInit()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getRow
  L0_1 = L0_1("Igmp", "Igmp._ROWID_", 1)
  return 1, L0_1
end
function checkConnType(A0_2, A1_3, A2_4)
  if A2_4 == "0" then
    if A1_3["Igmp.connectionType"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN1"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionType"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN1"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  if A2_4 == "1" then
    if A1_3["Igmp.connectionType"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN2"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionType"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN2"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  if A2_4 == "2" then
    if A1_3["Igmp.connectionTypePri"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN1"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionTypePri"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN1"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  if A2_4 == "3" then
    if A1_3["Igmp.connectionTypeSec"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN2"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionTypeSec"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN2"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  if A2_4 == "4" then
    if A1_3["Igmp.connectionTypePri"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN2"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionTypePri"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN2"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  if A2_4 == "5" then
    if A1_3["Igmp.connectionTypeSec"] == "pptp" then
      if A0_2["Igmp.upstreamInterfaceWAN1"] == "2" then
        printCLIError("Connection Type is pptp.Choose WAN-DHCP or WAN-PPTP")
        return "0"
      end
    elseif A1_3["Igmp.connectionTypeSec"] == "l2tp" and A0_2["Igmp.upstreamInterfaceWAN1"] == "1" then
      printCLIError("Connection Type is l2tp.Choose WAN-DHCP or WAN-L2TP")
      return "0"
    end
  end
  return "1"
end
function IgmpCfgInputVal(A0_5)
  local L1_6, L2_7, L3_8, L4_9
  L1_6 = db
  L1_6 = L1_6.getRow
  L2_7 = "Igmp"
  L3_8 = "Igmp._ROWID_"
  L4_9 = 1
  L1_6 = L1_6(L2_7, L3_8, L4_9)
  L2_7 = ""
  L3_8 = ""
  L4_9 = igmp
  L4_9 = L4_9.show
  L4_9 = L4_9()
  if A0_5["Igmp.IgmpEnable"] ~= "1" then
    if A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
      printCLIError("Upstream Interface is configurable only when Igmp proxy is enabled")
      return false
    end
  elseif A0_5["Igmp.IgmpEnable"] == "1" then
    if L4_9["Igmp.wanMode"] == "0" then
      if L4_9["Igmp.LogicalIfName"] == "WAN1" then
        A0_5["Igmp.upstreamInterfaceWAN2"] = L1_6["Igmp.upstreamInterfaceWAN2"]
      elseif L4_9["Igmp.LogicalIfName"] == "WAN2" then
        A0_5["Igmp.upstreamInterfaceWAN1"] = L1_6["Igmp.upstreamInterfaceWAN1"]
      end
    end
    if A0_5["Igmp.upstreamInterfaceWAN1"] == L1_6["Igmp.upstreamInterfaceWAN1"] and A0_5["Igmp.upstreamInterfaceWAN2"] == L1_6["Igmp.upstreamInterfaceWAN2"] then
      return true
    end
    if L4_9["Igmp.wanMode"] == "0" then
      if L4_9["Igmp.dualAccess"] == "0" then
        printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp or selected WAN is not Dedicated WAN")
        return false
      elseif L4_9["Igmp.dualAccess"] == "1" then
        if L4_9["Igmp.LogicalIfName"] == "WAN1" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("Upstream Interface can be configured for Dedicated WAN only.")
          return false
        elseif L4_9["Igmp.LogicalIfName"] == "WAN1" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          L2_7 = "0"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        elseif L4_9["Igmp.LogicalIfName"] == "WAN2" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          L2_7 = "1"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        elseif L4_9["Igmp.LogicalIfName"] == "WAN2" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          printCLIError("Upstream Interface can be configured for Dedicated WAN only")
          return false
        elseif L4_9["Igmp.LogicalIfName"] == "WAN3" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("WAN1/WAN2 is not dedicated WAN")
        end
      end
    elseif L4_9["Igmp.wanMode"] == "2" then
      if L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN1" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN2" then
        if L4_9["Igmp.dualAccessPri"] == "0" and (A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN1"] == L1_6["Igmp.upstreamInterfaceWAN1"]) then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "1" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          L2_7 = "2"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
        if L4_9["Igmp.dualAccessSec"] == "0" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "1" and (A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] or A0_5["Igmp.upstreamInterfaceWAN2"] == L1_6["Igmp.upstreamInterfaceWAN2"]) then
          L2_7 = "3"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      elseif L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN2" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN1" then
        if L4_9["Igmp.dualAccessPri"] == "0" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "1" and (A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] or A0_5["Igmp.upstreamInterfaceWAN2"] == L1_6["Igmp.upstreamInterfaceWAN2"]) then
          L2_7 = "4"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
        if L4_9["Igmp.dualAccessSec"] == "0" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "1" and (A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN1"] == L1_6["Igmp.upstreamInterfaceWAN1"]) then
          L2_7 = "5"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      elseif L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN3" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN1" then
        if A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("Upstream Interface cannot be configured as WAN2 is not configurable WAN.")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "0" and (A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN1"] == L1_6["Igmp.upstreamInterfaceWAN1"]) then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "1" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          L2_7 = "5"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      elseif L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN3" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN2" then
        if A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          printCLIError("Upstream Interface can be configured for Dedicated WAN or Configurable port")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "0" and (A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] or A0_5["Igmp.upstreamInterfaceWAN2"] == L1_6["Igmp.upstreamInterfaceWAN2"]) then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessSec"] == "1" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          L2_7 = "3"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      elseif L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN1" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN3" then
        if A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          printCLIError("Upstream Interface can be configured for Dedicated WAN or Configurable port")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "0" and (A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] or A0_5["Igmp.upstreamInterfaceWAN1"] == L1_6["Igmp.upstreamInterfaceWAN1"]) then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "1" and A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          L2_7 = "2"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      elseif L4_9["Igmp.FailoverPriLogicalIfName"] == "WAN2" and L4_9["Igmp.FailoverSecLogicalIfName"] == "WAN3" then
        if A0_5["Igmp.upstreamInterfaceWAN1"] ~= L1_6["Igmp.upstreamInterfaceWAN1"] then
          printCLIError("Upstream Interface can be configured for Dedicated WAN or Configurable port")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "0" and (A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] or A0_5["Igmp.upstreamInterfaceWAN2"] == L1_6["Igmp.upstreamInterfaceWAN2"]) then
          printCLIError("Upstream Interface should be configured only for Russian Dual Access pptp/l2tp")
          return false
        elseif L4_9["Igmp.dualAccessPri"] == "1" and A0_5["Igmp.upstreamInterfaceWAN2"] ~= L1_6["Igmp.upstreamInterfaceWAN2"] then
          L2_7 = "4"
          L3_8 = checkConnType(A0_5, L4_9, L2_7)
          if L3_8 == "0" then
            return false
          end
        end
      end
    end
  end
  return true
end
function IgmpCfgSave(A0_10)
  local L1_11, L2_12, L3_13
  L1_11 = "OK"
  L2_12 = ""
  L3_13 = ""
  L1_11, L2_12 = igmp.config(A0_10, A0_10["Igmp._ROWID_"], "edit")
  if L1_11 == "OK" then
    db.save()
  end
  L3_13 = db.getAttribute("stringsMap", "stringId", L2_12, LANGUAGE) or L2_12
  return L1_11, L3_13
end
function IgmpCfgShow(A0_14)
  configRow = db.getRow("Igmp", "_ROWID_", "1")
  printLabel("IGMP Configuration")
  if configRow["Igmp.IgmpEnable"] == "1" then
    print("Igmp Proxy: Enabled")
  else
    print("Igmp Proxy: Disabled")
  end
  if A0_14 == "1" then
    if configRow["Igmp.upstreamInterfaceWAN1"] == "1" then
      print("UpstreamInterface WAN : WAN-PPTP")
    else
      print("UpstreamInterface WAN : WAN-DHCP")
    end
  elseif A0_14 == "2" then
    if configRow["Igmp.upstreamInterfaceWAN1"] == "1" then
      print("UpstreamInterface WAN1 : WAN-PPTP")
    elseif configRow["Igmp.upstreamInterfaceWAN1"] == "2" then
      print("UpstreamInterface WAN1 : WAN-L2TP")
    else
      print("UpstreamInterface WAN1 : WAN-DHCP")
    end
    if configRow["Igmp.upstreamInterfaceWAN2"] == "1" then
      print("UpstreamInterface WAN2 : WAN-PPTP")
    elseif configRow["Igmp.upstreamInterfaceWAN2"] == "2" then
      print("UpstreamInterface WAN2 : WAN-L2TP")
    else
      print("UpstreamInterface WAN2 : WAN-DHCP")
    end
  end
end
function IgmpSnoopingCfgInit()
  local L0_15
  L0_15 = db
  L0_15 = L0_15.getRow
  L0_15 = L0_15("igmpSnooping", "_ROWID_", "1")
  L0_15["igmpSnooping.Status"] = L0_15["igmpSnooping.status"]
  return 1, L0_15
end
function IgmpSnoopingCfgInputVal(A0_16)
  local L1_17
  L1_17 = true
  return L1_17
end
function IgmpSnoopingCfgSave(A0_18)
  local L1_19, L2_20, L3_21, L4_22
  L1_19 = "OK"
  L2_20 = ""
  L3_21 = ""
  L4_22 = nil
  L1_19, L4_22 = _UPVALUE0_.igmpSnoopingSectionSet(A0_18)
  L3_21 = _UPVALUE1_.errorStringGet(L1_19)
  if L1_19 == 0 then
    L1_19 = "OK"
    db.save()
  else
    L1_19 = "ERROR"
  end
  return L1_19, L3_21
end
function IgmpPortmapCfgInit(A0_23)
  local L1_24
  L1_24 = db
  L1_24 = L1_24.getRow
  L1_24 = L1_24("igmpPortMap", "vlanId", A0_23[1])
  if L1_24 ~= nil then
    L1_24["igmpSnooping.vlanId"] = L1_24["igmpPortMap.vlanId"]
    L1_24["igmpSnooping.membership"] = L1_24["igmpPortMap.igmpPortMap"]
    L1_24["igmpSnooping.cookie"] = L1_24["igmpPortMap._ROWID_"]
  end
  return 1, L1_24
end
function IgmpPortmapCfgInputVal(A0_25)
  if db.getAttribute("igmpSnooping", "_ROWID_", "1", "status") == "0" then
    printCLIError("IGMP Snooping is disabled, please enable" .. " snooping to configure igmp portmembership")
    return false
  end
  if A0_25["igmpSnooping.vlanId"] == nil then
    printCLIError("VLAN id is not exist in igmp portmembership," .. " please enter correct valid vlan id")
    return false
  end
  if memberShipCheck(A0_25["igmpSnooping.vlanId"], A0_25["igmpSnooping.membership"]) == false then
    printCLIError("Please enter valid igmp portmembership.")
    return false
  end
  return true
end
function IgmpPortmapCfgSave(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  L1_27 = "OK"
  L2_28 = ""
  L3_29 = ""
  L4_30 = nil
  L1_27, L4_30 = _UPVALUE0_.igmpSnoopingPortSectionSet(A0_26)
  L3_29 = _UPVALUE1_.errorStringGet(L1_27)
  if L1_27 == 0 then
    L1_27 = "OK"
    db.save()
  else
    L1_27 = "ERROR"
  end
  return L1_27, L3_29
end
function memberShipCheck(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43
  L2_33 = 0
  L3_34 = 0
  if A1_32 == nil then
    L4_35 = false
    return L4_35
  end
  L4_35 = util
  L4_35 = L4_35.split
  L5_36 = A1_32
  L6_37 = ","
  L4_35 = L4_35(L5_36, L6_37)
  L5_36 = {}
  L6_37 = portVlanGetAll
  L7_38 = L6_37()
  for L11_42, L12_43 in L8_39(L9_40) do
    L2_33 = L2_33 + 1
    if A0_31 == L7_38[L2_33]["vlanportmgmt.DefaultPVID"] or (L7_38[L2_33]["vlanportmgmt.portModeName"] == "General" or L7_38[L2_33]["vlanportmgmt.portModeName"] == "Trunk") and string.find(L7_38[L2_33]["vlanportmgmt.participation"], A0_31) ~= nil then
      L3_34 = L3_34 + 1
      L5_36[L3_34] = tostring(tonumber(L7_38[L2_33]["vlanportmgmt.PortNumber"]) + 1)
    end
  end
  for L11_42, L12_43 in L8_39(L9_40) do
    if util.keyTableValueExists(L5_36, L12_43) == nil then
      return false
    end
  end
  return L8_39
end
function IgmpSnoopingCfgShow()
  local L0_44, L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55
  L0_44 = db
  L0_44 = L0_44.getRow
  L1_45 = "igmpSnooping"
  L2_46 = "_ROWID_"
  L0_44 = L0_44(L1_45, L2_46, L3_47)
  configRow = L0_44
  L0_44 = printLabel
  L1_45 = "IGMP snooping Configuration"
  L0_44(L1_45)
  L0_44 = configRow
  L0_44 = L0_44["igmpSnooping.status"]
  if L0_44 == "1" then
    L0_44 = print
    L1_45 = "Igmp Snooping: Enabled"
    L0_44(L1_45)
  else
    L0_44 = print
    L1_45 = "Igmp Snooping: Disabled"
    L0_44(L1_45)
  end
  L0_44 = configRow
  L0_44 = L0_44["igmpSnooping.status"]
  if L0_44 == "1" then
    L0_44 = {}
    L1_45 = printLabel
    L2_46 = "IGMP Port membership Configuration"
    L1_45(L2_46)
    L1_45 = _UPVALUE0_
    L1_45 = L1_45.igmpSnoopingPortSectionGetAll
    L2_46 = L1_45()
    for L6_50, L7_51 in L3_47(L4_48) do
      L8_52 = {}
      L8_52 = L2_46[L6_50]
      L9_53 = L8_52.vlanId
      L10_54 = L8_52.portMemberShip
      L11_55 = L8_52.igmpPortMap
      resTab.insertField(L0_44, "VLAN ID", L9_53)
      resTab.insertField(L0_44, "Port Membership", L10_54)
      resTab.insertField(L0_44, "IGMP Port Membership", L11_55)
    end
    L3_47(L4_48, L5_49)
  end
end
