local L0_0
L0_0 = module
L0_0("com.teamf1.core.usb.printing", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/usb_cookie")
L0_0 = require
L0_0("teamf1lualib/usb_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
printingTable = "USB"
sharePortVlanTable = "SharePortVlan"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyvalue = "1"
attribute.keyvalue1 = "0"
attribute.usbPort1Printing = "PrintServer"
attribute.usbPort2Printing = "PrintServer"
attribute.usbPort1Sharing = "StorageServer"
attribute.usbPort2Sharing = "StorageServer"
attribute.vlanId = "vlanId"
attribute.usbPrintingOnVlan = "printerSharing"
function isUsbPort1PrintingEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(printingTable, attribute.key, attribute.keyvalue1, attribute.usbPort1Printing)
  if L0_1 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function isUsbPort1PrintingEnabledNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = rowId
  return L2_3, L3_4, usbPort1Printing
end
function usbPort1PrintingEnable(A0_5)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue1, attribute.usbPort1Printing, "1") == nil then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function usbPort1PrintingDisable(A0_6)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue1, attribute.usbPort1Printing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_6
  end
  return _UPVALUE1_.SUCCESS, A0_6
end
function usbPort1SharingEnable(A0_7)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue1, attribute.usbPort1Sharing, "1") == nil then
    return _UPVALUE0_.FAILURE, A0_7
  end
  return _UPVALUE0_.SUCCESS, A0_7
end
function usbPort1SharingDisable(A0_8)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue1, attribute.usbPort1Sharing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_8
  end
  return _UPVALUE1_.SUCCESS, A0_8
end
function isUsbPort2PrintingEnabled()
  local L0_9
  L0_9 = db
  L0_9 = L0_9.getAttribute
  L0_9 = L0_9(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Printing)
  if L0_9 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_9
end
function isUsbPort2PrintingEnabledNext(A0_10)
  local L2_11, L3_12
  L2_11 = _UPVALUE0_
  L2_11 = L2_11.NOT_SUPPORTED
  L3_12 = rowId
  return L2_11, L3_12, usbPort2Printing
end
function usbPort2SharingEnable(A0_13)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Sharing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_13
  end
  return _UPVALUE1_.SUCCESS, A0_13
end
function usbPort2SharingDisable(A0_14)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Sharing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_14
  end
  return _UPVALUE1_.SUCCESS, A0_14
end
function usbPort2PrintingEnable(A0_15)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Printing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_15
  end
  return _UPVALUE1_.SUCCESS, A0_15
end
function usbPort2PrintingDisable(A0_16)
  if db.setAttribute(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Printing, _UPVALUE0_) == nil then
    return _UPVALUE1_.FAILURE, A0_16
  end
  return _UPVALUE1_.SUCCESS, A0_16
end
function vlanIdGet()
  local L0_17, L1_18, L2_19
  L0_17 = cookieGet
  L1_18 = sharePortVlanTable
  L2_19 = attribute
  L2_19 = L2_19.key
  L1_18 = L0_17(L1_18, L2_19)
  if L1_18 == nil then
    L2_19 = _UPVALUE0_
    L2_19 = L2_19.FAILURE
    return L2_19
  end
  L2_19 = db
  L2_19 = L2_19.getAttribute
  L2_19 = L2_19(sharePortVlanTable, attribute.key, L1_18, attribute.vlanId)
  if L2_19 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_18, L2_19
end
function vlanIdGetNext(A0_20)
  local L1_21, L2_22, L3_23
  if A0_20 == nil then
    L1_21 = _UPVALUE0_
    L1_21 = L1_21.INVALID_ARGUMENT
    return L1_21
  end
  L1_21 = cookieGetNext
  L2_22 = sharePortVlanTable
  L3_23 = attribute
  L3_23 = L3_23.key
  L2_22 = L1_21(L2_22, L3_23, A0_20)
  if L2_22 == nil then
    L3_23 = _UPVALUE0_
    L3_23 = L3_23.TABLE_IS_FULL
    return L3_23
  end
  L3_23 = db
  L3_23 = L3_23.getAttribute
  L3_23 = L3_23(sharePortVlanTable, attribute.key, L2_22, attribute.vlanId)
  if L3_23 == nil then
    return _UPVALUE0_.FAILURE, L2_22
  end
  return _UPVALUE0_.SUCCESS, L2_22, L3_23
