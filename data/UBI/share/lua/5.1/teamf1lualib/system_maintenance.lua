local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.maintenance", package.seeall)
L0_0 = require
L0_0("upgradeFileCheck")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
maintenanceTable = "system"
configSupportTable = "ConfigSupport"
attribute = {}
adaptos = {}
attribute.key = "_ROWID_"
attribute.keyValue = "1"
attribute.firmwareVersion = "firmwareVer"
attribute.wlanModuleVersion = "wlanModuleVersion"
attribute.firmwareFileName = "firmwareFile"
attribute.upgradeViaUSB = "upgradeViaUSB"
attribute.firmwareDate = "firmwareTime"
attribute.firmCSum = "firmCSum"
environmentTable = "environment"
attribute.firmHdrPartition = "FIRMWARE_PARTITION"
attribute.kernelPartition = "KERNEL_PARTITION"
attribute.configPartition = "CONFIG_PARTITION"
attribute.rootfsPartition = "ROOTFS_PARTITION"
attribute.deviceName = "DEVICE_NAME"
attribute.upgradeProgram = "UPGRADE_PROGRAM"
FactoryStatusTable = "FactoryStatus"
attribute.factStatus = "factStatus"
FACTORY_RESET_MESSAGE1 = "Not in Factory Default State."
FACTORY_RESET_MESSAGE2 = "Factory Default State."
loginSessionTable = "loginSession"
attribute.ipaddr = "ipaddr"
attribute.username = "username"
KERNEL_VERSION_FILE = "uname -r"
KEYNAME = "_ROWID_"
DEFAULT_COOKIE = "1"
REMOTE_ADDR = "REMOTE_ADDR"
RU_NOT_AVAILABLE = "512"
FIRM_INVALID = "1024"
SCRIPT_FAILED = "768"
userTable = "Users"
attribute.GroupId = "GroupId"
attribute.UserName = "UserName"
attribute.Capabilities = "Capabilities"
attribute.encryption = "EncryptEnable"
attribute.autoBackup = "EnableAutoBackup"
UserGroupsTable = "UserGroups"
OpenvpnSessionTable = "OpenvpnSession"
attribute.ipaddr = "ipaddr"
attribute.username = "username"
defaultGroupList = {
  "ADMIN",
  "GUEST",
  "ADMIN",
  "GUEST"
}
function firmwareVersionGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(maintenanceTable, attribute.key, attribute.keyValue, attribute.firmwareVersion)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function firmwareVersionGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function firmwareVersionSet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function wlanModuleVersionGet()
  if io.open("/mnt/fastpath/wlan_details", "r") then
    wlanModuleVersion = io.open("/mnt/fastpath/wlan_details", "r"):read("*line")
    io.open("/mnt/fastpath/wlan_details", "r"):close()
  end
  if wlanModuleVersion == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, wlanModuleVersion
