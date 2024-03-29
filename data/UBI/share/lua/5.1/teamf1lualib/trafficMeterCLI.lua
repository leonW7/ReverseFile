require("teamf1lualib/fwView")
rowid = "1"
totalLimit = ""
function trafficMeterCfgSave(A0_0)
  errorFlag = ""
  statusCode = ""
  statusMessage = ""
  DBTable = "FwTrafficMeter"
  errorFlag, statusCode = fwView.trafficMeterConfig(A0_0, rowid, "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  return errorFlag, statusMessage
end
function trafficMeterCfgInit(A0_1)
  configRow = db.getRow("FwTrafficMeter", "_ROWID_", "1")
  if configRow == nil then
    configRow = {}
  elseif configRow["FwTrafficMeter.TrafficMeterStatus"] == "1" and configRow["FwTrafficMeter.TrafficLimitType"] ~= "0" then
    if configRow["FwTrafficMeter.IncreaseLimitStatus"] == "1" then
      totalLimit = tonumber(configRow["FwTrafficMeter.TrafficMonthlyLimit"]) + tonumber(configRow["FwTrafficMeter.IncreaseLimitBy"])
    else
      totalLimit = configRow["FwTrafficMeter.TrafficMonthlyLimit"]
    end
  end
  return rowid, configRow
end
function trafficMeterCfgInputVal(A0_2)
  local L1_3
  L1_3 = true
  return L1_3
end
function trafficMeterSetupGet(A0_4)
  local L1_5
  L1_5 = {}
  tmRow = db.getRow("FwTrafficMeter", "_ROWID_", rowid)
  if tmRow == nil then
    print("Traffic Meter configurations unavailable\n")
  else
    printLabel("Enable Traffic Meter")
    if tmRow["FwTrafficMeter.TrafficMeterStatus"] == "0" then
      print("Traffic Meter is Disabled\n")
    elseif tmRow["FwTrafficMeter.TrafficMeterStatus"] == "1" then
      print("Traffic Meter is Enabled\n")
      if tmRow["FwTrafficMeter.TrafficLimitType"] == "0" then
        limitType = "No Limit"
      elseif tmRow["FwTrafficMeter.TrafficLimitType"] == "1" then
        limitType = "Download only"
      elseif tmRow["FwTrafficMeter.TrafficLimitType"] == "2" then
        limitType = "Both Directions"
      end
      print("Limit Type " .. limitType .. "\n")
      print("Monthly Limit in (MB): " .. tmRow["FwTrafficMeter.TrafficMonthlyLimit"] .. "\n")
      if tmRow["FwTrafficMeter.IncreaseLimitStatus"] == "1" then
        print("Increase this month limit: Enabled \n")
        if tmRow["FwTrafficMeter.IncreaseLimitBy"] ~= nil then
          print("Increase limit by in (MB): " .. tmRow["FwTrafficMeter.IncreaseLimitBy"] .. "\n")
        end
      else
        print("Increase this month limit: Disabled \n")
      end
      print("This month limit: " .. totalLimit .. "\n")
      printLabel("Traffic Counter\n")
      if tmRow["FwTrafficMeter.RestartCounter"] == "1" then
        print("Traffic Counter: Specific Time\n")
      elseif tmRow["FwTrafficMeter.RestartCounter"] == "0" then
        print("Traffic Counter: Restart Counter\n")
      end
      if tmRow["FwTrafficMeter.TimeHH"] ~= nil and tmRow["FwTrafficMeter.TimeMM"] ~= nil and tmRow["FwTrafficMeter.DayOfMonth"] ~= nil then
        print("Restart Time (HH/MM-Day of Month): " .. tmRow["FwTrafficMeter.TimeHH"] .. "/" .. tmRow["FwTrafficMeter.TimeMM"] .. "-" .. tmRow["FwTrafficMeter.DayOfMonth"])
      end
      if tmRow["FwTrafficMeter.SendEmailReport"] == "1" then
        print("Send e-mail before restarting: Enabled\n")
      elseif tmRow["FwTrafficMeter.SendEmailReport"] == "0" then
        print("Send e-mail before restarting: Disabled\n")
      end
      printLabel("When Limit is reached\n")
      if tmRow["FwTrafficMeter.BlockTraffic"] == "0" then
        blockTraffic = "Block All Traffic"
      else
        blockTraffic = "Block All Traffic Except Email"
      end
      print("Traffic Block Status: " .. blockTraffic .. " \n")
      if tmRow["FwTrafficMeter.SendEmailAlert"] == "1" then
        print("Send e-mail alert: Enabled\n")
      elseif tmRow["FwTrafficMeter.SendEmailAlert"] == "1" then
        print("Send e-mail alert: Disabled\n")
      end
    end
  end
  tsRow = db.getRow("TrafficStatistics", "_ROWID_", rowid)
  if tsRow ~= nil then
    printLabel("Internet Traffic Statistics\n")
    resTab.insertField(L1_5, "Start Date / Time", tsRow["TrafficStatistics.StartTime"] or "")
    resTab.insertField(L1_5, "Outgoing Traffic Volume", tsRow["TrafficStatistics.OutgoingTrafVol"] or "")
    resTab.insertField(L1_5, "Incoming Traffic Volume", tsRow["TrafficStatistics.IncomingTrafVol"] or "")
    resTab.insertField(L1_5, "Average per day", tsRow["TrafficStatistics.AvgPerDay"] or "")
    resTab.insertField(L1_5, "% of Standard Limit", tsRow["TrafficStatistics.StandardLimit"] or "")
    resTab.insertField(L1_5, "% of this Month's Limit", tsRow["TrafficStatistics.ThisMonthLimit"] or "")
  end
  resTab.print(L1_5, 0)
end
