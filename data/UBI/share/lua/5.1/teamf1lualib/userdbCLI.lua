local L0_0
L0_0 = require
L0_0("teamf1lualib/userdb")
L0_0 = require
L0_0("teamf1lualib/login")
L0_0 = require
L0_0("teamf1lualib/radius")
L0_0 = {}
L0_0.GroupName = "GroupName"
if HIGH_SEC == "HIGH" then
  require("teamf1lualib/sslAdmin")
  require("teamf1lualib/pop")
end
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
end
function userdbGroupsCfgInit(A0_1)
  local L1_2, L2_3
  L1_2 = A0_1[1]
  if L1_2 == nil then
    L1_2 = {}
    configRow = L1_2
    L1_2 = configRow
    L1_2["UserGroups._ROWID_"] = "-1"
  else
    L1_2 = db
    L1_2 = L1_2.getRow
    L2_3 = "UserGroups"
    L1_2 = L1_2(L2_3, "_ROWID_", A0_1[1])
    configRow = L1_2
    L1_2 = configRow
    if L1_2 == nil then
      L1_2 = print
      L2_3 = "Entered rowid does not exist\n"
      L1_2(L2_3)
      L1_2 = false
      L2_3 = {}
      return L1_2, L2_3
    end
    L1_2 = HIGH_SEC
    if L1_2 == "HIGH" then
      L1_2 = tonumber
      L2_3 = configRow
      L2_3 = L2_3["UserGroups.Capabilities"]
      L1_2 = L1_2(L2_3)
      if L1_2 == 0 then
        L1_2 = configRow
        L2_3 = db
        L2_3 = L2_3.getAttribute
        L2_3 = L2_3("USERDBDomains", "GroupId", configRow["UserGroups.GroupId"], "PortalLayoutName")
        L1_2["USERDBDomains.PortalLayoutName"] = L2_3
      end
    end
    L1_2 = 0
    L2_3 = configRow
    L2_3 = L2_3["UserGroups.Capabilities"]
    for _FORV_6_ in string.gmatch(L2_3, "%d+") do
      if _FORV_6_ == "8" then
        configRow["UserGroups.Pptp"] = "1"
      elseif _FORV_6_ == "7" then
        configRow["UserGroups.L2TP"] = "1"
      elseif _FORV_6_ == "0" then
        configRow["UserGroups.sslvpn"] = "1"
      elseif _FORV_6_ == "5" then
        configRow["UserGroups.Xauth"] = "1"
      elseif _FORV_6_ == "10" then
        configRow["UserGroups.RuntimeAuth"] = "1"
      elseif _FORV_6_ == "13" then
        configRow["UserGroups.openvpn"] = "1"
      elseif _FORV_6_ == "3" then
        configRow["UserGroups.userType"] = "1"
        L1_2 = 1
      elseif _FORV_6_ == "4" then
        configRow["UserGroups.userType"] = "3"
        L1_2 = 1
      end
    end
    if L1_2 == 0 then
      configRow["UserGroups.userType"] = "2"
    end
  end
  L1_2 = configRow
  L1_2 = L1_2["UserGroups._ROWID_"]
  L2_3 = configRow
  return L1_2, L2_3
end
function userdbUsersCfgInit(A0_4)
  if A0_4[1] == nil then
    configRow = {}
    configRow["Users._ROWID_"] = "-1"
  else
    configRow = db.getRow("Users", "_ROWID_", A0_4[1])
    if configRow == nil then
      print("Entered rowid does not exist\n")
      return -1, {}
    end
    configRow["Users.GroupName"] = db.getAttribute("UserGroups", "GroupId", configRow["Users.GroupId"], "GroupName")
  end
  return configRow["Users._ROWID_"], configRow
end
function userdbGroupsCfgSave(A0_5)
  local L1_6, L2_7, L3_8, L4_9
  L1_6 = "UserGroups"
  DBTable = L1_6
  L1_6 = false
  L2_7 = ""
  L3_8 = ""
  L4_9 = A0_5["UserGroups._ROWID_"]
  if L4_9 == "-1" then
    L4_9 = _UPVALUE0_
    L4_9 = L4_9.GroupName
    L4_9 = L4_9 .. " !='Temp-CP'"
    if db.getRowsWhere(DBTable, L4_9) ~= nil and #db.getRowsWhere(DBTable, L4_9) >= _UPVALUE1_ then
      L3_8 = "Maximum limit for groups is reached."
      return "ERROR", L3_8
    end
    L1_6, L2_7 = users.groupAdd(A0_5)
    if L2_7 == "12789" then
      L3_8 = "L2TP and PPTP user types cannot be selected together"
    elseif L2_7 == "12787" then
      L3_8 = "Admin and Xauth user types cannot be selected together"
    elseif L2_7 == "12265" then
      L3_8 = "Operation Succeeded"
    elseif L2_7 == "10180" then
      L3_8 = "Adding of Group failed"
    else
      L3_8 = L2_7
    end
  else
    L4_9 = users
    L4_9 = L4_9.groupEdit
    L2_7, L4_9 = A0_5, L4_9(A0_5, A0_5["UserGroups._ROWID_"])
    L1_6 = L4_9
    if L2_7 == "10671" then
      L3_8 = "Editing of Group failed"
    elseif L2_7 == "12265" then
      L3_8 = "Operation Succeeded"
    elseif L2_7 == "10370" then
      L3_8 = "Cannot change the protal for the only domain, As its portal is set as Default."
    else
      L3_8 = L2_7
    end
  end
  if L1_6 == "OK" then
    L4_9 = db
    L4_9 = L4_9.save
    L4_9()
  end
  L4_9 = L1_6
  return L4_9, L3_8
