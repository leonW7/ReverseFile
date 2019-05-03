local L0_0
L0_0 = require
L0_0("teamf1lualib/protocolBinding")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
function protocolBindingCfgInit(A0_1)
  local L1_2, L2_3
  L1_2 = A0_1[1]
  L2_3 = {}
  if L1_2 == "-1" then
    L2_3["ProtocolBinding._ROWID_"] = "-1"
    L2_3["ProtocolBinding.Enabled"] = "1"
  else
    L2_3 = db.getRow("ProtocolBinding", "ProtocolBinding._ROWID_", L1_2)
    if L2_3 == nil then
      print("Row does not exist")
      return false
    end
  end
  return L1_2, L2_3
end
function protocolBindingCfgSave(A0_4)
  local L1_5, L2_6, L3_7, L4_8
  L1_5 = ""
  L2_6 = ""
  L3_7 = ""
  L4_8 = A0_4["ProtocolBinding._ROWID_"]
  if A0_4["ProtocolBinding.LocalGatewayType"] == "WAN1" then
    A0_4["ProtocolBinding.LocalGatewayType"] = "1"
  end
  if A0_4["ProtocolBinding.LocalGatewayType"] == "WAN2" then
    A0_4["ProtocolBinding.LocalGatewayType"] = "2"
  end
  if A0_4["ProtocolBinding.LocalGatewayType"] == "WAN3" then
    A0_4["ProtocolBinding.LocalGatewayType"] = "3"
  end
  if L4_8 == "-1" then
    if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
      _UPVALUE0_ = 64
    else
      _UPVALUE0_ = 32
    end
    if db.getTable("ProtocolBinding") ~= nil and #db.getTable("ProtocolBinding") >= _UPVALUE0_ then
      L3_7 = "Protocol binding maximum limit reached."
      return "ERROR", L3_7
    end
    L1_5, L2_6 = protocolBinding.config(A0_4, L4_8, "add")
  else
    L1_5, L2_6 = protocolBinding.config(A0_4, L4_8, "edit")
  end
  if L1_5 == "OK" then
    db.save()
  end
  L3_7 = db.getAttribute("stringsMap", "stringId", L2_6, LANGUAGE)
  return L1_5, L3_7
