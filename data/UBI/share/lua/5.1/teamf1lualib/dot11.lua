local L0_0, L1_1
L0_0 = {}
dot11Interface = L0_0
L0_0 = {}
dot11Card = L0_0
L0_0 = {}
dot11ACL = L0_0
L0_0 = {}
dot11AuthorizedAP = L0_0
L0_0 = {}
dot11RogueAP = L0_0
L0_0 = {}
dot11Radio = L0_0
L0_0 = {}
dot11Profile = L0_0
L0_0 = {}
dot11VAP = L0_0
L0_0 = {}
dot11IAPP = L0_0
L0_0 = {}
dot11IAPPRemoteAP = L0_0
L0_0 = dot11Interface
function L1_1(A0_2, A1_3, A2_4)
  if dot11Interface.inputvalidate(A0_2, A2_4) then
    if A2_4 == "add" then
      return nil
    elseif A2_4 == "edit" then
      return db.setAttribute("dot11Interface", "_ROWID_", A1_3, "vapName", A0_2["dot11Interface.vapName"])
    elseif A2_4 == "delete" then
      return nil
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11Interface
function L1_1(A0_5, A1_6)
  do return db.typeAndRangeValidate(A0_5) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11Profile
function L1_1(A0_7, A1_8, A2_9)
  local L3_10, L4_11, L5_12, L6_13, L7_14, L8_15, L9_16
  L3_10 = false
  L4_11 = ""
  L4_11 = L6_13
  L3_10 = L5_12
  if L3_10 then
    if A2_9 == "add" then
      return L5_12(L6_13, L7_14)
    elseif A2_9 == "edit" then
      L8_15 = A1_8
      return L5_12(L6_13, L7_14, L8_15)
    elseif A2_9 == "delete" then
      for L8_15, L9_16 in L5_12(L6_13) do
        valid = db.deleteRow("dot11Profile", "_ROWID_", L9_16)
        if not valid then
          return false
        end
      end
      return L5_12
    end
  end
  return L5_12, L6_13
