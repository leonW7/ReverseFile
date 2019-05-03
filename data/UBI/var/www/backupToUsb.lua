local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16
L0_0 = require
L1_1 = "teamf1lualib/errorMap"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.errorMap"
L1_1 = L1_1(L2_2)
L2_2 = {
  L3_3,
  L4_4,
  L5_5,
  L6_6
}
L3_3 = "12426"
L4_4 = "12425"
L5_5 = "10187"
L6_6 = "10450"
L3_3 = I18N
L3_3 = L3_3.translate
L4_4 = L2_2
L3_3 = L3_3(L4_4)
L4_4 = ACCESS_LEVEL
if L4_4 ~= 0 then
  L4_4 = util
  L4_4 = L4_4.fileExists
  L5_5 = "/tmp/bootComplete"
  L4_4 = L4_4(L5_5)
  if not L4_4 then
    L5_5 = L1_1.errorStringGet
    L6_6 = L0_0.ROUTER_INITIALIZING_AFTER_REBOOT
    L5_5 = L5_5(L6_6)
    statusErrorMessage = L5_5
  else
    L5_5 = L1_1.errorStringGet
    L6_6 = L0_0.UNAUTHORIZED
    L5_5 = L5_5(L6_6)
    statusErrorMessage = L5_5
  end
  L5_5 = web
  L5_5 = L5_5.goToPage
  L6_6 = "backupRestore"
  L7_7 = true
  L8_8 = true
  L5_5(L6_6, L7_7, L8_8)
else
  L4_4 = db
  L4_4 = L4_4.getAttribute
  L5_5 = "environment"
  L6_6 = "name"
  L7_7 = "USB_STATUS_CHECK_PROGRAM"
  L8_8 = "value"
  L4_4 = L4_4(L5_5, L6_6, L7_7, L8_8)
  L5_5 = db
  L5_5 = L5_5.getAttribute
  L6_6 = "environment"
  L7_7 = "name"
  L8_8 = "USB_STATUS_FILE1"
  L9_9 = "value"
  L5_5 = L5_5(L6_6, L7_7, L8_8, L9_9)
  L6_6 = nil
  L7_7 = ""
  if L5_5 ~= nil then
    L8_8 = util
    L8_8 = L8_8.fileExists
    L9_9 = L5_5
    L8_8 = L8_8(L9_9)
    if L8_8 then
      L8_8 = util
      L8_8 = L8_8.fileToString
      L9_9 = L5_5
      L8_8 = L8_8(L9_9)
      L6_6 = L8_8
      L8_8 = string
      L8_8 = L8_8.gsub
      L9_9 = L6_6
      L10_10 = "\n"
      L11_11 = ""
      L8_8 = L8_8(L9_9, L10_10, L11_11)
      L6_6 = L8_8
    end
  end
  if L6_6 == nil then
    L6_6 = "-1"
  end
  if L6_6 == "0" then
    L8_8 = L1_1.errorStringGet
    L9_9 = L0_0.USB_DEVICE_NOT_MOUNTED
    L8_8 = L8_8(L9_9)
    statusErrorMessage = L8_8
  elseif L6_6 == "-1" then
    L8_8 = L1_1.errorStringGet
    L9_9 = L0_0.USB_DEVICE_NOT_CONNECTED
    L8_8 = L8_8(L9_9)
    statusErrorMessage = L8_8
  elseif L6_6 == "1" then
    L8_8 = UNIT_INFO
    L9_9 = string
    L9_9 = L9_9.find
    L10_10 = L8_8 or ""
    L11_11 = "-"
    L10_10 = L9_9(L10_10, L11_11)
    if (L8_8 == "DSR-1000N" or L8_8 == "DSR-1000" or L8_8 == "DSR-500N" or L8_8 == "DSR-500") and L9_9 ~= nil and L10_10 ~= nil then
      L11_11 = string
      L11_11 = L11_11.sub
      L12_12 = L8_8
      L13_13 = 0
      L14_14 = L9_9 - 1
      L11_11 = L11_11(L12_12, L13_13, L14_14)
      L8_8 = L11_11
    end
    L11_11 = L8_8 or L11_11(L12_12, L13_13, L14_14, L15_15)
    L12_12 = db
    L12_12 = L12_12.getAttribute
    L13_13 = "ConfigSupport"
    L14_14 = "_ROWID_"
    L15_15 = "1"
    L16_16 = "EncryptEnable"
    L12_12 = L12_12(L13_13, L14_14, L15_15, L16_16)
    if L12_12 ~= nil and L12_12 == "1" then
      L13_13, L14_14 = nil, nil
      L15_15 = io
      L15_15 = L15_15.open
      L16_16 = "/pfrm2.0/pkgMgmt/packageKey"
      L15_15 = L15_15(L16_16, "r")
      L16_16 = ""
      L13_13 = L15_15:read("*l")
      L14_14 = L15_15:read("*l")
      L15_15:close()
      util.appendDebugOut("Exec = " .. os.execute("/pfrm2.0/bin/usrKlite openssl enc -aes-128-cbc -in " .. SETTINGS_FILE .. " -out " .. SETTINGS_FILE .. ".enc -K " .. L13_13 .. " -iv " .. L14_14 .. " -nosalt"))
      L16_16 = SETTINGS_FILE .. ".enc"
      os.execute("/bin/cp " .. L16_16 .. " /usb1/" .. L11_11 .. ".cfg.enc")
    else
      L13_13 = os
      L13_13 = L13_13.execute
      L14_14 = "/bin/cp "
      L15_15 = SETTINGS_FILE
      L16_16 = " /usb1/"
      L14_14 = L14_14 .. L15_15 .. L16_16 .. L11_11 .. ".cfg"
      L13_13(L14_14)
    end
    L13_13 = util
    L13_13 = L13_13.appendDebugOut
    L14_14 = "Exec = "
    L15_15 = os
    L15_15 = L15_15.execute
    L16_16 = L4_4
    L16_16 = L16_16 .. " " .. 1
    L15_15 = L15_15(L16_16)
    L14_14 = L14_14 .. L15_15
    L13_13(L14_14)
    L13_13 = L1_1.errorStringGet
    L14_14 = L0_0.CONFIG_FILE_STORED_USB
    L13_13 = L13_13(L14_14)
    statusSuccessMessage = L13_13
  end
  L8_8 = web
  L8_8 = L8_8.goToPage
  L9_9 = "backupRestore"
  L10_10 = true
  L11_11 = true
  L8_8(L9_9, L10_10, L11_11)
end
