local L0_0
L0_0 = require
L0_0("teamf1lualib/bwLimit")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfiles_bl")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sessionLimitProfiles_bl")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).name = "name"
;({}).value = "value"
;({})["0"] = "10"
;({})["1"] = "30"
;({})["2"] = "60"
function bwProfileStatInit(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = A0_1[1]
  L2_3 = -1
  L3_4 = db
  L3_4 = L3_4.getRow
  L3_4 = L3_4("BandWidthProfileStatus", "Status", L1_2)
  if L3_4 == nil then
    L3_4 = {}
    L3_4["BandWidthProfileStatus.Status"] = L1_2
  else
    L2_3 = L3_4["BandWidthProfileStatus._ROWID_"]
  end
  return L2_3, L3_4
end
function bwProfileStatSave(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = "ERROR"
  L2_7 = ""
  L3_8, L4_9, L5_10 = nil, nil, nil
  DBTable = "BandWidthProfileStatus"
  if tonumber(A0_5["BandWidthProfileStatus.Status"]) == 0 then
    if (db.getAttribute("bandwidthmanagement", "_ROWID_", "1", "action") or "0") == "1" then
      L3_8 = "Bandwidth Management is enabled.Please disable Bandwidth Management to disable bandwidth profiles"
      return L1_6, L3_8
    end
  end
  L1_6, L2_7 = bwProfiles.profileConfig(A0_5, 1, "edit")
  if L1_6 == "OK" then
    db.save()
  end
  L3_8 = db.getAttribute("stringsMap", "stringId", L2_7, LANGUAGE)
  return L1_6, L3_8
end
function bwProfileStatInputVal(A0_11)
  local L1_12
  L1_12 = true
  return L1_12
end
function bwProfileCfgInit(A0_13)
  local L1_14
  L1_14 = A0_13[1]
  if L1_14 == nil then
    configRow = {}
    configRow["BandWidthProfile._ROWID_"] = "-1"
  else
    configRow = {}
    configRow["BandWidthProfile._ROWID_"] = L1_14
    configRow = db.getRow("BandWidthProfile", "_ROWID_", L1_14)
    if configRow == nil then
      print("Row does not exist")
      return false
    end
    if configRow["BandWidthProfile.ProfileName"] == "bandwidth_limit" then
      print("Profile reserved for Bandwidth Management")
      return false
    end
  end
  return configRow["BandWidthProfile._ROWID_"], configRow
end
function bwProfileCfgSave(A0_15)
  local L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L1_16 = "ERROR"
  L2_17 = ""
  L3_18 = ""
  L4_19 = "BandWidthProfile"
  DBTable = L4_19
  L4_19 = A0_15["BandWidthProfile._ROWID_"]
  L5_20 = PRODUCT_ID
  if L5_20 ~= "DSR-1000AC_Ax" then
    L5_20 = PRODUCT_ID
    if L5_20 ~= "DSR-500AC_Ax" then
      L5_20 = PRODUCT_ID
      if L5_20 ~= "DSR-1000_Bx" then
        L5_20 = PRODUCT_ID
        if L5_20 ~= "DSR-500_Bx" then
          L5_20 = PRODUCT_ID
          if L5_20 ~= "DSR-1000_Ax" then
            L5_20 = PRODUCT_ID
          end
        end
      end
    end
  else
    if L5_20 == "DSR-1000N_Ax" then
      L5_20 = 15
      _UPVALUE0_ = L5_20
  end
  else
    L5_20 = 8
    _UPVALUE0_ = L5_20
  end
  L5_20 = A0_15["BandWidthProfile.Policy"]
  if L5_20 == "0" then
    L5_20 = db
    L5_20 = L5_20.getRow
    L6_21 = "bandwidthmanagement"
    L7_22 = "_ROWID_"
    L8_23 = "1"
    L5_20 = L5_20(L6_21, L7_22, L8_23)
    L6_21 = L5_20["bandwidthmanagement.action"]
    if L6_21 == "1" then
      L6_21 = tonumber
      L7_22 = L5_20["bandwidthmanagement.bandwidthrate"]
      L6_21 = L6_21(L7_22)
      L7_22 = 100 - L6_21
      L7_22 = L7_22 * 1024
      L8_23 = 0
      if A0_15["BandWidthProfile.ProfileType"] == "1" then
        L8_23 = tonumber(A0_15["BandWidthProfile.MaximumRate"])
      else
        L8_23 = tonumber(_UPVALUE1_[A0_15["BandWidthProfile.Priority"]]) * 1024
      end
      if L7_22 < L8_23 then
        L3_18 = "Configured outbound bandwidth rate/priority exceeds the bandwidth available after excluding the rate reserved for Bandwidth Management"
        return "ERROR", L3_18
      end
    end
  end
  if L4_19 == "-1" then
    L5_20 = db
    L5_20 = L5_20.getTable
    L6_21 = "BandWidthProfile"
    L5_20 = L5_20(L6_21)
    if L5_20 ~= nil then
      L6_21 = #L5_20
      L7_22 = _UPVALUE0_
      if L6_21 >= L7_22 then
        L3_18 = "Bandwidth profiles maximum limit reached."
        L6_21 = L1_16
        L7_22 = L3_18
        return L6_21, L7_22
      end
    end
    L6_21 = bwProfiles
    L6_21 = L6_21.profileConfig
    L7_22 = A0_15
    L8_23 = "-1"
    L7_22 = L6_21(L7_22, L8_23, "add")
    L2_17 = L7_22
    L1_16 = L6_21
  else
    L5_20 = bwProfiles
    L5_20 = L5_20.profileConfig
    L6_21 = A0_15
    L7_22 = L4_19
    L8_23 = "edit"
    L6_21 = L5_20(L6_21, L7_22, L8_23)
    L2_17 = L6_21
    L1_16 = L5_20
  end
  if L1_16 == "OK" then
    L5_20 = db
    L5_20 = L5_20.save
    L5_20()
  end
  L5_20 = db
  L5_20 = L5_20.getAttribute
  L6_21 = "stringsMap"
  L7_22 = "stringId"
  L8_23 = L2_17
  L5_20 = L5_20(L6_21, L7_22, L8_23, LANGUAGE)
  L3_18 = L5_20 or L2_17
  L5_20 = L1_16
  L6_21 = L3_18
  return L5_20, L6_21
end
function bwProfileCfgDel(A0_24)
  local L1_25, L2_26, L3_27, L4_28, L5_29
  L1_25 = "OK"
  L2_26 = ""
  L3_27 = ""
  L4_28 = "BandWidthProfile"
  DBTable = L4_28
  L4_28 = db
  L4_28 = L4_28.getRow
  L5_29 = "BandWidthProfileStatus"
  L4_28 = L4_28(L5_29, "_ROWID_", "1")
  L5_29 = L4_28["BandWidthProfileStatus.Status"]
  if L5_29 == "0" then
    L5_29 = printCLIError
    L5_29("Bandwidth Profile Configuration failed, band width profile status is Disabled")
    L5_29 = nil
    return L5_29
  end
  if A0_24 ~= nil then
    L5_29 = {}
    configRow = L5_29
    L5_29 = configRow
    L5_29["BandWidthProfile._ROWID_"] = A0_24
    L5_29 = db
    L5_29 = L5_29.getRow
    L5_29 = L5_29("BandWidthProfile", "_ROWID_", A0_24)
    configRow = L5_29
    L5_29 = configRow
    if L5_29 == nil then
      L5_29 = print
      L5_29("Row does not exist")
      L5_29 = -1
      return L5_29, {}
    end
    L5_29 = configRow
    L5_29 = L5_29["BandWidthProfile.ProfileName"]
    if L5_29 == "bandwidth_limit" then
      L5_29 = print
      L5_29("Profile reserved for Bandwidth Management")
      L5_29 = false
      return L5_29
    end
  else
    L5_29 = print
    L5_29("Please enter ROW ID")
  end
  L5_29 = {}
  L5_29._ROWID_ = configRow["BandWidthProfile._ROWID_"]
  L1_25, L2_26 = bwProfiles.deleteProfiles(L5_29)
  if L1_25 == "OK" then
    db.save()
    print("Row Deleted")
  end
  L3_27 = db.getAttribute("stringsMap", "stringId", L2_26, LANGUAGE)
  return L1_25, L3_27
end
function bwProfileCfgInputVal(A0_30)
  local L1_31, L2_32
  L1_31 = db
  L1_31 = L1_31.getRow
  L2_32 = "BandWidthProfileStatus"
  L1_31 = L1_31(L2_32, "_ROWID_", "1")
  L2_32 = L1_31["BandWidthProfileStatus.Status"]
  if L2_32 == "0" then
    L2_32 = printCLIError
    L2_32("Bandwidth Profile Configuration failed, band width profile status is Disabled")
    L2_32 = false
    return L2_32
  end
  L2_32 = A0_30["BandWidthProfile._ROWID_"]
  if L2_32 ~= "-1" then
    L2_32 = db
    L2_32 = L2_32.getAttribute
    L2_32 = L2_32("BandWidthProfile", "_ROWID_", A0_30["BandWidthProfile._ROWID_"], "ProfileName")
    if #db.getRows("TrafficSelector", "ProfileName", L2_32) ~= 0 then
      printCLIError("Bandwidth Profile configuration failed as profile name is in use by traffic Selector.")
      return false
    end
  end
  L2_32 = A0_30["BandWidthProfile.ProfileName"]
  if L2_32 ~= nil then
    L2_32 = A0_30["BandWidthProfile.ProfileName"]
  elseif L2_32 == "" then
    L2_32 = printCLIError
    L2_32("Enter valid profile name\n")
    L2_32 = false
    return L2_32
  end
  L2_32 = A0_30["BandWidthProfile.Policy"]
  if L2_32 ~= nil then
    L2_32 = A0_30["BandWidthProfile.Policy"]
  elseif L2_32 == "" then
    L2_32 = printCLIError
    L2_32("Select valid policy type Inbound/Outbound\n")
    L2_32 = false
    return L2_32
  end
  L2_32 = A0_30["BandWidthProfile.ProfileType"]
  if L2_32 ~= nil then
    L2_32 = A0_30["BandWidthProfile.ProfileType"]
  elseif L2_32 == "" then
    L2_32 = printCLIError
    L2_32("Select valid profile type Priority/Bandwidth Rate\n")
    L2_32 = false
    return L2_32
  end
  L2_32 = A0_30["BandWidthProfile.ProfileType"]
  if L2_32 == "0" then
    L2_32 = A0_30["BandWidthProfile.Priority"]
    if L2_32 ~= "" then
      L2_32 = A0_30["BandWidthProfile.Priority"]
    elseif L2_32 == nil then
      L2_32 = printCLIError
      L2_32("Enter valid Priority Low/Medium/High\n")
      L2_32 = false
      return L2_32
    end
  end
  L2_32 = A0_30["BandWidthProfile.ProfileType"]
  if L2_32 == "1" then
    L2_32 = A0_30["BandWidthProfile.MinimumRate"]
    if L2_32 ~= "" then
      L2_32 = A0_30["BandWidthProfile.MaximumRate"]
      if L2_32 ~= "" then
        L2_32 = A0_30["BandWidthProfile.MinimumRate"]
        if L2_32 ~= nil then
          L2_32 = A0_30["BandWidthProfile.MaximumRate"]
        end
      end
    elseif L2_32 == nil then
      L2_32 = printCLIError
      L2_32("Enter valid bandwidth rate range\n")
      L2_32 = false
      return L2_32
    end
    L2_32 = A0_30["BandWidthProfile.MinimumRate"]
    if L2_32 ~= nil then
      L2_32 = A0_30["BandWidthProfile.MaximumRate"]
      if L2_32 ~= nil then
        L2_32 = tonumber
        L2_32 = L2_32(A0_30["BandWidthProfile.MaximumRate"])
        if L2_32 < tonumber(A0_30["BandWidthProfile.MinimumRate"]) then
          printCLIError("Invalid bandwidth rate range, Minimum bandwidth rate cannot be greater than Maximum bandwidth rate\n")
          return false
        end
      end
    end
  end
  L2_32 = A0_30["BandWidthProfile.Policy"]
  if L2_32 == "0" then
    L2_32 = UNIT_NAME
    if L2_32 ~= "DSR-1000N" then
      L2_32 = UNIT_NAME
      if L2_32 ~= "DSR-1000" then
        L2_32 = UNIT_NAME
      end
    else
      if L2_32 == "DSR-1000AC" then
        L2_32 = A0_30["BandWidthProfile.WANID"]
        if L2_32 ~= nil then
          L2_32 = A0_30["BandWidthProfile.WANID"]
          if L2_32 ~= "WAN1" then
            L2_32 = A0_30["BandWidthProfile.WANID"]
            if L2_32 ~= "WAN2" then
              L2_32 = A0_30["BandWidthProfile.WANID"]
            end
          end
        elseif L2_32 ~= "WAN3" then
          L2_32 = printCLIError
          L2_32("Enter valid WAN Interface type (WAN1/WAN2/WAN3) \n")
          L2_32 = false
          return L2_32
        end
    end
    else
      L2_32 = A0_30["BandWidthProfile.WANID"]
      if L2_32 ~= nil then
        L2_32 = A0_30["BandWidthProfile.WANID"]
        if L2_32 ~= "WAN1" then
          L2_32 = A0_30["BandWidthProfile.WANID"]
        end
      elseif L2_32 ~= "WAN2" then
        L2_32 = printCLIError
        L2_32("Enter valid WAN Interface type (WAN1/WAN2) \n")
        L2_32 = false
        return L2_32
      end
    end
  end
  L2_32 = A0_30["BandWidthProfile.Policy"]
  if L2_32 == "1" then
    L2_32 = A0_30["BandWidthProfile.WANID"]
    if L2_32 == nil then
      L2_32 = printCLIError
      L2_32("Enter valid LAN Interface type \n")
      L2_32 = false
      return L2_32
    else
      L2_32 = db
      L2_32 = L2_32.getRow
      L2_32 = L2_32("networkInterface", "LogicalIfName", A0_30["BandWidthProfile.WANID"])
      if L2_32 == nil or L2_32 == "" then
        printCLIError("Enter valid LAN/VLAN Interface type.Use <show net bandwidth profile interface_list> command to see list of interface for Inbound Bandwidth Profile")
        return false
      end
      if db.getAttribute("networkInterface", "LogicalIfName", A0_30["BandWidthProfile.WANID"], "ifType") ~= "bridge" then
        printCLIError("Enter valid LAN/VLAN Interface type.Use <show net bandwidth profile interface_list> command to see list of interface for Inbound Bandwidth Profile")
        return false
      end
    end
  end
  L2_32 = true
  return L2_32
end
function trafficSelectorCfgInit(A0_33)
  local L1_34
  L1_34 = A0_33[1]
  if L1_34 == nil then
    configRow = {}
    configRow["TrafficSelector._ROWID_"] = "-1"
    configRow["TrafficSelector.OID"] = "10"
  else
    configRow = db.getRow("TrafficSelector", "_ROWID_", L1_34)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
  end
  return configRow["TrafficSelector._ROWID_"], configRow
end
function trafficSelectorCfgSave(A0_35)
  local L1_36, L2_37, L3_38
  L1_36 = "ERROR"
  L2_37 = ""
  L3_38 = ""
  DBTable = "TrafficSelector"
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
    _UPVALUE0_ = 15
  else
    _UPVALUE0_ = 8
  end
  if A0_35["TrafficSelector._ROWID_"] == "-1" then
    if db.getTable("TrafficSelector") ~= nil and #db.getTable("TrafficSelector") >= _UPVALUE0_ then
      L3_38 = "Traffic selectors maximum limit reached."
      return L1_36, L3_38
    end
    L1_36, L2_37 = trafficSelector.profileConfig(A0_35, "-1", "add")
  else
    L1_36, L2_37 = trafficSelector.profileConfig(A0_35, A0_35["TrafficSelector._ROWID_"], "edit")
  end
  if L1_36 == "OK" then
    db.save()
  end
  L3_38 = db.getAttribute("stringsMap", "stringId", L2_37, LANGUAGE) or L2_37
  return L1_36, L3_38
end
function trafficSelectorCfgDel(A0_39)
  local L1_40, L2_41, L3_42, L4_43
  L1_40 = "ERROR"
  L2_41 = ""
  L3_42 = ""
  L4_43 = "TrafficSelector"
  DBTable = L4_43
  if A0_39 ~= nil then
    L4_43 = db
    L4_43 = L4_43.getRow
    L4_43 = L4_43("TrafficSelector", "_ROWID_", A0_39)
    configRow = L4_43
    L4_43 = configRow
    if L4_43 == nil then
      L4_43 = print
      L4_43("Row does not exist")
      L4_43 = -1
      return L4_43, {}
    end
  else
    L4_43 = print
    L4_43("Please enter the row id")
  end
  L4_43 = {}
  L4_43._ROWID_ = configRow["TrafficSelector._ROWID_"]
  L1_40, L2_41 = trafficSelector.profileConfig(L4_43, "-1", "delete")
  if L1_40 == "OK" then
    db.save()
  end
  L3_42 = db.getAttribute("stringsMap", "stringId", L2_41, LANGUAGE)
  return L1_40, L3_42
end
function trafficSelectorCfgInputVal(A0_44)
  local L1_45, L2_46, L3_47, L4_48, L5_49, L6_50, L7_51, L8_52, L9_53, L10_54, L11_55, L12_56, L13_57, L14_58, L15_59, L16_60, L17_61, L18_62, L19_63, L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70
  L1_45 = A0_44["TrafficSelector.ProfileName"]
  L2_46 = A0_44["TrafficSelector.ServiceName"]
  L3_47 = A0_44["TrafficSelector.MatchType"]
  L4_48 = A0_44["TrafficSelector.IPAddress"]
  L5_49 = A0_44["TrafficSelector.SubnetMask"]
  L6_50 = A0_44["TrafficSelector.MACAddress"]
  L7_51 = A0_44["TrafficSelector.PortName"]
  L8_52 = A0_44["TrafficSelector.VapName"]
  L9_53 = A0_44["TrafficSelector.VlanId"]
  L10_54 = db
  L10_54 = L10_54.getRow
  L11_55 = "BandWidthProfileStatus"
  L12_56 = "_ROWID_"
  L13_57 = "1"
  L10_54 = L10_54(L11_55, L12_56, L13_57)
  L11_55 = L10_54["BandWidthProfileStatus.Status"]
  if L11_55 ~= nil then
    L11_55 = L10_54["BandWidthProfileStatus.Status"]
    if L11_55 == "0" then
      L11_55 = printCLIError
      L12_56 = "Bandwidth Profile Status is Disabled"
      L11_55(L12_56)
      L11_55 = false
      return L11_55
    end
  else
    L11_55 = A0_44["TrafficSelector.ProfileName"]
    if L11_55 ~= nil then
      L11_55 = A0_44["TrafficSelector.ProfileName"]
    elseif L11_55 == "" then
      L11_55 = printCLIError
      L12_56 = "Enter valid bandwidth profile name. use <show net bandwidth profile setup> command to see the list of available profiles\n"
      L11_55(L12_56)
      L11_55 = false
      return L11_55
    end
    L11_55 = db
    L11_55 = L11_55.getRow
    L12_56 = "BandWidthProfile"
    L13_57 = "ProfileName"
    L14_58 = A0_44["TrafficSelector.ProfileName"]
    L11_55 = L11_55(L12_56, L13_57, L14_58)
    if L11_55 == nil then
      L12_56 = printCLIError
      L13_57 = "Invalid bandwidth profile name"
      L12_56(L13_57)
      L12_56 = false
      return L12_56
    end
    L12_56 = A0_44["TrafficSelector.ServiceName"]
    if L12_56 ~= nil then
      L12_56 = A0_44["TrafficSelector.ServiceName"]
    elseif L12_56 == "" then
      L12_56 = printCLIError
      L13_57 = "Enter valid service name. use <show net bandwidth traffic_selector services> to see the list of available services\n"
      L12_56(L13_57)
      L12_56 = false
      return L12_56
    end
    L12_56 = db
    L12_56 = L12_56.getRow
    L13_57 = "Services"
    L14_58 = "ServiceName"
    L12_56 = L12_56(L13_57, L14_58, L15_59)
    if L12_56 ~= nil then
      L13_57 = L12_56["Services.Protocol"]
      L14_58 = _UPVALUE0_
    elseif L13_57 == L14_58 then
      L13_57 = printCLIError
      L14_58 = "Invalid Service name, please enter valid service name\n"
      L13_57(L14_58)
      L13_57 = false
      return L13_57
    end
    L13_57 = L11_55["BandWidthProfile.Policy"]
    if L13_57 == "1" then
      L14_58 = db
      L14_58 = L14_58.getRowWhere
      L18_62 = "'"
      L14_58 = L14_58(L15_59, L16_60)
      if L15_59 ~= "0" then
      elseif L15_59 == "2" then
        if L15_59 > 73 then
          if L15_59 == 0 then
            if L15_59 == 0 then
              if L15_59 ~= 0 then
              elseif L15_59 == "" then
                L15_59(L16_60)
                return L15_59
              end
            end
          end
        end
      end
    end
    if L13_57 == "0" then
      L14_58 = db
      L14_58 = L14_58.getRowWhere
      L18_62 = "'"
      L14_58 = L14_58(L15_59, L16_60)
      if L15_59 ~= "0" then
      elseif L15_59 == "2" then
        if L15_59 > 73 then
          if L15_59 == 0 then
            if L15_59 == 0 then
              if L15_59 ~= 0 then
              elseif L15_59 == "" then
                L15_59(L16_60)
                return L15_59
              end
            end
          end
        end
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 ~= nil then
      L14_58 = A0_44["TrafficSelector.MatchType"]
    else
      if L14_58 == "" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
    end
    else
      L14_58 = L11_55["BandWidthProfile.Policy"]
      if L14_58 == "1" then
        L14_58 = A0_44["TrafficSelector.MatchType"]
        if L14_58 >= "3" then
          L14_58 = printCLIError
          L14_58(L15_59)
          L14_58 = false
          return L14_58
        end
      end
    end
    L14_58 = L11_55["BandWidthProfile.Policy"]
    if L14_58 == "1" then
      L14_58 = A0_44["TrafficSelector.MatchType"]
      if L14_58 == "2" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "1" then
      L14_58 = A0_44["TrafficSelector.IPAddress"]
      if L14_58 ~= "" then
        L14_58 = A0_44["TrafficSelector.IPAddress"]
      elseif L14_58 == nil then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "1" then
      L14_58 = A0_44["TrafficSelector.IPAddress"]
      if L14_58 == "0.0.0.0" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
      L14_58 = validations
      L14_58 = L14_58.split
      L14_58 = L14_58(L15_59, L16_60)
      if not (L15_59 < 1) then
        if not (L15_59 > 254) then
          if not (L15_59 < 1) then
          end
        end
      elseif L15_59 > 254 then
        L15_59(L16_60)
        return L15_59
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "1" then
      L14_58 = L11_55["BandWidthProfile.Policy"]
      if L14_58 ~= "0" then
        L14_58 = L11_55["BandWidthProfile.Policy"]
      elseif L14_58 == "1" then
        L14_58 = A0_44["TrafficSelector.SubnetMask"]
        if L14_58 ~= "" then
          L14_58 = A0_44["TrafficSelector.SubnetMask"]
        else
          if L14_58 == nil then
            L14_58 = printCLIError
            L14_58(L15_59)
            L14_58 = false
            return L14_58
        end
        else
          L14_58 = validations
          L14_58 = L14_58.split
          L14_58 = L14_58(L15_59, L16_60)
          L18_62 = L14_58[2]
          L19_63 = L14_58[3]
          L20_64 = L14_58[4]
          L26_70 = L16_60(L17_61, L18_62, L19_63, L20_64)
          if L15_59 == 1 then
            L16_60(L17_61)
            return L16_60
          end
        end
      end
    else
      L14_58 = A0_44["TrafficSelector.SubnetMask"]
      if L14_58 == "" then
        L14_58 = A0_44["TrafficSelector.SubnetMask"]
        if L14_58 == nil then
          L14_58 = A0_44["TrafficSelector.SubnetMask"]
        end
      elseif L14_58 == "0.0.0.0" then
        A0_44["TrafficSelector.SubnetMask"] = nil
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "2" then
      L14_58 = A0_44["TrafficSelector.MACAddress"]
      if L14_58 ~= nil then
        L14_58 = A0_44["TrafficSelector.MACAddress"]
      elseif L14_58 == "" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "3" then
      L14_58 = A0_44["TrafficSelector.PortName"]
      if L14_58 ~= nil then
        L14_58 = A0_44["TrafficSelector.PortName"]
      elseif L14_58 == "" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
      L14_58 = db
      L14_58 = L14_58.getRow
      L14_58 = L14_58(L15_59, L16_60, L17_61)
      if L14_58 == nil then
        L15_59(L16_60)
        return L15_59
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "4" then
      L14_58 = A0_44["TrafficSelector.VlanId"]
      if L14_58 ~= nil then
        L14_58 = A0_44["TrafficSelector.VlanId"]
      elseif L14_58 == "" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
      L14_58 = db
      L14_58 = L14_58.getRow
      L14_58 = L14_58(L15_59, L16_60, L17_61)
      if L14_58 == nil then
        L15_59(L16_60)
        return L15_59
      end
    end
    L14_58 = A0_44["TrafficSelector.MatchType"]
    if L14_58 == "6" then
      L14_58 = A0_44["TrafficSelector.VapName"]
      if L14_58 ~= nil then
        L14_58 = A0_44["TrafficSelector.VapName"]
      elseif L14_58 == "" then
        L14_58 = printCLIError
        L14_58(L15_59)
        L14_58 = false
        return L14_58
      end
      L14_58 = db
      L14_58 = L14_58.getRow
      L14_58 = L14_58(L15_59, L16_60, L17_61)
      if L14_58 == nil then
        L15_59(L16_60)
        return L15_59
      end
    end
    L14_58 = db
    L14_58 = L14_58.getTable
    L14_58 = L14_58(L15_59)
    for L18_62, L19_63 in L15_59(L16_60) do
      L20_64 = L14_58[L18_62]
      if L20_64 ~= nil then
        L20_64 = tonumber
        L21_65 = L14_58[L18_62]
        L21_65 = L21_65["TrafficSelector._ROWID_"]
        L20_64 = L20_64(L21_65)
        L21_65 = tonumber
        L22_66 = A0_44["TrafficSelector._ROWID_"]
        L21_65 = L21_65(L22_66)
        if L20_64 ~= L21_65 then
          L20_64 = L14_58[L18_62]
          L20_64 = L20_64["TrafficSelector.ServiceName"]
          if L20_64 == L2_46 then
            L20_64 = L14_58[L18_62]
            L20_64 = L20_64["TrafficSelector.ProfileName"]
            if L20_64 == L1_45 then
              L20_64 = tonumber
              L21_65 = L14_58[L18_62]
              L21_65 = L21_65["TrafficSelector.MatchType"]
              L20_64 = L20_64(L21_65)
              L21_65 = tonumber
              L22_66 = L3_47
              L21_65 = L21_65(L22_66)
              if L20_64 == L21_65 then
                if L3_47 == "1" then
                  L20_64 = L14_58[L18_62]
                  L20_64 = L20_64["TrafficSelector.IPAddress"]
                  if L20_64 == L4_48 then
                    L20_64 = L14_58[L18_62]
                    L20_64 = L20_64["TrafficSelector.SubnetMask"]
                    if L20_64 == L5_49 then
                      L20_64 = printCLIError
                      L21_65 = "Entry already exist.\n"
                      L20_64(L21_65)
                      L20_64 = false
                      return L20_64
                    end
                  end
                  L20_64, L21_65, L22_66, L23_67, L24_68, L25_69, L26_70 = nil, nil, nil, nil, nil, nil, nil
                  L25_69 = L14_58[L18_62]["TrafficSelector.IPAddress"]
                  L26_70 = L14_58[L18_62]["TrafficSelector.SubnetMask"]
                  L24_68, L20_64, L21_65 = validationsLuaLib.ipAddressRangeGet(L25_69, L26_70)
                  L24_68, L22_66, L23_67 = validationsLuaLib.ipAddressRangeGet(L4_48, L5_49)
                  L24_68 = validationsLuaLib.ipAddressRangesMatch(L20_64, L21_65, L22_66, L23_67)
                  if L24_68 == 0 then
                    printCLIError("Traffic Selector Rule Already exists.\n")
                    return false
                  end
                elseif L3_47 == "2" then
                  L20_64 = L14_58[L18_62]
                  L20_64 = L20_64["TrafficSelector.MACAddress"]
                  if L20_64 == L6_50 then
                    L20_64 = printCLIError
                    L21_65 = "Entry already exist.\n"
                    L20_64(L21_65)
                    L20_64 = false
                    return L20_64
                  end
                elseif L3_47 == "3" then
                  L20_64 = L14_58[L18_62]
                  L20_64 = L20_64["TrafficSelector.PortName"]
                  if L20_64 == L7_51 then
                    L20_64 = printCLIError
                    L21_65 = "Entry already exist.\n"
                    L20_64(L21_65)
                    L20_64 = false
                    return L20_64
                  end
                elseif L3_47 == "4" then
                  L20_64 = tonumber
                  L21_65 = L14_58[L18_62]
                  L21_65 = L21_65["TrafficSelector.VlanId"]
                  L20_64 = L20_64(L21_65)
                  L21_65 = tonumber
                  L22_66 = L9_53
                  L21_65 = L21_65(L22_66)
                  if L20_64 == L21_65 then
                    L20_64 = printCLIError
                    L21_65 = "Entry already exist.\n"
                    L20_64(L21_65)
                    L20_64 = false
                    return L20_64
                  end
                elseif L3_47 == "6" then
                  L20_64 = L14_58[L18_62]
                  L20_64 = L20_64["TrafficSelector.VapName"]
                  if L20_64 == L8_52 then
                    L20_64 = printCLIError
                    L21_65 = "Entry already exist.\n"
                    L20_64(L21_65)
                    L20_64 = false
                    return L20_64
                  end
                end
              end
            end
          end
        end
      end
    end
    return L15_59
  end
end
function bwProfileGet()
  local L0_71, L1_72, L2_73, L3_74, L4_75, L5_76, L6_77, L7_78, L8_79, L9_80, L10_81, L11_82, L12_83, L13_84
  L0_71 = db
  L0_71 = L0_71.getRow
  L1_72 = "BandWidthProfileStatus"
  L2_73 = "_ROWID_"
  L3_74 = "1"
  L0_71 = L0_71(L1_72, L2_73, L3_74)
  L1_72 = db
  L1_72 = L1_72.getTable
  L2_73 = "BandWidthProfile"
  L1_72 = L1_72(L2_73)
  L2_73 = {}
  L3_74 = {}
  L4_75 = nil
  L5_76 = 0
  L6_77 = L0_71["BandWidthProfileStatus.Status"]
  if L6_77 ~= nil then
    L6_77 = L0_71["BandWidthProfileStatus.Status"]
    if L6_77 == "0" then
      L6_77 = resTab
      L6_77 = L6_77.insertField
      L6_77(L7_78, L8_79, L9_80)
    end
  else
    L6_77 = resTab
    L6_77 = L6_77.insertField
    L6_77(L7_78, L8_79, L9_80)
  end
  L6_77 = "0"
  L7_78(L8_79)
  for L10_81, L11_82 in L7_78(L8_79) do
    L5_76 = L5_76 + 1
    L12_83 = L1_72[L5_76]
    L13_84 = L12_83["BandWidthProfile.ProfileName"]
    if L13_84 == "bandwidth_limit" then
      L6_77 = L12_83["BandWidthProfile._ROWID_"]
    end
    if L5_76 ~= nil then
      L13_84 = L12_83["BandWidthProfile.ProfileName"]
      if L13_84 ~= "bandwidth_limit" then
        L13_84 = resTab
        L13_84 = L13_84.insertField
        L13_84(L3_74, "ROW ID", L12_83["BandWidthProfile._ROWID_"] or "")
        L13_84 = resTab
        L13_84 = L13_84.insertField
        L13_84(L3_74, "Name", L12_83["BandWidthProfile.ProfileName"] or "")
        L13_84 = resTab
        L13_84 = L13_84.insertField
        L13_84(L3_74, "Interface", L12_83["BandWidthProfile.WANID"] or "")
        L13_84 = L12_83["BandWidthProfile.Policy"]
        if L13_84 == "0" then
          L13_84 = resTab
          L13_84 = L13_84.insertField
          L13_84(L3_74, "Bandwidth Policy Type ", "OUTBOUND")
        else
          L13_84 = L12_83["BandWidthProfile.Policy"]
          if L13_84 == "1" then
            L13_84 = resTab
            L13_84 = L13_84.insertField
            L13_84(L3_74, "Bandwidth Policy Type ", "INBOUND")
          end
        end
        L13_84 = L12_83["BandWidthProfile.ProfileType"]
        if L13_84 == "1" then
          L13_84 = L12_83["BandWidthProfile.MinimumRate"]
          L13_84 = L13_84 .. "-" .. L12_83["BandWidthProfile.MaximumRate"]
          resTab.insertField(L3_74, "Bandwidth Range/Priority", L13_84)
        else
          L13_84 = L12_83["BandWidthProfile.ProfileType"]
          if L13_84 == "0" then
            L13_84 = L12_83["BandWidthProfile.Priority"]
            if L13_84 == "0" then
              L13_84 = resTab
              L13_84 = L13_84.insertField
              L13_84(L3_74, "Bandwidth Range/Priority", "Low")
            else
              L13_84 = L12_83["BandWidthProfile.Priority"]
              if L13_84 == "1" then
                L13_84 = resTab
                L13_84 = L13_84.insertField
                L13_84(L3_74, "Bandwidth Range/Priority", "Medium")
              else
                L13_84 = L12_83["BandWidthProfile.Priority"]
                if L13_84 == "2" then
                  L13_84 = resTab
                  L13_84 = L13_84.insertField
                  L13_84(L3_74, "Bandwidth Range/Priority", "High")
                end
              end
            end
          end
        end
      end
    end
  end
  L7_78(L8_79, L9_80)
  L7_78(L8_79, L9_80)
  if L6_77 ~= "0" then
    L10_81 = " is reserved for Bandwidth Management while it is enabled"
    L7_78(L8_79)
  end
end
function trafficSelectorGet()
  local L0_85, L1_86
  L0_85 = db
  L0_85 = L0_85.getTable
  L1_86 = "TrafficSelector"
  L0_85 = L0_85(L1_86)
  L1_86 = {}
  printLabel("List of Available Traffic Selectors")
  for _FORV_7_, _FORV_8_ in pairs(L0_85) do
    if 0 + 1 ~= nil then
      resTab.insertField(L1_86, "ROW ID", L0_85[0 + 1]["TrafficSelector._ROWID_"] or "")
      resTab.insertField(L1_86, "Traffic Selector Details", L0_85[0 + 1]["TrafficSelector.ServiceName"] or "")
      resTab.insertField(L1_86, "Bandwidth Profile Name", L0_85[0 + 1]["TrafficSelector.ProfileName"] or "")
      if L0_85[0 + 1]["TrafficSelector.MatchType"] == "2" then
        resTab.insertField(L1_86, "Traffic Selector", "MAC Address")
      elseif L0_85[0 + 1]["TrafficSelector.MatchType"] == "1" then
        resTab.insertField(L1_86, "Traffic Selector", "IP Address")
      elseif L0_85[0 + 1]["TrafficSelector.MatchType"] == "3" then
        resTab.insertField(L1_86, "Traffic Selector", "Port Name")
      elseif L0_85[0 + 1]["TrafficSelector.MatchType"] == "4" then
        resTab.insertField(L1_86, "Traffic Selector", "Interface")
      elseif L0_85[0 + 1]["TrafficSelector.MatchType"] == "6" then
        resTab.insertField(L1_86, "Traffic Selector", "BSSID")
      end
    end
  end
  resTab.print(L1_86, 0)
end
function bwLanInterfaceGet()
  local L0_87, L1_88, L2_89, L3_90, L4_91
  L0_87 = 0
  L1_88 = {}
  L2_89 = nil
  L3_90 = "ifType = 'bridge'"
  L4_91 = db
  L4_91 = L4_91.getRowsWhere
  L4_91 = L4_91("networkInterface", L3_90)
  print("display available interfaces list \n")
  for _FORV_8_, _FORV_9_ in pairs(L4_91) do
    L0_87 = L0_87 + 1
    if L0_87 ~= nil then
      resTab.insertField(L1_88, "ROW ID", L4_91[L0_87]["networkInterface._ROWID_"] or "")
      resTab.insertField(L1_88, "LogicalIfName", L4_91[L0_87]["networkInterface.LogicalIfName"] or "")
    end
  end
  resTab.print(L1_88, 0)
end
function BssidListGet()
  local L0_92, L1_93, L2_94, L3_95
  L0_92 = 0
  L1_93 = {}
  L2_94 = nil
  L3_95 = db
  L3_95 = L3_95.getTable
  L3_95 = L3_95("dot11VAP")
  print("display available BSSID's list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_95) do
    L0_92 = L0_92 + 1
    if L0_92 ~= nil then
      resTab.insertField(L1_93, "ROW ID", L3_95[L0_92]["dot11VAP._ROWID_"] or "")
      resTab.insertField(L1_93, "vapName", L3_95[L0_92]["dot11VAP.vapName"] or "")
    end
  end
  resTab.print(L1_93, 0)
end
function ServiceListGet()
  local L0_96, L1_97, L2_98, L3_99
  L0_96 = 0
  L1_97 = {}
  L2_98 = nil
  L3_99 = db
  L3_99 = L3_99.getTable
  L3_99 = L3_99("Services")
  print("display available services list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_99) do
    L0_96 = L0_96 + 1
    if L0_96 ~= nil and L3_99[L0_96]["Services.Protocol"] ~= _UPVALUE0_ then
      resTab.insertField(L1_97, "ROW ID", L3_99[L0_96]["Services._ROWID_"] or "")
      resTab.insertField(L1_97, "ServiceName", L3_99[L0_96]["Services.ServiceName"] or "")
    end
  end
  resTab.print(L1_97, 0)
end
function bandwidthmanagementCfgInit(A0_100)
  local L1_101
  L1_101 = {}
  L1_101 = db.getRow("bandwidthmanagement", "_ROWID_", "1")
  return 1, L1_101
end
function bandwidthmanagementCfgSave(A0_102)
  local L1_103, L2_104, L3_105, L4_106
  L1_103 = "ERROR"
  L2_104 = ""
  L3_105 = ""
  L4_106 = {}
  L4_106["BandwidthManagement.WANInterface"] = A0_102["bandwidthmanagement.waninterface"]
  L4_106["BandwidthManagement.Servicetype"] = A0_102["bandwidthmanagement.service"]
  L4_106["BandwidthManagement.BandwidthManagement"] = A0_102["bandwidthmanagement.action"]
  L4_106["BandwidthManagement.BandwidthRate"] = A0_102["bandwidthmanagement.bandwidthrate"]
  L1_103 = _UPVALUE0_.bandwidthManagementCreate(L4_106)
  statusMessage = _UPVALUE1_.errorStringGet(L1_103)
  if L1_103 == 0 then
    L1_103 = "OK"
    db.save()
  else
    L1_103 = "ERROR"
  end
  return L1_103, statusMessage
end
function bandwidthmanagementCfgInputVal(A0_107)
  local L1_108
  L1_108 = {}
  if db.getRow("BandWidthProfileStatus", "_ROWID_", "1")["BandWidthProfileStatus.Status"] == "0" then
    printCLIError("Bandwidth management Configuration failed, band width profile status is Disabled")
    return false
  end
  if A0_107["bandwidthmanagement.service"] == nil or A0_107["bandwidthmanagement.service"] == "" then
    printCLIError("Enter valid service name. use <show net bandwidth traffic_selector services> to see the list of available services\n")
    return false
  end
  if db.getRow("Services", "ServiceName", A0_107["bandwidthmanagement.service"]) == nil or db.getRow("Services", "ServiceName", A0_107["bandwidthmanagement.service"])["Services.Protocol"] == _UPVALUE0_ then
    printCLIError("please enter valid service name  use <show net bandwidth traffic_selector services> to see the list of available services\n")
    return false
  end
  if A0_107["bandwidthmanagement.waninterface"] == nil or A0_107["bandwidthmanagement.waninterface"] == "" then
    printCLIError("please select waninterface")
    return false
  end
  dmzstatus = db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName")
  if A0_107["bandwidthmanagement.waninterface"] == "WAN2" and dmzstatus ~= "WAN2" then
    printCLIError("please change configPort to WAN2")
    return false
  end
  if A0_107["bandwidthmanagement.bandwidthrate"] == nil or A0_107["bandwidthmanagement.bandwidthrate"] == "" then
    printCLIError("please configure bandwidthrate")
    return false
  end
end
function bandwidthManagementConfigGet()
  local L0_109, L1_110
  L0_109 = db
  L0_109 = L0_109.getRow
  L1_110 = "bandwidthmanagement"
  L0_109 = L0_109(L1_110, "_ROWID_", "1")
  L1_110 = {}
  if L0_109["bandwidthmanagement.action"] == "0" then
    resTab.insertField(L1_110, "Bandwidth Management", "disabled" or "")
  else
    resTab.insertField(L1_110, "Bandwidth Management", "enabled" or "")
  end
  resTab.insertField(L1_110, "Service ", L0_109["bandwidthmanagement.service"] or "")
  resTab.insertField(L1_110, "WAN Interface ", L0_109["bandwidthmanagement.waninterface"] or "")
  resTab.insertField(L1_110, "Bandwidth Rate  ", L0_109["bandwidthmanagement.bandwidthrate"] or "")
  resTab.print(L1_110, 0)
end
function warningMessageCfgInit(A0_111)
  local L1_112
  L1_112 = A0_111[1]
  if L1_112 == nil then
    configRow = {}
    configRow["warningMessage._ROWID_"] = "-1"
  else
    configRow = {}
    configRow["warningMessage._ROWID_"] = L1_112
    configRow = db.getRow("warningMessage", "_ROWID_", L1_112)
    if configRow == nil then
      print("Row does not exist")
      return -1, {}
    end
  end
  return configRow["warningMessage._ROWID_"], configRow
end
function warningMessageCfgInputVal(A0_113)
  local L1_114
  L1_114 = true
  return L1_114
end
function warningMessageCfgSave(A0_115)
  local L1_116, L2_117
  L1_116 = "ERROR"
  L2_117 = nil
  DBTable = "warningMessage"
  A0_115["sessionLimit.WarningMessage"] = A0_115["warningMessage.warningMessage"]
  L1_116 = _UPVALUE0_.warningMessageEdit(A0_115)
  L2_117 = _UPVALUE1_.errorStringGet(L1_116)
  if L1_116 == _UPVALUE2_.SUCCESS then
    L1_116 = "OK"
  else
    L1_116 = "ERROR"
  end
  return L1_116, L2_117
end
function sessionLimitProfileStat()
  local L0_118, L1_119, L2_120
  L0_118 = {}
  L1_119 = print
  L2_120 = "List of available Session Limiting profiles status\n"
  L1_119(L2_120)
  L1_119 = 0
  L2_120 = db
  L2_120 = L2_120.getTable
  L2_120 = L2_120("sessionLimitProfileStats")
  if L2_120 == nil then
    print("Session Limiting profiles status unavailable\n")
  else
    for _FORV_6_, _FORV_7_ in pairs(L2_120) do
      L1_119 = L1_119 + 1
      if L1_119 ~= nil then
        resTab.insertField(L0_118, "ROW ID", L2_120[L1_119]["sessionLimitProfileStats._ROWID_"] or "")
        resTab.insertField(L0_118, "policy Name", L2_120[L1_119]["sessionLimitProfileStats.profileName"] or "")
        resTab.insertField(L0_118, "Current Sessions", L2_120[L1_119]["sessionLimitProfileStats.currentSessions"] or "")
        resTab.insertField(L0_118, "Session Limit", L2_120[L1_119]["sessionLimitProfileStats.totalSessions"] or "")
      end
    end
  end
  resTab.print(L0_118, 0)
end
function sessionLimitProfileslist()
  local L0_121, L1_122, L2_123
  L0_121 = {}
  L1_122 = print
  L2_123 = "List of available Session Limiting profiles List\n"
  L1_122(L2_123)
  L1_122 = 0
  L2_123 = db
  L2_123 = L2_123.getTable
  L2_123 = L2_123("sessionLimitProfiles")
  if L2_123 == nil then
    print("Session Limiting profiles List unavailable\n")
  else
    for _FORV_6_, _FORV_7_ in pairs(L2_123) do
      L1_122 = L1_122 + 1
      if L1_122 ~= nil then
        resTab.insertField(L0_121, "Row_Id", L2_123[L1_122]["sessionLimitProfiles._ROWID_"] or "")
        resTab.insertField(L0_121, "Profile_Name", L2_123[L1_122]["sessionLimitProfiles.profileName"] or "")
        if L2_123[L1_122]["sessionLimitProfiles.sourceType"] == "1" then
          L2_123[L1_122]["sessionLimitProfiles.sourceType"] = "IP"
        elseif L2_123[L1_122]["sessionLimitProfiles.sourceType"] == "2" then
          L2_123[L1_122]["sessionLimitProfiles.sourceType"] = "RANGE"
        elseif L2_123[L1_122]["sessionLimitProfiles.sourceType"] == "3" then
          L2_123[L1_122]["sessionLimitProfiles.sourceType"] = "INTERFACE"
        end
        resTab.insertField(L0_121, "Source_Type", L2_123[L1_122]["sessionLimitProfiles.sourceType"] or "")
        resTab.insertField(L0_121, "IP/Start_IP", L2_123[L1_122]["sessionLimitProfiles.startIpAddr"] or "")
        resTab.insertField(L0_121, "End_IP", L2_123[L1_122]["sessionLimitProfiles.endIpAddr"] or "")
        resTab.insertField(L0_121, "Interface", L2_123[L1_122]["sessionLimitProfiles.interface"] or "")
        resTab.insertField(L0_121, "Maximum_Sessions", L2_123[L1_122]["sessionLimitProfiles.sessionLimit"] or "")
        if L2_123[L1_122]["sessionLimitProfiles.enableSchedule"] == "1" then
          L2_123[L1_122]["sessionLimitProfiles.enableSchedule"] = "ENABLED"
        else
          L2_123[L1_122]["sessionLimitProfiles.enableSchedule"] = "DISABLED"
        end
        resTab.insertField(L0_121, "Schedule", L2_123[L1_122]["sessionLimitProfiles.enableSchedule"] or "")
        resTab.insertField(L0_121, "Schedule_Profile", L2_123[L1_122]["sessionLimitProfiles.scheduleProfile"] or "")
      end
    end
  end
  resTab.print(L0_121, 0)
end
function warningMessageGet()
  local L0_124, L1_125
  L0_124 = db
  L0_124 = L0_124.getRow
  L1_125 = "warningMessage"
  L0_124 = L0_124(L1_125, "_ROWID_", "1")
  L1_125 = L0_124["warningMessage.warningMessage"]
  print("Warning Message: " .. L1_125 .. "\n")
  return "OK"
end
function sessionLimitCfgInit(A0_126)
  RowId = A0_126[1]
  if RowId == nil then
    configRow = db.getDefaults(true, "sessionLimitProfiles")
  else
    configRow = db.getRow("sessionLimitProfiles", "sessionLimitProfiles._ROWID_", RowId)
  end
  if configRow == nil then
    print("Row doesnt exist probably deleted. Please exit from this mode.\n")
    return -1, {}
  end
  return 1, configRow
end
function sessionLimitCfgSave(A0_127)
  local L1_128, L2_129
  L1_128 = ""
  errorFlag = L1_128
  L1_128 = ""
  statusCode = L1_128
  L1_128 = ""
  statusMessage = L1_128
  L1_128 = "sessionLimitProfiles"
  DBTable = L1_128
  L1_128 = nil
  L2_129 = A0_127["sessionLimitProfiles._ROWID_"]
  RowId = L2_129
  L2_129 = RowId
  if L2_129 == nil then
    L2_129 = _UPVALUE0_
    L2_129 = L2_129.sessionLimitProfileCreate
    L1_128, L2_129 = A0_127, L2_129(A0_127)
    errorFlag = L2_129
    L2_129 = _UPVALUE1_
    L2_129 = L2_129.errorStringGet
    L2_129 = L2_129(errorFlag)
    statusMessage = L2_129
  else
    L2_129 = A0_127["sessionLimitProfiles._ROWID_"]
    if (db.getAttribute("sessionLimitProfiles", "_ROWID_", L2_129, "profileName") ~= nil or db.getAttribute("sessionLimitProfiles", "_ROWID_", L2_129, "profileName") ~= "") and db.getAttribute("sessionLimitProfiles", "_ROWID_", L2_129, "profileName") ~= A0_127["sessionLimit.ProfileName"] then
      printCLIError("Existing Policy name edit is not allowed.")
      return false
    end
    A0_127["sessionLimit.cookie"] = A0_127["sessionLimitProfiles._ROWID_"]
    errorFlag, L1_128 = _UPVALUE0_.sessionLimitProfileSet(A0_127)
    statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  end
  L2_129 = errorFlag
  if L2_129 == 0 then
    L2_129 = "OK"
    errorFlag = L2_129
    L2_129 = db
    L2_129 = L2_129.save
    L2_129()
  else
    L2_129 = "ERROR"
    errorFlag = L2_129
  end
  L2_129 = errorFlag
  return L2_129, statusMessage
end
function sessionLimitCfgDel(A0_130)
  local L1_131, L2_132
  L1_131 = ""
  errorFlag = L1_131
  L1_131 = ""
  statusCode = L1_131
  L1_131 = ""
  statusMessage = L1_131
  L1_131 = nil
  L2_132 = "sessionLimitProfiles"
  DBTable = L2_132
  L2_132 = {}
  L2_132 = db.getRow("sessionLimitProfiles", "_ROWID_", A0_130[1])
  if L2_132 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    L2_132["sessionLimit.cookie"] = L2_132["sessionLimitProfiles._ROWID_"]
    errorFlag, L1_131 = _UPVALUE0_.sessionLimitProfileDelete(L2_132)
    statusMessage = _UPVALUE1_.errorStringGet(errorFlag)
  end
  if errorFlag == 0 then
    errorFlag = "OK"
    db.save()
  else
    errorFlag = "ERROR"
  end
  return errorFlag, statusMessage
end
function sessionLimitCfgDelall()
  local L0_133, L1_134
  L0_133 = "ERROR"
  L1_134 = {}
  L1_134 = db.getTable("sessionLimitProfiles")
  if L1_134 == nil then
    return "ERROR", "No exisitng routes to delete"
  else
    L0_133 = _UPVALUE0_.sessionLimitProfileDeleteAll()
  end
  if L0_133 == 0 then
    L0_133 = "OK"
    db.save()
  else
    L0_133 = "ERROR"
  end
  return L0_133
end
function sessionLimitCfgInputVal(A0_135)
  local L1_136, L2_137, L3_138
  L1_136 = A0_135["sessionLimitProfiles._ROWID_"]
  L2_137 = ""
  if L1_136 then
    L3_138 = db
    L3_138 = L3_138.getAttribute
    L3_138 = L3_138("sessionLimitProfiles", "_ROWID_", L1_136, "profileName")
    L2_137 = L3_138 or ""
  end
  if L2_137 then
    L3_138 = A0_135["sessionLimit.ProfileName"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.ProfileName"]
    elseif L3_138 == "" then
      A0_135["sessionLimit.ProfileName"] = L2_137
    end
  else
    L3_138 = A0_135["sessionLimit.ProfileName"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.ProfileName"]
    elseif L3_138 == "" then
      L3_138 = printCLIError
      L3_138("please gave valid profile name")
      L3_138 = false
      return L3_138
    end
  end
  L3_138 = A0_135["sessionLimit.SourceType"]
  if L3_138 ~= nil then
    L3_138 = A0_135["sessionLimit.SourceType"]
  elseif L3_138 == "" then
    L3_138 = printCLIError
    L3_138("please select valid source Type")
    L3_138 = false
    return L3_138
  end
  L3_138 = A0_135["sessionLimit.SourceType"]
  if L3_138 == "1" then
    L3_138 = A0_135["sessionLimit.StartIPAddress"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.StartIPAddress"]
      if L3_138 ~= "" then
        L3_138 = A0_135["sessionLimit.StartIPAddress"]
      end
    elseif L3_138 == "0.0.0.0" then
      L3_138 = printCLIError
      L3_138("Invalid ip address")
      L3_138 = false
      return L3_138
    end
    L3_138 = _UPVALUE0_
    L3_138 = L3_138.checkFirewallIPAddress
    L3_138 = L3_138(A0_135["sessionLimit.StartIPAddress"])
    if L3_138 ~= true then
      L3_138 = printCLIError
      L3_138("IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L3_138 = false
      return L3_138
    end
  end
  L3_138 = A0_135["sessionLimit.SourceType"]
  if L3_138 == "2" then
    L3_138 = A0_135["sessionLimit.StartIPAddress"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.StartIPAddress"]
      if L3_138 ~= "" then
        L3_138 = A0_135["sessionLimit.StartIPAddress"]
      end
    elseif L3_138 == "0.0.0.0" then
      L3_138 = printCLIError
      L3_138("Invalid source_start_address")
      L3_138 = false
      return L3_138
    end
    L3_138 = _UPVALUE0_
    L3_138 = L3_138.checkFirewallIPAddress
    L3_138 = L3_138(A0_135["sessionLimit.StartIPAddress"])
    if L3_138 ~= true then
      L3_138 = printCLIError
      L3_138("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L3_138 = false
      return L3_138
    end
    L3_138 = A0_135["sessionLimit.EndIPAddress"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.EndIPAddress"]
      if L3_138 ~= "" then
        L3_138 = A0_135["sessionLimit.EndIPAddress"]
      end
    elseif L3_138 == "0.0.0.0" then
      L3_138 = printCLIError
      L3_138("Invalid source_end_address")
      L3_138 = false
      return L3_138
    end
    L3_138 = _UPVALUE0_
    L3_138 = L3_138.checkFirewallIPAddress
    L3_138 = L3_138(A0_135["sessionLimit.EndIPAddress"])
    if L3_138 ~= true then
      L3_138 = printCLIError
      L3_138("Source end IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 0-255 range.")
      L3_138 = false
      return L3_138
    end
  end
  L3_138 = A0_135["sessionLimit.SourceType"]
  if L3_138 == "3" then
    L3_138 = A0_135["sessionLimit.Interface"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.Interface"]
    elseif L3_138 == "" then
      L3_138 = printCLIError
      L3_138("Please select atleast one Interface from vlans")
      L3_138 = false
      return L3_138
    end
  end
  L3_138 = A0_135["sessionLimit.EnableSchedules"]
  if L3_138 ~= nil then
    L3_138 = A0_135["sessionLimit.EnableSchedules"]
  elseif L3_138 == "" then
    L3_138 = printCLIError
    L3_138("Please select Enable/Disable for Schedule")
    L3_138 = false
    return L3_138
  end
  L3_138 = A0_135["sessionLimit.EnableSchedules"]
  if L3_138 == "1" then
    L3_138 = A0_135["sessionLimit.ScheduleProfile"]
    if L3_138 ~= nil then
      L3_138 = A0_135["sessionLimit.ScheduleProfile"]
    elseif L3_138 == "" then
      L3_138 = printCLIError
      L3_138("Please select atleast one Schedule Profile.")
      L3_138 = false
      return L3_138
    end
    L3_138 = A0_135["sessionLimit.ScheduleProfile"]
    if db.getRow("Schedules", "Schedules.ScheduleName", L3_138) == nil then
      printCLIError("Given Schedule Profile is not exist.")
      return false
    end
  end
  L3_138 = true
  return L3_138
end
