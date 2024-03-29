local L0_0
L0_0 = require
L0_0("teamf1lualib/usb")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/usb_status")
L0_0 = "environment"
;({}).name = "name"
;({}).value = "value"
;({}).usb1Status = "USB_STATUS_FILE1"
;({}).usb2Status = "USB_STATUS_FILE2"
function usb1CfgInit(A0_1)
  configRow = db.getRow("USB", "usbNum", "0")
  if configRow == nil then
    configRow = {}
    configRow["USB._ROWID_"] = "-1"
  end
  configRowId = configRow["USB._ROWID_"]
  return configRowId, configRow
end
function usb1CfgSave(A0_2)
  local L1_3
  L1_3 = ""
  errorFlag = L1_3
  L1_3 = ""
  statusCode = L1_3
  L1_3 = ""
  statusMessage = L1_3
  L1_3 = "USB"
  DBTable = L1_3
  L1_3 = A0_2["USB._ROWID_"]
  if L1_3 == "-1" then
    A0_2["USB.usbNum"] = "0"
    if A0_2["USB.USBStatus"] == "0" then
      A0_2["USB.USBType"] = "4"
    end
    errorFlag, statusCode = usb.usbConfig(A0_2, L1_3, "add")
  else
    errorFlag, statusCode = usb.usbConfig(A0_2, L1_3, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return errorFlag, statusMessage
end
function usb1CfgInputVal(A0_4)
  if A0_4["USB.StorageServer"] == "1" and A0_4["USB.PrintServer"] == "1" then
    printCLIError("Cant enable both Storage and Printer at once")
    __CLISH_EDIT_CONFIG_ROW = {}
    return false
  end
  file1 = io.open("/var/usb1Info", "r")
  if file1 == nil then
    printCLIError("No Devices connected to usb")
    return false
  end
  fileContent = file1:read("*line")
  if A0_4["USB.StorageServer"] == "1" and string.find(fileContent, "storage") == nil then
    printCLIError("USB connected is not a storage device")
    return false
  end
  if A0_4["USB.PrintServer"] == "1" and string.find(fileContent, "Printer") == nil then
    printCLIError("USB connected is not a printer device")
    return false
  end
  if A0_4["USB.USBStatus"] == "" or A0_4["USB.USBStatus"] == nil then
    printCLIError("Enter Valid Enable Value")
    return false
  end
  if A0_4["USB.USBStatus"] == "1" and (A0_4["USB.USBType"] == "" or A0_4["USB.USBType"] == nil) then
    printCLIError("Enter Valid USB Type")
    return false
  end
  return true
end
function usbCfgGet()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25
  L0_5 = {}
  L1_6 = "DISCONNECTED"
  L2_7 = "NA"
  L3_8 = "NA"
  L4_9 = "NA"
  L5_10 = "NA"
  L6_11 = 0
  L7_12 = db
  L7_12 = L7_12.getAttribute
  L8_13 = _UPVALUE0_
  L9_14 = _UPVALUE1_
  L9_14 = L9_14.name
  L10_15 = _UPVALUE1_
  L10_15 = L10_15.usb1Status
  L11_16 = _UPVALUE1_
  L11_16 = L11_16.value
  L7_12 = L7_12(L8_13, L9_14, L10_15, L11_16)
  L8_13 = db
  L8_13 = L8_13.getAttribute
  L9_14 = _UPVALUE0_
  L10_15 = _UPVALUE1_
  L10_15 = L10_15.name
  L11_16 = _UPVALUE1_
  L11_16 = L11_16.usb2Status
  L12_17 = _UPVALUE1_
  L12_17 = L12_17.value
  L8_13 = L8_13(L9_14, L10_15, L11_16, L12_17)
  L9_14 = db
  L9_14 = L9_14.getAttribute
  L10_15 = "system"
  L11_16 = "_ROWID_"
  L12_17 = "1"
  L13_18 = "name"
  L9_14 = L9_14(L10_15, L11_16, L12_17, L13_18)
  if L9_14 ~= "DSR-500AC" then
    L10_15 = PRODUCT_ID
    if L10_15 ~= "DSR-500_Bx" then
      if L7_12 ~= nil then
        L10_15 = util
        L10_15 = L10_15.fileExists
        L11_16 = L7_12
        L10_15 = L10_15(L11_16)
        if L10_15 then
          L10_15 = util
          L10_15 = L10_15.fileToString
          L11_16 = L7_12
          L10_15 = L10_15(L11_16)
          usbStatus1 = L10_15
          L10_15 = string
          L10_15 = L10_15.gsub
          L11_16 = usbStatus1
          L12_17 = "\n"
          L13_18 = ""
          L10_15 = L10_15(L11_16, L12_17, L13_18)
          usbStatus1 = L10_15
          L6_11 = 1
        end
      end
      if L6_11 == 1 then
        L10_15 = io
        L10_15 = L10_15.open
        L11_16 = "/var/usb1Info"
        L12_17 = "r"
        L10_15 = L10_15(L11_16, L12_17)
        L11_16 = usbStatus1
        if L11_16 == "0" then
          L5_10 = "Unmounted"
          L1_6 = "Connected"
        else
          L11_16 = usbStatus1
          if L11_16 ~= "0" then
            L5_10 = "mounted"
            L1_6 = "Connected"
            if L10_15 then
              L12_17 = L10_15
              L11_16 = L10_15.read
              L13_18 = "*all"
              L11_16 = L11_16(L12_17, L13_18)
              L11_16 = L11_16 or ""
              L12_17 = util
              L12_17 = L12_17.split
              L13_18 = L11_16
              L14_19 = ":"
              L12_17 = L12_17(L13_18, L14_19)
              if L12_17 ~= nil then
                L13_18 = #L12_17
                if L13_18 > 4 then
                  L2_7 = L12_17[1]
                  L3_8 = L12_17[2]
                  L4_9 = L12_17[3]
                  L1_6 = "CONNECTED"
                end
              end
              L14_19 = L10_15
              L13_18 = L10_15.close
              L13_18(L14_19)
            end
          end
        end
        if L2_7 == nil or L3_8 == nil or L4_9 == nil or L5_10 == nil or L1_6 == nil then
          L11_16 = _UPVALUE2_
          L11_16 = L11_16.FAILURE
          return L11_16
        end
      end
      L10_15 = resTab
      L10_15 = L10_15.insertField
      L11_16 = L0_5
      L12_17 = "USB Connection status"
      L13_18 = L1_6
      L10_15(L11_16, L12_17, L13_18)
      L10_15 = resTab
      L10_15 = L10_15.insertField
      L11_16 = L0_5
      L12_17 = "USB Vendor"
      L13_18 = L2_7
      L10_15(L11_16, L12_17, L13_18)
      L10_15 = resTab
      L10_15 = L10_15.insertField
      L11_16 = L0_5
      L12_17 = "USB Model"
      L13_18 = L3_8
      L10_15(L11_16, L12_17, L13_18)
      L10_15 = resTab
      L10_15 = L10_15.insertField
      L11_16 = L0_5
      L12_17 = "USB Type"
      L13_18 = L4_9
      L10_15(L11_16, L12_17, L13_18)
      L10_15 = resTab
      L10_15 = L10_15.insertField
      L11_16 = L0_5
      L12_17 = "usb Mount status"
      L13_18 = L5_10
      L10_15(L11_16, L12_17, L13_18)
      L10_15 = printLabel
      L11_16 = "USB1 Status"
      L10_15(L11_16)
      L10_15 = resTab
      L10_15 = L10_15.print
      L11_16 = L0_5
      L12_17 = 0
      L10_15(L11_16, L12_17)
    end
  end
  L10_15 = db
  L10_15 = L10_15.getAttribute
  L11_16 = "system"
  L12_17 = "_ROWID_"
  L13_18 = "1"
  L14_19 = "name"
  L10_15 = L10_15(L11_16, L12_17, L13_18, L14_19)
  if L10_15 ~= "DSR-1000N" and L10_15 ~= "DSR-1000" and L10_15 ~= "DWC-1000" and L10_15 ~= "DSR-1000AC" and L10_15 ~= "DSR-500AC" then
    L11_16 = PRODUCT_ID
  elseif L11_16 == "DSR_500_Bx" then
    L11_16 = {}
    L12_17 = "DISCONNECTED"
    L13_18 = "NA"
    L14_19 = "NA"
    L15_20 = "NA"
    L16_21 = "NA"
    L17_22 = 0
    L18_23 = db
    L18_23 = L18_23.getAttribute
    L19_24 = _UPVALUE0_
    L20_25 = _UPVALUE1_
    L20_25 = L20_25.name
    L18_23 = L18_23(L19_24, L20_25, _UPVALUE1_.usb2Status, _UPVALUE1_.value)
    if L18_23 ~= nil then
      L19_24 = util
      L19_24 = L19_24.fileExists
      L20_25 = L18_23
      L19_24 = L19_24(L20_25)
      if L19_24 then
        L19_24 = util
        L19_24 = L19_24.fileToString
        L20_25 = L18_23
        L19_24 = L19_24(L20_25)
        usbStatus2 = L19_24
        L19_24 = string
        L19_24 = L19_24.gsub
        L20_25 = usbStatus2
        L19_24 = L19_24(L20_25, "\n", "")
        usbStatus2 = L19_24
        L17_22 = 1
      end
    end
    if L17_22 == 1 then
      L19_24 = io
      L19_24 = L19_24.open
      L20_25 = "/var/usb2Info"
      L19_24 = L19_24(L20_25, "r")
      L20_25 = usbStatus2
      if L20_25 == "0" then
        L16_21 = "Unmounted"
        L12_17 = "Connected"
      else
        L20_25 = usbStatus2
        if L20_25 ~= "0" then
          L16_21 = "mounted"
          L12_17 = "Connected"
          if L19_24 then
            L20_25 = L19_24.read
            L20_25 = L20_25(L19_24, "*all")
            L20_25 = L20_25 or ""
            if util.split(L20_25, ":") ~= nil and #util.split(L20_25, ":") > 4 then
              L13_18 = util.split(L20_25, ":")[1]
              L14_19 = util.split(L20_25, ":")[2]
              L15_20 = util.split(L20_25, ":")[3]
            end
            L19_24:close()
          end
        end
      end
      if L13_18 == nil or L14_19 == nil or L15_20 == nil or L16_21 == nil or L12_17 == nil then
        L20_25 = _UPVALUE2_
        L20_25 = L20_25.FAILURE
        return L20_25
      end
    end
    L19_24 = resTab
    L19_24 = L19_24.insertField
    L20_25 = L11_16
    L19_24(L20_25, "USB Connection status", L12_17)
    L19_24 = resTab
    L19_24 = L19_24.insertField
    L20_25 = L11_16
    L19_24(L20_25, "USB Vendor", L13_18)
    L19_24 = resTab
    L19_24 = L19_24.insertField
    L20_25 = L11_16
    L19_24(L20_25, "USB Model", L14_19)
    L19_24 = resTab
    L19_24 = L19_24.insertField
    L20_25 = L11_16
    L19_24(L20_25, "USB Type", L15_20)
    L19_24 = resTab
    L19_24 = L19_24.insertField
    L20_25 = L11_16
    L19_24(L20_25, "usb Mount status", L16_21)
    if L10_15 ~= "DSR-500AC" then
      L19_24 = PRODUCT_ID
    else
      if L19_24 == "DSR-500_Bx" then
        L19_24 = printLabel
        L20_25 = "USB1 Status"
        L19_24(L20_25)
    end
    else
      L19_24 = printLabel
      L20_25 = "USB2 Status"
      L19_24(L20_25)
    end
    L19_24 = resTab
    L19_24 = L19_24.print
    L20_25 = L11_16
    L19_24(L20_25, 0)
  end
end
function usb2CfgInit(A0_26)
  configRow = db.getRow("USB", "usbNum", "1")
  if configRow == nil then
    configRow = {}
    configRow["USB._ROWID_"] = "-1"
  end
  configRowId = configRow["USB._ROWID_"]
  return configRowId, configRow
end
function usb2CfgSave(A0_27)
  local L1_28
  L1_28 = ""
  errorFlag = L1_28
  L1_28 = ""
  statusCode = L1_28
  L1_28 = ""
  statusMessage = L1_28
  L1_28 = "USB"
  DBTable = L1_28
  L1_28 = A0_27["USB._ROWID_"]
  if L1_28 == "-1" then
    A0_27["USB.usbNum"] = "1"
    if A0_27["USB.USBStatus"] == "0" then
      A0_27["USB.USBType"] = "4"
    end
    errorFlag, statusCode = usb.usbConfig(A0_27, L1_28, "add")
  else
    errorFlag, statusCode = usb.usbConfig(A0_27, L1_28, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return errorFlag, statusMessage
end
function usb2CfgInputVal(A0_29)
  if A0_29["USB.StorageServer"] == "1" and A0_29["USB.PrintServer"] == "1" then
    printCLIError("Cant enable both Storage and Printer at once")
    __CLISH_EDIT_CONFIG_ROW = {}
    return false
  end
  file2 = io.open("/var/usb2Info", "r")
  if file2 == nil then
    printCLIError("No Devices connected")
    return false
  end
  fileContent = file2:read("*line")
  if A0_29["USB.StorageServer"] == "1" and string.find(fileContent, "storage") == nil then
    printCLIError("USB connected is not a storage device")
    return false
  end
  if A0_29["USB.PrintServer"] == "1" and string.find(fileContent, "Printer") == nil then
    printCLIError("USB connected is not a printer device")
    return false
  end
  if A0_29["USB.USBStatus"] == "" or A0_29["USB.USBStatus"] == nil then
    printCLIError("Enter Valid Enable Value")
    return false
  end
  if A0_29["USB.USBStatus"] == "1" and (A0_29["USB.USBType"] == "" or A0_29["USB.USBType"] == nil) then
    printCLIError("Enter Valid USB Type")
    return false
  end
  return true
end
function usbcfgUnmount(A0_30)
  local L1_31, L2_32
  if A0_30 == "usb1" then
    L1_31 = db
    L1_31 = L1_31.getAttribute
    L2_32 = _UPVALUE0_
    L1_31 = L1_31(L2_32, _UPVALUE1_.name, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
    if L1_31 ~= nil then
      L2_32 = util
      L2_32 = L2_32.fileExists
      L2_32 = L2_32(L1_31)
      if L2_32 then
        L2_32 = util
        L2_32 = L2_32.fileToString
        L2_32 = L2_32(L1_31)
        usbStatus1 = L2_32
        L2_32 = string
        L2_32 = L2_32.gsub
        L2_32 = L2_32(usbStatus1, "\n", "")
        usbStatus1 = L2_32
        L2_32 = 1
        usb1StatusFlag = L2_32
        L2_32 = usbStatus1
        if L2_32 == "0" then
          L2_32 = print
          L2_32("Usb1 is already unmounted")
          L2_32 = false
          return L2_32
        else
          L2_32 = _UPVALUE2_
          L2_32 = L2_32.usbUnmount
          L2_32(A0_30)
          L2_32 = print
          L2_32("Usb1 is Successfully unmounted")
          L2_32 = true
          return L2_32
        end
      else
        L2_32 = print
        L2_32("Usb1 port is not connected")
        L2_32 = false
        return L2_32
      end
    end
  end
  if A0_30 == "usb2" then
    L1_31 = db
    L1_31 = L1_31.getAttribute
    L2_32 = "system"
    L1_31 = L1_31(L2_32, "_ROWID_", "1", "name")
    if L1_31 ~= "DSR-500AC" then
      L2_32 = PRODUCT_ID
    else
      if L2_32 == "DSR-500_Bx" then
        L2_32 = "USB1"
        usbPort = L2_32
    end
    else
      L2_32 = "USB2"
      usbPort = L2_32
    end
    L2_32 = db
    L2_32 = L2_32.getAttribute
    L2_32 = L2_32(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb2Status, _UPVALUE1_.value)
    if L2_32 ~= nil then
      if util.fileExists(L2_32) then
        usbStatus2 = util.fileToString(L2_32)
        usbStatus2 = string.gsub(usbStatus2, "\n", "")
        usb1StatusFlag = 1
        if usbStatus2 == "0" then
          print(usbPort .. " is already unmounted")
          return false
        else
          _UPVALUE2_.usbUnmount(A0_30)
          print(usbPort .. " is Successfully unmounted")
          return true
        end
      else
        print(usbPort .. " port is not connected")
        return false
      end
    end
  end
end