end
function userdbUsersCfgSave(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16
  L1_11 = "Users"
  DBTable = L1_11
  L1_11 = false
  L2_12 = ""
  L3_13 = ""
  L4_14 = ""
  L5_15 = {}
  L6_16 = ""
  A0_10["Users.GroupId"] = db.getAttribute("UserGroups", "GroupName", A0_10["Users.GroupName"], "GroupId")
  L5_15["Users.UserName"] = A0_10["Users.UserName"]
  L5_15["Users.Password"] = A0_10["Users.Password"]
  L5_15["Users.FirstName"] = A0_10["Users.FirstName"]
  L5_15["Users.LastName"] = A0_10["Users.LastName"]
  L5_15["Users.AllowChangePassword"] = "0"
  L5_15["Users.EnableChangePasswd"] = A0_10["Users.enableChangePasswd"]
  L5_15["Users.GroupName"] = A0_10["Users.GroupName"]
  L5_15["Users.GroupId"] = A0_10["Users.GroupId"]
  if A0_10["Users._ROWID_"] ~= "-1" then
    L1_11, L6_16 = users.userEdit(L5_15, A0_10["Users._ROWID_"])
    if L6_16 == "12265" then
      L3_13 = "Operation Succeeded"
    elseif L6_16 == "10791" then
      L3_13 = "Failed to edit user"
    else
      L3_13 = L6_16
    end
  elseif A0_10["Users._ROWID_"] == "-1" then
    L5_15["Users.GroupName"] = A0_10["Users.GroupName"]
    L1_11, L6_16 = users.userAdd(L5_15)
    if L6_16 == "12463" then
      L3_13 = "User already exists"
    elseif L6_16 == "12265" then
      L3_13 = "Operation Succeeded"
    elseif L6_16 == "10784" then
      L3_13 = "Failed to add user"
    else
      L3_13 = L6_16
    end
  end
  if L1_11 == "OK" then
    db.save()
  end
  return L1_11, L3_13
end
function userdbGroupsCfgInputVal(A0_17)
  if A0_17["UserGroups.GroupName"] == nil or A0_17["UserGroups.GroupName"] == "" then
    printCLIError("Please enter valid groupname")
    return false
  end
  if 24 < string.len(A0_17["UserGroups.GroupName"]) or 0 > string.len(A0_17["UserGroups.GroupName"]) then
    printCLIError("Please enter upto 24 characters for groupname.")
    return false
  end
  if A0_17["UserGroups.Description"] == nil or A0_17["UserGroups.Description"] == "" then
    printCLIError("Please enter a short description of this group")
    return false
  end
  if A0_17["UserGroups.userType"] == nil or tonumber(A0_17["UserGroups.userType"]) == 0 then
    printCLIError("Please choose user type for the group.")
    return false
  end
  if tonumber(A0_17["UserGroups.userType"]) == 1 then
    A0_17["UserGroups.Admin"] = "1"
  elseif tonumber(A0_17["UserGroups.userType"]) == 3 then
    A0_17["UserGroups.Guest"] = "1"
  end
  if A0_17["UserGroups.Admin"] ~= "1" and A0_17["UserGroups.Guest"] ~= "1" and (A0_17["UserGroups.sslvpn"] == nil or tonumber(A0_17["UserGroups.sslvpn"]) == 0) and (A0_17["UserGroups.L2TP"] == nil or tonumber(A0_17["UserGroups.L2TP"]) == 0) and (A0_17["UserGroups.Pptp"] == nil or tonumber(A0_17["UserGroups.Pptp"]) == 0) and (A0_17["UserGroups.Xauth"] == nil or tonumber(A0_17["UserGroups.Xauth"]) == 0) and (A0_17["UserGroups.RuntimeAuth"] == nil or tonumber(A0_17["UserGroups.RuntimeAuth"]) == 0) and (A0_17["UserGroups.openvpn"] == nil or tonumber(A0_17["UserGroups.openvpn"]) == 0) then
    printCLIError("Please choose privilege for the group.")
    return false
  end
  if tonumber(A0_17["UserGroups.Guest"]) == 1 and (tonumber(A0_17["UserGroups.sslvpn"]) == 1 or tonumber(A0_17["UserGroups.L2TP"]) == 1 or tonumber(A0_17["UserGroups.Pptp"]) == 1 or tonumber(A0_17["UserGroups.Xauth"]) == 1 or tonumber(A0_17["UserGroups.openvpn"]) == 1 or tonumber(A0_17["UserGroups.RuntimeAuth"]) == 1) then
    if UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
      if HIGH_SEC == "HIGH" then
        printCLIError("SSLVPN/L2TP/PPTP/OpenVpn/Xauth/ privileges " .. "are not allowed when user type 'Guest' is selected.\n")
        return false
      else
        printCLIError("L2TP/PPTP/Xauth/ privileges are not allowed " .. "when user type 'Guest' is selected.\n")
        return false
      end
    elseif UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
      if HIGH_SEC == "HIGH" then
        printCLIError("SSLVPN/L2TP/PPTP/OpenVpn/Xauth/" .. "CaptivePortal privileges are not allowed when user " .. "type 'Guest' is selected.\n")
        return false
      else
        printCLIError("L2TP/PPTP/Xauth/CaptivePortal privileges" .. " are not allowed when user type 'Guest' is selected." .. "\n")
        return false
      end
    end
  end
  if tonumber(A0_17["UserGroups.Admin"]) == 1 and tonumber(A0_17["UserGroups.Xauth"]) == 1 then
    printCLIError("Xauth privilege type cannot be selected " .. "when user type 'Admin' is selected.\n")
    return false
  elseif tonumber(A0_17["UserGroups.Pptp"]) == 1 and tonumber(A0_17["UserGroups.L2TP"]) == 1 then
    printCLIError("L2TP and PPTP privilege types cannot be selected " .. "together.\n")
    return false
  end
  if A0_17["UserGroups.GroupTimeOut"] == nil or A0_17["UserGroups.GroupTimeOut"] == "" then
    printCLIError("Please enter valid timeout value")
    return false
  end
  return true
end
function userdbUsersCfgInputVal(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31
  L1_19 = ""
  L2_20 = nil
  L3_21 = 24
  L4_22 = 0
  L5_23 = 128
  L6_24 = 0
  L7_25 = A0_18["Users._ROWID_"]
  if L7_25 == "-1" then
    L7_25 = A0_18["Users.GroupName"]
    if L7_25 == "admin" then
      A0_18["Users.GroupName"] = "ADMIN"
    end
    L7_25 = A0_18["Users.GroupName"]
    if L7_25 == "guest" then
      A0_18["Users.GroupName"] = "GUEST"
    end
  end
  L7_25 = A0_18["Users._ROWID_"]
  if L7_25 ~= "-1" then
    L7_25 = db
    L7_25 = L7_25.existsRow
    L8_26 = "UserGroups"
    L9_27 = "GroupName"
    L10_28 = A0_18["Users.GroupName"]
    L7_25 = L7_25(L8_26, L9_27, L10_28)
    if not L7_25 then
      L7_25 = printCLIError
      L8_26 = "Group does not exist.Use command 'show system group "
      L9_27 = "all' to see all groups on system for editing the Group Name.\n"
      L8_26 = L8_26 .. L9_27
      L7_25(L8_26)
      L7_25 = false
      return L7_25
    end
  end
  L7_25 = A0_18["Users.UserName"]
  if L7_25 ~= nil then
    L7_25 = A0_18["Users.UserName"]
  elseif L7_25 == "" then
    L7_25 = printCLIError
    L8_26 = "Please enter valid username"
    L7_25(L8_26)
    L7_25 = false
    return L7_25
  end
  L7_25 = string
  L7_25 = L7_25.len
  L8_26 = A0_18["Users.UserName"]
  L7_25 = L7_25(L8_26)
  if L3_21 < L7_25 or L4_22 > L7_25 then
    L8_26 = printCLIError
    L9_27 = "Please enter upto 24 characters for username."
    L8_26(L9_27)
    L8_26 = false
    return L8_26
  end
  L8_26 = A0_18["Users.FirstName"]
  if L8_26 ~= nil then
    L8_26 = A0_18["Users.FirstName"]
  elseif L8_26 == "" then
    L8_26 = printCLIError
    L9_27 = "Please enter user's first name"
    L8_26(L9_27)
    L8_26 = false
    return L8_26
  end
  L8_26 = string
  L8_26 = L8_26.len
  L9_27 = A0_18["Users.FirstName"]
  L8_26 = L8_26(L9_27)
  if L3_21 < L8_26 or L4_22 > L8_26 then
    L9_27 = printCLIError
    L10_28 = "Please enter upto 24 characters for user's firstname ."
    L9_27(L10_28)
    L9_27 = false
    return L9_27
  end
  L9_27 = A0_18["Users.LastName"]
  if L9_27 ~= nil then
    L9_27 = A0_18["Users.LastName"]
  elseif L9_27 == "" then
    L9_27 = printCLIError
    L10_28 = "Please enter user's last name"
    L9_27(L10_28)
    L9_27 = false
    return L9_27
  end
  L9_27 = string
  L9_27 = L9_27.len
  L10_28 = A0_18["Users.LastName"]
  L9_27 = L9_27(L10_28)
  if L3_21 < L9_27 or L4_22 > L9_27 then
    L10_28 = printCLIError
    L11_29 = "Please enter upto 24 characters for user's lastname."
    L10_28(L11_29)
    L10_28 = false
    return L10_28
  end
  L10_28 = A0_18["Users._ROWID_"]
  if L10_28 == "-1" then
    L10_28 = A0_18["Users.Password"]
    if L10_28 ~= nil then
      L10_28 = A0_18["Users.Password"]
    elseif L10_28 == "" then
      L10_28 = printCLIError
      L11_29 = "Please enter a password for this user"
      L10_28(L11_29)
      L10_28 = false
      return L10_28
    end
  end
  L10_28 = string
  L10_28 = L10_28.len
  L11_29 = A0_18["Users.Password"]
  L10_28 = L10_28(L11_29)
  if L5_23 < L10_28 or L6_24 > L10_28 then
    L11_29 = printCLIError
    L12_30 = "Please enter upto 128 characters for user's Password."
    L11_29(L12_30)
    L11_29 = false
    return L11_29
  end
  L11_29 = A0_18["Users._ROWID_"]
  if L11_29 == "-1" then
    L11_29 = A0_18["Users.CfmPassword"]
    if L11_29 ~= nil then
      L11_29 = A0_18["Users.CfmPassword"]
    elseif L11_29 == "" then
      L11_29 = printCLIError
      L12_30 = "Please re-enter the password to confirm"
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
    L11_29 = A0_18["Users.Password"]
    L12_30 = A0_18["Users.CfmPassword"]
    if L11_29 ~= L12_30 then
      L11_29 = printCLIError
      L12_30 = "Passwords do not match"
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
  end
  L11_29 = A0_18["Users._ROWID_"]
  if L11_29 == "-1" then
    L11_29 = A0_18["Users.GroupName"]
    if L11_29 ~= nil then
      L11_29 = A0_18["Users.GroupName"]
    elseif L11_29 == "" then
      L11_29 = printCLIError
      L12_30 = "Please enter the groupname to which user is to be added"
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
    L11_29 = db
    L11_29 = L11_29.existsRow
    L12_30 = "UserGroups"
    L13_31 = "GroupName"
    L11_29 = L11_29(L12_30, L13_31, A0_18["Users.GroupName"])
    if not L11_29 then
      L11_29 = printCLIError
      L12_30 = "Group does not exist.Use command 'show system group all' to see all groups on system"
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
  end
  L11_29 = A0_18["Users._ROWID_"]
  if L11_29 == "-1" then
    L11_29 = users
    L11_29 = L11_29.totalUsersCheck
    L12_30 = _UPVALUE0_
    L11_29 = L11_29(L12_30)
    L1_19 = L11_29
    if L1_19 ~= "OK" then
      L11_29 = printCLIError
      L12_30 = "Max limit reached for the number of users"
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
    L11_29 = users
    L11_29 = L11_29.UsersPerGroup
    L12_30 = A0_18["Users.GroupName"]
    L13_31 = _UPVALUE1_
    L11_29 = L11_29(L12_30, L13_31)
    L1_19 = L11_29
    if L1_19 ~= "OK" then
      L11_29 = printCLIError
      L12_30 = "Maximum limit reached for the number of users for this group."
      L11_29(L12_30)
      L11_29 = false
      return L11_29
    end
  end
  L11_29 = A0_18["Users._ROWID_"]
  if L11_29 ~= "-1" then
    L11_29 = "/var/LoginUserName.txt"
    L12_30 = os
    L12_30 = L12_30.execute
    L13_31 = "echo $USER >"
    L13_31 = L13_31 .. L11_29
    L12_30(L13_31)
    L12_30 = io
    L12_30 = L12_30.open
    L13_31 = L11_29
    L12_30 = L12_30(L13_31, "r")
    L13_31 = L12_30.read
    L13_31 = L13_31(L12_30, "*line")
    if L13_31 ~= nil then
      if A0_18["Users.current_password"] ~= nil then
        if A0_18["Users.current_password"] ~= (db.getAttribute("Users", "UserName", L13_31, "Password") or "") then
          print("current password did not match.")
          return false
        end
        if L5_23 < string.len(A0_18["Users.new_password"]) or L6_24 > string.len(A0_18["Users.new_password"]) then
          printCLIError("Please enter upto 128 characters for" .. " user's New Password.")
          return false
        end
        if A0_18["Users.new_password"] ~= A0_18["Users.new_password_confirm"] then
          print("new password mismatch.")
          return false
        end
        A0_18["Users.Password"] = A0_18["Users.new_password"]
      end
    end
    L12_30:close()
  end
  L11_29 = A0_18["Users.GroupName"]
  if L11_29 == nil then
    L11_29 = db
    L11_29 = L11_29.getRow
    L12_30 = "Users"
    L13_31 = "_ROWID_"
    L11_29 = L11_29(L12_30, L13_31, A0_18["Users._ROWID_"])
    groupName = L11_29
    L11_29 = db
    L11_29 = L11_29.getRow
    L12_30 = "UserGroups"
    L13_31 = "GroupId"
    L11_29 = L11_29(L12_30, L13_31, groupName["Users.GroupId"])
    L2_20 = L11_29
  else
    L11_29 = db
    L11_29 = L11_29.getRow
    L12_30 = "UserGroups"
    L13_31 = "GroupName"
    L11_29 = L11_29(L12_30, L13_31, A0_18["Users.GroupName"])
    L2_20 = L11_29
  end
  L11_29 = A0_18["Users.enableChangePasswd"]
  if L11_29 ~= nil then
    L11_29 = tonumber
    L12_30 = L2_20["UserGroups.Capabilities"]
    L11_29 = L11_29(L12_30)
    if L11_29 ~= 10 then
      L11_29 = tonumber
      L12_30 = A0_18["Users.enableChangePasswd"]
      L11_29 = L11_29(L12_30)
      if L11_29 == 1 then
        L11_29 = tonumber
        L12_30 = 0
        L11_29 = L11_29(L12_30)
        A0_18["Users.enableChangePasswd"] = L11_29
        L11_29 = print
        L12_30 = "Enable change password is applicable only for captive portal users"
        L11_29(L12_30)
      end
    end
  else
    L11_29 = tonumber
    L12_30 = 0
    L11_29 = L11_29(L12_30)
    A0_18["Users.enableChangePasswd"] = L11_29
  end
  L11_29 = true
  return L11_29
end
function userdbGroupsCfgDel(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37
  L1_33 = {}
  L2_34 = ""
  L3_35 = ""
  L4_36 = ""
  L5_37 = {}
  L5_37 = db.getRow("UserGroups", "_ROWID_", A0_32[1])
  if L5_37 == nil then
    print("Entered rowid does not exist\n")
    return
  end
  L1_33[1] = A0_32[1]
  L4_36, L3_35 = users.groupDelete(L1_33)
  if L3_35 == "10513" then
    L2_34 = "Default Group(s) cannot be deleted"
  elseif L3_35 == "10884" then
    L2_34 = "Group cannot be deleted if it contains User(s)"
  elseif L3_35 == "12265" then
    L2_34 = "Operation Succeeded"
  elseif L3_35 == "10883" then
    L2_34 = "Group cannot be deleted"
  else
    L2_34 = L3_35
  end
  if L4_36 == "OK" then
    db.save()
  else
    print(L2_34)
  end
  return L4_36, L2_34
end
function userdbUsersCfgDel(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43
  L1_39 = ""
  L2_40 = ""
  L3_41 = {}
  L4_42 = {}
  L5_43 = ""
  L3_41 = db.getRow("Users", "_ROWID_", A0_38[1])
  if L3_41 == nil then
    print("Entered rowid does not exist\n")
    return
  end
  L4_42[1] = A0_38[1]
  L5_43, L1_39 = users.userDelete(L4_42)
  if L1_39 == "10520" then
    L2_40 = "Default User(s) cannot be deleted"
  elseif L1_39 == "12468" then
    L2_40 = "User deletion failed due to logged in users"
  elseif L1_39 == "12265" then
    L2_40 = "Operation Succeeded"
  elseif L1_39 == "10787" then
    L2_40 = "Failed to delete user"
  else
    L2_40 = L1_39
  end
  if L5_43 == "OK" then
    db.save()
  else
    print(L2_40)
  end
  return L5_43, L2_40
end
function userdbUsersGet(A0_44)
  local L1_45, L2_46, L3_47, L4_48
  L1_45 = A0_44[1]
  L2_46 = {}
  L3_47 = {}
  L4_48 = ""
  if L1_45 ~= nil then
    L2_46 = db.getRow("Users", "Users._ROWID_", L1_45)
  end
  if L2_46 ~= nil then
    if L2_46["Users.Password"] ~= nil or L2_46["Users.Password"] == "" then
      L2_46["Users.Password"] = util.mask(L2_46["Users.Password"])
    end
    resTab.insertField(L3_47, "UserName", L2_46["Users.UserName"] or "")
    resTab.insertField(L3_47, "Group", db.getAttribute("UserGroups", "GroupId", L2_46["Users.GroupId"], "GroupName"))
    resTab.insertField(L3_47, "First Name", L2_46["Users.FirstName"] or "")
    resTab.insertField(L3_47, "Last Name", L2_46["Users.LastName"] or "")
    resTab.insertField(L3_47, "User Id", L2_46["Users.UserId"] or "")
    resTab.insertField(L3_47, "Password", L2_46["Users.Password"] or "")
    resTab.insertField(L3_47, "Default User", L2_46["Users.DefaultUser"] or "")
    resTab.print(L3_47, 0)
  else
    printCLIError("Row does not exist")
  end
end
function userdbGroupsGet(A0_49)
  local L1_50, L2_51, L3_52, L4_53
  L1_50 = A0_49[1]
  L2_51 = {}
  L3_52 = {}
  L4_53 = ""
  if L1_50 ~= nil then
    L2_51 = db.getRow("UserGroups", "UserGroups._ROWID_", L1_50)
  end
  if L2_51 ~= nil then
    capabilityRow = users.capabilitiesGet(L2_51["UserGroups.GroupId"])
    for _FORV_11_, _FORV_12_ in pairs(capabilityRow) do
      if _FORV_12_ == "0" then
        L4_53 = L4_53 .. "sslvpn, "
      elseif _FORV_12_ == "3" then
        L4_53 = L4_53 .. "Admin, "
      elseif _FORV_12_ == "4" then
        L4_53 = L4_53 .. "Guest, "
      elseif _FORV_12_ == "5" then
        L4_53 = L4_53 .. "Xauth, "
      elseif _FORV_12_ == "7" then
        L4_53 = L4_53 .. "L2TP, "
      elseif _FORV_12_ == "8" then
        L4_53 = L4_53 .. "PPTP, "
      elseif _FORV_12_ == "10" then
        L4_53 = L4_53 .. "Captive Portal, "
      elseif _FORV_12_ == "13" then
        L4_53 = L4_53 .. "OpenVPN, "
      end
    end
    L4_53 = string.sub(L4_53, 1, -3)
    resTab.insertField(L3_52, "GroupName", L2_51["UserGroups.GroupName"] or "")
    resTab.insertField(L3_52, "GroupId", L2_51["UserGroups.GroupId"] or "")
    resTab.insertField(L3_52, "Description", L2_51["UserGroups.Description"] or "")
    resTab.insertField(L3_52, "Privilege", L4_53 or "")
    if 1 == 1 and HIGH_SEC == "HIGH" then
      resTab.insertField(L3_52, "Portal Name", db.getRow("USERDBDomains", "GroupId", L2_51["UserGroups.GroupId"])["USERDBDomains.PortalLayoutName"] or "")
      resTab.insertField(L3_52, "Authentication Type", db.getRow("USERDBDomains", "GroupId", L2_51["UserGroups.GroupId"])["USERDBDomains.AuthenticationType"] or "")
    end
    resTab.insertField(L3_52, "Idle timeout", L2_51["UserGroups.GroupTimeOut"] or "")
    resTab.print(L3_52, 0)
  else
    printCLIError("Row does not exist")
  end
end
function groupAccessControlCfgInit(A0_54)
  configRow = db.getRow("GroupAccessControl", "GroupId", A0_54[1])
  if configRow == nil then
    printCLIError("No Access control configuration found for the specified group")
    return -1, {}
  else
    return 1, configRow
  end
end
function groupAccessControlCfgSave(A0_55)
  local L1_56, L2_57, L3_58
  L1_56 = ""
  L2_57 = ""
  L3_58 = ""
  db.beginTransaction()
  rowid = db.getAttribute("UserGroups", "GroupId", A0_55["GroupAccessControl.GroupId"], "_ROWID_")
  L3_58, L1_56 = login.loginPolicyConfig("GroupAccessControl", A0_55, rowid, "edit")
  if L1_56 == "12810" then
    L2_57 = "DENY_LOGIN_DEFAULT_ADMIN"
  elseif L1_56 == "12265" then
    L2_57 = "Operation Succeeded"
  elseif L1_56 == "12230" then
    L2_57 = "SSLVPN User(s) Configuration Failed"
  else
    L2_57 = L1_56
  end
  if L3_58 == "OK" then
    db.commitTransaction(true)
    db.save()
  else
    db.rollback()
  end
  return L3_58, L2_57
end
function groupAccessControlCfgVal(A0_59)
  local L1_60
  L1_60 = A0_59["GroupAccessControl.GroupId"]
  if L1_60 ~= nil then
    L1_60 = A0_59["GroupAccessControl.GroupId"]
  else
    if L1_60 == "" then
      L1_60 = printCLIError
      L1_60("Invalid group_id value")
      L1_60 = false
      return L1_60
  end
  else
    L1_60 = A0_59["GroupAccessControl.DenyLogin"]
    if L1_60 ~= nil then
      L1_60 = A0_59["GroupAccessControl.DenyLogin"]
    else
      if L1_60 == "" then
        L1_60 = printCLIError
        L1_60("Invalid deny_login value")
        L1_60 = false
        return L1_60
    end
    else
      L1_60 = A0_59["GroupAccessControl.DenyLoginFromWan"]
      if L1_60 ~= nil then
        L1_60 = A0_59["GroupAccessControl.DenyLoginFromWan"]
      elseif L1_60 == "" then
        L1_60 = printCLIError
        L1_60("Invalid deny_login_wan value")
        L1_60 = false
        return L1_60
      end
    end
  end
  L1_60 = db
  L1_60 = L1_60.getAttribute
  L1_60 = L1_60("UserGroups", "GroupId", A0_59["GroupAccessControl.GroupId"], "Capabilities")
  if not users.isUserType(L1_60, "0") and not users.isUserType(L1_60, "3") and not users.isUserType(L1_60, "4") and not users.isUserType(L1_60, "10") then
    printCLIError("The selected group does not have privileges to configure login policies")
    return false
  end
  return true
end
function groupAccessControlBrowserCfgInit(A0_61)
  local L1_62, L2_63, L3_64
  L1_62 = {}
  L2_63 = 1
  L3_64 = L1_62
  return L2_63, L3_64
end
function groupAccessControlBrowserCfgSave(A0_65)
  local L1_66, L2_67, L3_68
  L1_66 = ""
  L2_67 = ""
  L3_68 = ""
  db.beginTransaction()
  L1_66, L3_68 = login.loginPolicyConfig("AccessControlUserGroupPolicyBrowser", A0_65, "-1", "add")
  if L3_68 == "12810" then
    L2_67 = "DENY_LOGIN_DEFAULT_ADMIN"
  elseif L3_68 == "12265" then
    L2_67 = "Operation Succeeded"
  elseif L3_68 == "12230" then
    L2_67 = "SSLVPN User(s) Configuration Failed"
  else
    L2_67 = L3_68
  end
  if L1_66 == "OK" then
    db.commitTransaction(true)
    db.save()
  else
    db.rollback()
  end
  return L1_66, L2_67
end
function groupAccessControlBrowserCfgVal(A0_69)
  local L1_70
  L1_70 = A0_69["AccessControlUserGroupPolicyBrowser.GroupId"]
  if L1_70 ~= nil then
    L1_70 = A0_69["AccessControlUserGroupPolicyBrowser.GroupId"]
  else
    if L1_70 == "" then
      L1_70 = printCLIError
      L1_70("Invalid group_id value")
      L1_70 = false
      return L1_70
  end
  else
    L1_70 = A0_69["AccessControlUserGroupPolicyBrowser.ClientBrowserName"]
    if L1_70 ~= nil then
      L1_70 = A0_69["AccessControlUserGroupPolicyBrowser.ClientBrowserName"]
    elseif L1_70 == "" then
      L1_70 = printCLIError
      L1_70("Invalid browser_name value")
      L1_70 = false
      return L1_70
    end
  end
  L1_70 = db
  L1_70 = L1_70.getRow
  L1_70 = L1_70("UserGroups", "GroupId", A0_69["AccessControlUserGroupPolicyBrowser.GroupId"] or "")
  if L1_70 == nil then
    L1_70 = printCLIError
    L1_70("No group exists with the specified groupid")
    L1_70 = false
    return L1_70
  end
  L1_70 = db
  L1_70 = L1_70.getAttribute
  L1_70 = L1_70("UserGroups", "GroupId", A0_69["AccessControlUserGroupPolicyBrowser.GroupId"], "Capabilities")
  if not users.isUserType(L1_70, "0") and not users.isUserType(L1_70, "3") and not users.isUserType(L1_70, "4") and not users.isUserType(L1_70, "10") then
    printCLIError("The selected group does not have privileges to configure login policies")
    return false
  end
  return db.typeAndRangeValidate(A0_69)
end
function groupAccessControlBrowserDelete(A0_71)
  local L1_72, L2_73, L3_74
  L1_72 = "ERROR"
  L2_73 = ""
  L3_74 = ""
  if db.getRow("AccessControlUserGroupPolicyBrowser", "_ROWID_", A0_71[1]) == nil then
    printCLIError("Row does not exist")
    return L1_72, "Row does not exist"
  end
  db.beginTransaction()
  L1_72, L2_73 = login.loginPolicyConfig("AccessControlUserGroupPolicyBrowser", A0_71, "-1", "delete")
  if L2_73 == "12810" then
    L3_74 = "DENY_LOGIN_DEFAULT_ADMIN"
  elseif L2_73 == "12265" then
    L3_74 = "Operation Succeeded"
  elseif L2_73 == "12230" then
    L3_74 = "SSLVPN User(s) Configuration Failed"
  else
    L3_74 = L2_73
  end
  if L1_72 == "OK" then
    db.commitTransaction(true)
    db.save()
  else
    db.rollback()
    printCLIError(L3_74 or L2_73)
  end
  return L1_72, L3_74
end
function groupAccessControlIPCfgInit(A0_75)
  local L1_76, L2_77, L3_78
  L1_76 = {}
  L2_77 = 1
  L3_78 = L1_76
  return L2_77, L3_78
end
function groupAccessControlIPCfgSave(A0_79)
  local L1_80, L2_81, L3_82
  L1_80 = "ERROR"
  L2_81 = ""
  L3_82 = ""
  db.beginTransaction()
  L1_80, L2_81 = login.loginPolicyConfig("AccessControlUserGroupPolicyIPAddress", A0_79, "-1", "add")
  if L2_81 == "12810" then
    L3_82 = "DENY_LOGIN_DEFAULT_ADMIN"
  elseif L2_81 == "12265" then
    L3_82 = "Operation Succeeded"
  elseif L2_81 == "12230" then
    L3_82 = "SSLVPN User(s) Configuration Failed"
  else
    L3_82 = L2_81
  end
  if L1_80 == "OK" then
    db.commitTransaction(true)
    db.save()
  else
    db.rollback()
  end
  return L1_80, L3_82
end
function groupAccessControlIPCfgVal(A0_83)
  local L1_84
  L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.GroupId"]
  if L1_84 ~= nil then
    L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.GroupId"]
  elseif L1_84 == "" then
    L1_84 = printCLIError
    L1_84("Invalid group_id value")
    L1_84 = false
    return L1_84
  end
  L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.AddressType"]
  if L1_84 ~= nil then
    L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.AddressType"]
  elseif L1_84 == "" then
    L1_84 = printCLIError
    L1_84("Invalid address_type value")
    L1_84 = false
    return L1_84
  end
  L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.Address"]
  if L1_84 ~= nil then
    L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.Address"]
    if L1_84 ~= "" then
      L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.Address"]
    end
  elseif L1_84 == "0.0.0.0" then
    L1_84 = printCLIError
    L1_84("Invalid source_address value")
    L1_84 = false
    return L1_84
  end
  L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.AddressType"]
  if L1_84 == "1" then
    L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.MaskLength"]
    if L1_84 ~= nil then
      L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.MaskLength"]
    elseif L1_84 == "" then
      L1_84 = printCLIError
      L1_84("Invalid mask_length value")
      L1_84 = false
      return L1_84
    end
  else
    L1_84 = A0_83["AccessControlUserGroupPolicyIPAddress.AddressType"]
    if L1_84 == "0" then
      A0_83["AccessControlUserGroupPolicyIPAddress.MaskLength"] = "32"
      L1_84 = util
      L1_84 = L1_84.split
      L1_84 = L1_84(A0_83["AccessControlUserGroupPolicyIPAddress.Address"], ".")
      if tonumber(L1_84[1]) < 1 or tonumber(L1_84[1]) > 223 then
        printCLIError("Invalid IP Address,Please enter a value between 1-223 for octet1")
        return false
      end
      if 1 > tonumber(L1_84[4]) or tonumber(L1_84[4]) > 254 then
        printCLIError("Invalid IP Address,Please enter a value between 1-254 for octet4")
        return false
      end
    end
  end
  L1_84 = db
  L1_84 = L1_84.getRow
  L1_84 = L1_84("UserGroups", "GroupId", A0_83["AccessControlUserGroupPolicyIPAddress.GroupId"] or "")
  if L1_84 == nil then
    L1_84 = printCLIError
    L1_84("No group exists with the specified groupid")
    L1_84 = false
    return L1_84
  end
  L1_84 = db
  L1_84 = L1_84.getAttribute
  L1_84 = L1_84("UserGroups", "GroupId", A0_83["AccessControlUserGroupPolicyIPAddress.GroupId"], "Capabilities")
  if not users.isUserType(L1_84, "0") and not users.isUserType(L1_84, "3") and not users.isUserType(L1_84, "4") and not users.isUserType(L1_84, "10") then
    printCLIError("The selected group does not have privileges to configure login policies")
    return false
  end
  return db.typeAndRangeValidate(A0_83)
end
function groupAccessControlIPDelete(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = "ERROR"
  L2_87 = ""
  L3_88 = ""
  if db.getRow("AccessControlUserGroupPolicyIPAddress", "_ROWID_", A0_85[1]) == nil then
    printCLIError("Row does not exist")
    return L1_86, "Row does not exist"
  end
  db.beginTransaction()
  L1_86, L2_87 = login.loginPolicyConfig("AccessControlUserGroupPolicyIPAddress", A0_85, "-1", "delete")
  if L2_87 == "12810" then
    L3_88 = "DENY_LOGIN_DEFAULT_ADMIN"
  elseif L2_87 == "12265" then
    L3_88 = "Operation Succeeded"
  elseif L2_87 == "12230" then
    L3_88 = "SSLVPN User(s) Configuration Failed"
  else
    L3_88 = L2_87
  end
  if L1_86 == "OK" then
    db.commitTransaction(true)
    db.save()
  else
    db.rollback()
    printCLIError(L3_88 or L2_87)
  end
  return L1_86, L3_88
end
function groupAccessControlShow(A0_89)
  local L1_90
  L1_90 = db
  L1_90 = L1_90.getRow
  L1_90 = L1_90("GroupAccessControl", "GroupId", A0_89[1])
  configRow = L1_90
  L1_90 = configRow
  if L1_90 ~= nil then
    L1_90 = {}
    resTab.insertField(L1_90, "Deny Login", configRow["GroupAccessControl.DenyLogin"] or "")
    resTab.insertField(L1_90, "Deny Login from WAN", configRow["GroupAccessControl.DenyLoginFromWan"] or "")
    resTab.insertField(L1_90, "Allow Login from defined Addresses", configRow["GroupAccessControl.LoginFromIP"] or "")
    resTab.insertField(L1_90, "Allow Login from defined Browsers", configRow["GroupAccessControl.LoginFromBrowser"] or "")
    printLabel("Group Login Policies.")
    resTab.print(L1_90, 0)
  else
    L1_90 = printCLIError
    L1_90("Row does not exist.")
  end
end
function groupAccessControlBrowserShow(A0_91)
  local L1_92, L2_93
  L1_92 = db
  L1_92 = L1_92.getTable
  L2_93 = "AccessControlUserGroupPolicyBrowser"
  L1_92 = L1_92(L2_93)
  L2_93 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_92) do
    resTab.insertField(L2_93, "Row Id", _FORV_8_["AccessControlUserGroupPolicyBrowser._ROWID_"])
    resTab.insertField(L2_93, "Group Id", _FORV_8_["AccessControlUserGroupPolicyBrowser.GroupId"] or "")
    resTab.insertField(L2_93, "Browser", _FORV_8_["AccessControlUserGroupPolicyBrowser.ClientBrowserName"] or "")
  end
  printLabel("Access Control Browser Policies")
  resTab.print(L2_93, 0)
end
function groupAccessControlIPShow(A0_94)
  local L1_95, L2_96, L3_97, L4_98
  L1_95 = db
  L1_95 = L1_95.getTable
  L2_96 = "AccessControlUserGroupPolicyIPAddress"
  L1_95 = L1_95(L2_96)
  L2_96 = {}
  L3_97 = 0
  L4_98 = ""
  for _FORV_8_, _FORV_9_ in pairs(L1_95) do
    L3_97 = L3_97 + 1
    resTab.insertField(L2_96, "Row Id", _FORV_9_["AccessControlUserGroupPolicyIPAddress._ROWID_"] or "")
    resTab.insertField(L2_96, "Group Id", _FORV_9_["AccessControlUserGroupPolicyIPAddress.GroupId"] or "")
    if _FORV_9_["AccessControlUserGroupPolicyIPAddress.AddressType"] == "0" then
      L4_98 = "IP Address"
    elseif _FORV_9_["AccessControlUserGroupPolicyIPAddress.AddressType"] == "1" then
      L4_98 = "IP Network"
    else
      L4_98 = "UNKNOWN"
    end
    resTab.insertField(L2_96, "Address Type", L4_98)
    resTab.insertField(L2_96, "Address", _FORV_9_["AccessControlUserGroupPolicyIPAddress.Address"] or "")
    resTab.insertField(L2_96, "Mask Length", _FORV_9_["AccessControlUserGroupPolicyIPAddress.MaskLength"] or "")
  end
  printLabel("Access Control IP Policies")
  resTab.print(L2_96, 0)
end
function userdbUsersGetAll()
  local L0_99, L1_100, L2_101, L3_102, L4_103, L5_104, L6_105, L7_106
  L0_99 = db
  L0_99 = L0_99.getTable
  L1_100 = "Users"
  L0_99 = L0_99(L1_100)
  L1_100 = {}
  L2_101 = nil
  L3_102 = 0
  L4_103 = ""
  L5_104 = ""
  L6_105 = ""
  L7_106 = ""
  printLabel("-------------USERS----------------\n")
  if L0_99 == nil then
    print("There are no entries of user on system")
  else
    for _FORV_11_, _FORV_12_ in pairs(L0_99) do
      L3_102 = L3_102 + 1
      L2_101 = L0_99[L3_102]
      if L2_101 ~= nil then
        L5_104 = L2_101["Users.UserName"]
        L6_105 = users.groupOfUserGet(L5_104)
        L7_106 = login.loginStatusGet(L5_104)
        resTab.insertField(L1_100, "ROWID", L2_101["Users._ROWID_"] or "")
        resTab.insertField(L1_100, "User Name", L5_104 or "")
        resTab.insertField(L1_100, "Group", L6_105 or "")
        resTab.insertField(L1_100, "Login Status", L7_106 or "")
      end
    end
    resTab.print(L1_100, 0)
  end
end
function userdbGroupsGetAll()
  local L0_107, L1_108
  L0_107 = db
  L0_107 = L0_107.getTable
  L1_108 = "UserGroups"
  L0_107 = L0_107(L1_108)
  L1_108 = {}
  printLabel("-------------GROUPS----------------\n")
  if L0_107 == nil then
    print("There are no entries of group on system")
  else
    for _FORV_10_, _FORV_11_ in pairs(L0_107) do
      if L0_107[0 + 1] ~= nil and L0_107[0 + 1]["UserGroups.GroupName"] ~= "Temp-CP" then
        resTab.insertField(L1_108, "ROWID", L0_107[0 + 1]["UserGroups._ROWID_"] or "")
        resTab.insertField(L1_108, "Group Name", L0_107[0 + 1]["UserGroups.GroupName"] or "" or "")
        resTab.insertField(L1_108, "Description", L0_107[0 + 1]["UserGroups.Description"] or "" or "")
      end
    end
    resTab.print(L1_108, 0)
  end
end
function changeUserPassword(A0_109)
  local L1_110, L2_111, L3_112
  L1_110 = A0_109[1]
  L2_111 = A0_109[2]
  L3_112 = A0_109[3]
  clishCfgObjAdd("Users", "Users.current_password", L1_110)
  clishCfgObjAdd("Users", "Users.new_password", L2_111)
  clishCfgObjAdd("Users", "Users.new_password_confirm", L3_112)
  return "OK"
end
function sslvpnGroupAdd(A0_113)
  local L1_114, L2_115
  L1_114 = A0_113[1]
  L2_115 = A0_113[2]
  clishCfgObjAdd("UserGroups", "USERDBDomains.PortalLayoutName", L1_114)
  clishCfgObjAdd("UserGroups", "USERDBDomains.AuthenticationType", L2_115)
end
