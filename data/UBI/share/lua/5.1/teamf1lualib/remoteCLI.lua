local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = "accessMgmt"
L1_1 = "RemoteSnmp"
L2_2 = {}
L2_2.status = "Status"
L2_2.accessMgmtEnable = "accessMgmtEnable"
L2_2.ROWID = "_ROWID_"
L3_3 = "1"
L4_4 = "2"
L5_5 = 1
L6_6 = require
L7_7 = "teamf1lualib/policies_bl"
L6_6(L7_7)
L6_6 = require
L7_7 = "teamf1lualib/firewall"
L6_6(L7_7)
L6_6 = HIGH_SEC
if L6_6 == "HIGH" then
  L6_6 = require
  L7_7 = "teamf1lualib/sslvpn"
  L6_6(L7_7)
else
  L6_6 = require
  L7_7 = "teamf1lualib/httpsMgmt"
  L6_6(L7_7)
end
L6_6 = require
L7_7 = "com.teamf1.core.errorMap"
L6_6 = L6_6(L7_7)
L7_7 = nil
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-500N" then
  L7_7 = "/pfrm2.0/bin/"
else
  L7_7 = "/bin/"
end
function accessMgmtInputVal(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16, L9_17
  L1_9 = 3
  L2_10 = 0
  L3_11 = ""
  L4_12 = HIGH_SEC
  if L4_12 == "LOW" then
    L4_12 = printCLIError
    L4_12(L5_13)
    L4_12 = false
    return L4_12
  end
  L4_12 = A0_8["accessMgmt.accessMgmtEnable"]
  if L4_12 == "0" then
    L4_12 = A0_8["accessMgmt.accessMgmtEnableSsh"]
    if L4_12 == "0" then
      L4_12 = true
      return L4_12
    end
  end
  L4_12 = tonumber
  L4_12 = L4_12(L5_13)
  if L4_12 > 2 then
    L4_12 = printCLIError
    L4_12(L5_13)
    L4_12 = false
    return L4_12
  end
  L4_12 = tonumber
  L4_12 = L4_12(L5_13)
  if L4_12 > 0 then
    L4_12 = A0_8["accessMgmt.accessMgmtIP1"]
    if L4_12 == nil then
      L4_12 = printCLIError
      L4_12(L5_13)
      L4_12 = false
      return L4_12
    end
  end
  L4_12 = A0_8["accessMgmt.accessType"]
  if L4_12 == "1" then
    L4_12 = A0_8["accessMgmt.accessMgmtIP2"]
    if L4_12 == nil then
      L4_12 = printCLIError
      L4_12(L5_13)
      L4_12 = false
      return L4_12
    end
  end
  L4_12 = A0_8["accessMgmt.accessMgmtEnable"]
  if L4_12 == "1" then
    L4_12 = A0_8["accessMgmt.serviceType"]
    if L4_12 == "0" then
      L4_12 = os
      L4_12 = L4_12.execute
      L4_12(L5_13)
      L4_12 = {}
      for L8_16 in L5_13(L6_14) do
        L9_17 = table
        L9_17 = L9_17.insert
        L9_17(L4_12, L8_16)
      end
      for L8_16, L9_17 in L5_13(L6_14) do
        if tonumber(L9_17) == tonumber(A0_8["accessMgmt.port"]) then
          printCLIError("Configured Port is already open, please configure another port")
          return false
        end
      end
      if L5_13 <= 1024 then
        if L5_13 ~= "443" then
          L6_14(L7_15)
          while L3_11 ~= "Y" and L3_11 ~= "y" and L3_11 ~= "n" and L3_11 ~= "N" and L1_9 > L2_10 do
            L6_14(L7_15)
            L8_16 = "*l"
            L3_11 = L6_14
            L2_10 = L2_10 + 1
          end
          if L3_11 == "N" or L3_11 == "n" or L1_9 <= L2_10 then
            return L6_14
          end
        end
      end
    end
  end
  L4_12 = true
  return L4_12
end
function accessMgmtHttpInputVal(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L1_19 = 3
  L2_20 = 0
  L3_21 = ""
  L4_22 = HIGH_SEC
  if L4_22 == "HIGH" then
    L4_22 = printCLIError
    L4_22(L5_23)
    L4_22 = false
    return L4_22
  end
  L4_22 = A0_18["accessMgmt.accessMgmtEnable"]
  if L4_22 == "0" then
    L4_22 = A0_18["accessMgmt.accessMgmtEnableSsh"]
    if L4_22 == "0" then
      L4_22 = true
      return L4_22
    end
  end
  L4_22 = tonumber
  L4_22 = L4_22(L5_23)
  if L4_22 > 2 then
    L4_22 = printCLIError
    L4_22(L5_23)
    L4_22 = false
    return L4_22
  end
  L4_22 = tonumber
  L4_22 = L4_22(L5_23)
  if L4_22 > 0 then
    L4_22 = A0_18["accessMgmt.accessMgmtIP1"]
    if L4_22 == nil then
      L4_22 = printCLIError
      L4_22(L5_23)
      L4_22 = false
      return L4_22
    end
  end
  L4_22 = A0_18["accessMgmt.accessType"]
  if L4_22 == "1" then
    L4_22 = A0_18["accessMgmt.accessMgmtIP2"]
    if L4_22 == nil then
      L4_22 = printCLIError
      L4_22(L5_23)
      L4_22 = false
      return L4_22
    end
  end
  L4_22 = A0_18["accessMgmt.accessMgmtEnable"]
  if L4_22 == "1" then
    L4_22 = A0_18["accessMgmt.serviceType"]
    if L4_22 == "0" then
      L4_22 = os
      L4_22 = L4_22.execute
      L4_22(L5_23)
      L4_22 = {}
      for L8_26 in L5_23(L6_24) do
        L9_27 = table
        L9_27 = L9_27.insert
        L9_27(L4_22, L8_26)
      end
      for L8_26, L9_27 in L5_23(L6_24) do
        if tonumber(L9_27) == tonumber(A0_18["accessMgmt.port"]) then
          printCLIError("Configured Port is already open, please configure another port")
          return false
        end
      end
      if L5_23 <= 1024 then
        if L5_23 ~= "443" then
          L6_24(L7_25)
          while L3_21 ~= "Y" and L3_21 ~= "y" and L3_21 ~= "n" and L3_21 ~= "N" and L1_19 > L2_20 do
            L6_24(L7_25)
            L8_26 = "*l"
            L3_21 = L6_24
            L2_20 = L2_20 + 1
          end
          if L3_21 == "N" or L3_21 == "n" or L1_19 <= L2_20 then
            return L6_24
          end
        end
      end
    end
  end
  L4_22 = true
  return L4_22
end
function accessMgmtHttpsInit(A0_28)
  local L1_29, L2_30
  L1_29 = -1
  L2_30 = db
  L2_30 = L2_30.getRow
  L2_30 = L2_30("accessMgmt", "servicetype", "0")
  if L2_30 == nil then
    return L1_29, {}
  end
  L1_29 = L2_30["accessMgmt._ROWID_"]
  return L1_29, L2_30
end
function accessMgmtHttpInit(A0_31)
  local L1_32, L2_33
  L1_32 = -1
  L2_33 = db
  L2_33 = L2_33.getRow
  L2_33 = L2_33("accessMgmt", "servicetype", "0")
  if L2_33 == nil then
    return L1_32, {}
  end
  L1_32 = L2_33["accessMgmt._ROWID_"]
  return L1_32, L2_33
end
function accessMgmtTelnetInit(A0_34)
  local L1_35, L2_36
  L1_35 = -1
  L2_36 = db
  L2_36 = L2_36.getRow
  L2_36 = L2_36("accessMgmt", "serviceType", "1")
  if L2_36 == nil then
    return L1_35, {}
  end
  L1_35 = L2_36["accessMgmt._ROWID_"]
  return L1_35, L2_36
end
function remoteMgmtGet()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  L3_40 = {}
  if L4_41 == "HIGH" then
    L3_40.https = 0
  elseif L4_41 == "LOW" then
    L3_40.http = 0
  end
  for L7_44, _FORV_8_ in L4_41(L5_42) do
    printLabel("Remote Mgmt Configuration for " .. L7_44)
    L0_37 = db.getRow("accessMgmt", "serviceType", L3_40[L7_44])
    if L0_37 ~= nil then
      if L0_37["accessMgmt.accessMgmtEnable"] == "0" then
        print("Remote access through " .. L7_44 .. " is currently disabled")
      else
        if L0_37["accessMgmt.accessType"] == "0" then
          print("Access granted to everyone")
        end
        if L0_37["accessMgmt.accessType"] == "1" then
          print("Access granted to a range of IPs from :" .. L0_37["accessMgmt.accessMgmtIP1"] .. " to " .. L0_37["accessMgmt.accessMgmtIP2"])
        end
        if L0_37["accessMgmt.accessType"] == "2" then
          print("Access granted to the IP " .. L0_37["accessMgmt.accessMgmtIP1"])
        end
        print("port being used : " .. L0_37["accessMgmt.port"])
      end
    end
  end
  if L4_41 == "HIGH" then
    L7_44 = _UPVALUE2_
    L2_39 = L4_41
    if L2_39 then
      if L4_41 == L5_42 then
        L4_41(L5_42)
      end
    else
      L4_41(L5_42)
    end
  end
  L7_44 = _UPVALUE5_
  L1_38 = L4_41
  if L1_38 then
    if L4_41 == L5_42 then
      L4_41(L5_42)
    end
  else
    L4_41(L5_42)
  end
end
function accessMgmtCfgSave(A0_45)
  local L1_46, L2_47, L3_48
  L2_47 = ""
  L3_48 = ""
  if HIGH_SEC == "LOW" then
    A0_45["httpsMgmt.httpsMgmtEnable"] = A0_45["accessMgmt.accessMgmtEnable"]
  end
  A0_45["httpsMgmt.httpsMgmtPort"] = A0_45["accessMgmt.port"]
  L1_46, L3_48 = httpsMgmt.config(A0_45, "1", "edit")
  if L1_46 == "OK" then
    L1_46, L3_48 = fwAccessMgmt.config(A0_45, "0", "edit")
  elseif L1_46 == "ERROR" then
    db.rollback()
    L3_48 = db.getAttribute("stringsMap", "stringId", L2_47, LANGUAGE)
    return L1_46, L3_48
  end
  if L1_46 == "OK" then
    db.save()
  end
  L3_48 = db.getAttribute("stringsMap", "stringId", L2_47, LANGUAGE)
  return L1_46, L3_48
end
function accessMgmtHttpCfgSave(A0_49)
  local L1_50, L2_51, L3_52
  L2_51 = ""
  L3_52 = ""
  if HIGH_SEC == "LOW" then
    A0_49["httpsMgmt.httpsMgmtEnable"] = A0_49["accessMgmt.accessMgmtEnable"]
  end
  A0_49["httpsMgmt.httpsMgmtPort"] = A0_49["accessMgmt.port"]
  L1_50, L3_52 = httpsMgmt.config(A0_49, "1", "edit")
  if L1_50 == "OK" then
    L1_50, L3_52 = fwAccessMgmt.config(A0_49, "0", "edit")
  elseif L1_50 == "ERROR" then
    db.rollback()
    L3_52 = db.getAttribute("stringsMap", "stringId", L2_51, LANGUAGE)
    return L1_50, L3_52
  end
  if L1_50 == "OK" then
    db.save()
  elseif L1_50 == "ERROR" then
    db.rollback()
  end
  L3_52 = db.getAttribute("stringsMap", "stringId", L2_51, LANGUAGE)
  return L1_50, L3_52
end
