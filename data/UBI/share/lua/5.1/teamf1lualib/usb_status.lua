local L0_0
L0_0 = module
L0_0("com.teamf1.core.usb.status", package.seeall)
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
;({}).name = "name"
;({}).value = "value"
;({}).usb1Status = "USB_STATUS_FILE1"
;({}).usb2Status = "USB_STATUS_FILE2"
USB1_INFO = "/var/usb1Info"
USB2_INFO = "/var/usb2Info"
USB1_FILELIST = "USB_FILE_LIST1"
USB2_FILELIST = "USB_FILE_LIST2"
DEFINED_0 = "0"
DEFINED_1 = "1"
DEFINED_2 = "2"
USB_MOUNTED = "USB mounted"
USB_UNMOUNTED = "USB unmounted"
UNABLE_MOUNT_USB = "Unable to mount, USB size is greater than 2TB"
CONNECTED = "connected"
DISCONNECTED = "disconnected"
function usbPortGet()
  local L1_1
  L1_1 = _UPVALUE0_
  L1_1 = L1_1.NOT_SUPPORTED
  return L1_1
end
function usbPortGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function usbPortSet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function usbPortDelete(A0_7, A1_8)
  return _UPVALUE0_.NOT_SUPPORTED
end
function connectionStatusGet()
  local L0_9, L1_10, L2_11
  L0_9 = DISCONNECTED
  L1_10 = 0
  L2_11 = db
  L2_11 = L2_11.getAttribute
  L2_11 = L2_11(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L2_11 ~= nil and util.fileExists(L2_11) then
    usbStatus1 = util.fileToString(L2_11)
    usbStatus1 = string.gsub(usbStatus1, "\n", "")
    L1_10 = 1
  end
  if L1_10 == 1 and usbStatus1 == DEFINED_1 then
    L0_9 = CONNECTED
  end
  if L0_9 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_9
end
function connectionStatusGetNext(A0_12)
  local L1_13, L2_14, L3_15
  L1_13 = DISCONNECTED
  L2_14 = 0
  L3_15 = db
  L3_15 = L3_15.getAttribute
  L3_15 = L3_15(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb2Status, _UPVALUE1_.value)
  if L3_15 ~= nil and util.fileExists(L3_15) then
    usbStatus2 = util.fileToString(L3_15)
    usbStatus2 = string.gsub(usbStatus2, "\n", "")
    L2_14 = 1
  end
  if L2_14 == 1 and usbStatus2 == DEFINED_1 then
    L1_13 = CONNECTED
  end
  if L1_13 == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L1_13
end
function connectionStatusSet(A0_16, A1_17)
  local L3_18
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NOT_SUPPORTED
  return L3_18, A0_16
end
function vendorGet()
  local L0_19, L1_20, L2_21, L3_22
  L0_19 = 0
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L2_21 = _UPVALUE0_
  L3_22 = _UPVALUE1_
  L3_22 = L3_22.name
  L1_20 = L1_20(L2_21, L3_22, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L1_20 ~= nil then
    L2_21 = util
    L2_21 = L2_21.fileExists
    L3_22 = L1_20
    L2_21 = L2_21(L3_22)
    if L2_21 then
      L2_21 = util
      L2_21 = L2_21.fileToString
      L3_22 = L1_20
      L2_21 = L2_21(L3_22)
      usbStatus1 = L2_21
      L2_21 = string
      L2_21 = L2_21.gsub
      L3_22 = usbStatus1
      L2_21 = L2_21(L3_22, "\n", "")
      usbStatus1 = L2_21
      L0_19 = 1
    end
  end
  L2_21 = io
  L2_21 = L2_21.open
  L3_22 = USB1_INFO
  L2_21 = L2_21(L3_22, "r")
  if L0_19 == 1 then
    L3_22 = usbStatus
    if L3_22 == DEFINED_0 then
      L3_22 = DEFINED_0
      mountStatus = L3_22
    else
      L3_22 = usbStatus
      if L3_22 == DEFINED_1 then
        L3_22 = DEFINED_1
        mountStatus = L3_22
        if L2_21 then
          L3_22 = L2_21.read
          L3_22 = L3_22(L2_21, "*all")
          L3_22 = L3_22 or ""
          if util.split(L3_22, ":") ~= nil and #util.split(L3_22, ":") > 4 then
            vendor = util.split(L3_22, ":")[1]
          end
          L2_21:close()
        end
      end
    end
  end
  L3_22 = vendor
  if L3_22 == nil then
    L3_22 = _UPVALUE2_
    L3_22 = L3_22.FAILURE
    return L3_22
  end
  L3_22 = _UPVALUE2_
  L3_22 = L3_22.SUCCESS
  return L3_22, 1, vendor
end
function vendorGetNext(A0_23)
  local L1_24, L2_25, L3_26, L4_27
  L1_24 = 0
  L2_25 = db
  L2_25 = L2_25.getAttribute
  L3_26 = _UPVALUE0_
  L4_27 = _UPVALUE1_
  L4_27 = L4_27.name
  L2_25 = L2_25(L3_26, L4_27, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L2_25 ~= nil then
    L3_26 = util
    L3_26 = L3_26.fileExists
    L4_27 = L2_25
    L3_26 = L3_26(L4_27)
    if L3_26 then
      L3_26 = util
      L3_26 = L3_26.fileToString
      L4_27 = L2_25
      L3_26 = L3_26(L4_27)
      usbStatus2 = L3_26
      L3_26 = string
      L3_26 = L3_26.gsub
      L4_27 = usbStatus2
      L3_26 = L3_26(L4_27, "\n", "")
      usbStatus2 = L3_26
      L1_24 = 1
    end
  end
  L3_26 = io
  L3_26 = L3_26.open
  L4_27 = USB2_INFO
  L3_26 = L3_26(L4_27, "r")
  if L1_24 == 1 then
    L4_27 = usbStatus
    if L4_27 == DEFINED_0 then
      L4_27 = DEFINED_0
      mountStatus = L4_27
    else
      L4_27 = usbStatus
      if L4_27 == DEFINED_1 then
        L4_27 = DEFINED_1
        mountStatus = L4_27
        if L3_26 then
          L4_27 = fUsb1
          L4_27 = L4_27.read
          L4_27 = L4_27(L4_27, "*all")
          L4_27 = L4_27 or ""
          if util.split(L4_27, ":") ~= nil and #util.split(L4_27, ":") > 4 then
            vendor = util.split(L4_27, ":")[1]
          end
          L3_26:close()
        end
      end
    end
  end
  L4_27 = vendor
  if L4_27 == nil then
    L4_27 = _UPVALUE2_
    L4_27 = L4_27.FAILURE
    return L4_27
  end
  L4_27 = _UPVALUE2_
  L4_27 = L4_27.SUCCESS
  return L4_27, 1, vendor
end
function vendorSet(A0_28, A1_29)
  local L3_30
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NOT_SUPPORTED
  return L3_30, A0_28
end
function modelGet()
  local L0_31, L1_32, L2_33, L3_34
  L0_31 = 0
  L1_32 = db
  L1_32 = L1_32.getAttribute
  L2_33 = _UPVALUE0_
  L3_34 = _UPVALUE1_
  L3_34 = L3_34.name
  L1_32 = L1_32(L2_33, L3_34, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L1_32 ~= nil then
    L2_33 = util
    L2_33 = L2_33.fileExists
    L3_34 = L1_32
    L2_33 = L2_33(L3_34)
    if L2_33 then
      L2_33 = util
      L2_33 = L2_33.fileToString
      L3_34 = L1_32
      L2_33 = L2_33(L3_34)
      usbStatus1 = L2_33
      L2_33 = string
      L2_33 = L2_33.gsub
      L3_34 = usbStatus1
      L2_33 = L2_33(L3_34, "\n", "")
      usbStatus1 = L2_33
      L0_31 = 1
    end
  end
  L2_33 = io
  L2_33 = L2_33.open
  L3_34 = USB1_INFO
  L2_33 = L2_33(L3_34, "r")
  if L0_31 == 1 then
    L3_34 = usbStatus
    if L3_34 == DEFINED_0 then
      L3_34 = DEFINED_0
      mountStatus = L3_34
    else
      L3_34 = usbStatus
      if L3_34 == DEFINED_1 then
        L3_34 = DEFINED_1
        mountStatus = L3_34
        if L2_33 then
          L3_34 = L2_33.read
          L3_34 = L3_34(L2_33, "*all")
          L3_34 = L3_34 or ""
          if util.split(L3_34, ":") ~= nil and #util.split(L3_34, ":") > 4 then
            model = util.split(L3_34, ":")[2]
          end
          L2_33:close()
        end
      end
    end
  end
  L3_34 = model
  if L3_34 == nil then
    L3_34 = _UPVALUE2_
    L3_34 = L3_34.FAILURE
    return L3_34
  end
  L3_34 = _UPVALUE2_
  L3_34 = L3_34.SUCCESS
  return L3_34, 1, model
end
function modelGetNext(A0_35)
  local L1_36, L2_37, L3_38, L4_39
  L1_36 = 0
  L2_37 = db
  L2_37 = L2_37.getAttribute
  L3_38 = _UPVALUE0_
  L4_39 = _UPVALUE1_
  L4_39 = L4_39.name
  L2_37 = L2_37(L3_38, L4_39, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L2_37 ~= nil then
    L3_38 = util
    L3_38 = L3_38.fileExists
    L4_39 = L2_37
    L3_38 = L3_38(L4_39)
    if L3_38 then
      L3_38 = util
      L3_38 = L3_38.fileToString
      L4_39 = L2_37
      L3_38 = L3_38(L4_39)
      usbStatus2 = L3_38
      L3_38 = string
      L3_38 = L3_38.gsub
      L4_39 = usbStatus2
      L3_38 = L3_38(L4_39, "\n", "")
      usbStatus2 = L3_38
      L1_36 = 1
    end
  end
  L3_38 = io
  L3_38 = L3_38.open
  L4_39 = USB2_INFO
  L3_38 = L3_38(L4_39, "r")
  if L1_36 == 1 then
    L4_39 = usbStatus
    if L4_39 == DEFINED_0 then
      L4_39 = DEFINED_0
      mountStatus = L4_39
    else
      L4_39 = usbStatus
      if L4_39 == DEFINED_1 then
        L4_39 = DEFINED_1
        mountStatus = L4_39
        if L3_38 then
          L4_39 = fUsb1
          L4_39 = L4_39.read
          L4_39 = L4_39(L4_39, "*all")
          L4_39 = L4_39 or ""
          if util.split(L4_39, ":") ~= nil and #util.split(L4_39, ":") > 4 then
            model = util.split(L4_39, ":")[2]
          end
          L3_38:close()
        end
      end
    end
  end
  L4_39 = model
  if L4_39 == nil then
    L4_39 = _UPVALUE2_
    L4_39 = L4_39.FAILURE
    return L4_39
  end
  L4_39 = _UPVALUE2_
  L4_39 = L4_39.SUCCESS
  return L4_39, 1, model
end
function modelSet(A0_40, A1_41)
  local L3_42
  L3_42 = _UPVALUE0_
  L3_42 = L3_42.NOT_SUPPORTED
  return L3_42, A0_40
end
function typeGet(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  L1_44 = 0
  L2_45 = db
  L2_45 = L2_45.getAttribute
  L3_46 = _UPVALUE0_
  L4_47 = _UPVALUE1_
  L4_47 = L4_47.name
  L2_45 = L2_45(L3_46, L4_47, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L2_45 ~= nil then
    L3_46 = util
    L3_46 = L3_46.fileExists
    L4_47 = L2_45
    L3_46 = L3_46(L4_47)
    if L3_46 then
      L3_46 = util
      L3_46 = L3_46.fileToString
      L4_47 = L2_45
      L3_46 = L3_46(L4_47)
      usbStatus1 = L3_46
      L3_46 = string
      L3_46 = L3_46.gsub
      L4_47 = usbStatus1
      L3_46 = L3_46(L4_47, "\n", "")
      usbStatus1 = L3_46
      L1_44 = 1
    end
  end
  L3_46 = io
  L3_46 = L3_46.open
  L4_47 = USB1_INFO
  L3_46 = L3_46(L4_47, "r")
  if L1_44 == 1 then
    L4_47 = usbStatus
    if L4_47 == DEFINED_0 then
      L4_47 = DEFINED_0
      mountStatus = L4_47
    else
      L4_47 = usbStatus
      if L4_47 == DEFINED_1 then
        L4_47 = DEFINED_1
        mountStatus = L4_47
        if L3_46 then
          L4_47 = L3_46.read
          L4_47 = L4_47(L3_46, "*all")
          L4_47 = L4_47 or ""
          if util.split(L4_47, ":") ~= nil and #util.split(L4_47, ":") > 4 then
            typeUsb = util.split(L4_47, ":")[3]
          end
          L3_46:close()
        end
      end
    end
  end
  L4_47 = typeUsb
  if L4_47 == nil then
    L4_47 = _UPVALUE2_
    L4_47 = L4_47.FAILURE
    return L4_47
  end
  L4_47 = _UPVALUE2_
  L4_47 = L4_47.SUCCESS
  return L4_47, 1, typeUsb
end
function typeGetNext(A0_48)
  local L1_49, L2_50, L3_51, L4_52
  L1_49 = 0
  L2_50 = db
  L2_50 = L2_50.getAttribute
  L3_51 = _UPVALUE0_
  L4_52 = _UPVALUE1_
  L4_52 = L4_52.name
  L2_50 = L2_50(L3_51, L4_52, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L2_50 ~= nil then
    L3_51 = util
    L3_51 = L3_51.fileExists
    L4_52 = L2_50
    L3_51 = L3_51(L4_52)
    if L3_51 then
      L3_51 = util
      L3_51 = L3_51.fileToString
      L4_52 = L2_50
      L3_51 = L3_51(L4_52)
      usbStatus2 = L3_51
      L3_51 = string
      L3_51 = L3_51.gsub
      L4_52 = usbStatus2
      L3_51 = L3_51(L4_52, "\n", "")
      usbStatus2 = L3_51
      L1_49 = 1
    end
  end
  L3_51 = io
  L3_51 = L3_51.open
  L4_52 = USB2_INFO
  L3_51 = L3_51(L4_52, "r")
  if L1_49 == 1 then
    L4_52 = usbStatus
    if L4_52 == DEFINED_0 then
      L4_52 = DEFINED_0
      mountStatus = L4_52
    else
      L4_52 = usbStatus
      if L4_52 == DEFINED_1 then
        L4_52 = DEFINED_1
        mountStatus = L4_52
        if L3_51 then
          L4_52 = fUsb1
          L4_52 = L4_52.read
          L4_52 = L4_52(L4_52, "*all")
          L4_52 = L4_52 or ""
          if util.split(L4_52, ":") ~= nil and #util.split(L4_52, ":") > 4 then
            typeUsb = util.split(L4_52, ":")[3]
          end
          L3_51:close()
        end
      end
    end
  end
  L4_52 = typeUsb
  if L4_52 == nil then
    L4_52 = _UPVALUE2_
    L4_52 = L4_52.FAILURE
    return L4_52
  end
  L4_52 = _UPVALUE2_
  L4_52 = L4_52.SUCCESS
  return L4_52, 1, typeUsb
end
function typeSet(A0_53, A1_54)
  local L3_55
  L3_55 = _UPVALUE0_
  L3_55 = L3_55.NOT_SUPPORTED
  return L3_55, A0_53
end
function mountStatusGet()
  local L0_56, L1_57
  L0_56 = 0
  L1_57 = db
  L1_57 = L1_57.getAttribute
  L1_57 = L1_57(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L1_57 ~= nil and util.fileExists(L1_57) then
    usbStatus1 = util.fileToString(L1_57)
    usbStatus1 = string.gsub(usbStatus1, "\n", "")
    L0_56 = 1
  end
  if L0_56 == 1 then
    if usbStatus == DEFINED_0 then
      mountStatus = DEFINED_0
    elseif usbStatus == DEFINED_1 then
      mountStatus = DEFINED_1
    end
  end
  if mountStatus == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, mountStatus
end
function mountStatusGetNext(A0_58)
  local L1_59, L2_60
  L1_59 = 0
  L2_60 = db
  L2_60 = L2_60.getAttribute
  L2_60 = L2_60(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb2Status, _UPVALUE1_.vlaue)
  if L2_60 ~= nil and util.fileExists(L2_60) then
    usbStatus2 = util.fileToString(L2_60)
    usbStatus2 = string.gsub(usbStatus2, "\n", "")
    L1_59 = 1
  end
  if L1_59 == 1 then
    if usbStatus == DEFINED_0 then
      mountStatus = DEFINED_0
    elseif usbStatus == DEFINED_1 then
      mountStatus = DEFINED_1
    end
  end
  if mountStatus == nil then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, mountStatus
end
function mountStatusSet(A0_61, A1_62)
  local L3_63
  L3_63 = _UPVALUE0_
  L3_63 = L3_63.NOT_SUPPORTED
  return L3_63, A0_61
end
function usbPortStatusGet(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
  L1_65 = DISCONNECTED
  L2_66 = "NA"
  L3_67 = "NA"
  L4_68 = "NA"
  L5_69 = 0
  L6_70 = db
  L6_70 = L6_70.getAttribute
  L7_71 = _UPVALUE0_
  L8_72 = _UPVALUE1_
  L8_72 = L8_72.name
  L6_70 = L6_70(L7_71, L8_72, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
  if L6_70 ~= nil then
    L7_71 = util
    L7_71 = L7_71.fileExists
    L8_72 = L6_70
    L7_71 = L7_71(L8_72)
    if L7_71 then
      L7_71 = util
      L7_71 = L7_71.fileToString
      L8_72 = L6_70
      L7_71 = L7_71(L8_72)
      usbStatus1 = L7_71
      L7_71 = string
      L7_71 = L7_71.gsub
      L8_72 = usbStatus1
      L7_71 = L7_71(L8_72, "\n", "")
      usbStatus1 = L7_71
      L5_69 = 1
    end
  end
  if L5_69 == 1 then
    L7_71 = io
    L7_71 = L7_71.open
    L8_72 = "/var/usb1Info"
    L7_71 = L7_71(L8_72, "r")
    L8_72 = usbStatus1
    if L8_72 == DEFINED_0 then
      L8_72 = USB_UNMOUNTED
      mountStatus = L8_72
      L1_65 = CONNECTED
    else
      L8_72 = usbStatus1
      if L8_72 == DEFINED_2 then
        L8_72 = UNABLE_MOUNT_USB
        mountStatus = L8_72
        L1_65 = CONNECTED
      else
        L8_72 = usbStatus1
        if L8_72 ~= DEFINED_0 then
          L8_72 = usbStatus1
          if L8_72 ~= DEFINED_2 then
            L8_72 = USB_MOUNTED
            mountStatus = L8_72
            if L7_71 then
              L8_72 = L7_71.read
              L8_72 = L8_72(L7_71, "*all")
              L8_72 = L8_72 or ""
              if util.split(L8_72, ":") ~= nil and #util.split(L8_72, ":") > 4 then
                L2_66 = util.split(L8_72, ":")[1]
                L3_67 = util.split(L8_72, ":")[2]
                L4_68 = util.split(L8_72, ":")[3]
                L1_65 = CONNECTED
              end
              L7_71:close()
            end
          end
        end
      end
    end
    if L2_66 ~= nil and L3_67 ~= nil and L4_68 ~= nil then
      L8_72 = mountStatus
    elseif L8_72 == nil or L1_65 == nil then
      L8_72 = _UPVALUE2_
      L8_72 = L8_72.FAILURE
      return L8_72
    end
  end
  L7_71 = _UPVALUE2_
  L7_71 = L7_71.SUCCESS
  L8_72 = 1
  return L7_71, L8_72, A0_64, L1_65, L2_66, L3_67, L4_68, mountStatus
end
function usbPortStatusGetNext(A0_73)
  local L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82
  L1_74 = DISCONNECTED
  L2_75 = "NA"
  L3_76 = "NA"
  L4_77 = "NA"
  L5_78 = "NA"
  L6_79 = 0
  L7_80 = db
  L7_80 = L7_80.getAttribute
  L8_81 = _UPVALUE0_
  L9_82 = _UPVALUE1_
  L9_82 = L9_82.name
  L7_80 = L7_80(L8_81, L9_82, _UPVALUE1_.usb2Status, _UPVALUE1_.value)
  if L7_80 ~= nil then
    L8_81 = util
    L8_81 = L8_81.fileExists
    L9_82 = L7_80
    L8_81 = L8_81(L9_82)
    if L8_81 then
      L8_81 = util
      L8_81 = L8_81.fileToString
      L9_82 = L7_80
      L8_81 = L8_81(L9_82)
      usbStatus2 = L8_81
      L8_81 = string
      L8_81 = L8_81.gsub
      L9_82 = usbStatus2
      L8_81 = L8_81(L9_82, "\n", "")
      usbStatus2 = L8_81
      L6_79 = 1
    end
  end
  if L6_79 == 1 then
    L8_81 = io
    L8_81 = L8_81.open
    L9_82 = USB2_INFO
    L8_81 = L8_81(L9_82, "r")
    L9_82 = usbStatus2
    if L9_82 == DEFINED_0 then
      L5_78 = USB_UNMOUNTED
      L1_74 = CONNECTED
    else
      L9_82 = usbStatus2
      if L9_82 == DEFINED_2 then
        L5_78 = UNABLE_MOUNT_USB
        L1_74 = CONNECTED
      else
        L9_82 = usbStatus2
        if L9_82 ~= DEFINED_0 then
          L9_82 = usbStatus2
          if L9_82 ~= DEFINED_2 then
            L5_78 = USB_MOUNTED
            if L8_81 then
              L9_82 = L8_81.read
              L9_82 = L9_82(L8_81, "*all")
              L9_82 = L9_82 or ""
              if util.split(L9_82, ":") ~= nil and #util.split(L9_82, ":") > 4 then
                L2_75 = util.split(L9_82, ":")[1]
                L3_76 = util.split(L9_82, ":")[2]
                L4_77 = util.split(L9_82, ":")[3]
                L1_74 = CONNECTED
              end
              L8_81:close()
            end
          end
        end
      end
    end
    if L2_75 == nil or L3_76 == nil or L4_77 == nil or L5_78 == nil or L1_74 == nil then
      L9_82 = _UPVALUE2_
      L9_82 = L9_82.FAILURE
      return L9_82
    end
  end
  L8_81 = _UPVALUE2_
  L8_81 = L8_81.SUCCESS
  L9_82 = 1
  return L8_81, L9_82, usbPort, L1_74, L2_75, L3_76, L4_77, L5_78
end
function usbPortStatusSet(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88, A6_89)
  return _UPVALUE0_.NOT_SUPPORTED
end
function usbPortStatusCreate(A0_90, A1_91, A2_92, A3_93, A4_94, A5_95)
  return _UPVALUE0_.NOT_SUPPORTED
end
function usbPortStatusDelete(A0_96)
  return _UPVALUE0_.NOT_SUPPORTED
end
function usb1FileListGet()
  local L0_97, L1_98
  L1_98 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, USB1_FILELIST, _UPVALUE1_.value)
  if L1_98 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_98
end
function usb2FileListGet()
  local L0_99, L1_100
  L1_100 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, USB2_FILELIST, _UPVALUE1_.value)
  if L1_100 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_100
end
function usbUnmount(A0_101)
  local L1_102, L2_103, L3_104, L4_105, L5_106, L6_107, L7_108
  L1_102 = ""
  L2_103 = ""
  L3_104 = ""
  L4_105 = ""
  L5_106 = ""
  L6_107 = ""
  L7_108 = UNMOUNT_SUCCESSFUL
  if A0_101 == "usb1" then
    fUsb = io.open(USB1_INFO, "r")
  elseif A0_101 == "usb2" then
    fUsb = io.open(USB2_INFO, "r")
  end
  if fUsb then
    L1_102 = fUsb:read("*all") or ""
    fUsb:close()
  end
  if L1_102 ~= "" then
    L3_104 = util.split(L1_102, ":")
    if #L3_104 >= 4 then
      L4_105 = os.execute("/bin/umount -rl " .. L3_104[4] .. " 2>>/dev/null")
      L4_105 = os.execute("/bin/rm -rf " .. L3_104[4])
      if A0_101 == "usb1" then
        L4_105 = os.execute("/bin/rm -f " .. USB1_INFO)
      elseif A0_101 == "usb2" then
        L4_105 = os.execute("/bin/rm -f " .. USB2_INFO)
      end
      L4_105 = os.execute("/pfrm2.0/bin/usbTblUpdate /tmp/system.db StorageServer 0")
      if A0_101 == "usb1" then
        L5_106 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb1Status, _UPVALUE1_.value)
        L6_107 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, USB1_FILELIST, _UPVALUE1_.value)
      elseif A0_101 == "usb2" then
        L5_106 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, _UPVALUE1_.usb2Status, _UPVALUE1_.value)
        L6_107 = db.getAttribute(_UPVALUE0_, _UPVALUE1_.name, USB2_FILELIST, _UPVALUE1_.value)
      end
      if L5_106 ~= _UPVALUE2_.NIL then
        L4_105 = os.execute("echo 0 > " .. L5_106)
        L4_105 = os.execute("/bin/rm -f " .. L6_107)
      end
    else
      L7_108 = UNMOUNT_FAILED
      return _UPVALUE2_.FAILURE, L7_108
    end
  else
    L7_108 = UNMOUNT_FAILED
    return _UPVALUE2_.FAILURE, L7_108
  end
  return _UPVALUE2_.SUCCESS, L7_108
end