end
function protocolBindingCfgInputVal(A0_9)
  local L1_10
  if db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") == "DMZ" then
    printCLIError("Please set the Configurable port to WAN")
    return false
  end
  if A0_9["ProtocolBinding.LocalGatewayType"] == "" or A0_9["ProtocolBinding.LocalGatewayType"] == nil then
    printCLIError("Give Local gateway type")
    return false
  end
  if A0_9["ProtocolBinding.ServiceName"] == "" or A0_9["ProtocolBinding.ServiceName"] == nil then
    printCLIError("Give Service name")
    return false
  end
  if A0_9["ProtocolBinding.SourceNetworkType"] == "" or A0_9["ProtocolBinding.SourceNetworkType"] == nil then
    printCLIError("Give Source Network type")
    return false
  end
  if A0_9["ProtocolBinding.DestinationNetworkType"] == "" or A0_9["ProtocolBinding.DestinationNetworkType"] == nil then
    printCLIError("Give Destination Network type")
    return false
  end
  if A0_9["ProtocolBinding.SourceNetworkType"] == "1" then
    if A0_9["ProtocolBinding.SourceNetworkStart"] == "" or A0_9["ProtocolBinding.SourceNetworkStart"] == nil or A0_9["ProtocolBinding.SourceNetworkStart"] == "0.0.0.0" then
      printCLIError("Source Ip not given")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.SourceNetworkStart"]) ~= true then
      printCLIError("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
  end
  if A0_9["ProtocolBinding.DestinationNetworkType"] == "1" then
    if A0_9["ProtocolBinding.DestinationNetworkStart"] == "" or A0_9["ProtocolBinding.DestinationNetworkStart"] == nil or A0_9["ProtocolBinding.DestinationNetworkStart"] == "0.0.0.0" then
      printCLIError("Destination Ip not given")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.DestinationNetworkStart"]) ~= true then
      printCLIError("Destination Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
  end
  if A0_9["ProtocolBinding.SourceNetworkType"] == "2" then
    if A0_9["ProtocolBinding.SourceNetworkStart"] == "" or A0_9["ProtocolBinding.SourceNetworkStart"] == nil or A0_9["ProtocolBinding.SourceNetworkStart"] == "0.0.0.0" then
      printCLIError("Source Start Ip not given")
      return false
    end
    if A0_9["ProtocolBinding.SourceNetworkEnd"] == "" or A0_9["ProtocolBinding.SourceNetworkEnd"] == nil or A0_9["ProtocolBinding.SourceNetworkEnd"] == "0.0.0.0" then
      printCLIError("Source End Ip not given")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.SourceNetworkStart"]) ~= true then
      printCLIError("Source Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.SourceNetworkEnd"]) ~= true then
      printCLIError("Source End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    L1_10 = _UPVALUE0_.ipv4AddressesCompare(A0_9["ProtocolBinding.SourceNetworkStart"], A0_9["ProtocolBinding.SourceNetworkEnd"])
    if L1_10 == 0 or L1_10 == 3 then
      printCLIError(" Source End address should be higher than or equal to Start address")
      return false
    end
  end
  if A0_9["ProtocolBinding.DestinationNetworkType"] == "2" then
    if A0_9["ProtocolBinding.DestinationNetworkStart"] == "" or A0_9["ProtocolBinding.DestinationNetworkStart"] == nil or A0_9["ProtocolBinding.DestinationNetworkStart"] == "0.0.0.0" then
      printCLIError("Destination Ip not given")
      return false
    end
    if A0_9["ProtocolBinding.DestinationNetworkEnd"] == "" or A0_9["ProtocolBinding.DestinationNetworkEnd"] == nil or A0_9["ProtocolBinding.DestinationNetworkEnd"] == "0.0.0.0" then
      printCLIError("Destination end Ip not given")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.DestinationNetworkStart"]) ~= true then
      printCLIError("Destination Start IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    if _UPVALUE0_.checkIpv4Address(A0_9["ProtocolBinding.DestinationNetworkEnd"]) ~= true then
      printCLIError("Destination End IP Address is Invalid.Octet 1 should be in 1-223 and Octet 4 should be in 1-254 range.")
      return false
    end
    L1_10 = _UPVALUE0_.ipv4AddressesCompare(A0_9["ProtocolBinding.DestinationNetworkStart"], A0_9["ProtocolBinding.DestinationNetworkEnd"])
    if L1_10 == 0 or L1_10 == 3 then
      printCLIError("Destination End address should be higher than or equal to Start address")
      return false
    end
  end
  return true
end
function protocolBindingModify(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17
  L1_12 = {}
  L2_13 = "ProtocolBinding"
  DBTable = L2_13
  L2_13 = A0_11[1]
  L1_12.rowid = L2_13
  L2_13 = A0_11[2]
  L3_14 = {}
  L4_15 = ""
  L5_16 = ""
  L6_17 = ""
  L3_14 = db.getRow("ProtocolBinding", "ProtocolBinding._ROWID_", L1_12.rowid)
  if L3_14 == nil then
    printCLIError("Row doesnt exist")
  elseif L1_12 then
    if L2_13 == "enable" then
      L4_15, L5_16 = protocolBinding.modifyRules(L1_12, "enable")
    elseif L2_13 == "disable" then
      L4_15, L5_16 = protocolBinding.modifyRules(L1_12, "disable")
    else
      L4_15, L5_16 = protocolBinding.modifyRules(L1_12, "delete")
    end
  end
  if L4_15 == "OK" then
    db.save()
  end
  L6_17 = db.getAttribute("stringsMap", "stringId", L5_16, LANGUAGE)
  return L4_15, L6_17
end
function protocolBindingInfoGet()
  local L0_18, L1_19
  L0_18 = db
  L0_18 = L0_18.getTable
  L1_19 = "ProtocolBinding"
  L0_18 = L0_18(L1_19)
  L1_19 = {}
  printLabel("Protcol Binding Rules")
  printLabel("List of Available Protocol Binding Rules")
  if L0_18 == nil then
    print("protocolbinding table not available")
  else
    for _FORV_7_, _FORV_8_ in pairs(L0_18) do
      if "0" + 1 ~= nil then
        resTab.insertField(L1_19, "ROWID", L0_18["0" + 1]["ProtocolBinding._ROWID_"] or "")
        resTab.insertField(L1_19, "Service", L0_18["0" + 1]["ProtocolBinding.ServiceName"] or "")
        if L0_18["0" + 1]["ProtocolBinding.LocalGatewayType"] == "2" then
          resTab.insertField(L1_19, "LocalGateway", "ConfigurableWAN")
        elseif L0_18["0" + 1]["ProtocolBinding.LocalGatewayType"] == "1" then
          resTab.insertField(L1_19, "LocalGateway", "DedicatedWAN")
        elseif L0_18["0" + 1]["ProtocolBinding.LocalGatewayType"] == "3" then
          resTab.insertField(L1_19, "LocalGateway", "3G_Internet")
        end
        if L0_18["0" + 1]["ProtocolBinding.DestinationNetworkType"] == "0" then
          resTab.insertField(L1_19, "Destination type", "ANY")
        elseif L0_18["0" + 1]["ProtocolBinding.DestinationNetworkType"] == "1" then
          resTab.insertField(L1_19, "Destination type", "Single Address")
        else
          resTab.insertField(L1_19, "Destination type", "Range Address")
        end
        if L0_18["0" + 1]["ProtocolBinding.SourceNetworkType"] == "0" then
          resTab.insertField(L1_19, "Source type", "ANY")
        elseif L0_18["0" + 1]["ProtocolBinding.SourceNetworkType"] == "1" then
          resTab.insertField(L1_19, "Source type", "Single Address")
        else
          resTab.insertField(L1_19, "Source type", "Range Address")
        end
        resTab.insertField(L1_19, "SourceStartAddress", L0_18["0" + 1]["ProtocolBinding.SourceNetworkStart"] or "")
        resTab.insertField(L1_19, "SourceEndAddress", L0_18["0" + 1]["ProtocolBinding.SourceNetworkEnd"] or "")
        resTab.insertField(L1_19, "DestinationStartAddress", L0_18["0" + 1]["ProtocolBinding.DestinationNetworkStart"] or "")
        resTab.insertField(L1_19, "DestinationEndAddress", L0_18["0" + 1]["ProtocolBinding.DestinationNetworkEnd"] or "")
      end
    end
    resTab.print(L1_19, 0)
  end
end
