require("teamf1lualib/db")
require("sslvpnLuaLib")
sslvpn = {}
httpsMgmt = {}
function sslvpn.portalLayoutConfig(A0_0, A1_1, A2_2)
  local L3_3, L4_4
  L3_3 = ACCESS_LEVEL
  if L3_3 ~= 0 then
    L3_3 = "ACCESS_DENIED"
    L4_4 = "10187"
    return L3_3, L4_4
  end
  L3_3 = db
  L3_3 = L3_3.beginTransaction
  L3_3()
  L3_3 = false
  if A2_2 == "add" then
    L4_4 = db
    L4_4 = L4_4.getAttribute
    L4_4 = L4_4("networkInterface", "LogicalIfName", "WAN1", "ipaddr")
    A0_0["SSLVPNPortalLayout.PortalURL"] = "https://" .. L4_4 .. "/portal/" .. A0_0["SSLVPNPortalLayout.PortalLayoutName"]
  end
  L4_4 = db
  L4_4 = L4_4.typeAndRangeValidate
  L4_4 = L4_4(A0_0)
  if L4_4 then
    if A2_2 == "add" then
      L4_4 = db
      L4_4 = L4_4.insert
      L4_4 = L4_4(DBTable, A0_0)
      L3_3 = L4_4
    elseif A2_2 == "edit" then
      L4_4 = db
      L4_4 = L4_4.update
      L4_4 = L4_4(DBTable, A0_0, A1_1)
      L3_3 = L4_4
    elseif A2_2 == "delete" then
      L4_4 = A0_0["SSLVPNPortalLayout.UseCount"]
      if L4_4 > "0" then
        L3_3 = false
      else
        L4_4 = db
        L4_4 = L4_4.delete
        L4_4 = L4_4(DBTable, A0_0)
        L3_3 = L4_4
      end
    end
  end
  if L3_3 then
    L4_4 = db
    L4_4 = L4_4.commitTransaction
    L4_4(true)
    L4_4 = "OK"
    return L4_4, "12265"
  else
    L4_4 = db
    L4_4 = L4_4.rollback
    L4_4()
    L4_4 = "ERROR"
    return L4_4, "11818"
  end
