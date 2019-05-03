local L0_0, L1_1
L0_0 = {}
sharePort = L0_0
L0_0 = sharePort
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return db.delete(DBTable, A0_2)
    end
  end
end
L0_0.config = L1_1
L0_0 = sharePort
function L1_1(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11, L7_12
  L2_7 = ACCESS_LEVEL
  if L2_7 ~= 0 then
    L2_7 = "ACCESS_DENIED"
    return L2_7, L3_8
  end
  L2_7 = false
  usbTable = L3_8
  for L6_11, L7_12 in L3_8(L4_9) do
    if A0_5["USB.StorageServer" .. L7_12["USB.usbNum"]] ~= nil then
      L7_12["USB.StorageServer"] = A0_5["USB.StorageServer" .. L7_12["USB.usbNum"]]
    end
    if A0_5["USB.PrintServer" .. L7_12["USB.usbNum"]] ~= nil then
      L7_12["USB.PrintServer"] = A0_5["USB.PrintServer" .. L7_12["USB.usbNum"]]
    end
    L2_7 = sharePort.config(L7_12, L7_12["USB._ROWID_"], A1_6)
    if not L2_7 then
      return "ERROR", "12423"
    end
  end
  if L2_7 then
    return L3_8, L4_9
  end
end
L0_0.usbConfig = L1_1
L0_0 = sharePort
function L1_1(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18
  L1_14 = {L2_15, L3_16}
  for L5_18 = 1, 2 do
    if io.open("/var/usb" .. L5_18 .. "Info", "r") == nil then
      L1_14[L5_18] = false
    else
      fileContent = io.open("/var/usb" .. L5_18 .. "Info", "r"):read("*line")
      if string.find(fileContent, A0_13) == nil then
        L1_14[L5_18] = false
      end
    end
  end
  if not L2_15 then
    if not L2_15 then
      return L2_15
    end
  end
  return L2_15
end
L0_0.usbCheck = L1_1
function L0_0(A0_19, A1_20)
  local L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28
  L2_21 = 0
  L3_22 = 0
  for L7_26, L8_27 in L4_23(L5_24) do
    L9_28 = L8_27["SharePortVlan.vlanId"]
    if A0_19["SharePortVlan.storageSharing_" .. L9_28] == "1" then
      L2_21 = L2_21 + 1
    end
    if A0_19["SharePortVlan.printerSharing_" .. L9_28] == "1" then
      L3_22 = L3_22 + 1
    end
  end
  if L2_21 > 0 then
    if L4_23 == "0" then
      if L4_23 == "0" then
        return L4_23, L5_24
      end
    end
  elseif L2_21 == 0 then
    if L4_23 ~= "1" then
    elseif L4_23 == "1" then
      return L4_23, L5_24
    end
  end
  if L3_22 > 0 then
    if L4_23 == "0" then
      if L4_23 == "0" then
        return L4_23, L5_24
      end
    end
  elseif L3_22 == 0 then
    if L4_23 ~= "1" then
    elseif L4_23 == "1" then
      return L4_23, L5_24
    end
  end
  return L4_23, L5_24
end
sharePortCheck = L0_0
L0_0 = sharePort
function L1_1(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37
  L2_31 = ACCESS_LEVEL
  if L2_31 ~= 0 then
    L2_31 = "ACCESS_DENIED"
    return L2_31, L3_32
  end
  L2_31 = true
  if A1_30 == "add" then
    tableName = L3_32
    A0_29["SharePortVlan.interfaceName"] = L4_33
    A0_29["SharePortVlan.storageSharing"] = "0"
    A0_29["SharePortVlan.printerSharing"] = "0"
    L6_35 = A0_29
    L2_31 = L4_33
  elseif A1_30 == "edit" then
    sharePortVlanTable = L3_32
    statusMsg = L4_33
    L2_31 = L3_32
    if not L2_31 then
      return L3_32, L4_33
    end
    for L6_35, L7_36 in L3_32(L4_33) do
      L8_37 = L7_36["SharePortVlan.vlanId"]
      if A0_29["SharePortVlan.storageSharing_" .. L8_37] == "1" then
        L2_31 = sharePort.usbCheck("storage")
      end
      if L2_31 then
        L7_36["SharePortVlan.storageSharing"] = A0_29["SharePortVlan.storageSharing_" .. L8_37]
      end
      if L2_31 then
        if A0_29["SharePortVlan.printerSharing_" .. L8_37] == "1" then
          L2_31 = sharePort.usbCheck("Printer")
        end
        if L2_31 then
          L7_36["SharePortVlan.printerSharing"] = A0_29["SharePortVlan.printerSharing_" .. L8_37]
        end
      end
      if L2_31 then
        L2_31 = db.update("SharePortVlan", L7_36, L7_36["SharePortVlan._ROWID_"])
      else
        return "ERROR", "12770"
      end
    end
  end
  if L2_31 then
    return L3_32, L4_33
  end
end
L0_0.vlanConfig = L1_1
