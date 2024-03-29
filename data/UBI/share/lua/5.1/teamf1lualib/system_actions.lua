local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.actions", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/platform_returnCodes")
L0_0 = require
L0_0("teamf1lualib/config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
adaptos = {}
;({}).key = "_ROWID_"
;({}).keyValue = "1"
;({}).name = "name"
;({}).modelId = "modelId"
;({}).reboot = "reboot"
;({}).rebootTime = "rebootTime"
;({}).factoryReset = "factoryReset"
;({}).backupConfig = "backupConfig"
;({}).restoreConfig = "restoreConfig"
;({}).restoreConfigFile = "restoreConfigFile"
;({}).flashCFGPartition = "FLASH_CFG_PARTITION"
;({}).bootupTime = "value"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" then
else
end
TMP = "/tmp/"
BACKUP = "backup"
ASCII = "flash/tmp/teamf1.cfg.ascii"
STARTUP = "flash/tmp/startup-config"
FACTORY_RESET_ENABLE = "/data/tmp/factoryResetEnable"
function rebootGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_.key, _UPVALUE1_.keyValue, _UPVALUE1_.reboot)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_1
end
function rebootGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function rebootSet(A0_4, A1_5)
  local L2_6
  L2_6 = {}
  if A1_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_5 == "start" then
    L2_6[_UPVALUE1_ .. "." .. _UPVALUE2_.reboot] = _UPVALUE3_
    L2_6[_UPVALUE1_ .. "." .. _UPVALUE2_.rebootTime] = REBOOT_TIME
    status = db.update(_UPVALUE1_, L2_6, _UPVALUE2_.keyValue)
  else
    status = db.setAttribute(_UPVALUE1_, _UPVALUE2_.key, _UPVALUE2_.keyValue, _UPVALUE2_.reboot, _UPVALUE4_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4
end
function factoryResetGet()
  local L1_7
  L1_7 = _UPVALUE0_
  L1_7 = L1_7.NOT_SUPPORTED
  return L1_7
end
function factoryResetGetNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function factoryResetSet(A0_10, A1_11)
  local L2_12
  if A1_11 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_11 == "start" then
    L2_12 = io.open(FACTORY_RESET_ENABLE, "w")
    if L2_12 ~= _UPVALUE0_.NIL then
      L2_12:close()
    else
    end
  else
    return _UPVALUE0_.NOT_SUPPORTED
  end
  return _UPVALUE0_.SUCCESS, A0_10
end
function backupConfigGet()
  local L1_13
  L1_13 = _UPVALUE0_
  L1_13 = L1_13.NOT_SUPPORTED
  return L1_13
end
function backupConfigGetNext(A0_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, A0_14
end
function backupConfigSet(A0_16, A1_17)
  local L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if A1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  if A1_17 ~= "start" and A1_17 ~= "stop" then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.INVALID_ARGUMENT
    return L2_18
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L3_19 = _UPVALUE1_
  L4_20 = _UPVALUE2_
  L4_20 = L4_20.key
  L5_21 = _UPVALUE2_
  L5_21 = L5_21.keyValue
  L6_22 = _UPVALUE2_
  L6_22 = L6_22.name
  L2_18 = L2_18(L3_19, L4_20, L5_21, L6_22)
  fileName = L2_18
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L3_19 = _UPVALUE3_
  L4_20 = _UPVALUE2_
  L4_20 = L4_20.key
  L5_21 = _UPVALUE2_
  L5_21 = L5_21.keyValue
  L6_22 = _UPVALUE2_
  L6_22 = L6_22.modelId
  L2_18 = L2_18(L3_19, L4_20, L5_21, L6_22)
  if A0_16 == "pc" then
    L3_19 = UNIT_INFO
    L4_20 = string
    L4_20 = L4_20.find
    L5_21 = L3_19 or ""
    L6_22 = "-"
    L5_21 = L4_20(L5_21, L6_22)
    if L4_20 ~= nil and L5_21 ~= nil then
      L6_22 = string
      L6_22 = L6_22.sub
      L7_23 = L3_19
      L8_24 = 0
      L9_25 = L4_20 - 1
      L6_22 = L6_22(L7_23, L8_24, L9_25)
      L3_19 = L6_22
    end
    L6_22 = L3_19 or L6_22(L7_23, L8_24, L9_25, "name")
    if L2_18 == "DWC-1000" then
      L7_23 = util
      L7_23 = L7_23.appendDebugOut
      L8_24 = "Exec = "
      L9_25 = os
      L9_25 = L9_25.execute
      L9_25 = L9_25("cd /tmp && mkdir backup && cp /flash/tmp/teamf1.cfg.ascii /flash/tmp/startup-config backup/")
      L8_24 = L8_24 .. L9_25
      L7_23(L8_24)
      L7_23 = util
      L7_23 = L7_23.appendDebugOut
      L8_24 = "Exec = "
      L9_25 = os
      L9_25 = L9_25.execute
      L9_25 = L9_25("cd /tmp && tar -cf" .. " " .. L6_22 .. ".tgz" .. " " .. "backup")
      L8_24 = L8_24 .. L9_25
      L7_23(L8_24)
      L7_23 = web
      L7_23 = L7_23.download
      L8_24 = "/tmp/"
      L9_25 = L6_22
      L8_24 = L8_24 .. L9_25 .. ".tgz"
      L9_25 = L6_22
      L9_25 = L9_25 .. ".tgz"
      L7_23(L8_24, L9_25)
      L7_23 = util
      L7_23 = L7_23.appendDebugOut
      L8_24 = "Exec = "
      L9_25 = os
      L9_25 = L9_25.execute
      L9_25 = L9_25("rm -rf /tmp/backup  /tmp/DWC.tgz ")
      L8_24 = L8_24 .. L9_25
      L7_23(L8_24)
    else
      L7_23 = db
      L7_23 = L7_23.getAttribute
      L8_24 = "ConfigSupport"
      L9_25 = "_ROWID_"
      L7_23 = L7_23(L8_24, L9_25, "1", "EncryptEnable")
      if L7_23 ~= nil and L7_23 == "1" then
        L8_24, L9_25 = nil, nil
        L8_24 = io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):read("*l")
        L9_25 = io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):read("*l")
        io.open("/pfrm2.0/pkgMgmt/packageKey", "r"):close()
        util.appendDebugOut("Exec = " .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in " .. SETTINGS_FILE .. " -out " .. SETTINGS_FILE .. ".enc -K " .. L8_24 .. " -iv " .. L9_25 .. " -nosalt"))
        web.download(SETTINGS_FILE .. ".enc", L6_22 .. ".cfg.enc")
        util.appendDebugOut("Exec = " .. os.execute("/bin/rm " .. SETTINGS_FILE .. ".enc"))
      else
        L8_24 = web
        L8_24 = L8_24.download
        L9_25 = SETTINGS_FILE
        L8_24(L9_25, L6_22 .. ".cfg")
      end
    end
  elseif A0_16 == "usb1" then
    if L2_18 == "DWC-1000" then
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp && mkdir backup && cp /tmp/teamf1.cfg.ascii /mnt/fastpath/startup-config backup/"
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp  && tar -cf"
      L5_21 = " "
      L6_22 = fileName
      L7_23 = ".tgz"
      L8_24 = " "
      L9_25 = "backup"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24 .. L9_25
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp && /bin/cp "
      L5_21 = fileName
      L6_22 = ".tgz"
      L7_23 = " "
      L8_24 = "/usb1"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24
      L3_19(L4_20)
      L3_19 = db
      L3_19 = L3_19.getAttribute
      L4_20 = "environment"
      L5_21 = "name"
      L6_22 = "USB_STATUS_CHECK_PROGRAM"
      L7_23 = "value"
      L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23)
      usbStatusCmd = L3_19
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = usbStatusCmd
      L5_21 = " "
      L6_22 = 1
      L4_20 = L4_20 .. L5_21 .. L6_22
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "rm -rf /tmp/backup /tmp/DWC.tgz"
      L3_19(L4_20)
    else
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "/bin/cp "
      L5_21 = SETTINGS_FILE
      L6_22 = " /usb1"
      L7_23 = fileName
      L8_24 = ".cfg"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24
      L3_19(L4_20)
      L3_19 = db
      L3_19 = L3_19.getAttribute
      L4_20 = "environment"
      L5_21 = "name"
      L6_22 = "USB_STATUS_CHECK_PROGRAM"
      L7_23 = "value"
      L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23)
      usbStatusCmd = L3_19
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = usbStatusCmd
      L5_21 = " "
      L6_22 = 1
      L4_20 = L4_20 .. L5_21 .. L6_22
      L3_19(L4_20)
    end
  elseif A0_16 == "usb2" then
    if L2_18 == "DWC-1000" then
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp && mkdir backup && cp /tmp/teamf1.cfg.ascii /mnt/fastpath/startup-config backup/"
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp  && tar -cf"
      L5_21 = " "
      L6_22 = fileName
      L7_23 = ".tgz"
      L8_24 = " "
      L9_25 = "backup"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24 .. L9_25
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "cd /tmp && /bin/cp "
      L5_21 = fileName
      L6_22 = ".tgz"
      L7_23 = " "
      L8_24 = "/usb2"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24
      L3_19(L4_20)
      L3_19 = db
      L3_19 = L3_19.getAttribute
      L4_20 = "environment"
      L5_21 = "name"
      L6_22 = "USB_STATUS_CHECK_PROGRAM"
      L7_23 = "value"
      L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23)
      usbStatusCmd = L3_19
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = usbStatusCmd
      L5_21 = " "
      L6_22 = 2
      L4_20 = L4_20 .. L5_21 .. L6_22
      L3_19(L4_20)
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "rm -rf /tmp/backup /tmp/DWC.tgz"
      L3_19(L4_20)
    else
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = "/bin/cp "
      L5_21 = SETTINGS_FILE
      L6_22 = " /usb2"
      L7_23 = fileName
      L8_24 = ".cfg"
      L4_20 = L4_20 .. L5_21 .. L6_22 .. L7_23 .. L8_24
      L3_19(L4_20)
      L3_19 = db
      L3_19 = L3_19.getAttribute
      L4_20 = "environment"
      L5_21 = "name"
      L6_22 = "USB_STATUS_CHECK_PROGRAM"
      L7_23 = "value"
      L3_19 = L3_19(L4_20, L5_21, L6_22, L7_23)
      usbStatusCmd = L3_19
      L3_19 = adaptos
      L3_19 = L3_19.execute
      L4_20 = usbStatusCmd
      L5_21 = " "
      L6_22 = 2
      L4_20 = L4_20 .. L5_21 .. L6_22
      L3_19(L4_20)
    end
  else
    L3_19 = _UPVALUE0_
    L3_19 = L3_19.NOT_SUPPORTED
    return L3_19
  end
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.SUCCESS
  L4_20 = A0_16
  return L3_19, L4_20
