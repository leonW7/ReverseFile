local L0_0
L0_0 = module
L0_0("com.teamf1.bl.usb.printing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/usb_printing")
L0_0 = require
L0_0("teamf1lualib/usb_returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function usbPort1PrintingGet()
  local L0_1, L1_2, L2_3
  L0_1, L1_2, L2_3 = _UPVALUE0_.isUsbPort1PrintingEnabled()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3
end
function usbPort1PrintingSet(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page usbSharePorts"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["usbSharePorts.cookie"]
  L2_6 = A0_4["usbSharePorts.PrintServer"]
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.NIL
  if L1_5 == L3_7 then
    L3_7 = util
    L3_7 = L3_7.appendDebugOut
    L4_8 = "Set : Invalid Cookie"
    L3_7(L4_8)
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.BAD_PARAMETER
    return L3_7
  end
  L3_7 = _UPVALUE0_
  L3_7 = L3_7.NIL
  if L2_6 == L3_7 then
    L3_7 = util
    L3_7 = L3_7.appendDebugOut
    L4_8 = "GetNext : Invalid Cookie"
    L3_7(L4_8)
    L3_7 = _UPVALUE0_
    L3_7 = L3_7.BAD_PARAMETER
    return L3_7
  end
  L3_7, L4_8 = nil, nil
  _UPVALUE1_.start()
  if L2_6 == _UPVALUE2_ then
    L3_7, L4_8 = _UPVALUE3_.usbPort1PrintingEnable(L1_5)
  else
    L3_7, L4_8 = _UPVALUE3_.usbPort1PrintingDisable(L1_5)
  end
  if L3_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usbSharePorts" .. L3_7)
    _UPVALUE1_.abort()
    return L3_7, L1_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L3_7, L4_8
end
function usbPort2PrintingGet()
  local L0_9, L1_10, L2_11
  L0_9, L1_10, L2_11 = _UPVALUE0_.isUsbPort2PrintingEnabled()
  if L0_9 ~= _UPVALUE1_.SUCCESS then
    return L0_9
  end
  return L0_9, L1_10, L2_11
end
function usbPort2PrintingSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = util
    L1_13 = L1_13.appendDebugOut
    L2_14 = "Detected Unauthorized access for page usbSharePorts"
    L1_13(L2_14)
    L1_13 = _UPVALUE0_
    L1_13 = L1_13.UNAUTHORIZED
    return L1_13
  end
  L1_13 = A0_12["usbSharePorts.cookie"]
  L2_14 = A0_12["usbSharePorts.PrintServer"]
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.NIL
  if L1_13 == L3_15 then
    L3_15 = util
    L3_15 = L3_15.appendDebugOut
    L4_16 = "Set : Invalid Cookie"
    L3_15(L4_16)
    L3_15 = _UPVALUE0_
    L3_15 = L3_15.BAD_PARAMETER
    return L3_15
  end
  L3_15 = _UPVALUE0_
  L3_15 = L3_15.NIL
  if L2_14 == L3_15 then
    L3_15 = util
    L3_15 = L3_15.appendDebugOut
    L4_16 = "GetNext : Invalid Cookie"
    L3_15(L4_16)
    L3_15 = _UPVALUE0_
    L3_15 = L3_15.BAD_PARAMETER
    return L3_15
  end
  L3_15, L4_16 = nil, nil
  _UPVALUE1_.start()
  if L2_14 == _UPVALUE2_ then
    L3_15, L4_16 = _UPVALUE3_.usbPort2PrintingEnable(L1_13)
  else
    L3_15, L4_16 = _UPVALUE3_.usbPort2PrintingDisable(L1_13)
  end
  if L3_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usbSharePorts" .. L3_15)
    _UPVALUE1_.abort()
    return L3_15, L1_13
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L3_15, L4_16
end
function usbPrintingSectionGet()
  local L0_17, L1_18, L2_19, L3_20
  L0_17, L1_18, L2_19, L3_20 = _UPVALUE0_.usbPrintingGet()
  if L0_17 ~= _UPVALUE1_.SUCCESS then
    return L0_17
  end
  return L0_17, L1_18, L2_19, L3_20
end
function usbPrintingSectionGetNext(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  L1_22 = A0_21["usbSharePorts.cookie"]
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NIL
  if L1_22 == L2_23 then
    L2_23 = util
    L2_23 = L2_23.appendDebugOut
    L3_24 = "GetNext : Invalid Cookie"
    L2_23(L3_24)
    L2_23 = _UPVALUE0_
    L2_23 = L2_23.BAD_PARAMETER
    return L2_23
  end
  L2_23, L3_24, L4_25, L5_26 = nil, nil, nil, nil
  L2_23, L3_24, L4_25, L5_26 = _UPVALUE1_.usbPrintingGetNext(L1_22)
  if L2_23 ~= _UPVALUE0_.SUCCESS then
    return L2_23
  end
  return L2_23, L3_24, L4_25, L5_26
end
function usbPrintingOnVlanSet(A0_27)
  local L1_28, L2_29, L3_30, L4_31
  L1_28 = ACCESS_LEVEL
  if L1_28 ~= 0 then
    L1_28 = util
    L1_28 = L1_28.appendDebugOut
    L2_29 = "Detected Unauthorized access for page usbSharePorts"
    L1_28(L2_29)
    L1_28 = _UPVALUE0_
    L1_28 = L1_28.UNAUTHORIZED
    return L1_28
  end
  L1_28 = A0_27["usbSharePorts.cookie"]
  L2_29 = A0_27["usbSharePorts.printerSharing"]
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NIL
  if L1_28 == L3_30 then
    L3_30 = util
    L3_30 = L3_30.appendDebugOut
    L4_31 = "Set : Invalid Cookie"
    L3_30(L4_31)
    L3_30 = _UPVALUE0_
    L3_30 = L3_30.BAD_PARAMETER
    return L3_30
  end
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NIL
  if L2_29 == L3_30 then
    L3_30 = util
    L3_30 = L3_30.appendDebugOut
    L4_31 = "GetNext : Invalid Cookie"
    L3_30(L4_31)
    L3_30 = _UPVALUE0_
    L3_30 = L3_30.BAD_PARAMETER
    return L3_30
  end
  L3_30, L4_31 = nil, nil
  _UPVALUE1_.start()
  if L2_29 == _UPVALUE2_ then
    L3_30, L4_31 = _UPVALUE3_.usbPrintingOnVlanEnable(L1_28)
  else
    L3_30, L4_31 = _UPVALUE3_.usbPrintingOnVlanDisable(L1_28)
  end
  if L3_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usbSharePorts" .. L3_30)
    _UPVALUE1_.abort()
    return L3_30, L1_28
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L3_30, L4_31
end
function usbSharePortSetupSectionGetAll()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37
  L0_32, L1_33, L2_34, L3_35, L4_36, L5_37 = _UPVALUE0_.usbSharePortSetupGetAll()
  if L0_32 ~= _UPVALUE1_.SUCCESS then
    return L0_32
  end
  return L0_32, L1_33, L2_34, L3_35, L4_36, L5_37
end
function usbSharePortSetupSectionSetAll(A0_38)
  local L1_39, L2_40, L3_41, L4_42, L5_43
  L1_39 = ACCESS_LEVEL
  if L1_39 ~= 0 then
    L1_39 = util
    L1_39 = L1_39.appendDebugOut
    L2_40 = "Detected Unauthorized access for page usbSharePorts"
    L1_39(L2_40)
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.UNAUTHORIZED
    return L1_39
  end
  L1_39 = A0_38["usbSharePorts.usb1"]
  L2_40 = A0_38["usbSharePorts.usb2"]
  L3_41 = A0_38["usbSharePorts.usb1Sharing"]
  L4_42 = A0_38["usbSharePorts.usb2Sharing"]
  L5_43 = "1"
  if L1_39 == _UPVALUE0_.NIL and _UPVALUE0_.NIL == L2_40 then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if L1_39 == _UPVALUE2_ then
    returnCode, cookie = _UPVALUE3_.usbPort1PrintingDisable(L5_43)
  elseif L1_39 == _UPVALUE4_ then
    returnCode, cookie = _UPVALUE3_.usbPort1PrintingEnable(L5_43)
  end
  if L2_40 == _UPVALUE2_ then
    returnCode, cookie = _UPVALUE3_.usbPort2PrintingDisable(L5_43)
  elseif L2_40 == _UPVALUE4_ then
    returnCode, cookie = _UPVALUE3_.usbPort2PrintingEnable(L5_43)
  end
  if L3_41 == _UPVALUE2_ then
    returnCode, cookie = _UPVALUE3_.usbPort1SharingDisable(L5_43)
  elseif L3_41 == _UPVALUE4_ then
    returnCode, cookie = _UPVALUE3_.usbPort1SharingEnable(L5_43)
  end
  if L4_42 == _UPVALUE2_ then
    returnCode, cookie = _UPVALUE3_.usbPort2SharingDisable(L5_43)
  elseif L4_42 == _UPVALUE4_ then
    returnCode, cookie = _UPVALUE3_.usbPort2SharingEnable(L5_43)
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usbSharePorts" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, cookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function usbSharedEnabledInterfacesSectionGetAll()
  local L0_44, L1_45, L2_46
  L2_46 = {}
  L0_44, L1_45, L2_46 = _UPVALUE0_.usbSharedEnabledInterfacesGetAll()
  if L0_44 ~= _UPVALUE1_.SUCCESS then
    return L0_44
  end
  return L0_44, L1_45, L2_46
end
function usbSharedEnabledInterfacesSectionSetAll(A0_47)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page usbSharePorts")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_47 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  returnCode, cookie = _UPVALUE2_.usbSharedEnabledInterfacesSetAll(A0_47)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page usbSharePorts" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode, cookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
function isPrinterDeviceConnected()
  local L0_48, L1_49, L2_50, L3_51, L4_52, L5_53, L6_54
  L0_48 = {L1_49, L2_50}
  for L4_52 = 1, 2 do
    L5_53 = io
    L5_53 = L5_53.open
    L6_54 = "/var/usb"
    L6_54 = L6_54 .. L4_52 .. "Info"
    L5_53 = L5_53(L6_54, "r")
    L6_54 = _UPVALUE0_
    L6_54 = L6_54.NIL
    if L5_53 == L6_54 then
      L0_48[L4_52] = false
    else
      L6_54 = L5_53.read
      L6_54 = L6_54(L5_53, "*line")
      fileContent = L6_54
      L6_54 = "Printer"
      if string.find(fileContent, L6_54) == nil then
        L0_48[L4_52] = false
      end
    end
  end
  if not L1_49 then
    if not L1_49 then
      return L1_49
    end
  else
    return L1_49, L2_50, L3_51
  end
end
function isUsbDeviceConnected()
  local L0_55, L1_56, L2_57, L3_58, L4_59, L5_60, L6_61
  L0_55 = {L1_56, L2_57}
  for L4_59 = 1, 2 do
    L5_60 = io
    L5_60 = L5_60.open
    L6_61 = "/var/usb"
    L6_61 = L6_61 .. L4_59 .. "Info"
    L5_60 = L5_60(L6_61, "r")
    L6_61 = _UPVALUE0_
    L6_61 = L6_61.NIL
    if L5_60 == L6_61 then
      L0_55[L4_59] = false
    else
      L6_61 = L5_60.read
      L6_61 = L6_61(L5_60, "*line")
      fileContent = L6_61
      L6_61 = "storage"
      if string.find(fileContent, L6_61) == nil then
        L0_55[L4_59] = false
      end
    end
  end
  if not L1_56 then
    if not L1_56 then
      return L1_56
    end
  else
    return L1_56, L2_57, L3_58
  end
end