end
L0_0.config = L1_1
L0_0 = dot11Profile
function L1_1(A0_17, A1_18)
  if A0_17["dot11Profile.security"] == "WEP" then
    if A0_17["dot11Profile.wepkey0"] and A0_17["dot11Profile.wepkey0"] ~= "" then
      if string.len(A0_17["dot11Profile.wepkey0"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey0"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
      if dot11VAP.hasTypeValidate(A0_17["dot11Profile.wepkey0"], "%X") == 1 and string.len(A0_17["dot11Profile.wepkey0"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 then
        return false, "10259"
      elseif string.len(A0_17["dot11Profile.wepkey0"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey0"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
    end
    if A0_17["dot11Profile.wepkey1"] and A0_17["dot11Profile.wepkey1"] ~= "" then
      if string.len(A0_17["dot11Profile.wepkey1"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey1"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
      if dot11VAP.hasTypeValidate(A0_17["dot11Profile.wepkey1"], "%X") == 1 and string.len(A0_17["dot11Profile.wepkey1"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 then
        return false, "10259"
      elseif string.len(A0_17["dot11Profile.wepkey1"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey1"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
    end
    if A0_17["dot11Profile.wepkey2"] and A0_17["dot11Profile.wepkey2"] ~= "" then
      if string.len(A0_17["dot11Profile.wepkey2"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey2"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
      if dot11VAP.hasTypeValidate(A0_17["dot11Profile.wepkey2"], "%X") == 1 and string.len(A0_17["dot11Profile.wepkey2"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 then
        return false, "10259"
      elseif string.len(A0_17["dot11Profile.wepkey2"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey2"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
    end
    if A0_17["dot11Profile.wepkey3"] and A0_17["dot11Profile.wepkey3"] ~= "" then
      if string.len(A0_17["dot11Profile.wepkey3"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey3"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
      if dot11VAP.hasTypeValidate(A0_17["dot11Profile.wepkey3"], "%X") == 1 and string.len(A0_17["dot11Profile.wepkey3"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 then
        return false, "10259"
      elseif string.len(A0_17["dot11Profile.wepkey3"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 / 2 and string.len(A0_17["dot11Profile.wepkey3"]) ~= (A0_17["dot11Profile.groupCipher"] - 24) / 4 then
        return false, "10785"
      end
    end
  elseif (A0_17["dot11Profile.security"] == "WPA" or A0_17["dot11Profile.security"] == "WPA2" or A0_17["dot11Profile.security"] == "WPA+WPA2") and A0_17["dot11Profile.pskPassAscii"] and (string.len(A0_17["dot11Profile.pskPassAscii"]) < 8 or string.len(A0_17["dot11Profile.pskPassAscii"]) > 63) then
    return false, "11043"
  end
  do return db.typeAndRangeValidate(A0_17) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11Radio
function L1_1(A0_19, A1_20, A2_21)
  if dot11Radio.inputvalidate(A0_19, A2_21) then
    if A2_21 == "add" then
      return db.insert("dot11Radio", A0_19)
    elseif A2_21 == "edit" then
      return db.update("dot11Radio", A0_19, A1_20)
    elseif A2_21 == "delete" then
      return db.delete("dot11Radio", A0_19)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11Radio
function L1_1(A0_22, A1_23)
  do return db.typeAndRangeValidate(A0_22) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11Card
function L1_1(A0_24, A1_25, A2_26)
  if dot11Card.inputvalidate(A0_24, A2_26) then
    if A2_26 == "add" then
      return db.insert("dot11Card", A0_24)
    elseif A2_26 == "edit" then
      return db.update("dot11Card", A0_24, A1_25)
    elseif A2_26 == "delete" then
      return db.delete("dot11Card", A0_24)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11Card
function L1_1(A0_27, A1_28)
  do return db.typeAndRangeValidate(A0_27) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11ACL
function L1_1(A0_29, A1_30, A2_31)
  if dot11ACL.inputvalidate(A0_29, A2_31) then
    if A2_31 == "add" then
      return db.insert("dot11ACL", A0_29)
    elseif A2_31 == "edit" then
      return db.update("dot11ACL", A0_29, A1_30)
    elseif A2_31 == "delete" then
      return db.delete("dot11ACL", A0_29)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11ACL
function L1_1(A0_32, A1_33)
  do return db.typeAndRangeValidate(A0_32) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11AuthorizedAP
function L1_1(A0_34, A1_35, A2_36)
  if dot11AuthorizedAP.inputvalidate(A0_34, A2_36) then
    if A2_36 == "add" then
      return db.insert("dot11AuthorizedAP", A0_34)
    elseif A2_36 == "edit" then
      return db.update("dot11AuthorizedAP", A0_34, A1_35)
    elseif A2_36 == "delete" then
      return db.delete("dot11AuthorizedAP", A0_34)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11AuthorizedAP
function L1_1(A0_37, A1_38)
  do return db.typeAndRangeValidate(A0_37) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11RogueAP
function L1_1(A0_39, A1_40, A2_41)
  if dot11RogueAP.inputvalidate(A0_39, A2_41) and A2_41 == "delete" then
    return db.delete("dot11RogueAP", A0_39)
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11RogueAP
function L1_1(A0_42, A1_43)
  do return db.typeAndRangeValidate(A0_42) end
  return false
end
L0_0.inputvalidate = L1_1
L0_0 = dot11VAP
function L1_1(A0_44, A1_45, A2_46)
  local L3_47, L4_48, L5_49, L6_50, L7_51
  if L3_47 then
    if A2_46 == "add" then
      return L3_47(L4_48, L5_49)
    elseif A2_46 == "edit" then
      L6_50 = A1_45
      return L3_47(L4_48, L5_49, L6_50)
    elseif A2_46 == "delete" then
      for L6_50, L7_51 in L3_47(L4_48) do
        valid = db.deleteRow("dot11VAP", "_ROWID_", L7_51)
        if not valid then
          return false
        end
      end
      return L3_47
    end
  end
  return L3_47
end
L0_0.config = L1_1
L0_0 = dot11VAP
function L1_1(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L13_65, L14_66, L15_67, L16_68, L17_69, L18_70, L19_71
  L2_54 = db
  L2_54 = L2_54.typeAndRangeValidate
  L3_55 = util
  L3_55 = L3_55.tableSplit
  L4_56 = A0_52
  L19_71 = L3_55(L4_56, L5_57, L6_58)
  L2_54 = L2_54(L3_55, L4_56, L5_57, L6_58, L7_59, L8_60, L9_61, L10_62, L11_63, L12_64, L13_65, L14_66, L15_67, L16_68, L17_69, L18_70, L19_71, L3_55(L4_56, L5_57, L6_58))
  if L2_54 == false then
    L3_55 = false
    return L3_55
  end
  L3_55 = A0_52["dot11VAP.dot11Mode"]
  if L3_55 == "WDS Repeater" then
    L3_55 = db
    L3_55 = L3_55.getRowWhere
    L4_56 = "dot11Profile"
    L3_55 = L3_55(L4_56, L5_57)
    L4_56 = util
    L4_56 = L4_56.appendOut
    L4_56(L5_57)
    L4_56 = L3_55["dot11Profile.security"]
    if L4_56 ~= "OPEN" then
      L4_56 = L3_55["dot11Profile.security"]
      if L4_56 ~= "WEP" then
        L4_56 = false
        return L4_56
      end
    end
    L4_56 = db
    L4_56 = L4_56.getTable
    L4_56 = L4_56(L5_57)
    for L8_60, L9_61 in L5_57(L6_58) do
      L10_62 = util
      L10_62 = L10_62.appendOut
      L11_63 = "vapName "
      L12_64 = L9_61["dot11VAP.vapName"]
      L11_63 = L11_63 .. L12_64 .. L13_65 .. L14_66 .. L15_67
      L10_62(L11_63)
      L10_62 = L9_61["dot11VAP.dot11Mode"]
      if L10_62 == "WDS Repeater" then
        L10_62 = L9_61["dot11VAP.vapName"]
        L11_63 = A0_52["dot11VAP.vapName"]
        if L10_62 ~= L11_63 then
          L10_62 = false
          return L10_62
        end
      end
    end
  end
  L3_55 = 0
  L4_56 = util
  L4_56 = L4_56.tableSplit
  L4_56 = L4_56(L5_57, L6_58, L7_59)
  for L8_60, L9_61 in L5_57(L6_58) do
    L10_62 = util
    L10_62 = L10_62.split
    L11_63 = L8_60
    L12_64 = "."
    L10_62 = L10_62(L11_63, L12_64)
    L11_63 = L10_62[2]
    L12_64 = db
    L12_64 = L12_64.getRows
    L12_64 = L12_64(L13_65, L14_66, L15_67)
    for L16_68, L17_69 in L13_65(L14_66) do
      L18_70 = L17_69["dot11Interface.vapName"]
      L19_71 = db
      L19_71 = L19_71.getAttribute
      L19_71 = L19_71("dot11VAP", "vapName", L18_70, "maxClients")
      L19_71 = L19_71 or 0
      if L18_70 == A0_52["dot11VAP.vapName"] then
        L19_71 = A0_52["dot11VAP.maxClients"]
      end
      if tonumber(L19_71) == 0 then
        return false
      end
      L3_55 = L3_55 + L19_71
      if L18_70 == "unused" then
        break
      end
    end
  end
  L8_60 = "name"
  L9_61 = "DOT11_MAX_ASSOC_CLIENTS"
  L10_62 = "value"
  L19_71 = L6_58(L7_59, L8_60, L9_61, L10_62)
  if L3_55 > L5_57 then
    return L6_58
  end
  return L6_58
end
L0_0.inputvalidate = L1_1
L0_0 = dot11IAPP
function L1_1(A0_72, A1_73)
  local L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80
  L2_74 = true
  for L6_78, L7_79 in L3_75(L4_76) do
    L8_80 = ""
    if A1_73 then
      L8_80 = "1"
    else
      L8_80 = "0"
    end
    L2_74 = db.setAttribute("dot11VAP", "_ROWID_", L7_79, "iappEnabled", L8_80)
    if L2_74 == false then
      return L2_74
    end
  end
  return L2_74
end
L0_0.enable = L1_1
L0_0 = dot11IAPP
function L1_1(A0_81)
  local L1_82
  L1_82 = true
  L1_82 = db.setAttribute("dot11GlobalConfig", "_ROWID_", "1", "iappBssidSecret", A0_81)
  return L1_82
end
L0_0.setBssidSecret = L1_1
L0_0 = dot11IAPPRemoteAP
function L1_1(A0_83, A1_84, A2_85)
  if dot11IAPPRemoteAP.inputvalidate(A0_83, A2_85) then
    if A2_85 == "add" then
      return db.insert("dot11IAPPRemoteAP", A0_83)
    elseif A2_85 == "edit" then
      return db.update("dot11IAPPRemoteAP", A0_83, A1_84)
    elseif A2_85 == "delete" then
      return db.delete("dot11IAPPRemoteAP", A0_83)
    end
  end
  return false
end
L0_0.config = L1_1
L0_0 = dot11IAPPRemoteAP
function L1_1(A0_86, A1_87)
  return db.typeAndRangeValidate(A0_86)
end
L0_0.inputvalidate = L1_1
L0_0 = dot11Radio
function L1_1(A0_88, A1_89, A2_90)
  if A2_90 == "add" then
    return db.insert("dot11Radio11n", A0_88)
  elseif A2_90 == "edit" then
    return db.update("dot11Radio11n", A0_88, A1_89)
  elseif A2_90 == "delete" then
    return db.delete("dot11Radio11n", A0_88)
  end
  return false
end
L0_0.config11n = L1_1
L0_0 = dot11VAP
function L1_1(A0_91, A1_92, A2_93, A3_94)
  local L4_95, L5_96
  L4_95 = 0
  L5_96 = 0
  if A0_91 == nil then
    return 1, "10797"
  end
  if A2_93 ~= nil then
    for _FORV_9_, _FORV_10_ in string.gfind(A0_91, "[" .. A1_92 .. "]") do
      if _FORV_9_ ~= A2_93 then
        L5_96 = 1
      else
        L4_95 = L4_95 + 1
      end
    end
    if L4_95 ~= A3_94 and A3_94 ~= nil then
      L5_96 = 1
    end
  elseif string.find(A0_91, "[" .. A1_92 .. "]") then
    L5_96 = 1
  else
    L5_96 = 0
  end
  return L5_96
end
L0_0.hasTypeValidate = L1_1