end
function vlanIdSet(A0_24, A1_25)
  local L3_26
  L3_26 = _UPVALUE0_
  L3_26 = L3_26.NOT_SUPPORTED
  return L3_26, A0_24
end
function vlanIdDelete(A0_27, A1_28)
  local L3_29
  L3_29 = _UPVALUE0_
  L3_29 = L3_29.NOT_SUPPORTED
  return L3_29, A0_27
end
function isUsbPrintingOnVlanEnabled()
  local L0_30, L1_31, L2_32
  L0_30 = cookieGet
  L1_31 = sharePortVlanTable
  L2_32 = attribute
  L2_32 = L2_32.key
  L1_31 = L0_30(L1_31, L2_32)
  if L1_31 == nil then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.FAILURE
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(sharePortVlanTable, attribute.key, L1_31, attribute.usbPrintingOnVlan)
  if L2_32 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function isUsbPrintingOnVlanEnabledNext(A0_33)
  local L1_34, L2_35, L3_36
  if A0_33 == nil then
    L1_34 = _UPVALUE0_
    L1_34 = L1_34.INVALID_ARGUMENT
    return L1_34
  end
  L1_34 = cookieGetNext
  L2_35 = sharePortVlanTable
  L3_36 = attribute
  L3_36 = L3_36.key
  L2_35 = L1_34(L2_35, L3_36, A0_33)
  L3_36 = rowId
  if L3_36 == nil then
    L3_36 = _UPVALUE0_
    L3_36 = L3_36.TABLE_IS_FULL
    return L3_36
  end
  L3_36 = db
  L3_36 = L3_36.getAttribute
  L3_36 = L3_36(sharePortVlanTable, attribute.key, L2_35, attribute.usbPrintingOnVlan)
  if L3_36 == nil then
    return _UPVALUE0_.FAILURE, L2_35
  end
  return _UPVALUE0_.SUCCESS, L2_35, L3_36
end
function usbPrintingOnVlanEnable(A0_37)
  if A0_37 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(sharePortVlanTable, attribute.key, A0_37) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(sharePortVlanTable, attribute.key, A0_37, attribute.usbPrintingOnVlan, _UPVALUE1_) == nil then
    return _UPVALUE0_.FAILURE, A0_37
  end
  return _UPVALUE0_.SUCCESS, A0_37
end
function usbPrintingOnVlanDisable(A0_38)
  if A0_38 == nil or tonumber(A0_38) == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(sharePortVlanTable, attribute.key, A0_38) == false then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(sharePortVlanTable, attribute.key, A0_38, attribute.usbPrintingOnVlan, _UPVALUE1_) == nil then
    return _UPVALUE0_.FAILURE, A0_38
  end
  return _UPVALUE0_.SUCCESS, A0_38
end
function usbPrintingGet()
  local L0_39, L1_40, L2_41
  L0_39 = {}
  L1_40 = db
  L1_40 = L1_40.getRow
  L2_41 = sharePortVlanTable
  L1_40 = L1_40(L2_41, attribute.key, attribute.keyvalue)
  L0_39 = L1_40
  L1_40, L2_41 = nil, nil
  L1_40 = L0_39[sharePortVlanTable .. "." .. attribute.vlanId]
  L2_41 = L0_39[sharePortVlanTable .. "." .. attribute.usbPrintingOnVlan]
  if L1_40 == nil or L2_41 == nil then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_40, L2_41
