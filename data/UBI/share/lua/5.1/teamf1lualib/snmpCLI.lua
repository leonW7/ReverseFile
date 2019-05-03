local L0_0
L0_0 = require
L0_0("teamf1lualib/net-snmp")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = 32
function snmpSysConfigInputVal(A0_1)
  local L1_2
  L1_2 = TRUE
  return L1_2
end
function snmpSysConfigSave(A0_3)
  local L1_4, L2_5, L3_6
  L1_4 = "ERROR"
  L2_5 = ""
  L3_6 = ""
  if A0_3["system.sysContact"] == nil then
    L3_6 = "Please enter valid system contact value"
    return L1_4, L3_6
  elseif A0_3["system.name"] == nil then
    L3_6 = "Please enter valid system name"
    return L1_4, L3_6
  elseif A0_3["system.sysLoc"] == nil then
    L3_6 = "Please enter valid system location"
    return L1_4, L3_6
  end
  L1_4, L2_5 = snmp.system_config(A0_3, "1", "edit")
  if L1_4 == "OK" then
    db.save()
  end
  L3_6 = db.getAttribute("stringsMap", "stringId", L2_5, LANGUAGE)
  return L1_4, L3_6
end
function snmpSysConfigInit(A0_7)
  local L1_8, L2_9
  L1_8 = A0_7[1]
  L2_9 = db
  L2_9 = L2_9.getRow
  L2_9 = L2_9("system", "system._ROWID_", 1)
  if L2_9 == nil then
    L2_9 = {}
  end
  return rowId, L2_9
end
function snmpTrapConfigInputVal(A0_10)
  local L1_11
  L1_11 = TRUE
  return L1_11
