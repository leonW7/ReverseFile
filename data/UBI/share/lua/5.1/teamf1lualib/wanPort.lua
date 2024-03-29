require("portMgmtLuaLib")
wan = {}
function wan.config(A0_0, A1_1, A2_2)
  if db.typeAndRangeValidate(A0_0) then
    if A2_2 == "add" then
      return db.insert(DBTable, A0_0)
    elseif A2_2 == "edit" then
      return db.update(DBTable, A0_0, A1_1)
    elseif A2_2 == "delete" then
      return false
    end
  else
    return false
  end
end
function wan.portConfig(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14
  L1_4 = false
  L2_5 = nil
  L3_6 = PRODUCT_ID
  if L3_6 ~= "DSR-1000_Bx" then
    L3_6 = PRODUCT_ID
    if L3_6 ~= "DSR-500_Bx" then
      L3_6 = UNIT_NAME
      if L3_6 ~= "DSR-1000AC" then
        L3_6 = UNIT_NAME
      end
    end
  else
    if L3_6 == "DSR-500AC" then
      L3_6 = A0_3["Wan.LogicalIfName"]
      if L3_6 == "WAN1" then
        L3_6 = db
        L3_6 = L3_6.getRowWhere
        L4_7 = "portMgmt"
        L5_8 = "PortName= 'DedicatedWAN'"
        L3_6 = L3_6(L4_7, L5_8)
        L2_5 = L3_6
      else
        L3_6 = db
        L3_6 = L3_6.getRowWhere
        L4_7 = "portMgmt"
        L5_8 = "PortName= 'OptionalPort'"
        L3_6 = L3_6(L4_7, L5_8)
        L2_5 = L3_6
      end
  end
  else
    L3_6 = db
    L3_6 = L3_6.getRowWhere
    L4_7 = "portMgmt"
    L5_8 = "PortName= 'DedicatedWAN'"
    L3_6 = L3_6(L4_7, L5_8)
    L2_5 = L3_6
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 == "0" then
    L2_5["portMgmt.AutoNegEnable"] = "1"
  else
    L2_5["portMgmt.AutoNegEnable"] = "0"
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 ~= "1" then
    L3_6 = A0_3["Wan.portSpeed"]
    if L3_6 ~= "3" then
      L3_6 = A0_3["Wan.portSpeed"]
    end
  elseif L3_6 == "5" then
    L2_5["portMgmt.DuplexMode"] = "0"
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 ~= "2" then
    L3_6 = A0_3["Wan.portSpeed"]
    if L3_6 ~= "4" then
      L3_6 = A0_3["Wan.portSpeed"]
    end
  elseif L3_6 == "6" then
    L2_5["portMgmt.DuplexMode"] = "1"
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 ~= "1" then
    L3_6 = A0_3["Wan.portSpeed"]
  elseif L3_6 == "2" then
    L2_5["portMgmt.PortSpeed"] = "10"
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 ~= "3" then
    L3_6 = A0_3["Wan.portSpeed"]
  elseif L3_6 == "4" then
    L2_5["portMgmt.PortSpeed"] = "100"
  end
  L3_6 = A0_3["Wan.portSpeed"]
  if L3_6 ~= "5" then
    L3_6 = A0_3["Wan.portSpeed"]
  elseif L3_6 == "6" then
    L2_5["portMgmt.PortSpeed"] = "1000"
  end
  L3_6 = "portMgmt"
  DBTable = L3_6
  L3_6 = UNIT_NAME
  if L3_6 ~= "DSR-250N" then
    L3_6 = UNIT_NAME
    if L3_6 ~= "DSR-250" then
      L3_6 = UNIT_NAME
      if L3_6 ~= "DSR-150N" then
        L3_6 = UNIT_NAME
      end
    end
  else
    if L3_6 == "DSR-150" then
      L3_6 = A0_3["Wan.LogicalIfName"]
  end
  else
    if L3_6 == "WAN1" then
      L3_6 = wan
      L3_6 = L3_6.config
      L4_7 = L2_5
      L5_8 = L2_5["portMgmt._ROWID_"]
      L3_6 = L3_6(L4_7, L5_8, L6_9)
      L1_4 = L3_6
      if not L1_4 then
        L3_6 = "ERROR"
        L4_7 = "11797"
        return L3_6, L4_7
      end
  end
  else
    L1_4 = true
  end
  L3_6 = db
  L3_6 = L3_6.getRowsWhere
  L4_7 = "NimfConf"
  L5_8 = "LogicalIfName = '"
  L5_8 = L5_8 .. L6_9 .. L7_10
  L3_6 = L3_6(L4_7, L5_8)
  if L3_6 == nil then
    L4_7 = "ERROR"
    L5_8 = "10994"
    return L4_7, L5_8
  end
  L4_7 = 0
  L5_8 = 0
  for L9_12, L10_13 in L6_9(L7_10) do
    L4_7 = L4_7 + 1
    L11_14 = L3_6[L4_7]
    if L11_14["NimfConf.UseDefaultMtu"] ~= A0_3["Wan.DefMtu"] then
      L5_8 = 1
    elseif A0_3["Wan.MtuSize"] ~= nil and L11_14["NimfConf.MtuSize"] ~= A0_3["Wan.MtuSize"] then
      L5_8 = 1
    end
    L11_14["NimfConf.UseDefaultMtu"] = A0_3["Wan.DefMtu"]
    if A0_3["Wan.DefMtu"] == "0" then
      L11_14["NimfConf.MtuSize"] = A0_3["Wan.MtuSize"]
    elseif L11_14["NimfConf.RequireLogin"] == "0" then
      L11_14["NimfConf.MtuSize"] = "1500"
    else
      L11_14["NimfConf.MtuSize"] = "1492"
    end
    if L5_8 == 1 then
      DBTable = "NimfConf"
      L1_4 = wan.config(L11_14, L11_14["NimfConf._ROWID_"], "edit")
      L5_8 = 0
    end
    if not L1_4 then
      return "ERROR", "10994"
    end
  end
  return L6_9, L7_10
end
function wan.wanConfigSetWrap(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L3_18 = ACCESS_LEVEL
  if L3_18 ~= 0 then
    L3_18 = "ACCESS_DENIED"
    L4_19 = "10187"
    return L3_18, L4_19
  end
  L3_18 = db
  L3_18 = L3_18.beginTransaction
  L3_18()
  L3_18 = false
  L4_19 = db
  L4_19 = L4_19.getRow
  L5_20 = "AttackChecks"
  L6_21 = "_ROWID_"
  L7_22 = "1"
  L4_19 = L4_19(L5_20, L6_21, L7_22)
  if L4_19 ~= nil then
    L5_20 = A0_15["AttackChecks.ExternalPing"]
    L4_19["AttackChecks.ExternalPing"] = L5_20
    L5_20 = "AttackChecks"
    DBTable = L5_20
    L5_20 = wan
    L5_20 = L5_20.config
    L6_21 = L4_19
    L7_22 = "1"
    L8_23 = "edit"
    L5_20 = L5_20(L6_21, L7_22, L8_23)
    L3_18 = L5_20
  end
  L5_20 = db
  L5_20 = L5_20.getRow
  L6_21 = "AttackChecks6"
  L7_22 = "_ROWID_"
  L8_23 = "1"
  L5_20 = L5_20(L6_21, L7_22, L8_23)
  if L5_20 ~= nil then
    L6_21 = A0_15["AttackChecks.ExternalPing"]
    L5_20["AttackChecks6.ExternalPing"] = L6_21
    L6_21 = "AttackChecks6"
    DBTable = L6_21
    L6_21 = wan
    L6_21 = L6_21.config
    L7_22 = L5_20
    L8_23 = "1"
    L6_21 = L6_21(L7_22, L8_23, "edit")
    L3_18 = L6_21
  end
  if L3_18 then
    L6_21 = {}
    L6_21["Wan.LogicalIfName"] = "WAN1"
    L7_22 = A0_15["Wan.DefMtu"]
    L6_21["Wan.DefMtu"] = L7_22
    L7_22 = A0_15["Wan.DefMtu"]
    if L7_22 == "0" then
      L7_22 = A0_15["Wan.MtuSize"]
      L6_21["Wan.MtuSize"] = L7_22
    end
    L7_22 = A0_15["Wan.portSpeed"]
    L6_21["Wan.portSpeed"] = L7_22
    L7_22 = wan
    L7_22 = L7_22.portConfig
    L8_23 = L6_21
    L8_23 = L7_22(L8_23)
    if L7_22 ~= "OK" then
      db.rollback()
      return L7_22, L8_23
    else
      L3_18 = true
    end
  end
  if L3_18 then
    L6_21 = {}
    L6_21["Wan.LogicalIfName"] = "WAN2"
    L7_22 = A0_15["Wan.DefMtu2"]
    L6_21["Wan.DefMtu"] = L7_22
    L7_22 = A0_15["Wan.DefMtu2"]
    if L7_22 == "0" then
      L7_22 = A0_15["Wan.MtuSize2"]
      L6_21["Wan.MtuSize"] = L7_22
    end
    L7_22 = UNIT_NAME
    if L7_22 ~= "DSR-250N" then
      L7_22 = UNIT_NAME
      if L7_22 ~= "DSR-250" then
        L7_22 = UNIT_NAME
        if L7_22 ~= "DSR-150N" then
          L7_22 = UNIT_NAME
          if L7_22 ~= "DSR-150" then
            L7_22 = A0_15["Wan.portSpeed2"]
            L6_21["Wan.portSpeed"] = L7_22
          end
        end
      end
    end
    L7_22 = wan
    L7_22 = L7_22.portConfig
    L8_23 = L6_21
    L8_23 = L7_22(L8_23)
    stCode = L8_23
    errFg = L7_22
    L7_22 = errFg
    if L7_22 ~= "OK" then
      L7_22 = db
      L7_22 = L7_22.rollback
      L7_22()
      L7_22 = errFg
      L8_23 = stCode
      return L7_22, L8_23
    else
      L3_18 = true
    end
  end
  if L3_18 then
    L6_21 = UNIT_NAME
    if L6_21 ~= "DSR-500N" then
      L6_21 = UNIT_NAME
      if L6_21 ~= "DSR-500" then
        L6_21 = nil
        L7_22 = 0
        L8_23 = UNIT_NAME
        if L8_23 ~= "DSR-1000N" then
          L8_23 = UNIT_NAME
          if L8_23 ~= "DSR-1000" then
            L8_23 = UNIT_NAME
          end
        else
          if L8_23 == "DSR-1000AC" then
            L6_21 = "WAN3"
        end
        else
          L6_21 = "WAN2"
        end
        L8_23 = db
        L8_23 = L8_23.getRowWhere
        L8_23 = L8_23("NimfConf", "LogicalIfName = '" .. L6_21 .. "' and AddressFamily = 2")
        if L8_23 == nil then
          return "ERROR", "10994"
        end
        if L8_23["NimfConf.UseDefaultMtu"] ~= A0_15["Wan.DefMtu3"] then
          L7_22 = 1
        elseif A0_15["Wan.MtuSize3"] ~= nil and L8_23["NimfConf.MtuSize"] ~= A0_15["Wan.MtuSize"] then
          L7_22 = 1
        end
        L8_23["NimfConf.UseDefaultMtu"] = A0_15["Wan.DefMtu3"]
        if A0_15["Wan.DefMtu3"] == "0" then
          L8_23["NimfConf.MtuSize"] = A0_15["Wan.MtuSize3"]
        elseif A0_15["Wan.DefMtu3"] == "1" then
          L8_23["NimfConf.MtuSize"] = "1500"
        end
        if L7_22 == 1 then
          DBTable = "NimfConf"
          L3_18 = wan.config(L8_23, L8_23["NimfConf._ROWID_"], "edit")
          L7_22 = 0
        end
        if not L3_18 then
          return "ERROR", "10994"
        end
      end
    end
  end
  if L3_18 then
    L6_21 = db
    L6_21 = L6_21.commitTransaction
    L7_22 = true
    L6_21(L7_22)
    L6_21 = "OK"
    L7_22 = "12265"
    return L6_21, L7_22
  else
    L6_21 = db
    L6_21 = L6_21.rollback
    L6_21()
    L6_21 = "ERROR"
    L7_22 = "10992"
    return L6_21, L7_22
  end
end
function wan.wanConfigGetWrap(A0_24)
  local L1_25
  L1_25 = A0_24
  return (wan.wanAdvConfigGet(L1_25))
end
function wan.wanAdvConfigGet(A0_26)
  local L1_27, L2_28
  L1_27 = {}
  L2_28 = nil
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_26 .. "' and AddressFamily = 2") ~= nil then
    L1_27["Wan.DefMtu"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_26 .. "' and AddressFamily = 2")["NimfConf.UseDefaultMtu"] or ""
    L1_27["Wan.MtuSize"] = db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_26 .. "' and AddressFamily = 2")["NimfConf.MtuSize"] or ""
    if db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_26 .. "' and AddressFamily = 2")["NimfConf.RequireLogin"] == "0" then
      L1_27["Wan.MtuSizeMin"] = "68"
      L1_27["Wan.MtuSizeMax"] = "1500"
    else
      L1_27["Wan.MtuSizeMin"] = "128"
      L1_27["Wan.MtuSizeMax"] = "1492"
    end
  end
  if db.getAttribute("NimfConf", "LogicalIfName", A0_26, "ConnectionType") == "threeg" and UNIT_NAME ~= "DSR-500N" and UNIT_NAME ~= "DSR-500" then
    return L1_27
  end
  if PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    if A0_26 == "WAN1" then
      L2_28 = db.getRowWhere("portMgmt", "PortName= 'DedicatedWAN'")
    else
      L2_28 = db.getRowWhere("portMgmt", "PortName= 'OptionalPort'")
    end
  else
    L2_28 = db.getRowWhere("portMgmt", "PortName= 'DedicatedWAN'")
  end
  L1_27["Wan.AutoNegEnable"] = L2_28["portMgmt.AutoNegEnable"]
  if (PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC") and L2_28["portMgmt.PortSpeed"] == "1000" and L2_28["portMgmt.AutoNegEnable"] == "0" then
    L1_27["Wan.AutoNegEnable"] = "1"
  end
  if L2_28["portMgmt.AutoNegEnable"] == "0" and "1" == "0" then
    if L2_28["portMgmt.PortSpeed"] == "10" and L2_28["portMgmt.DuplexMode"] == "0" then
      L1_27["Wan.portSpeed"] = "1"
    end
    if L2_28["portMgmt.PortSpeed"] == "10" and L2_28["portMgmt.DuplexMode"] == "1" then
      L1_27["Wan.portSpeed"] = "2"
    end
    if L2_28["portMgmt.PortSpeed"] == "100" and L2_28["portMgmt.DuplexMode"] == "0" then
      L1_27["Wan.portSpeed"] = "3"
    end
    if L2_28["portMgmt.PortSpeed"] == "100" and L2_28["portMgmt.DuplexMode"] == "1" then
      L1_27["Wan.portSpeed"] = "4"
    end
    if L2_28["portMgmt.PortSpeed"] == "1000" and L2_28["portMgmt.DuplexMode"] == "0" then
      L1_27["Wan.portSpeed"] = "5"
    end
    if L2_28["portMgmt.PortSpeed"] == "1000" and L2_28["portMgmt.DuplexMode"] == "1" then
      L1_27["Wan.portSpeed"] = "6"
    end
  else
    L2_28["portMgmt.realLinkSpeed"] = tostring(portMgmtLuaLib.wanSpeedGet(A0_26))
    L2_28["portMgmt.realDuplexMode"] = tostring(portMgmtLuaLib.wanDuplexModeGet(A0_26))
    if "1" == "1" then
      L1_27["Wan.portSpeed"] = "6"
    else
      L1_27["Wan.portSpeed"] = "0"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "10" and L2_28["portMgmt.realDuplexMode"] == "0" then
      L1_27["Wan.linkSpeed"] = "1"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "10" and L2_28["portMgmt.realDuplexMode"] == "1" then
      L1_27["Wan.linkSpeed"] = "2"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "100" and L2_28["portMgmt.realDuplexMode"] == "0" then
      L1_27["Wan.linkSpeed"] = "3"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "100" and L2_28["portMgmt.realDuplexMode"] == "1" then
      L1_27["Wan.linkSpeed"] = "4"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "1000" and L2_28["portMgmt.realDuplexMode"] == "0" then
      L1_27["Wan.linkSpeed"] = "5"
    end
    if L2_28["portMgmt.realLinkSpeed"] == "1000" and L2_28["portMgmt.realDuplexMode"] == "1" then
      L1_27["Wan.linkSpeed"] = "6"
    end
  end
  return L1_27
end