end
function restoreConfigGet()
  local L1_26
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.NOT_SUPPORTED
  return L1_26
end
function restoreConfigGetNext(A0_27)
  local L2_28
  L2_28 = _UPVALUE0_
  L2_28 = L2_28.NOT_SUPPORTED
  return L2_28, A0_27
end
function restoreConfigSet(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43
  L1_30 = A0_29["backupRestore.restoreStatus"]
  L2_31 = A0_29["backupRestore.filename"]
  L3_32, L4_33, L5_34 = nil, nil, nil
  L6_35 = ""
  if L1_30 == "pc" then
    L7_36 = A0_29["file.restore"]
    L3_32 = L7_36.filesize
    L7_36 = A0_29["file.restore"]
    L4_33 = L7_36.filename
    L7_36 = A0_29["file.restore"]
    L5_34 = L7_36.file
    L7_36 = string
    L7_36 = L7_36.sub
    L8_37 = A0_29["file.restore"]
    L8_37 = L8_37.filename
    L9_38 = -3
    L10_39 = -1
    L7_36 = L7_36(L8_37, L9_38, L10_39)
    if L7_36 == "enc" then
      L6_35 = "1"
    end
  end
  L7_36 = "out.cfg"
  L8_37 = _UPVALUE0_
  L8_37 = L8_37.NIL
  if L1_30 == L8_37 then
    L8_37 = _UPVALUE0_
    L8_37 = L8_37.INVALID_ARGUMENT
    return L8_37
  end
  if L1_30 == "pc" then
    L8_37 = cgilua
    L8_37 = L8_37.cookies
    L8_37 = L8_37.get
    L9_38 = "TeamF1Login"
    L8_37 = L8_37(L9_38)
    L9_38 = L8_37
    if L6_35 == "1" then
      L10_39, L11_40 = nil, nil
      L12_41 = io
      L12_41 = L12_41.open
      L13_42 = "/pfrm2.0/pkgMgmt/packageKey"
      L14_43 = "r"
      L12_41 = L12_41(L13_42, L14_43)
      L14_43 = L12_41
      L13_42 = L12_41.read
      L13_42 = L13_42(L14_43, "*l")
      L10_39 = L13_42
      L14_43 = L12_41
      L13_42 = L12_41.read
      L13_42 = L13_42(L14_43, "*l")
      L11_40 = L13_42
      L14_43 = L12_41
      L13_42 = L12_41.close
      L13_42(L14_43)
      L13_42 = util
      L13_42 = L13_42.appendDebugOut
      L14_43 = "Exec = "
      L14_43 = L14_43 .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -d -aes-128-cbc -in /tmp/" .. L8_37 .. " -out /tmp/" .. L7_36 .. " -K " .. L10_39 .. " -iv " .. L11_40 .. " -nosalt")
      L13_42(L14_43)
      L8_37 = L7_36
    end
    L10_39 = db
    L10_39 = L10_39.getAttribute
    L11_40 = "unitInfo"
    L12_41 = "_ROWID_"
    L13_42 = "1"
    L14_43 = "modelId"
    L10_39 = L10_39(L11_40, L12_41, L13_42, L14_43)
    L11_40 = io
    L11_40 = L11_40.popen
    L12_41 = "cat '"
    L13_42 = "/tmp/"
    L14_43 = L8_37
    L12_41 = L12_41 .. L13_42 .. L14_43 .. "' | grep -i 'firmwareFile' | cut -d'\"' -f4 | cut -d'_' -f1"
    L11_40 = L11_40(L12_41)
    L13_42 = L11_40
    L12_41 = L11_40.read
    L14_43 = "*a"
    L12_41 = L12_41(L13_42, L14_43)
    L14_43 = L11_40
    L13_42 = L11_40.close
    L13_42(L14_43)
    L13_42 = string
    L13_42 = L13_42.sub
    L14_43 = L12_41
    L13_42 = L13_42(L14_43, 1, -2)
    L12_41 = L13_42
    if L12_41 ~= L10_39 then
      L13_42 = util
      L13_42 = L13_42.appendDebugOut
      L14_43 = "Exec = "
      L14_43 = L14_43 .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L8_37 .. " ; /bin/rm -rf " .. "/tmp/" .. L9_38)
      L13_42(L14_43)
      L13_42 = _UPVALUE1_
      L13_42 = L13_42.INVALID_FILE
      return L13_42
    else
      L13_42 = config
      L13_42 = L13_42.verifyChecksum
      L14_43 = "/tmp/"
      L14_43 = L14_43 .. L8_37
      L13_42 = L13_42(L14_43)
      if L13_42 == "ok" then
        L13_42 = db
        L13_42 = L13_42.getAttribute
        L14_43 = "environment"
        L13_42 = L13_42(L14_43, "name", "FLASH_CFG_PARTITION", "value")
        L14_43 = util
        L14_43 = L14_43.appendDebugOut
        L14_43("Exec = " .. os.execute("cp -f" .. " " .. "/tmp/" .. L8_37 .. " " .. L13_42))
      else
        L13_42 = util
        L13_42 = L13_42.appendDebugOut
        L14_43 = "Exec = "
        L14_43 = L14_43 .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L8_37 .. " ; /bin/rm -rf " .. "/tmp/" .. L9_38)
        L13_42(L14_43)
        L13_42 = _UPVALUE1_
        L13_42 = L13_42.CONFIG_CHECKSUM_FAILED
        return L13_42
      end
    end
  elseif L1_30 == "usb1" then
    L8_37 = ""
    L9_38 = "out.cfg"
    L10_39 = L2_31
    L11_40 = string
    L11_40 = L11_40.sub
    L12_41 = L10_39
    L13_42 = -3
    L14_43 = -1
    L11_40 = L11_40(L12_41, L13_42, L14_43)
    if L11_40 == "enc" then
      L8_37 = "1"
    end
    if L8_37 == "1" then
      L11_40, L12_41 = nil, nil
      L13_42 = io
      L13_42 = L13_42.open
      L14_43 = "/pfrm2.0/pkgMgmt/packageKey"
      L13_42 = L13_42(L14_43, "r")
      L14_43 = L13_42.read
      L14_43 = L14_43(L13_42, "*l")
      L11_40 = L14_43
      L14_43 = L13_42.read
      L14_43 = L14_43(L13_42, "*l")
      L12_41 = L14_43
      L14_43 = L13_42.close
      L14_43(L13_42)
      L14_43 = util
      L14_43 = L14_43.appendDebugOut
      L14_43("Exec = " .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -d -aes-128-cbc -in /usb1/" .. L10_39 .. " -out /tmp/" .. L9_38 .. " -K " .. L11_40 .. " -iv " .. L12_41 .. " -nosalt"))
      L10_39 = L9_38
    else
      L11_40 = util
      L11_40 = L11_40.appendDebugOut
      L12_41 = "Exec = "
      L13_42 = os
      L13_42 = L13_42.execute
      L14_43 = "/bin/cp -f /usb1/"
      L14_43 = L14_43 .. L10_39 .. " /tmp/"
      L13_42 = L13_42(L14_43)
      L12_41 = L12_41 .. L13_42
      L11_40(L12_41)
    end
    L11_40 = db
    L11_40 = L11_40.getAttribute
    L12_41 = "unitInfo"
    L13_42 = "_ROWID_"
    L14_43 = "1"
    L11_40 = L11_40(L12_41, L13_42, L14_43, "modelId")
    L12_41 = io
    L12_41 = L12_41.popen
    L13_42 = "cat '"
    L14_43 = "/tmp/"
    L13_42 = L13_42 .. L14_43 .. L10_39 .. "' | grep -i 'firmwareFile' | cut -d'\"' -f4 | cut -d'_' -f1"
    L12_41 = L12_41(L13_42)
    L14_43 = L12_41
    L13_42 = L12_41.read
    L13_42 = L13_42(L14_43, "*a")
    L14_43 = L12_41.close
    L14_43(L12_41)
    L14_43 = string
    L14_43 = L14_43.sub
    L14_43 = L14_43(L13_42, 1, -2)
    L13_42 = L14_43
    if L13_42 ~= L11_40 then
      L14_43 = util
      L14_43 = L14_43.appendDebugOut
      L14_43("Exec = " .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L10_39))
      L14_43 = _UPVALUE1_
      L14_43 = L14_43.INVALID_FILE
      return L14_43
    else
      L14_43 = config
      L14_43 = L14_43.verifyChecksum
      L14_43 = L14_43("/tmp/" .. L10_39)
      if L14_43 == "ok" then
        L14_43 = db
        L14_43 = L14_43.getAttribute
        L14_43 = L14_43("environment", "name", "FLASH_CFG_PARTITION", "value")
        util.appendDebugOut("Exec = " .. os.execute("cp -f" .. " " .. "/tmp/" .. L10_39 .. " " .. L14_43))
      else
        L14_43 = util
        L14_43 = L14_43.appendDebugOut
        L14_43("Exec = " .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L10_39))
        L14_43 = _UPVALUE1_
        L14_43 = L14_43.CONFIG_CHECKSUM_FAILED
        return L14_43
      end
    end
  elseif L1_30 == "usb2" then
    L8_37 = ""
    L9_38 = "out.cfg"
    L10_39 = L2_31
    L11_40 = string
    L11_40 = L11_40.sub
    L12_41 = L10_39
    L13_42 = -3
    L14_43 = -1
    L11_40 = L11_40(L12_41, L13_42, L14_43)
    if L11_40 == "enc" then
      L8_37 = "1"
    end
    if L8_37 == "1" then
      L11_40, L12_41 = nil, nil
      L13_42 = io
      L13_42 = L13_42.open
      L14_43 = "/pfrm2.0/pkgMgmt/packageKey"
      L13_42 = L13_42(L14_43, "r")
      L14_43 = L13_42.read
      L14_43 = L14_43(L13_42, "*l")
      L11_40 = L14_43
      L14_43 = L13_42.read
      L14_43 = L14_43(L13_42, "*l")
      L12_41 = L14_43
      L14_43 = L13_42.close
      L14_43(L13_42)
      L14_43 = util
      L14_43 = L14_43.appendDebugOut
      L14_43("Exec = " .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -d -aes-128-cbc -in /usb2/" .. L10_39 .. " -out /tmp/" .. L9_38 .. " -K " .. L11_40 .. " -iv " .. L12_41 .. " -nosalt"))
      L10_39 = L9_38
    else
      L11_40 = util
      L11_40 = L11_40.appendDebugOut
      L12_41 = "Exec = "
      L13_42 = os
      L13_42 = L13_42.execute
      L14_43 = "/bin/cp -f /usb2/"
      L14_43 = L14_43 .. L10_39 .. " /tmp/"
      L13_42 = L13_42(L14_43)
      L12_41 = L12_41 .. L13_42
      L11_40(L12_41)
    end
    L11_40 = db
    L11_40 = L11_40.getAttribute
    L12_41 = "unitInfo"
    L13_42 = "_ROWID_"
    L14_43 = "1"
    L11_40 = L11_40(L12_41, L13_42, L14_43, "modelId")
    L12_41 = io
    L12_41 = L12_41.popen
    L13_42 = "cat '"
    L14_43 = "/tmp/"
    L13_42 = L13_42 .. L14_43 .. L10_39 .. "' | grep -i 'firmwareFile' | cut -d'\"' -f4 | cut -d'_' -f1"
    L12_41 = L12_41(L13_42)
    L14_43 = L12_41
    L13_42 = L12_41.read
    L13_42 = L13_42(L14_43, "*a")
    L14_43 = L12_41.close
    L14_43(L12_41)
    L14_43 = string
    L14_43 = L14_43.sub
    L14_43 = L14_43(L13_42, 1, -2)
    L13_42 = L14_43
    if L13_42 ~= L11_40 then
      L14_43 = util
      L14_43 = L14_43.appendDebugOut
      L14_43("Exec = " .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L10_39))
      L14_43 = _UPVALUE1_
      L14_43 = L14_43.INVALID_FILE
      return L14_43
    else
      L14_43 = config
      L14_43 = L14_43.verifyChecksum
      L14_43 = L14_43("/tmp/" .. L10_39)
      if L14_43 == "ok" then
        L14_43 = db
        L14_43 = L14_43.getAttribute
        L14_43 = L14_43("environment", "name", "FLASH_CFG_PARTITION", "value")
        util.appendDebugOut("Exec = " .. os.execute("cp -f" .. " " .. "/tmp/" .. L10_39 .. " " .. L14_43))
      else
        L14_43 = util
        L14_43 = L14_43.appendDebugOut
        L14_43("Exec = " .. os.execute("/bin/rm -rf" .. " " .. "/tmp/" .. L10_39))
        L14_43 = _UPVALUE1_
        L14_43 = L14_43.CONFIG_CHECKSUM_FAILED
        return L14_43
      end
    end
  else
    L8_37 = _UPVALUE0_
    L8_37 = L8_37.FAILURE
    return L8_37
  end
  L8_37 = util
  L8_37 = L8_37.appendDebugOut
  L9_38 = "Exec = "
  L10_39 = os
  L10_39 = L10_39.execute
  L11_40 = "touch /tmp/restoreProgress.txt"
  L10_39 = L10_39(L11_40)
  L9_38 = L9_38 .. L10_39
  L8_37(L9_38)
  L8_37 = _UPVALUE0_
  L8_37 = L8_37.SUCCESS
  L9_38 = L2_31
  return L8_37, L9_38