end
function snmpTrapConfigDel(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L1_13 = "ERROR"
  L2_14 = "SNMP_CONFIG_FAILED"
  L3_15 = ""
  L4_16 = {}
  table.insert(L4_16, A0_12["snmpTrap._ROWID_"])
  if L4_16 then
    L1_13, L2_14 = snmp.snmpTrap_config(L4_16, "-1", "delete")
  end
  if L1_13 == "OK" then
    db.save()
  end
  L3_15 = db.getAttribute("stringsMap", "stringId", L2_14, LANGUAGE)
  return L1_13, L3_15
end
function snmpTrapConfigSave(A0_17)
  local L1_18, L2_19, L3_20, L4_21
  L1_18 = "ERROR"
  L2_19 = ""
  L3_20 = ""
  L4_21 = {}
  if A0_17["snmpTrap.snmpVersion"] == nil then
    L3_20 = "Invalid snmp version."
    return L1_18, L3_20
  elseif A0_17["snmpTrap.ipAddr"] == nil then
    L3_20 = "Invalid IP address."
    return L1_18, L3_20
  elseif A0_17["snmpTrap.port"] == nil then
    L3_20 = "Invalid port number."
    return L1_18, L3_20
  elseif A0_17["snmpTrap.commName"] == nil then
    L3_20 = "Please enter a valid SNMP community string."
    return L1_18, L3_20
  end
  if string.len(A0_17["snmpTrap.commName"]) > 32 then
    L3_20 = "Community string should be of lenth less" .. " than or equal to 32 characters."
    return L1_18, L3_20
  end
  if tonumber(A0_17["snmpTrap.snmpVersion"]) == 1 then
  else
  end
  A0_17["snmpTrap.snmpVersion"] = "v3"
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
    _UPVALUE0_ = 32
  elseif UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
    _UPVALUE0_ = 16
  else
    _UPVALUE0_ = 8
  end
  if A0_17["snmpTrap._ROWID_"] == nil then
    L4_21 = db.getTable("snmpTrap")
    if L4_21 ~= nil and _UPVALUE0_ <= #L4_21 then
      L3_20 = "SNMP trap list maximum limit is reached."
      return L1_18, L3_20
    end
    L1_18, L2_19 = snmp.snmpTrap_config(A0_17, "-1", "add")
    A0_17["snmpTrap._ROWID_"] = db.getAttribute("snmpTrap", "snmpTrap.ipAddr", A0_17["snmpTrap.ipAddr"], "_ROWID_")
  else
    L1_18, L2_19 = snmp.snmpTrap_config(A0_17, A0_17["snmpTrap._ROWID_"], "edit")
  end
  if L1_18 == "OK" then
    db.save()
  end
  L3_20 = db.getAttribute("stringsMap", "stringId", L2_19, LANGUAGE)
  return L1_18, L3_20
end
function snmpTrapConfigInit(A0_22)
  local L1_23, L2_24
  L1_23 = A0_22[1]
  L2_24 = db
  L2_24 = L2_24.getRow
  L2_24 = L2_24("snmpTrap", "snmpTrap.ipAddr", L1_23)
  if L2_24 == nil then
    L2_24 = {}
    L2_24["snmpTrap.ipAddr"] = L1_23
  end
  return rowId, L2_24
end
function snmpACLConfigInputVal(A0_25)
  local L1_26
  L1_26 = TRUE
  return L1_26
end
function snmpACLConfigDel(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32
  L1_28 = "ERROR"
  L2_29 = "SNMP_CONFIG_FAILED"
  L3_30 = ""
  L4_31 = {}
  L5_32 = db
  L5_32 = L5_32.getRow
  L5_32 = L5_32("snmpAccessControl", "_ROWID_", A0_27)
  if nil == L5_32 then
    printCLIError("Rowid doesn't exists")
    return L1_28, L2_29
  end
  if L4_31 then
    L1_28, L2_29 = snmp.snmpAccessControl_config(L5_32, A0_27, "delete")
  end
  if L1_28 == "OK" then
    db.save()
  end
  L3_30 = db.getAttribute("stringsMap", "stringId", L2_29, LANGUAGE)
  return L1_28, L3_30
end
function snmpACLConfigSave(A0_33)
  local L1_34, L2_35, L3_36, L4_37, L5_38, L6_39
  L1_34 = "ERROR"
  L2_35 = ""
  L3_36 = ""
  L4_37 = {}
  L5_38 = nil
  L6_39 = {}
  if A0_33["snmpAccessControl.subnetMask"] == nil then
    L3_36 = "Invalid subnet mask."
    return L1_34, L3_36
  elseif A0_33["snmpAccessControl.ipAddr"] == nil then
    L3_36 = "Invalid IP address."
    return L1_34, L3_36
  elseif A0_33["snmpAccessControl.accessType"] == nil then
    L3_36 = "Please enter a valid SNMP accessType."
    return L1_34, L3_36
  elseif A0_33["snmpAccessControl.commName"] == nil then
    L3_36 = "Please enter a valid SNMP community string."
    return L1_34, L3_36
  end
  if string.len(A0_33["snmpAccessControl.commName"]) > 32 then
    L3_36 = "Community string should be of lenth less" .. " than or equal to 32 characters."
    return L1_34, L3_36
  end
  if A0_33["snmpAccessControl.accessType"] == "1" then
    A0_33["snmpAccessControl.accessType"] = "rocommunity"
  elseif A0_33["snmpAccessControl.accessType"] == "2" then
    A0_33["snmpAccessControl.accessType"] = "rwcommunity"
  end
  L5_38 = validationsLuaLib.ipAddressCheck(2, A0_33["snmpAccessControl.ipAddr"])
  if L5_38 ~= 0 then
    L3_36 = "Invalid IP address."
    return L1_34, L3_36
  end
  L4_37 = validations.split(A0_33["snmpAccessControl.subnetMask"], ".")
  if L4_37 == nil then
    L3_36 = "Invalid subnet mask."
    return L1_34, L3_36
  end
  L5_38 = tonumber(validationsLuaLib.CIDRMaskValidityCheck(L4_37[1], L4_37[2], L4_37[3], L4_37[4]))
  if L5_38 ~= 0 then
    L3_36 = "Invalid subnet mask."
    return L1_34, L3_36
  end
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
    _UPVALUE0_ = 32
  elseif UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
    _UPVALUE0_ = 16
  else
    _UPVALUE0_ = 8
  end
  if A0_33["snmpAccessControl._ROWID_"] == "-1" then
    L6_39 = db.getTable("snmpAccessControl")
    if L6_39 ~= nil and _UPVALUE0_ <= #L6_39 then
      L3_36 = "SNMP access control list maximum limit is reached."
      return L1_34, L3_36
    end
    L1_34, L2_35 = snmp.snmpAccessControl_config(A0_33, "-1", "add")
  else
    L1_34, L2_35 = snmp.snmpAccessControl_config(A0_33, A0_33["snmpAccessControl._ROWID_"], "edit")
  end
  if L1_34 == "OK" then
    db.save()
  end
  L3_36 = db.getAttribute("stringsMap", "stringId", L2_35, LANGUAGE)
  return L1_34, L3_36
end
function snmpACLConfigInit(A0_40)
  local L1_41
  L1_41 = {}
  if A0_40[1] == "-1" then
    L1_41["snmpAccessControl._ROWID_"] = A0_40[1]
  else
    L1_41 = db.getRow("snmpAccessControl", "snmpAccessControl._ROWID_", A0_40[1])
  end
  if L1_41 == nil then
    L1_41 = {}
    L1_41["snmpAccessControl._ROWID_"] = A0_40[1]
    return A0_40[1], L1_41
  end
  return L1_41["snmpAccessControl._ROWID_"], L1_41
end
function snmpACLConfigInitEdit(A0_42)
  local L1_43
  L1_43 = {}
  if A0_42[1] == "-1" then
    L1_43["snmpAccessControl._ROWID_"] = A0_42[1]
  else
    L1_43 = db.getRow("snmpAccessControl", "snmpAccessControl._ROWID_", A0_42[1])
  end
  if L1_43 == nil then
    printCLIError("** Entry does not exit **")
    return false
  end
  return L1_43["snmpAccessControl._ROWID_"], L1_43
end
function snmpv3UsersConfigInit(A0_44)
  local L1_45, L2_46, L3_47
  L1_45 = A0_44[1]
  L2_46 = {}
  L3_47 = ""
  if L1_45 == "admin" then
    L3_47 = "1"
  else
    L3_47 = "2"
  end
  L2_46 = db.getRow("snmpv3Users", "snmpv3Users._ROWID_", L3_47)
  L2_46["snmpv3Users.authAlgo"] = ""
  L2_46["snmpv3Users.privAlgo"] = ""
  return L3_47, L2_46
end
function snmpv3UsersConfigSave(A0_48)
  local L1_49, L2_50, L3_51, L4_52
  L1_49 = "ERROR"
  L2_50 = ""
  L3_51 = ""
  L4_52 = A0_48["snmpv3Users._ROWID_"]
  L1_49, L2_50 = snmp.snmpv3Users_config(A0_48, L4_52, "edit")
  if L1_49 == "OK" then
    db.save()
  end
  L3_51 = db.getAttribute("stringsMap", "stringId", L2_50, LANGUAGE)
  return L1_49, L3_51
end
function snmpv3UsersInputVal(A0_53)
  if A0_53["snmpv3Users.securityLevel"] == "" or A0_53["snmpv3Users.securityLevel"] == nil then
    printCLIError("Give Security Level")
    return false
  end
  if A0_53["snmpv3Users.securityLevel"] == "1" and (A0_53["snmpv3Users.authAlgo"] == nil or A0_53["snmpv3Users.authAlgo"] == "") then
    printCLIError("Give authentication algorithm")
    return false
  end
  if A0_53["snmpv3Users.securityLevel"] == "2" then
    if A0_53["snmpv3Users.authAlgo"] == nil or A0_53["snmpv3Users.authAlgo"] == "" then
      printCLIError("Give authentication algorithm")
      return false
    end
    if A0_53["snmpv3Users.privAlgo"] == nil or A0_53["snmpv3Users.privAlgo"] == "" then
      printCLIError("Give privacy algorithm")
      return false
    end
  end
  if A0_53["snmpv3Users.authAlgo"] == "SHA" and string.len(A0_53["snmpv3Users.authPassword"]) ~= 20 then
    printCLIError("SHA1 Key must be 20 characters long")
    return false
  end
  if A0_53["snmpv3Users.authAlgo"] == "MD5" and string.len(A0_53["snmpv3Users.authPassword"]) ~= 16 then
    printCLIError("MD5 Key must be 16 characters long")
    return false
  end
  if A0_53["snmpv3Users.privAlgo"] == "DES" and string.len(A0_53["snmpv3Users.privPassword"]) ~= 8 then
    printCLIError("DES Key must be 8 characters long")
    return false
  end
  if A0_53["snmpv3Users.privAlgo"] == "AES" and string.len(A0_53["snmpv3Users.privPassword"]) ~= 16 then
    printCLIError("AES Key must be 16 characters long")
    return false
  end
  return true
end