end
function usbPrintingGetNext(A0_42)
  local L1_43, L2_44, L3_45, L4_46, L5_47
  if A0_42 == nil then
    L1_43 = _UPVALUE0_
    L1_43 = L1_43.INVALID_ARGUMENT
    return L1_43
  end
  L1_43 = cookieGetNext
  L2_44 = sharePortVlanTable
  L3_45 = attribute
  L3_45 = L3_45.key
  L4_46 = A0_42
  L2_44 = L1_43(L2_44, L3_45, L4_46)
  if L2_44 == nil then
    L3_45 = _UPVALUE0_
    L3_45 = L3_45.TABLE_IS_FULL
    return L3_45
  end
  L3_45 = db
  L3_45 = L3_45.getRow
  L4_46 = sharePortVlanTable
  L5_47 = attribute
  L5_47 = L5_47.key
  L3_45 = L3_45(L4_46, L5_47, L2_44)
  if L3_45 == nil then
    L4_46 = _UPVALUE0_
    L4_46 = L4_46.FAILURE
    return L4_46
  end
  L4_46, L5_47 = nil, nil
  L4_46 = L3_45[sharePortVlanTable .. "." .. attribute.vlanId]
  L5_47 = L3_45[sharePortVlanTable .. "." .. attribute.usbPrintingOnVlan]
  return _UPVALUE0_.SUCCESS, rowId, L4_46, L5_47
end
function usbPrintingSet(A0_48, A1_49, A2_50)
  local L4_51
  L4_51 = _UPVALUE0_
  L4_51 = L4_51.NOT_SUPPORTED
  return L4_51, A0_48
end
function usbPrintingCreate(A0_52, A1_53)
  local L3_54
  L3_54 = _UPVALUE0_
  L3_54 = L3_54.NOT_SUPPORTED
  return L3_54, rowid
end
function usbPrintingDelete(A0_55)
  local L2_56
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NOT_SUPPORTED
  return L2_56, A0_55
end
function usbSharePortSetupGetAll()
  local L0_57, L1_58, L2_59, L3_60
  L0_57 = db
  L0_57 = L0_57.getAttribute
  L1_58 = printingTable
  L2_59 = attribute
  L2_59 = L2_59.key
  L3_60 = attribute
  L3_60 = L3_60.keyvalue1
  L0_57 = L0_57(L1_58, L2_59, L3_60, attribute.usbPort1Printing)
  if L0_57 == nil then
    L1_58 = _UPVALUE0_
    L1_58 = L1_58.FAILURE
    return L1_58
  end
  L1_58 = db
  L1_58 = L1_58.getAttribute
  L2_59 = printingTable
  L3_60 = attribute
  L3_60 = L3_60.key
  L1_58 = L1_58(L2_59, L3_60, attribute.keyvalue, attribute.usbPort2Printing)
  if L1_58 == nil then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.FAILURE
    return L2_59
  end
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.NIL
  if L0_57 ~= L2_59 then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.NIL
  elseif L1_58 == L2_59 then
    L2_59 = _UPVALUE0_
    L2_59 = L2_59.FAILURE
    return L2_59
  end
  L2_59 = db
  L2_59 = L2_59.getAttribute
  L3_60 = printingTable
  L2_59 = L2_59(L3_60, attribute.key, attribute.keyvalue1, attribute.usbPort1Sharing)
  if L2_59 == nil then
    L3_60 = _UPVALUE0_
    L3_60 = L3_60.FAILURE
    return L3_60
  end
  L3_60 = db
  L3_60 = L3_60.getAttribute
  L3_60 = L3_60(printingTable, attribute.key, attribute.keyvalue, attribute.usbPort2Sharing)
  if L3_60 == nil then
    return _UPVALUE0_.FAILURE
  end
  if L2_59 == _UPVALUE0_.NIL or L3_60 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_57, L1_58, L2_59, L3_60