end
function restoreConfigFileGet()
  local L1_44
  L1_44 = _UPVALUE0_
  L1_44 = L1_44.NOT_SUPPORTED
  return L1_44
end
function restoreConfigFileGetNext(A0_45)
  local L2_46
  L2_46 = _UPVALUE0_
  L2_46 = L2_46.NOT_SUPPORTED
  return L2_46, A0_45
end
function restoreConfigFileSet(A0_47, A1_48)
  local L3_49
  L3_49 = _UPVALUE0_
  L3_49 = L3_49.NOT_SUPPORTED
  return L3_49, A0_47
end
function adaptos.execute(A0_50)
  status = os.execute(A0_50)
  return status
end
function bootupTimeGet()
  local L0_51
  L0_51 = db
  L0_51 = L0_51.getAttribute
  L0_51 = L0_51(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE2_, _UPVALUE1_.bootupTime)
  if L0_51 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_51
end
function fileSizeGet(A0_52)
  local L1_53, L2_54, L3_55
  L1_53 = io
  L1_53 = L1_53.open
  L2_54 = A0_52
  L3_55 = "r"
  L1_53 = L1_53(L2_54, L3_55)
  L3_55 = L1_53
  L2_54 = L1_53.seek
  L2_54 = L2_54(L3_55)
  L3_55 = L1_53.seek
  L3_55 = L3_55(L1_53, "end")
  L1_53:seek("set", L2_54)
  if L3_55 > 2097152 then
    return _UPVALUE0_.FILE_SIZE_MORE_THAN_2MB, L3_55
  else
    return _UPVALUE1_.SUCCESS, L3_55
  end
end
