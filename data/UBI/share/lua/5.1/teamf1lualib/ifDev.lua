require("ifDevLib")
ifDev = {}
networkInterface = {}
function networkInterface.config(A0_0, A1_1, A2_2)
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  if networkInterface.inputvalidate(A0_0, A2_2) then
    if A2_2 == "add" then
      return nil
    elseif A2_2 == "edit" then
      return db.update("networkInterface", A0_0, A1_1)
    elseif A2_2 == "delete" then
      return nil
    end
  end
  return false
end
function networkInterface.inputvalidate(A0_3, A1_4)
  do return db.typeAndRangeValidate(A0_3) end
  return false
end
function networkInterface.autoRefreshSet(A0_5, A1_6, A2_7)
  local L3_8
  L3_8 = ACCESS_LEVEL
  if L3_8 ~= 0 then
    L3_8 = "ACCESS_DENIED"
    return L3_8, "10187"
  end
  L3_8 = db
  L3_8 = L3_8.beginTransaction
  L3_8()
  L3_8 = false
  if networkInterface.inputvalidate(A0_5, A2_7) then
    if A2_7 == "add" then
      L3_8 = db.insert("interfaceStatsParams", A0_5, A1_6)
    elseif A2_7 == "edit" then
      L3_8 = db.update("interfaceStatsParams", A0_5, A1_6)
    elseif A2_7 == "delete" then
      L3_8 = false
    end
  end
  if L3_8 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "10287"
  end
end
function networkInterface.configUsageSnaps(A0_9, A1_10)
  if networkInterface.inputvalidate(A0_9, A1_10) then
    if A1_10 == "delete" then
      valid = db.execute("DELETE FROM ifUsageReportConfig")
    elseif A1_10 == "add" then
      valid = db.execute("INSERT INTO ifUsageReportConfig VALUES (" .. A0_9["ifUsageReportConfig.maxSnaps"] .. ", 0)")
    else
      valid = db.execute("UPDATE ifUsageReportConfig SET maxSnaps=" .. A0_9["ifUsageReportConfig.maxSnaps"])
    end
    if valid then
      return "OK", "12265"
    end
  end
  return "ERROR", "12421"
end
function networkInterface.ifaceUsageReport(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  L1_12 = assert
  L2_13 = io
  L2_13 = L2_13.open
  L3_14 = A0_11
  L4_15 = "w"
  L6_17 = L2_13(L3_14, L4_15)
  L1_12 = L1_12(L2_13, L3_14, L4_15, L5_16, L6_17, L2_13(L3_14, L4_15))
  L2_13 = db
  L2_13 = L2_13.getTable
  L3_14 = "interfaceUsage"
  L4_15 = nil
  L5_16 = "SELECT * FROM interfaceUsage ORDER BY entryNum"
  L2_13 = L2_13(L3_14, L4_15, L5_16)
  L3_14 = db
  L3_14 = L3_14.getTable
  L4_15 = "interfaceUsage"
  L5_16 = nil
  L6_17 = "SELECT count(*)/max(entryNum) as numRecsPerGroup FROM interfaceUsage"
  L3_14 = L3_14(L4_15, L5_16, L6_17)
  L4_15 = 0
  L5_16 = L3_14[1]
  L5_16 = L5_16["interfaceUsage.numRecsPerGroup"]
  L6_17 = ""
  util.appendDebugOut("------------------- CSV BUFFER -------------------------<br>")
  for _FORV_10_, _FORV_11_ in pairs(L2_13) do
    L4_15 = L4_15 + 1
    L6_17 = ""
    if (L4_15 - 1) % L5_16 == 0 then
      if L4_15 - 1 ~= 0 then
        L6_17 = [[


]]
      end
      L6_17 = L6_17 .. "Timestamp," .. L2_13[L4_15]["interfaceUsage.entryTime"]
      util.appendDebugOut(L6_17 .. "<br>")
      L1_12:write(L6_17)
      L6_17 = [[

Interface Name, ]] .. "RX Packets, TX Packets,  " .. "RX Bytes, RX Byte Rate (bytes/sec), " .. "TX Bytes, TX Byte Rate (bytes/sec), " .. "RX Errors, RX Error Rate (errors/sec), " .. "TX Errors, TX Error Rate (errors/sec)"
      util.appendDebugOut(L6_17 .. "<br>")
      L1_12:write(L6_17)
    end
    L6_17 = [[

"]] .. L2_13[L4_15]["interfaceUsage.interfaceName"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.rx_packets"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.tx_packets"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.rx_bytes"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.rx_bytes_rate"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.tx_bytes"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.tx_bytes_rate"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.rx_errors"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.rx_error_rate"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.tx_errors"] .. "\"," .. "\"" .. L2_13[L4_15]["interfaceUsage.tx_error_rate"] .. "\""
    util.appendDebugOut(L6_17 .. "<br>")
    L1_12:write(L6_17)
  end
  L1_12:write("\n")
  L1_12:close()
  util.appendDebugOut("--------------------------------------------------------<br>")
end
