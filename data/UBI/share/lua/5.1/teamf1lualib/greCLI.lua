local L0_0
L0_0 = require
L0_0("teamf1lualib/gre")
L0_0 = require
L0_0("iprouteLuaLib")
L0_0 = nil
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
  L0_0 = 25
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
  L0_0 = 15
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
  L0_0 = 10
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
  L0_0 = 5
end
function getGreTunnels()
  local L0_1, L1_2
  L0_1 = {}
  L1_2 = db
  L1_2 = L1_2.getTable
  L1_2 = L1_2("GRE")
  printLabel("-------------------Configured GRE Tunnels------------------------")
  for _FORV_5_, _FORV_6_ in pairs(L1_2) do
    resTab.insertField(L0_1, "ROWID", _FORV_6_["GRE._ROWID_"] or "")
    resTab.insertField(L0_1, "Tunnel Name", _FORV_6_["GRE.TunnelName"] or "")
    resTab.insertField(L0_1, "IP Address", _FORV_6_["GRE.IpAddress"] or "")
    resTab.insertField(L0_1, "Subnet Mask", _FORV_6_["GRE.SubnetMask"] or "")
    if (UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N") and _FORV_6_["GRE.InterfaceName"] == "WAN2" then
      resTab.insertField(L0_1, "Interface", "ROLLOVER_WAN")
    else
      resTab.insertField(L0_1, "Interface", _FORV_6_["GRE.InterfaceName"] or "")
    end
    resTab.insertField(L0_1, "Remote IP", _FORV_6_["GRE.RemoteIp"] or "")
    resTab.insertField(L0_1, "DDP Enable", _FORV_6_["GRE.DdpBrd"] or "")
    resTab.insertField(L0_1, "Destination IP", _FORV_6_["GRE.DstIpAddr"] or "")
    resTab.insertField(L0_1, "Route Subnet Mask", _FORV_6_["GRE.RouteNetMask"] or "")
    resTab.insertField(L0_1, "Gatway IP", _FORV_6_["GRE.GwIpAddr"] or "")
  end
  resTab.print(L0_1, 0)
end
function greCfgInit(A0_3)
  if A0_3[1] == nil then
    configRow = {}
    configRow["GRE._ROWID_"] = "-1"
  else
    configRow = db.getRow("GRE", "_ROWID_", A0_3[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["GRE._ROWID_"], configRow
end
function greCfgSave(A0_4)
  local L1_5
  L1_5 = ""
  errorFlag = L1_5
  L1_5 = ""
  statusCode = L1_5
  L1_5 = ""
  statusMessage = L1_5
  L1_5 = "GRE"
  DBTable = L1_5
  L1_5 = MODEL_ID
  UNIT_NAME = L1_5
  L1_5 = A0_4["GRE._ROWID_"]
  if db.getTable(DBTable) ~= nil and #db.getTable(DBTable) >= _UPVALUE0_ then
    statusMessage = "Maximum limit for GRE tunnels is reached."
    return "ERROR", statusMessage
  end
  if L1_5 == "-1" then
    errorFlag, statusCode = gre.greConfig(A0_4, L1_5, "add")
  else
    errorFlag, statusCode = gre.greConfig(A0_4, L1_5, "edit")
  end
  if errorFlag == "OK" then
    db.save()
  end
  print(statusCode)
  return errorFlag, statusCode
end
function greCfgDel(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11, L6_12
  L1_7 = {}
  L2_8 = {}
  L3_9 = ""
  L4_10 = ""
  L5_11 = false
  L6_12 = {}
  L6_12 = db.getRow("GRE", "_ROWID_", A0_6[1])
  if L6_12 == nil then
    print("Entered rowid does not exist\n")
    return
  end
  db.beginTransaction()
  L5_11 = db.delete("GRE", L6_12)
  if L5_11 then
    db.commitTransaction(true)
    errorFlag = "OK"
    L4_10 = "Operation Succeeded"
  else
    db.rollback()
    errorFlag = "ERROR"
    L4_10 = "Operation Failed"
  end
  if errorFlag == "OK" then
    db.save()
  end
  print(L4_10)
end
function greCfgInputVal(A0_13)
  local L1_14, L2_15
  L1_14 = A0_13["GRE.TunnelName"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.TunnelName"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.IpAddress"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.IpAddress"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.SubnetMask"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.SubnetMask"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.InterfaceName"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.InterfaceName"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.RemoteIp"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.RemoteIp"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.DdpBrd"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.DdpBrd"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.DstIpAddr"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.DstIpAddr"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.RouteNetMask"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.RouteNetMask"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = A0_13["GRE.GwIpAddr"]
  if L1_14 ~= nil then
    L1_14 = A0_13["GRE.GwIpAddr"]
  elseif L1_14 == "" then
    L1_14 = printCLIError
    L1_14(L2_15)
    L1_14 = false
    return L1_14
  end
  L1_14 = db
  L1_14 = L1_14.getTable
  L1_14 = L1_14(L2_15)
  for _FORV_5_, _FORV_6_ in L2_15(L1_14) do
    if iprouteLuaLib.ipSubnetCheck(A0_13["GRE.DstIpAddr"], _FORV_6_["GRE.DstIpAddr"], _FORV_6_["GRE.RouteNetMask"]) and (A0_13["GRE._ROWID_"] ~= _FORV_6_["GRE._ROWID_"] or A0_13["GRE._ROWID_"] == "-1") then
      printCLIError("Static route for this subnet is already configured")
      return false
    end
  end
  for _FORV_5_, _FORV_6_ in L2_15(L1_14) do
    if iprouteLuaLib.ipSubnetCheck(A0_13["GRE.IpAddress"], _FORV_6_["GRE.IpAddress"], _FORV_6_["GRE.SubnetMask"]) and (A0_13["GRE._ROWID_"] ~= _FORV_6_["GRE._ROWID_"] or A0_13["GRE._ROWID_"] == "-1") then
      printCLIError("Tunnel in this subnet is already configured")
      return false
    end
  end
  where = L2_15
  if L2_15 ~= nil then
    if A0_13["GRE._ROWID_"] == "-1" then
      if #L2_15 > 0 then
        printCLIError("GRE Tunnel with configured Remote IP and Interface already exists")
        return false
      end
    elseif A0_13["GRE._ROWID_"] > "0" then
      for _FORV_6_, _FORV_7_ in pairs(L2_15) do
        if A0_13["GRE._ROWID_"] ~= _FORV_7_["GRE._ROWID_"] then
          printCLIError("GRE Tunnel with configured Remote IP and Interface already exists")
          return false
        end
      end
    end
  end
  if iprouteLuaLib.ipSubnetCheck(A0_13["GRE.GwIpAddr"], A0_13["GRE.IpAddress"], A0_13["GRE.SubnetMask"]) then
    return true
  else
    printCLIError("Gateway should be in the same network of the tunnel")
    return false
  end
  return 0
end