end
function sslvpn.deleteLayouts(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
  L1_6 = ACCESS_LEVEL
  if L1_6 ~= 0 then
    L1_6 = "ACCESS_DENIED"
    return L1_6, L2_7
  end
  L1_6 = db
  L1_6 = L1_6.beginTransaction
  L1_6()
  L1_6 = false
  for L5_10, L6_11 in L2_7(L3_8) do
    L7_12 = {}
    L7_12["SSLVPNPortalLayout._ROWID_"] = L6_11
    if db.getRow("SSLVPNPortalLayout", "_ROWID_", L6_11)["SSLVPNPortalLayout.UseCount"] > "0" then
      L1_6 = false
    else
      L1_6 = db.delete("SSLVPNPortalLayout", L7_12)
    end
    if L1_6 == false then
      break
    end
  end
  if L1_6 then
    L2_7(L3_8)
    return L2_7, L3_8
  else
    L2_7()
    return L2_7, L3_8
  end
end
function sslvpn.setDefault(A0_13)
  local L1_14, L2_15
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = "ACCESS_DENIED"
    L2_15 = "10187"
    return L1_14, L2_15
  end
  L1_14 = db
  L1_14 = L1_14.beginTransaction
  L1_14()
  L1_14 = false
  L2_15 = db
  L2_15 = L2_15.existsRow
  L2_15 = L2_15("SSLVPNPortalLayout", "DefaultPortal", "2")
  if L2_15 then
    L2_15 = db
    L2_15 = L2_15.getRow
    L2_15 = L2_15("SSLVPNPortalLayout", "DefaultPortal", "2")
    L2_15["SSLVPNPortalLayout.DefaultPortal"] = "0"
    L1_14 = db.update("SSLVPNPortalLayout", L2_15, L2_15["SSLVPNPortalLayout._ROWID_"])
  end
  L2_15 = db
  L2_15 = L2_15.getRow
  L2_15 = L2_15("SSLVPNPortalLayout", "_ROWID_", A0_13)
  if L2_15["SSLVPNPortalLayout.UseCount"] == "0" then
    L1_14 = false
  else
    if L2_15["SSLVPNPortalLayout.DefaultPortal"] ~= "1" then
      L2_15["SSLVPNPortalLayout.DefaultPortal"] = "2"
    end
    L1_14 = db.update("SSLVPNPortalLayout", L2_15, A0_13)
  end
  if L1_14 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "13316"
  end
end
function sslvpn.portForwardConfig(A0_16, A1_17, A2_18)
  local L3_19
  L3_19 = ACCESS_LEVEL
  if L3_19 ~= 0 then
    L3_19 = "ACCESS_DENIED"
    return L3_19, "10187"
  end
  L3_19 = db
  L3_19 = L3_19.beginTransaction
  L3_19()
  L3_19 = false
  if db.typeAndRangeValidate(A0_16) then
    if A2_18 == "add" then
      L3_19 = db.insert(DBTable, A0_16)
    elseif A2_18 == "edit" then
      L3_19 = db.update(DBTable, A0_16, A1_17)
    elseif A2_18 == "delete" then
      L3_19 = db.delete(DBTable, A0_16)
    end
  end
  if L3_19 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11820"
  end
end
function sslvpn.resourceDeleteConfig(A0_20, A1_21, A2_22)
  if A2_22 == "delete" then
    return db.delete(DBTable, A0_20)
  end
  return false
end
function sslvpn.resourceConfig(A0_23, A1_24, A2_25)
  local L3_26
  L3_26 = ACCESS_LEVEL
  if L3_26 ~= 0 then
    L3_26 = "ACCESS_DENIED"
    return L3_26, "10187"
  end
  L3_26 = db
  L3_26 = L3_26.beginTransaction
  L3_26()
  L3_26 = false
  if db.typeAndRangeValidate(A0_23) then
    if A2_25 == "add" then
      L3_26 = db.insert(DBTable, A0_23)
    elseif A2_25 == "edit" then
      L3_26 = db.update(DBTable, A0_23, A1_24)
    elseif A2_25 == "delete" then
      L3_26 = db.delete(DBTable, A0_23)
    end
  end
  if L3_26 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12225"
  end
end
function sslvpn.deleteResources(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42, L16_43, L17_44
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = "ACCESS_DENIED"
    L2_29 = "10187"
    return L1_28, L2_29
  end
  L1_28 = db
  L1_28 = L1_28.beginTransaction
  L1_28()
  L1_28 = true
  L2_29 = "12265"
  for L6_33, L7_34 in L3_30(L4_31) do
    L8_35 = 0
    L9_36 = db
    L9_36 = L9_36.getAttribute
    L10_37 = "SSLVPNResource"
    L11_38 = "_ROWID_"
    L9_36 = L9_36(L10_37, L11_38, L12_39, L13_40)
    L10_37 = db
    L10_37 = L10_37.getAttribute
    L11_38 = "SSLVPNResource"
    L10_37 = L10_37(L11_38, L12_39, L13_40, L14_41)
    L11_38 = db
    L11_38 = L11_38.getRows
    L11_38 = L11_38(L12_39, L13_40, L14_41)
    if L12_39 > 0 then
      L11_38 = nil
      L1_28 = false
      L2_29 = "11974"
    end
    if L11_38 then
      for L15_42, L16_43 in L12_39(L13_40) do
        L17_44 = {}
        L17_44["SSLVPNResourceObject._ROWID_"] = L16_43["SSLVPNResourceObject._ROWID_"]
        DBTable = "SSLVPNResourceObject"
        L1_28 = sslvpn.resourceDeleteConfig(L17_44, "-1", "delete")
        if L1_28 == false then
          L2_29 = "12829"
          break
        end
      end
    end
  end
  for L6_33, L7_34 in L3_30(L4_31) do
    if L1_28 then
      L8_35 = {}
      L8_35["SSLVPNResource._ROWID_"] = L7_34
      L9_36 = "SSLVPNResource"
      DBTable = L9_36
      L9_36 = sslvpn
      L9_36 = L9_36.resourceDeleteConfig
      L10_37 = L8_35
      L11_38 = "-1"
      L9_36 = L9_36(L10_37, L11_38, L12_39)
      L1_28 = L9_36
      if L1_28 == false then
        L2_29 = "11973"
        break
      end
    end
  end
  if L1_28 then
    L3_30(L4_31)
    return L3_30, L4_31
  else
    L3_30()
    return L3_30, L4_31
  end
end
function sslvpn.sslVpnClientConfig(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50, L6_51, L7_52, L8_53, L9_54, L10_55, L11_56
  L3_48 = ACCESS_LEVEL
  if L3_48 ~= 0 then
    L3_48 = "ACCESS_DENIED"
    L4_49 = "10187"
    return L3_48, L4_49
  end
  L3_48 = db
  L3_48 = L3_48.beginTransaction
  L3_48()
  L3_48 = false
  L4_49 = sslvpnLuaLib
  L4_49 = L4_49.compareNetwork
  L4_49 = L4_49(L5_50, L6_51, L7_52)
  if L4_49 <= 0 then
    L4_49 = db
    L4_49 = L4_49.rollback
    L4_49()
    L4_49 = "ERROR"
    return L4_49, L5_50
  end
  L4_49 = db
  L4_49 = L4_49.getRows
  L4_49 = L4_49(L5_50, L6_51, L7_52)
  for L8_53, L9_54 in L5_50(L6_51) do
    L10_55 = L9_54["ifStatic.StaticIp"]
    L10_55 = L10_55 or ""
    L11_56 = L9_54["ifStatic.NetMask"]
    L11_56 = L11_56 or ""
    if L10_55 == "" or L11_56 == "" or L10_55 == "0.0.0.0" or L11_56 == "0.0.0.0" then
    elseif sslvpnLuaLib.compareNetwork(A0_45["SSLVPNClientConf.BeginClientAddress"], L10_55, L11_56) == 0 then
      db.rollback()
      return "ERROR", "11094"
    elseif sslvpnLuaLib.compareNetwork(A0_45["SSLVPNClientConf.EndClientAddress"], L10_55, L11_56) == 0 then
      db.rollback()
      return "ERROR", "11094"
    end
  end
  if L5_50 then
    if A2_47 == "add" then
      L3_48 = L5_50
    elseif A2_47 == "edit" then
      L8_53 = A1_46
      L3_48 = L5_50
    end
  end
  if L3_48 then
    L5_50(L6_51)
    return L5_50, L6_51
  else
    L5_50()
    return L5_50, L6_51
  end
end
function sslvpn.sslClientRouteConfig(A0_57, A1_58, A2_59)
  local L3_60
  L3_60 = ACCESS_LEVEL
  if L3_60 ~= 0 then
    L3_60 = "ACCESS_DENIED"
    return L3_60, "10187"
  end
  L3_60 = db
  L3_60 = L3_60.beginTransaction
  L3_60()
  L3_60 = false
  if A2_59 == "add" then
    L3_60 = db.insert(DBTable, A0_57)
  elseif A2_59 == "edit" then
    L3_60 = false
  elseif A2_59 == "delete" then
    L3_60 = db.delete(DBTable, A0_57)
  end
  if L3_60 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12213"
  end
end
function sslvpn.policyConfig(A0_61, A1_62, A2_63)
  local L3_64, L4_65, L5_66
  L3_64 = ACCESS_LEVEL
  if L3_64 ~= 0 then
    L3_64 = "ACCESS_DENIED"
    L4_65 = "10187"
    return L3_64, L4_65
  end
  L3_64 = db
  L3_64 = L3_64.beginTransaction
  L3_64()
  L3_64 = false
  L4_65 = A0_61["SSLVPNPolicy.PolicyType"]
  if L4_65 == "global" then
    A0_61["SSLVPNPolicy.PolicyOwnerName"] = "global"
  end
  L4_65 = A0_61["SSLVPNPolicy.DestinationObjectType"]
  if L4_65 == "1" then
    L4_65 = A0_61["SSLVPNPolicy.ResourceName"]
    A0_61["SSLVPNPolicy.DestinationObject"] = L4_65
  else
    L4_65 = A0_61["SSLVPNPolicy.DestinationObjectType"]
    if L4_65 == "2" then
      L4_65 = A0_61["SSLVPNPolicy.Address"]
      L5_66 = ":"
      L4_65 = L4_65 .. L5_66 .. A0_61["SSLVPNPolicy.StartPort"] .. "-" .. A0_61["SSLVPNPolicy.EndPort"]
      A0_61["SSLVPNPolicy.DestinationObject"] = L4_65
    else
      L4_65 = A0_61["SSLVPNPolicy.DestinationObjectType"]
      if L4_65 == "3" then
        L4_65 = A0_61["SSLVPNPolicy.Address"]
        L5_66 = "/"
        L4_65 = L4_65 .. L5_66 .. A0_61["SSLVPNPolicy.MaskLength"] .. ":" .. A0_61["SSLVPNPolicy.StartPort"] .. "-" .. A0_61["SSLVPNPolicy.EndPort"]
        A0_61["SSLVPNPolicy.DestinationObject"] = L4_65
      else
        L4_65 = A0_61["SSLVPNPolicy.DestinationObjectType"]
        if L4_65 == "4" then
          L4_65 = "0.0.0.0/"
          L5_66 = A0_61["SSLVPNPolicy.StartPort"]
          L4_65 = L4_65 .. L5_66 .. "-" .. A0_61["SSLVPNPolicy.EndPort"]
          A0_61["SSLVPNPolicy.DestinationObject"] = L4_65
        end
      end
    end
  end
  if A2_63 == "edit" then
    L4_65 = A0_61["SSLVPNPolicy.DestinationObjectType"]
    if L4_65 == "1" then
      A0_61["SSLVPNPolicy.ServiceType"] = ""
    end
  end
  if A2_63 == "add" or A2_63 == "edit" then
    L4_65 = A0_61["SSLVPNPolicy.ResourceName"]
    if L4_65 ~= nil then
      L4_65 = db
      L4_65 = L4_65.getRowsWhere
      L5_66 = "SSLVPNResourceObject"
      L4_65 = L4_65(L5_66, "ResourceName = '" .. A0_61["SSLVPNPolicy.ResourceName"] .. "'")
      if L4_65 ~= nil then
        L5_66 = #L4_65
        if L5_66 == 0 then
          L5_66 = db
          L5_66 = L5_66.rollback
          L5_66()
          L5_66 = "ERROR"
          return L5_66, "11434"
        end
      end
    end
  end
  L4_65 = ""
  L5_66 = ""
  if A2_63 == "edit" then
    L5_66 = db.getAttribute("SSLVPNPolicy", "_ROWID_", A1_62, "DestinationObjectType")
    if L5_66 == "1" then
      L4_65 = db.getAttribute("SSLVPNPolicy", "_ROWID_", A1_62, "ResourceName")
    end
  end
  L3_64 = sslvpn.config(A0_61, A1_62, A2_63)
  if L3_64 and A0_61["SSLVPNPolicy.DestinationObjectType"] == "1" and A2_63 == "add" then
    sslvpn.updateResource(A0_61["SSLVPNPolicy.ResourceName"], A2_63)
  end
  if L3_64 and A2_63 == "edit" then
    if L5_66 == "1" and A0_61["SSLVPNPolicy.DestinationObjectType"] == "1" then
      if L4_65 ~= A0_61["SSLVPNPolicy.ResourceName"] then
        L3_64 = sslvpn.updateResource(L4_65, "delete")
        L3_64 = L3_64 and sslvpn.updateResource(A0_61["SSLVPNPolicy.ResourceName"], "edit")
      end
    elseif L5_66 == "1" and A0_61["SSLVPNPolicy.DestinationObjectType"] ~= "1" then
      L3_64 = sslvpn.updateResource(L4_65, "delete")
    elseif L5_66 ~= "1" and A0_61["SSLVPNPolicy.DestinationObjectType"] == "1" then
      L3_64 = sslvpn.updateResource(A0_61["SSLVPNPolicy.ResourceName"], "edit")
    end
  end
  if L3_64 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12224"
  end
end
function sslvpn.config(A0_67, A1_68, A2_69)
  if db.typeAndRangeValidate(A0_67) then
    if A2_69 == "add" then
      return db.insert(DBTable, A0_67)
    elseif A2_69 == "edit" then
      return db.update(DBTable, A0_67, A1_68)
    elseif A2_69 == "delete" then
      return db.delete(DBTable, A0_67)
    end
  end
  return false
end
function sslvpn.deletePolicy(A0_70)
  local L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79
  L1_71 = ACCESS_LEVEL
  if L1_71 ~= 0 then
    L1_71 = "ACCESS_DENIED"
    return L1_71, L2_72
  end
  L1_71 = db
  L1_71 = L1_71.beginTransaction
  L1_71()
  L1_71 = false
  for L5_75, L6_76 in L2_72(L3_73) do
    L7_77 = {}
    L7_77["SSLVPNPolicy._ROWID_"] = L6_76
    L8_78 = db
    L8_78 = L8_78.getAttribute
    L9_79 = "SSLVPNPolicy"
    L8_78 = L8_78(L9_79, "_ROWID_", L7_77["SSLVPNPolicy._ROWID_"], "DestinationObjectType")
    if L8_78 == "1" then
      L9_79 = db
      L9_79 = L9_79.getAttribute
      L9_79 = L9_79("SSLVPNPolicy", "_ROWID_", L7_77["SSLVPNPolicy._ROWID_"], "ResourceName")
      L1_71 = sslvpn.updateResource(L9_79, "delete")
    else
      L1_71 = true
    end
    if L1_71 then
      L9_79 = db
      L9_79 = L9_79.delete
      L9_79 = L9_79("SSLVPNPolicy", L7_77)
      L1_71 = L9_79
    end
    if L1_71 == false then
      break
    end
  end
  if L1_71 then
    L2_72(L3_73)
    return L2_72, L3_73
  else
    L2_72()
    return L2_72, L3_73
  end
end
function sslvpn.updateResource(A0_80, A1_81)
  local L2_82, L3_83, L4_84, L5_85
  L2_82 = false
  L3_83 = {}
  L4_84 = db
  L4_84 = L4_84.getAttribute
  L5_85 = "SSLVPNResource"
  L4_84 = L4_84(L5_85, "ResourceName", A0_80, "UseCount")
  L5_85 = db
  L5_85 = L5_85.getAttribute
  L5_85 = L5_85("SSLVPNResource", "ResourceName", A0_80, "_ROWID_")
  if A1_81 == "add" then
    L3_83["SSLVPNResource.UseCount"] = tonumber(L4_84) + 1
    L2_82 = db.update("SSLVPNResource", L3_83, L5_85)
  end
  if A1_81 == "edit" then
    L3_83["SSLVPNResource.UseCount"] = tonumber(L4_84) + 1
    L2_82 = db.update("SSLVPNResource", L3_83, L5_85)
  end
  if A1_81 == "delete" then
    L3_83["SSLVPNResource.UseCount"] = tonumber(L4_84) - 1
    L2_82 = db.update("SSLVPNResource", L3_83, L5_85)
  end
  if L2_82 then
    return true
  else
    return false
  end
end
function sslvpn.setUserState(A0_86)
  local L1_87, L2_88, L3_89, L4_90
  L1_87 = ACCESS_LEVEL
  if L1_87 ~= 0 then
    L1_87 = "ACCESS_DENIED"
    L2_88 = "10187"
    return L1_87, L2_88
  end
  L1_87 = db
  L1_87 = L1_87.beginTransaction
  L1_87()
  L1_87 = false
  L2_88 = {}
  L3_89 = ""
  L4_90 = db
  L4_90 = L4_90.getAttribute
  L4_90 = L4_90("SSLVPNActiveUsers", "_ROWID_", A0_86, "UserName")
  L3_89 = L4_90
  L4_90 = db
  L4_90 = L4_90.getAttribute
  L4_90 = L4_90("SSLVPNActiveUsers", "UserName", L3_89, "_ROWID_")
  L2_88["SSLVPNUserState.ActiveUser"] = "0"
  L1_87 = db.update("SSLVPNUserState", L2_88, L4_90)
  if L1_87 then
    db.commitTransaction(true)
    return "OK", "12218"
  else
    db.rollback()
    return "ERROR", "12219"
  end
end
function sslvpn.sslvpnTunnelStatsGet()
  if sslvpnLuaLib.sslTunnelStatsGet() == 0 then
    return 0
  else
    return -1
  end
end
function httpsMgmt.config(A0_91, A1_92, A2_93)
  local L3_94
  L3_94 = ACCESS_LEVEL
  if L3_94 ~= 0 then
    L3_94 = "ACCESS_DENIED"
    return L3_94, "10187"
  end
  L3_94 = MODEL_ID
  if L3_94 ~= "DWC-1000" then
    L3_94 = db
    L3_94 = L3_94.beginTransaction
    L3_94()
  end
  L3_94 = false
  if httpsMgmt.inputvalidate(A0_91, A2_93) then
    if A2_93 == "add" then
      return nil
    elseif A2_93 == "edit" then
      if A0_91["httpsMgmt.httpsMgmtPort"] ~= nil then
        if A0_91["httpsMgmt.httpsMgmtPort"] == "0" then
          return "ERROR", "Invalid Port Configured"
        elseif A0_91["httpsMgmt.httpsMgmtPort"] == "80" then
          return "ERROR", "This Port is Already Reserved"
        elseif tonumber(A0_91["httpsMgmt.httpsMgmtPort"]) > 65535 then
          return "ERROR", "Port Range Exceeded"
        end
      end
      L3_94 = db.update("httpsMgmt", A0_91, A1_92)
    elseif A2_93 == "delete" then
      return nil
    end
  end
  if L3_94 then
    if MODEL_ID ~= "DWC-1000" then
      db.commitTransaction(true)
    end
    return "OK", "11485"
  else
    if MODEL_ID ~= "DWC-1000" then
      db.rollback()
    end
    return "ERROR", "10451"
  end
end
function httpsMgmt.inputvalidate(A0_95, A1_96)
  do return db.typeAndRangeValidate(A0_95) end
  return false
end
function sslvpn.deleteDefinedResource(A0_97, A1_98)
  local L2_99, L3_100, L4_101, L5_102, L6_103, L7_104, L8_105, L9_106
  L2_99 = db
  L2_99 = L2_99.getRowsWhere
  L3_100 = "SSLVPNResourceObject"
  L2_99 = L2_99(L3_100, L4_101)
  L3_100 = db
  L3_100 = L3_100.getRowsWhere
  L7_104 = "'"
  L3_100 = L3_100(L4_101, L5_102)
  if L3_100 ~= nil and L2_99 ~= nil then
    if L4_101 ~= 0 then
      if L4_101 ~= 1 then
      elseif L4_101 == L5_102 then
        return L4_101, L5_102
      end
    end
  end
  for L7_104, L8_105 in L4_101(L5_102) do
    configRowId = L8_105
    L9_106 = {configRowId}
    errorFlag, statusCode = sslvpn.resourceConfig(L9_106, "-1", "delete")
    if errorFlag ~= "OK" then
      return errorFlag, statusCode
    end
  end
  return L4_101, L5_102
end
function sslvpn.sslvpnLogsGet()
  return db.getRows("eventLog", "component", "UMI_COMP_SSLVPN")
end
function sslvpn.sslvpnLogsClear()
  return db.deleteRow("eventLog", "component", "UMI_COMP_SSLVPN")
end
function sslvpn.loginProfilesListGet()
  return db.getDistinctValues("LoginProfiles", "LoginProfiles.configurationName")
end
function sslvpn.uploadHeaderImg(A0_107)
  local L1_108, L2_109, L3_110, L4_111, L5_112, L6_113, L7_114, L8_115
  L1_108 = ACCESS_LEVEL
  if L1_108 ~= 0 then
    L1_108 = "ACCESS_DENIED"
    L2_109 = "10187"
    return L1_108, L2_109
  end
  L1_108 = A0_107["LoginImageDetails.RowID"]
  L2_109 = cgilua
  L2_109 = L2_109.cookies
  L2_109 = L2_109.get
  L3_110 = "TeamF1Login"
  L2_109 = L2_109(L3_110)
  L3_110 = sslvpnLuaLib
  L3_110 = L3_110.extensionGet
  L4_111 = A0_107["LoginImageDetails.name"]
  L4_111 = L4_111.filename
  L3_110 = L3_110(L4_111)
  L4_111 = "image"
  L5_112 = L1_108
  L6_113 = "."
  L7_114 = L3_110
  L4_111 = L4_111 .. L5_112 .. L6_113 .. L7_114
  L5_112 = A0_107["LoginImageDetails.name"]
  L5_112 = L5_112.filesize
  L6_113 = tonumber
  L7_114 = L5_112
  L6_113 = L6_113(L7_114)
  if L6_113 > 50000 then
    L6_113 = os
    L6_113 = L6_113.execute
    L7_114 = "rm -fr"
    L8_115 = " "
    L7_114 = L7_114 .. L8_115 .. "/tmp/" .. L2_109
    L6_113(L7_114)
    L6_113 = "ERROR"
    L7_114 = "12831"
    return L6_113, L7_114
  end
  L6_113 = db
  L6_113 = L6_113.getAttribute
  L7_114 = "LoginImageDetails"
  L8_115 = "_ROWID_"
  L6_113 = L6_113(L7_114, L8_115, L1_108, "name")
  L7_114 = os
  L7_114 = L7_114.execute
  L8_115 = "rm -rf"
  L8_115 = L8_115 .. " " .. "/flash/tmp/login/" .. L6_113
  L7_114(L8_115)
  L7_114 = nil
  L8_115 = db
  L8_115 = L8_115.beginTransaction
  L8_115()
  L8_115 = os
  L8_115 = L8_115.execute
  L8_115 = L8_115("mv" .. " " .. "/tmp/" .. L2_109 .. " /flash/tmp/login/" .. L4_111)
  L7_114 = L8_115
  L8_115 = {}
  L8_115["LoginImageDetails.name"] = L4_111
  L8_115["LoginImageDetails.value"] = "1"
  L7_114 = L7_114 and db.update("LoginImageDetails", L8_115, L1_108)
  if L7_114 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function sslvpn.loginProfileConfig(A0_116, A1_117, A2_118)
  local L3_119
  L3_119 = ACCESS_LEVEL
  if L3_119 ~= 0 then
    L3_119 = "ACCESS_DENIED"
    return L3_119, "10187"
  end
  L3_119 = util
  L3_119 = L3_119.appendDebugOut
  L3_119(util.tableToStringRec(A0_116))
  L3_119 = db
  L3_119 = L3_119.beginTransaction
  L3_119()
  L3_119 = nil
  if A2_118 == "add" then
    L3_119 = db.insert("LoginProfiles", A0_116)
  end
  if A2_118 == "edit" then
    L3_119 = db.update("LoginProfiles", A0_116, A1_117)
  end
  if L3_119 then
    db.commitTransaction(true)
    return "OK", "11485"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function sslvpn.deleteProfiles(A0_120)
  local L1_121, L2_122, L3_123, L4_124, L5_125, L6_126
  L1_121 = db
  L1_121 = L1_121.beginTransaction
  L1_121()
  L1_121 = nil
  if A0_120 ~= nil then
    for L5_125, L6_126 in L2_122(L3_123) do
      L1_121 = db.deleteRow("LoginProfiles", "_ROWID_", L6_126)
      if not L1_121 then
        break
      end
    end
  end
  if L1_121 then
    L2_122(L3_123)
    if L2_122 == "DWC-1000" then
      return L2_122, L3_123
    else
      return L2_122, L3_123
    end
  else
    L2_122()
    return L2_122, L3_123
  end
end