end
function wlanModuleVersionGetNext(A0_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NOT_SUPPORTED
  return L2_8, A0_7
end
function wlanModuleVersionSet(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function firmwareUpgradeGet()
  local L1_12
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.NOT_SUPPORTED
  return L1_12
end
function firmwareUpgradeGetNext(A0_13)
  local L2_14
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NOT_SUPPORTED
  return L2_14, A0_13
end
function firmwareUpgradeSet(A0_15, A1_16)
  local L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NIL
  if A1_16 == L2_17 then
    L2_17 = _UPVALUE0_
    L2_17 = L2_17.INVALID_ARGUMENT
    return L2_17
  end
  L2_17 = ""
  L3_18 = db
  L3_18 = L3_18.getAttribute
  L4_19 = "environment"
  L5_20 = "name"
  L6_21 = "UPGRADE_PROGRAM"
  L7_22 = "value"
  L3_18 = L3_18(L4_19, L5_20, L6_21, L7_22)
  L4_19 = _UPVALUE0_
  L4_19 = L4_19.NIL
  if L3_18 == L4_19 then
    L4_19 = _UPVALUE0_
    L4_19 = L4_19.FAILURE
    return L4_19
  end
  L4_19 = db
  L4_19 = L4_19.getAttribute
  L5_20 = "environment"
  L6_21 = "name"
  L7_22 = "DEVICE_NAME"
  L8_23 = "value"
  L4_19 = L4_19(L5_20, L6_21, L7_22, L8_23)
  L5_20 = _UPVALUE0_
  L5_20 = L5_20.NIL
  if L4_19 == L5_20 then
    L5_20 = _UPVALUE0_
    L5_20 = L5_20.FAILURE
    return L5_20
  end
  L5_20 = db
  L5_20 = L5_20.getAttribute
  L6_21 = "environment"
  L7_22 = "name"
  L8_23 = "KERNEL_PARTITION"
  L9_24 = "value"
  L5_20 = L5_20(L6_21, L7_22, L8_23, L9_24)
  L6_21 = _UPVALUE0_
  L6_21 = L6_21.NIL
  if L5_20 == L6_21 then
    L6_21 = _UPVALUE0_
    L6_21 = L6_21.FAILURE
    return L6_21
  end
  L6_21 = db
  L6_21 = L6_21.getAttribute
  L7_22 = "environment"
  L8_23 = "name"
  L9_24 = "ROOTFS_PARTITION"
  L6_21 = L6_21(L7_22, L8_23, L9_24, "value")
  L7_22 = _UPVALUE0_
  L7_22 = L7_22.NIL
  if L6_21 == L7_22 then
    L7_22 = _UPVALUE0_
    L7_22 = L7_22.FAILURE
    return L7_22
  end
  L7_22 = db
  L7_22 = L7_22.getAttribute
  L8_23 = "environment"
  L9_24 = "name"
  L7_22 = L7_22(L8_23, L9_24, "CONFIG_PARTITION", "value")
  L8_23 = _UPVALUE0_
  L8_23 = L8_23.NIL
  if L7_22 == L8_23 then
    L8_23 = _UPVALUE0_
    L8_23 = L8_23.FAILURE
    return L8_23
  end
  L8_23 = PRODUCT_ID
  if L8_23 ~= "DSR-1000AC_Ax" then
    L8_23 = PRODUCT_ID
    if L8_23 ~= "DSR-500AC_Ax" then
      L8_23 = PRODUCT_ID
      if L8_23 ~= "DSR-1000_Bx" then
        L8_23 = PRODUCT_ID
      end
    end
  elseif L8_23 == "DSR-500_Bx" then
    L8_23 = db
    L8_23 = L8_23.getAttribute
    L9_24 = "environment"
    L8_23 = L8_23(L9_24, "name", "FIRMWARE_PARTITION", "value")
    L2_17 = L8_23
    L8_23 = _UPVALUE0_
    L8_23 = L8_23.NIL
    if L2_17 == L8_23 then
      L8_23 = _UPVALUE0_
      L8_23 = L8_23.FAILURE
      return L8_23
    end
  end
  L8_23 = db
  L8_23 = L8_23.getAttribute
  L9_24 = "unitInfo"
  L8_23 = L8_23(L9_24, "_ROWID_", "1", "hardwareVersion")
  L9_24 = db
  L9_24 = L9_24.getAttribute
  L9_24 = L9_24("system", "_ROWID_", "1", "firmwareVerInt")
  os.execute("/pfrm2.0/bin/upgradeCopy.sh")
  if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
  else
  end
  if status ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE, A0_15
  end
  return _UPVALUE0_.SUCCESS, A0_15
end
function upgradeFile(A0_25)
  local L1_26
  L1_26 = db
  L1_26 = L1_26.getAttribute
  L1_26 = L1_26("unitInfo", "_ROWID_", "1", "hardwareVersion")
  return (upgradeFileCheck.firmwareCheck("/tmp/" .. A0_25, UNIT_NAME, L1_26))
end
function upgradeViaUSBGet()
  local L1_27
  L1_27 = _UPVALUE0_
  L1_27 = L1_27.NOT_SUPPORTED
  return L1_27
end
function upgradeViaUSBGetNext(A0_28)
  local L2_29
  L2_29 = _UPVALUE0_
  L2_29 = L2_29.NOT_SUPPORTED
  return L2_29, A0_28
end
function upgradeViaUSBSet(A0_30, A1_31, A2_32)
  local L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42
  L4_34 = _UPVALUE0_
  L4_34 = L4_34.NIL
  if A1_31 == L4_34 then
    L4_34 = _UPVALUE0_
    L4_34 = L4_34.INVALID_ARGUMENT
    return L4_34
  end
  L4_34 = ""
  L5_35 = _UPVALUE0_
  L5_35 = L5_35.NIL
  if A2_32 == L5_35 then
    L5_35 = _UPVALUE0_
    L5_35 = L5_35.INVALID_ARGUMENT
    return L5_35
  end
  L5_35 = db
  L5_35 = L5_35.getAttribute
  L6_36 = environmentTable
  L7_37 = "name"
  L8_38 = attribute
  L8_38 = L8_38.upgradeProgram
  L9_39 = "value"
  L5_35 = L5_35(L6_36, L7_37, L8_38, L9_39)
  L6_36 = _UPVALUE0_
  L6_36 = L6_36.NIL
  if L5_35 == L6_36 then
    L6_36 = _UPVALUE0_
    L6_36 = L6_36.FAILURE
    return L6_36
  end
  L6_36 = db
  L6_36 = L6_36.getAttribute
  L7_37 = environmentTable
  L8_38 = "name"
  L9_39 = attribute
  L9_39 = L9_39.deviceName
  L10_40 = "value"
  L6_36 = L6_36(L7_37, L8_38, L9_39, L10_40)
  L7_37 = _UPVALUE0_
  L7_37 = L7_37.NIL
  if L6_36 == L7_37 then
    L7_37 = _UPVALUE0_
    L7_37 = L7_37.FAILURE
    return L7_37
  end
  L7_37 = db
  L7_37 = L7_37.getAttribute
  L8_38 = environmentTable
  L9_39 = "name"
  L10_40 = attribute
  L10_40 = L10_40.kernelPartition
  L11_41 = "value"
  L7_37 = L7_37(L8_38, L9_39, L10_40, L11_41)
  L8_38 = _UPVALUE0_
  L8_38 = L8_38.NIL
  if L7_37 == L8_38 then
    L8_38 = _UPVALUE0_
    L8_38 = L8_38.FAILURE
    return L8_38
  end
  L8_38 = db
  L8_38 = L8_38.getAttribute
  L9_39 = environmentTable
  L10_40 = "name"
  L11_41 = attribute
  L11_41 = L11_41.rootfsPartition
  L12_42 = "value"
  L8_38 = L8_38(L9_39, L10_40, L11_41, L12_42)
  L9_39 = _UPVALUE0_
  L9_39 = L9_39.NIL
  if L8_38 == L9_39 then
    L9_39 = _UPVALUE0_
    L9_39 = L9_39.FAILURE
    return L9_39
  end
  L9_39 = db
  L9_39 = L9_39.getAttribute
  L10_40 = "environment"
  L11_41 = "name"
  L12_42 = "CONFIG_PARTITION"
  L9_39 = L9_39(L10_40, L11_41, L12_42, "value")
  L10_40 = _UPVALUE0_
  L10_40 = L10_40.NIL
  if L9_39 == L10_40 then
    L10_40 = _UPVALUE0_
    L10_40 = L10_40.FAILURE
    return L10_40
  end
  L10_40 = PRODUCT_ID
  if L10_40 ~= "DSR-1000AC_Ax" then
    L10_40 = PRODUCT_ID
    if L10_40 ~= "DSR-500AC_Ax" then
      L10_40 = PRODUCT_ID
      if L10_40 ~= "DSR-1000_Bx" then
        L10_40 = PRODUCT_ID
      end
    end
  elseif L10_40 == "DSR-500_Bx" then
    L10_40 = db
    L10_40 = L10_40.getAttribute
    L11_41 = "environment"
    L12_42 = "name"
    L10_40 = L10_40(L11_41, L12_42, "FIRMWARE_PARTITION", "value")
    L4_34 = L10_40
    L10_40 = _UPVALUE0_
    L10_40 = L10_40.NIL
    if L4_34 == L10_40 then
      L10_40 = _UPVALUE0_
      L10_40 = L10_40.FAILURE
      return L10_40
    end
  end
  L10_40 = db
  L10_40 = L10_40.getAttribute
  L11_41 = "unitInfo"
  L12_42 = "_ROWID_"
  L10_40 = L10_40(L11_41, L12_42, "1", "hardwareVersion")
  L11_41 = db
  L11_41 = L11_41.getAttribute
  L12_42 = "system"
  L11_41 = L11_41(L12_42, "_ROWID_", "1", "firmwareVerInt")
  L12_42 = adaptos
  L12_42 = L12_42.execute
  L12_42("/pfrm2.0/bin/upgradeCopy.sh")
  if A2_32 == "usb1" or A2_32 == "usb2" then
    L12_42 = L5_35
    L12_42 = L12_42 .. " " .. "/" .. A2_32 .. "/" .. A1_31 .. " " .. L6_36 .. " " .. L7_37 .. " " .. L8_38 .. " " .. L11_41 .. " " .. L9_39 .. " " .. L10_40
    if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
      L12_42 = L12_42 .. " " .. L4_34
    else
      L12_42 = L12_42 .. " &"
    end
    L3_33 = adaptos.execute(L12_42)
  end
  L12_42 = _UPVALUE0_
  L12_42 = L12_42.SUCCESS
  if L3_33 ~= L12_42 then
    L12_42 = _UPVALUE0_
    L12_42 = L12_42.FAILURE
    return L12_42, 0
  end
  L12_42 = _UPVALUE0_
  L12_42 = L12_42.SUCCESS
  return L12_42, 1
end
function currentFirmwareGetAll()
  local L0_43, L1_44
  L0_43 = db
  L0_43 = L0_43.getAttribute
  L1_44 = maintenanceTable
  L0_43 = L0_43(L1_44, attribute.key, attribute.keyValue, attribute.firmwareVersion)
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.NIL
  if L0_43 == L1_44 then
    L1_44 = _UPVALUE0_
    L1_44 = L1_44.FAILURE
    return L1_44
  end
  L1_44 = db
  L1_44 = L1_44.getAttribute
  L1_44 = L1_44(maintenanceTable, attribute.key, attribute.keyValue, attribute.firmwareDate)
  if L1_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if L0_43 == _UPVALUE0_.NIL or L1_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_43, L1_44
end
function currentUserNameGet(A0_45)
  local L1_46, L2_47, L3_48
  ipAddress = SAPI.Request.servervariable(REMOTE_ADDR)
  cookie = cgilua.cookies.get("TeamF1Login")
  if cookie ~= _UPVALUE0_.NIL then
    cookie = db.escape(cookie)
    L1_46 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND cookie = '" .. cookie .. "'"
    L2_47 = db.getAttributeWhere(loginSessionTable, L1_46, attribute.username)
    if L2_47 == _UPVALUE0_.NIL then
      L1_46 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND " .. attribute.username .. "= '" .. A0_45 .. "'"
      L2_47 = db.getAttributeWhere(loginSessionTable, L1_46, attribute.username)
      L3_48 = getGroupName(L2_47)
      return _UPVALUE0_.SUCCESS, L2_47, L3_48
    else
      L3_48 = getGroupName(L2_47)
      return _UPVALUE0_.SUCCESS, L2_47, L3_48
    end
  else
    L1_46 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND " .. attribute.username .. "= '" .. A0_45 .. "'"
    L2_47 = db.getAttributeWhere(loginSessionTable, L1_46, attribute.username)
    L3_48 = getGroupName(L2_47)
    return _UPVALUE0_.SUCCESS, L2_47, L3_48
  end
end
function openvpnCurrentUserNameGet(A0_49)
  local L1_50, L2_51, L3_52
  ipAddress = SAPI.Request.servervariable(REMOTE_ADDR)
  cookie = cgilua.cookies.get("TeamF1OmniSSLLogin")
  if cookie ~= _UPVALUE0_.NIL then
    L1_50 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND cookie = '" .. cookie .. "'"
    L2_51 = db.getAttributeWhere(OpenvpnSessionTable, L1_50, attribute.username)
    if L2_51 == _UPVALUE0_.NIL then
      L1_50 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND " .. attribute.username .. "= '" .. A0_49 .. "'"
      L2_51 = db.getAttributeWhere(OpenvpnSessionTable, L1_50, attribute.username)
      L3_52 = openvpnGetGroupName(L2_51)
      return _UPVALUE0_.SUCCESS, L2_51, L3_52
    else
      L3_52 = openvpnGetGroupName(L2_51)
      return _UPVALUE0_.SUCCESS, L2_51, L3_52
    end
  else
    L1_50 = attribute.ipaddr .. "= '" .. ipAddress .. "'" .. " AND " .. attribute.username .. "= '" .. A0_49 .. "'"
    L2_51 = db.getAttributeWhere(OpenvpnSessionTable, L1_50, attribute.username)
    L3_52 = openvpnGetGroupName(L2_51)
    return _UPVALUE0_.SUCCESS, L2_51, L3_52
  end
end
function getGroupName(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61
  L3_56 = db
  L3_56 = L3_56.getAttribute
  L7_60 = attribute
  L7_60 = L7_60.GroupId
  L3_56 = L3_56(L4_57, L5_58, L6_59, L7_60)
  L1_54 = L3_56
  L3_56 = db
  L3_56 = L3_56.getAttribute
  L7_60 = attribute
  L7_60 = L7_60.Capabilities
  L3_56 = L3_56(L4_57, L5_58, L6_59, L7_60)
  capability = L3_56
  L3_56 = util
  L3_56 = L3_56.split
  L3_56 = L3_56(L4_57, L5_58)
  for L7_60, L8_61 in L4_57(L5_58) do
    if L8_61 == "3" then
      L2_55 = defaultGroupList[tonumber(L8_61)]
    elseif L8_61 == "4" then
      L2_55 = defaultGroupList[tonumber(L8_61)]
    end
  end
  return L2_55
end
function openvpnGetGroupName(A0_62)
  local L1_63, L2_64, L3_65
  L3_65 = db
  L3_65 = L3_65.getAttribute
  L3_65 = L3_65(userTable, attribute.UserName, A0_62, attribute.GroupId)
  L1_63 = L3_65
  L3_65 = db
  L3_65 = L3_65.getAttribute
  L3_65 = L3_65(UserGroupsTable, attribute.GroupId, L1_63, attribute.Capabilities)
  capability = L3_65
  L3_65 = util
  L3_65 = L3_65.split
  L3_65 = L3_65(capability, ",")
  for _FORV_7_, _FORV_8_ in pairs(L3_65) do
    if _FORV_8_ == "13" then
      L2_64 = "OPENVPN"
    end
  end
  return L2_64
end
function wlanDomainInfoGet()
  if (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "840" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "578" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "36" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "643" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "356" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "999" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "76" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "392" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "158" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "124" then
  elseif (db.getRow("dot11GlobalConfig", "_ROWID_", 1)["dot11GlobalConfig.country"] or "") == "156" then
  else
  end
  return "NA"
end
function queryLinkInfoGet()
  local L0_66, L1_67, L2_68, L3_69
  L0_66 = ""
  L1_67 = ""
  L2_68 = ""
  L3_69 = ""
  L3_69 = db.existsRow("unitInfo", "_ROWID_", "1") and (db.getRow("unitInfo", "_ROWID_", "1")["unitInfo.lanMacAddress"] or "")
  L2_68 = db.existsRow("unitinfo", "_ROWID_", "1") and (db.getRow("unitinfo", "_ROWID_", "1")["unitinfo.regionInfo"] or "")
  L0_66 = db.existsRow("system", "_ROWID_", "1") and (db.getRow("system", "_ROWID_", "1")["system.firmwareFile"] or "")
  L1_67 = db.getRow("unitInfo", "_ROWID_", "1")["unitInfo.firmwareQueryUrl"] or ""
  return L0_66, L1_67, L2_68, L3_69
end
function wlanInfoGet()
  local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80, L11_81, L12_82, L13_83
  L0_70 = ""
  L1_71 = ""
  L2_72 = ""
  L3_73 = ""
  L4_74 = 0
  L5_75 = db
  L5_75 = L5_75.getTable
  L5_75 = L5_75(L6_76)
  for L9_79, L10_80 in L6_76(L7_77) do
    L4_74 = L4_74 + 1
    L11_81 = L5_75[L4_74]
    L12_82 = db
    L12_82 = L12_82.getRow
    L13_83 = "dot11Profile"
    L12_82 = L12_82(L13_83, "profileName", L11_81["dot11VAP.profileName"])
    L13_83 = db
    L13_83 = L13_83.getRow
    L13_83 = L13_83("dot11Interface", "vapName", L11_81["dot11VAP.vapName"])
    if L12_82 == nil then
      L12_82 = {}
    end
    if L13_83 == nil then
      L13_83 = {}
    end
    if L11_81["dot11VAP.vapEnabled"] == "1" then
      L2_72 = L2_72 .. L12_82["dot11Profile.ssid"] .. ", "
      L0_70 = L0_70 .. L13_83["dot11Interface.macAddress"] .. ", "
    end
  end
  return L6_76, L7_77
end
function checkListInfoGet()
  local L0_84, L1_85, L2_86, L3_87, L4_88, L5_89, L6_90, L7_91
  L5_89 = db
  L5_89 = L5_89.getTable
  L6_90 = maintenanceTable
  L7_91 = false
  L5_89 = L5_89(L6_90, L7_91)
  L6_90 = _UPVALUE0_
  L6_90 = L6_90.NIL
  if L5_89 == L6_90 then
    L6_90 = _UPVALUE0_
    L6_90 = L6_90.FAILURE
    return L6_90
  end
  L6_90 = io
  L6_90 = L6_90.popen
  L7_91 = KERNEL_VERSION_FILE
  L6_90 = L6_90(L7_91)
  L7_91 = L6_90.read
  L7_91 = L7_91(L6_90, "*a")
  L6_90:close()
  L4_88 = db.getTable(FactoryStatusTable, false)
  if L4_88[1][attribute.factStatus] == "1" then
    L3_87 = FACTORY_RESET_MESSAGE1
  else
    L3_87 = FACTORY_RESET_MESSAGE2
  end
  return _UPVALUE0_.SUCCESS, L5_89[1][attribute.firmwareVersion], L5_89[1][attribute.firmwareDate], L5_89[1][attribute.firmCSum], L7_91, L3_87
end
function adaptos.execute(A0_92)
  return (os.execute(A0_92))
end
function backupConfigGet()
  local L0_93, L1_94, L2_95
  L2_95 = {}
  L2_95 = db.getRow(configSupportTable, KEYNAME, DEFAULT_COOKIE)
  if L2_95 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  else
    L0_93 = L2_95[configSupportTable .. "." .. attribute.autoBackup]
    L1_94 = L2_95[configSupportTable .. "." .. attribute.encryption]
    return _UPVALUE0_.SUCCESS, DEFAULT_COOKIE, L0_93, L1_94
  end
end
function backupConfigSet(A0_96, A1_97, A2_98)
  local L3_99, L4_100, L5_101, L6_102, L7_103
  L4_100 = {}
  L5_101, L6_102, L7_103 = nil, nil, nil
  if A1_97 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L7_103
  end
  L3_99 = _UPVALUE1_.isBoolean(A1_97)
  if L3_99 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE, L7_103
  end
  if A2_98 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L7_103
  end
  L3_99 = _UPVALUE1_.isBoolean(A2_98)
  if L3_99 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE, L7_103
  end
  L4_100[configSupportTable .. "." .. attribute.autoBackup] = A1_97
  L4_100[configSupportTable .. "." .. attribute.encryption] = A2_98
  L6_102 = db.update(configSupportTable, L4_100, DEFAULT_COOKIE)
  if not L6_102 then
    return _UPVALUE0_.FAILURE, L7_103
  end
  return _UPVALUE0_.SUCCESS, L7_103
end
function macAddrInfoGet()
  local L0_104, L1_105, L2_106, L3_107, L4_108, L5_109, L6_110, L7_111, L8_112
  L4_108 = db
  L4_108 = L4_108.getRow
  L5_109 = "networkInterface"
  L6_110 = "LogicalIfName"
  L7_111 = "LAN"
  L4_108 = L4_108(L5_109, L6_110, L7_111)
  L5_109 = db
  L5_109 = L5_109.getAttribute
  L6_110 = "ethernet"
  L7_111 = "ethernet.interfaceName"
  L8_112 = L4_108["networkInterface.interfaceName"]
  L5_109 = L5_109(L6_110, L7_111, L8_112, "macAddress")
  L5_109 = L5_109 or ""
  L6_110 = db
  L6_110 = L6_110.getAttribute
  L7_111 = "networkInterface"
  L8_112 = "LogicalIfName"
  L6_110 = L6_110(L7_111, L8_112, "WAN1", "interfaceName")
  if L6_110 ~= nil then
    L7_111 = db
    L7_111 = L7_111.getAttribute
    L8_112 = "ethernet"
    L7_111 = L7_111(L8_112, "interfaceName", L6_110, "macAddress")
    L1_105 = L7_111 or ""
  end
  L7_111 = db
  L7_111 = L7_111.getAttribute
  L8_112 = "ConfigPort"
  L7_111 = L7_111(L8_112, "_ROWID_", "1", "LogicalIfName")
  if L7_111 == "WAN2" then
    L8_112 = db
    L8_112 = L8_112.getAttribute
    L8_112 = L8_112("networkInterface", "LogicalIfName", "WAN2", "interfaceName")
    if L8_112 ~= nil then
      L2_106 = db.getAttribute("ethernet", "interfaceName", L8_112, "macAddress") or ""
    end
  else
    L8_112 = db
    L8_112 = L8_112.getRow
    L8_112 = L8_112("networkInterface", "LogicalIfName", "DMZ")
    L3_107 = db.getAttribute("ethernet", "ethernet.interfaceName", L8_112["networkInterface.interfaceName"], "macAddress") or ""
  end
  L8_112 = L5_109
  return L8_112, L1_105, L2_106, L3_107, L7_111
end