end
function usbSharedEnabledInterfacesGetAll()
  local L0_61, L1_62
  L0_61 = {}
  L1_62 = db
  L1_62 = L1_62.getTable
  L1_62 = L1_62(sharePortVlanTable)
  if L1_62 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_62
end
function usbSharedEnabledInterfacesSetAll(A0_63)
  local L1_64, L2_65, L3_66, L4_67, L5_68, L6_69, L7_70, L8_71, L9_72, L10_73, L11_74, L12_75, L13_76
  L1_64 = db
  L1_64 = L1_64.getTable
  L1_64 = L1_64(L2_65)
  statusMsg = L3_66
  valid = L2_65
  if not L2_65 then
    if L2_65 == 1 then
      return L2_65
    elseif L2_65 == 2 then
      return L2_65
    end
  end
  usbValid = L2_65
  usbValidtwo = L2_65
  for L5_68, L6_69 in L2_65(L3_66) do
    L7_70 = L6_69["SharePortVlan.vlanId"]
    if L8_71 == "1" then
      for L11_74 = 1, 2 do
        L12_75 = io
        L12_75 = L12_75.open
        L13_76 = "/var/usb"
        L13_76 = L13_76 .. L11_74 .. "Info"
        L12_75 = L12_75(L13_76, "r")
        L13_76 = _UPVALUE1_
        L13_76 = L13_76.NIL
        if L12_75 == L13_76 then
          L13_76 = usbValid
          L13_76[L11_74] = false
        else
          L13_76 = L12_75.read
          L13_76 = L13_76(L12_75, "*line")
          fileContent = L13_76
          L13_76 = "storage"
          if string.find(fileContent, L13_76) == nil then
            usbValid[L11_74] = false
          end
        end
      end
    end
    if not L8_71 then
      if not L8_71 then
        valid = L8_71
      end
    else
      valid = L8_71
    end
    if L8_71 then
      L6_69["SharePortVlan.storageSharing"] = L8_71
    end
    usbValid = L8_71
    if L8_71 == "1" then
      for L11_74 = 1, 2 do
        L12_75 = io
        L12_75 = L12_75.open
        L13_76 = "/var/usb"
        L13_76 = L13_76 .. L11_74 .. "Info"
        L12_75 = L12_75(L13_76, "r")
        L13_76 = _UPVALUE1_
        L13_76 = L13_76.NIL
        if L12_75 == L13_76 then
          L13_76 = usbValidtwo
          L13_76[L11_74] = false
        else
          L13_76 = L12_75.read
          L13_76 = L13_76(L12_75, "*line")
          fileContent = L13_76
          L13_76 = "Printer"
          if string.find(fileContent, L13_76) == nil then
            usbValidtwo[L11_74] = false
          end
        end
      end
    end
    if not L8_71 then
      if not L8_71 then
        valid = L8_71
      end
    else
      valid = L8_71
    end
    if L8_71 then
      L6_69["SharePortVlan.printerSharing"] = L8_71
    end
    L11_74 = L6_69["SharePortVlan._ROWID_"]
    status = L8_71
  end
  if L2_65 == L3_66 then
    return L2_65, L3_66
  end
  return L2_65, L3_66
end
function sharePortCheck(A0_77, A1_78)
  local L2_79, L3_80, L4_81, L5_82, L6_83, L7_84, L8_85, L9_86
  L2_79 = 0
  L3_80 = 0
  for L7_84, L8_85 in L4_81(L5_82) do
    L9_86 = L8_85["SharePortVlan.vlanId"]
    if A0_77["SharePortVlan.sharing_" .. L9_86] == "1" then
      L3_80 = L3_80 + 1
    end
  end
  if L3_80 > 0 then
    if L4_81 == "0" then
      if L4_81 == "0" then
        return L4_81, L5_82
      end
    end
  elseif L3_80 == 0 then
    if L4_81 ~= "1" then
    elseif L4_81 == "1" then
      return L4_81, L5_82
    end
  end
  return L4_81, L5_82
end
