local L0_0, L1_1
L0_0 = {}
portMgmt = L0_0
L0_0 = portMgmt
function L1_1(A0_2, A1_3, A2_4)
  if db.typeAndRangeValidate(A0_2) then
    if A2_4 == "add" then
      return db.insert(DBTable, A0_2)
    elseif A2_4 == "edit" then
      return db.update(DBTable, A0_2, A1_3)
    elseif A2_4 == "delete" then
      return false
    end
  end
end
L0_0.config = L1_1
L0_0 = portMgmt
function L1_1(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    L4_9 = "10187"
    return L3_8, L4_9
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  L4_9 = db
  L4_9 = L4_9.getTable
  L5_10 = "PortMgmt"
  L4_9 = L4_9(L5_10)
  L5_10 = 0
  L6_11 = true
  for L10_15, L11_16 in L7_12(L8_13) do
    L5_10 = L5_10 + 1
    L12_17 = L4_9[L5_10]
    L12_17["PortMgmt.PortStatus"] = A0_5["PortMgmt.PortStatus_" .. L12_17["PortMgmt._ROWID_"]]
    if L12_17["PortMgmt.PortStatus"] == "1" then
      L6_11 = false
      L12_17["PortMgmt.AutoNegEnable"] = A0_5["PortMgmt.AutoNegEnable_" .. L12_17["PortMgmt._ROWID_"]]
      if L12_17["PortMgmt.AutoNegEnable"] == "0" then
        L12_17["PortMgmt.DuplexMode"] = A0_5["PortMgmt.DuplexMode_" .. L12_17["PortMgmt._ROWID_"]]
        L12_17["PortMgmt.PortSpeed"] = A0_5["PortMgmt.PortSpeed_" .. L12_17["PortMgmt._ROWID_"]]
      end
    end
    L3_8 = portMgmt.config(L12_17, L12_17["PortMgmt._ROWID_"], A2_7)
    if not L3_8 then
      break
    end
  end
  if L6_11 then
    L7_12()
    return L7_12, L8_13
  end
  if L3_8 then
    L7_12(L8_13)
    return L7_12, L8_13
  else
    L7_12()
    return L7_12, L8_13
  end
end
L0_0.portMgmtConfig = L1_1
L0_0 = portMgmt
function L1_1(A0_18, A1_19, A2_20)
  local L3_21
  L3_21 = ACCESS_LEVEL
  if L3_21 ~= 0 then
    L3_21 = "ACCESS_DENIED"
    return L3_21, "10187"
  end
  L3_21 = db
  L3_21 = L3_21.beginTransaction
  L3_21()
  L3_21 = false
  L3_21 = portMgmt.config(A0_18, A1_19, A2_20)
  if L3_21 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "12747"
  end
end
L0_0.portMirroringConfig = L1_1
L0_0 = portMgmt
function L1_1(A0_22, A1_23, A2_24)
  local L3_25, L4_26, L5_27
  L3_25 = ACCESS_LEVEL
  if L3_25 ~= 0 then
    L3_25 = "ACCESS_DENIED"
    L4_26 = "10187"
    return L3_25, L4_26
  end
  L3_25 = db
  L3_25 = L3_25.beginTransaction
  L3_25()
  L3_25 = false
  L4_26 = db
  L4_26 = L4_26.getRow
  L5_27 = "PortMgmt"
  L4_26 = L4_26(L5_27, "_ROWID_", A1_23)
  if L4_26 ~= nil then
    L4_26["PortMgmt.AutoNegEnable"] = "0"
    L5_27 = A0_22["PortMgmt.LinkSpeed"]
    if L5_27 == "2" then
      L4_26["PortMgmt.DuplexMode"] = "0"
      L4_26["PortMgmt.PortSpeed"] = "10"
    else
      L5_27 = A0_22["PortMgmt.LinkSpeed"]
      if L5_27 == "3" then
        L4_26["PortMgmt.DuplexMode"] = "1"
        L4_26["PortMgmt.PortSpeed"] = "10"
      else
        L5_27 = A0_22["PortMgmt.LinkSpeed"]
        if L5_27 == "4" then
          L4_26["PortMgmt.DuplexMode"] = "0"
          L4_26["PortMgmt.PortSpeed"] = "100"
        else
          L5_27 = A0_22["PortMgmt.LinkSpeed"]
          if L5_27 == "5" then
            L4_26["PortMgmt.DuplexMode"] = "1"
            L4_26["PortMgmt.PortSpeed"] = "100"
          else
            L5_27 = A0_22["PortMgmt.LinkSpeed"]
            if L5_27 == "6" then
              L4_26["PortMgmt.DuplexMode"] = "1"
              L4_26["PortMgmt.PortSpeed"] = "1000"
            else
              L4_26["PortMgmt.AutoNegEnable"] = "1"
            end
          end
        end
      end
    end
    L5_27 = L4_26["PortMgmt.PortPhyID"]
    if L5_27 ~= "1" then
      L5_27 = L4_26["PortMgmt.PortPhyID"]
      if L5_27 ~= "2" then
        L5_27 = L4_26["PortMgmt.PortPhyID"]
        if L5_27 ~= "3" then
          L5_27 = L4_26["PortMgmt.PortPhyID"]
        end
      end
    elseif L5_27 == "4" then
      L5_27 = A0_22["PortMgmt.Mtu"]
      L4_26["PortMgmt.Mtu"] = L5_27
      L5_27 = A0_22["PortMgmt.SetMacAddress"]
      L4_26["PortMgmt.SetMacAddress"] = L5_27
      L5_27 = A0_22["PortMgmt.SetMacAddress"]
      if L5_27 == "0" then
        L5_27 = L4_26["PortMgmt.DefaultMacAddress"]
        L4_26["PortMgmt.MacAddress"] = L5_27
      else
        L5_27 = A0_22["PortMgmt.MacAddress"]
        L4_26["PortMgmt.MacAddress"] = L5_27
      end
    end
    L5_27 = portMgmt
    L5_27 = L5_27.config
    L5_27 = L5_27(L4_26, A1_23, A2_24)
    L3_25 = L5_27
    if L3_25 then
      L5_27 = L4_26["PortMgmt.PortPhyID"]
      if L5_27 ~= "1" then
        L5_27 = L4_26["PortMgmt.PortPhyID"]
        if L5_27 ~= "2" then
          L5_27 = L4_26["PortMgmt.PortPhyID"]
          if L5_27 ~= "3" then
            L5_27 = L4_26["PortMgmt.PortPhyID"]
          end
        end
      elseif L5_27 == "4" then
        L5_27 = db
        L5_27 = L5_27.getRow
        L5_27 = L5_27("vlan", "portName", L4_26["PortMgmt.PortName"])
        if L5_27 ~= nil then
          L3_25 = db.setAttribute("vlan", "portName", L4_26["PortMgmt.PortName"], "portName", L4_26["PortMgmt.PortName"])
        end
      end
    end
    if L3_25 then
      L5_27 = L4_26["PortMgmt.PortPhyID"]
      if L5_27 == "6" then
        L5_27 = db
        L5_27 = L5_27.getRow
        L5_27 = L5_27("NimfConf", "LogicalIfName", "WAN1")
        if L5_27 ~= nil then
          L5_27["NimfConf.UseDefaultMtu"] = "0"
          L5_27["NimfConf.MtuSize"] = A0_22["PortMgmt.Mtu"]
          L5_27["NimfConf.SetMacAddress"] = A0_22["PortMgmt.SetMacAddress"]
          L5_27["NimfConf.MacAddress"] = A0_22["PortMgmt.MacAddress"]
          DBTable = "NimfConf"
          L3_25 = portMgmt.config(L5_27, L5_27["NimfConf._ROWID_"], A2_24)
        else
          L3_25 = false
        end
      end
    end
  end
  if L3_25 then
    L5_27 = db
    L5_27 = L5_27.commitTransaction
    L5_27(true)
    L5_27 = "OK"
    return L5_27, "12265"
  else
    L5_27 = db
    L5_27 = L5_27.rollback
    L5_27()
    L5_27 = "ERROR"
    return L5_27, "12748"
  end
end
L0_0.portMgmtConfigWrap = L1_1
L0_0 = portMgmt
function L1_1(A0_28)
  local L1_29, L2_30
  L1_29 = db
  L1_29 = L1_29.getRow
  L2_30 = "PortMgmt"
  L1_29 = L1_29(L2_30, "PortPhyID", A0_28)
  if L1_29 ~= nil then
    L2_30 = L1_29["PortMgmt.PortPhyID"]
    if L2_30 == "1" then
      L1_29["PortMgmt.interfaceName"] = "LAN1"
    else
      L2_30 = L1_29["PortMgmt.PortPhyID"]
      if L2_30 == "2" then
        L1_29["PortMgmt.interfaceName"] = "LAN2"
      else
        L2_30 = L1_29["PortMgmt.PortPhyID"]
        if L2_30 == "3" then
          L1_29["PortMgmt.interfaceName"] = "LAN3"
        else
          L2_30 = L1_29["PortMgmt.PortPhyID"]
          if L2_30 == "4" then
            L1_29["PortMgmt.interfaceName"] = "LAN4"
          else
            L2_30 = L1_29["PortMgmt.PortPhyID"]
            if L2_30 == "6" then
              L1_29["PortMgmt.interfaceName"] = "WAN"
            end
          end
        end
      end
    end
    L2_30 = L1_29["PortMgmt.AutoNegEnable"]
    if L2_30 == "1" then
      L1_29["PortMgmt.LinkSpeed"] = "1"
    else
      L2_30 = L1_29["PortMgmt.PortSpeed"]
      if L2_30 == "10" then
        L2_30 = L1_29["PortMgmt.DuplexMode"]
        if L2_30 == "0" then
          L1_29["PortMgmt.LinkSpeed"] = "2"
        else
          L1_29["PortMgmt.LinkSpeed"] = "3"
        end
      else
        L2_30 = L1_29["PortMgmt.PortSpeed"]
        if L2_30 == "100" then
          L2_30 = L1_29["PortMgmt.DuplexMode"]
          if L2_30 == "0" then
            L1_29["PortMgmt.LinkSpeed"] = "4"
          else
            L1_29["PortMgmt.LinkSpeed"] = "5"
          end
        else
          L2_30 = L1_29["PortMgmt.PortSpeed"]
          if L2_30 == "1000" then
            L2_30 = L1_29["PortMgmt.DuplexMode"]
            if L2_30 == "1" then
              L1_29["PortMgmt.LinkSpeed"] = "6"
            end
          end
        end
      end
    end
    L2_30 = L1_29["PortMgmt.PortPhyID"]
    if L2_30 == "6" then
      L2_30 = db
      L2_30 = L2_30.getAttribute
      L2_30 = L2_30("networkInterface", "LogicalIfName", "WAN1", "interfaceName")
      L2_30 = L2_30 or ""
      if L2_30 ~= nil then
        L1_29["PortMgmt.DefaultMacAddress"] = db.getAttribute("ethernet", "interfaceName", L2_30, "macAddress") or ""
      end
      if db.getRow("NimfConf", "LogicalIfName", "WAN1") ~= nil then
        L1_29["PortMgmt.Mtu"] = db.getRow("NimfConf", "LogicalIfName", "WAN1")["NimfConf.MtuSize"] or ""
        L1_29["PortMgmt.SetMacAddress"] = db.getRow("NimfConf", "LogicalIfName", "WAN1")["NimfConf.SetMacAddress"] or ""
        L1_29["PortMgmt.MacAddress"] = db.getRow("NimfConf", "LogicalIfName", "WAN1")["NimfConf.MacAddress"] or ""
      end
    end
  end
  return L1_29
end
L0_0.portMgmtConfigGetWrap = L1_1
