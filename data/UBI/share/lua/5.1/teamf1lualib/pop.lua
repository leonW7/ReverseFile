require("teamf1lualib/util")
require("teamf1lualib/radius")
if HIGH_SEC == "HIGH" then
  require("teamf1lualib/sslAdmin")
end
pop = {}
function pop.profilesConfig(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
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
  A0_0["POPProfiles.ProfileName"] = "Default"
  L4_4 = popProfilesConfig
  L5_5 = A0_0
  L6_6 = A1_1
  L7_7 = A2_2
  L4_4 = L4_4(L5_5, L6_6, L7_7)
  L3_3 = L4_4
  L4_4 = HIGH_SEC
  if L4_4 == "HIGH" and A2_2 == "edit" then
    L4_4 = {}
    L5_5 = ""
    L6_6 = ""
    L7_7 = "AuthenticationType = 'pop' AND AuthProfile = '"
    L7_7 = L7_7 .. L8_8 .. L9_9
    L4_4 = L8_8
    if L4_4 ~= nil then
      for L11_11, L12_12 in L8_8(L9_9) do
        L5_5 = db.getAttribute("UserGroups", "GroupId", L12_12["USERDBDomains.GroupId"], "_ROWID_")
        valid1, L6_6 = sslAdmin.domainConfig(L12_12, L5_5, "edit")
      end
    end
  end
  if L3_3 then
    L4_4 = db
    L4_4 = L4_4.commitTransaction
    L5_5 = true
    L4_4(L5_5)
    L4_4 = "OK"
    L5_5 = "12265"
    return L4_4, L5_5
  else
    L4_4 = db
    L4_4 = L4_4.rollback
    L4_4()
    L4_4 = "ERROR"
    L5_5 = "11481"
    return L4_4, L5_5
  end
end
function popProfilesConfig(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18, L6_19, L7_20
  if L3_16 then
    if A2_15 == "add" then
      return L3_16(L4_17, L5_18)
    elseif A2_15 == "edit" then
      L6_19 = A1_14
      return L3_16(L4_17, L5_18, L6_19)
    elseif A2_15 == "delete" then
      for L6_19, L7_20 in L3_16(L4_17) do
        valid = db.deleteRow("POPProfiles", "_ROWID_", L7_20)
        if not valid then
          return false
        end
      end
      return L3_16
    end
  end
  return L3_16
end
function pop.profilesGet()
  return db.getTable("POPProfiles")
end
function pop.CADelete(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28, L8_29
  for L4_25, L5_26 in L1_22(L2_23) do
    L6_27 = db
    L6_27 = L6_27.getAttribute
    L7_28 = "POPCAFiles"
    L8_29 = "ROWID"
    L6_27 = L6_27(L7_28, L8_29, L5_26, "CAFile")
    L7_28 = db
    L7_28 = L7_28.beginTransaction
    L7_28()
    if L6_27 then
      L7_28 = {}
      L8_29 = db
      L8_29 = L8_29.getRows
      L8_29 = L8_29("POPProfiles", "CAFile", L6_27)
      L7_28 = L8_29
      if L7_28 then
        L8_29 = #L7_28
        if L8_29 >= 1 then
          L8_29 = db
          L8_29 = L8_29.rollback
          L8_29()
          L8_29 = "ERROR"
          return L8_29, "20438"
        end
      end
    end
    L7_28 = util
    L7_28 = L7_28.runShellCmd
    L8_29 = "rm -rf"
    L8_29 = L8_29 .. " " .. "/flash/tmp/caFiles/" .. L6_27
    L7_28 = L7_28(L8_29)
    L8_29 = {}
    L8_29["POPCAFiles._ROWID_"] = L5_26
    db.delete("POPCAFiles", L8_29)
    if L7_28 then
      db.commitTransaction(true)
      return "OK", "20437"
    else
      db.rollback()
      return "ERROR", "20438"
    end
  end
end
function pop.CAAdd(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36
  L1_31 = cgilua
  L1_31 = L1_31.cookies
  L1_31 = L1_31.get
  L2_32 = "TeamF1Login"
  L1_31 = L1_31(L2_32)
  L2_32 = A0_30["POPCAFiles.CAFile"]
  L2_32 = L2_32.filename
  L3_33 = A0_30["POPCAFiles.CAFile"]
  L3_33 = L3_33.filesize
  L4_34 = tonumber
  L5_35 = L3_33
  L4_34 = L4_34(L5_35)
  if L4_34 > 1000000 then
    L4_34 = util
    L4_34 = L4_34.runShellCmd
    L5_35 = "rm -fr"
    L6_36 = " "
    L5_35 = L5_35 .. L6_36 .. "/tmp/" .. L1_31
    L4_34(L5_35)
    L4_34 = "ERROR"
    L5_35 = "20439"
    return L4_34, L5_35
  end
  L4_34 = util
  L4_34 = L4_34.runShellCmd
  L5_35 = "rm -rf"
  L6_36 = " "
  L5_35 = L5_35 .. L6_36 .. "/flash/tmp/caFiles/" .. L2_32
  L4_34(L5_35)
  L4_34 = nil
  L5_35 = db
  L5_35 = L5_35.beginTransaction
  L5_35()
  L5_35 = util
  L5_35 = L5_35.runShellCmd
  L6_36 = "mv"
  L6_36 = L6_36 .. " " .. "/tmp/" .. L1_31 .. " /flash/tmp/caFiles/" .. L2_32
  L5_35 = L5_35(L6_36)
  L4_34 = L5_35
  L5_35 = {}
  L5_35["POPCAFiles.CAFile"] = L2_32
  if L4_34 then
    L6_36 = db
    L6_36 = L6_36.getAttribute
    L6_36 = L6_36("POPCAFiles", "CAFile", L2_32, "rowid")
    if L6_36 ~= nil then
      L4_34 = db.update("POPCAFiles", L5_35, L6_36)
    else
      L4_34 = db.insert("POPCAFiles", L5_35)
    end
  end
  if L4_34 then
    L6_36 = db
    L6_36 = L6_36.commitTransaction
    L6_36(true)
    L6_36 = "OK"
    return L6_36, "20440"
  else
    L6_36 = db
    L6_36 = L6_36.rollback
    L6_36()
    L6_36 = "ERROR"
    return L6_36, "20441"
  end
end
function pop.CAAddCli(A0_37)
  local L1_38, L2_39, L3_40
  L2_39 = util
  L2_39 = L2_39.runShellCmd
  L3_40 = "rm -rf"
  L3_40 = L3_40 .. " " .. "/flash/tmp/caFiles/" .. A0_37
  L2_39(L3_40)
  L2_39 = db
  L2_39 = L2_39.beginTransaction
  L2_39()
  L2_39 = util
  L2_39 = L2_39.runShellCmd
  L3_40 = "mv"
  L3_40 = L3_40 .. " " .. "/tmp/" .. A0_37 .. " /flash/tmp/caFiles/" .. A0_37
  L2_39 = L2_39(L3_40)
  L1_38 = L2_39
  L2_39 = {}
  L2_39["POPCAFiles.CAFile"] = A0_37
  if L1_38 then
    L3_40 = db
    L3_40 = L3_40.getAttribute
    L3_40 = L3_40("POPCAFiles", "CAFile", A0_37, "rowid")
    if L3_40 ~= nil then
      L1_38 = db.update("POPCAFiles", L2_39, L3_40)
    else
      L1_38 = db.insert("POPCAFiles", L2_39)
    end
  end
  if L1_38 then
    L3_40 = db
    L3_40 = L3_40.commitTransaction
    L3_40(true)
    L3_40 = "OK"
    return L3_40, "File uploaded successfully."
  else
    L3_40 = db
    L3_40 = L3_40.rollback
    L3_40()
    L3_40 = "ERROR"
    return L3_40, "File Upload Failed."
  end
end
