local L0_0
L0_0 = require
L0_0("teamf1lualib/iproute")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("iprouteLuaLib")
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/routing_static_routes")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.errorMap")
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
elseif UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-500N" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function routeCfgSave(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L1_2 = "ERROR"
  L2_3 = ""
  L3_4 = ""
  L4_5 = A0_1["route._ROWID_"]
  if L4_5 == nil then
    L4_5 = "interfaceName!='WAN2PPPOE2' and interfaceName!='WAN1PPPOE2'"
    if db.getRowsWhere(_UPVALUE0_, L4_5) ~= nil and #db.getRowsWhere(_UPVALUE0_, L4_5) >= _UPVALUE1_ then
      L3_4 = "Maximum limit for static routes is reached."
      return "ERROR", L3_4
    end
    L1_2, L3_4 = iproute.config(A0_1, "-1", "add")
  else
    L4_5 = iproute
    L4_5 = L4_5.config
    L3_4, L4_5 = A0_1, L4_5(A0_1, A0_1["route._ROWID_"], "edit")
    L1_2 = L4_5
  end
  if L1_2 == "OK" then
    L4_5 = db
    L4_5 = L4_5.save
    L4_5()
  end
  L4_5 = db
  L4_5 = L4_5.getAttribute
  L4_5 = L4_5("stringsMap", "stringId", L2_3, LANGUAGE)
  L3_4 = L4_5 or L2_3
  L4_5 = L1_2
  return L4_5, L3_4
end
function routeV6CfgSave(A0_6)
  local L1_7, L2_8, L3_9, L4_10
  L1_7 = "ERROR"
  L2_8 = ""
  L3_9 = ""
  L4_10 = A0_6["route6._ROWID_"]
  if L4_10 == nil then
    L4_10 = "interfaceName!='WAN2PPPOE2' and interfaceName!='WAN1PPPOE2'"
    if db.getRowsWhere(_UPVALUE0_, L4_10) ~= nil and #db.getRowsWhere(_UPVALUE0_, L4_10) >= _UPVALUE1_ then
      L3_9 = "Maximum limit for IPV6 routes is reached."
      return L1_7, L3_9
    end
    L1_7, L3_9 = iproute.ipv6Config(A0_6, "-1", "add")
  else
    L4_10 = iproute
    L4_10 = L4_10.ipv6Config
    L3_9, L4_10 = A0_6, L4_10(A0_6, A0_6["route6._ROWID_"], "edit")
    L1_7 = L4_10
  end
  if L1_7 == "OK" then
    L4_10 = db
    L4_10 = L4_10.save
    L4_10()
  end
  L4_10 = L1_7
  return L4_10, L3_9
end
function routeCfgDel(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = "ERROR"
  L2_13 = ""
  L3_14 = ""
  L4_15 = {}
  if db.existsRow("route", "routeName", A0_11["route.routeName"]) then
    L4_15["route._ROWID_"] = A0_11["route._ROWID_"]
    L1_12, L3_14 = iproute.deleteRoute(L4_15)
  else
    return "ERROR", "No such route with the specified name"
  end
  if L1_12 == "OK" then
    db.save()
  end
  return L1_12, L3_14
end
function routeV6CfgDel(A0_16)
  local L1_17, L2_18, L3_19, L4_20
  L1_17 = "ERROR"
  L2_18 = ""
  L3_19 = ""
  L4_20 = {}
  if db.existsRow("route6", "routeName", A0_16["route6.routeName"]) then
    L4_20["route6._ROWID_"] = A0_16["route6._ROWID_"]
    L1_17, L3_19 = iproute.deleteIpv6Route(L4_20)
  else
    return "ERROR", "No such route with the specified name"
  end
  if L1_17 == "OK" then
    db.save()
  end
  return L1_17, L3_19
end
function routeDelAll()
  local L0_21, L1_22, L2_23, L3_24, L4_25
  L0_21 = "ERROR"
  L1_22 = ""
  L2_23 = ""
  L3_24 = {}
  L4_25 = {}
  L4_25 = db.getTable("route")
  if L4_25 == nil then
    return "ERROR", "No exisitng routes to delete"
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_25) do
    L3_24[_FORV_9_["route._ROWID_"]] = _FORV_9_["route._ROWID_"]
  end
  L0_21, L2_23 = iproute.deleteRoute(L3_24)
  if L0_21 == "OK" then
    db.save()
  end
  return L0_21, L2_23
end
function routeV6DelAll()
  local L0_26, L1_27, L2_28, L3_29, L4_30
  L0_26 = "ERROR"
  L1_27 = ""
  L2_28 = ""
  L3_29 = {}
  L4_30 = {}
  L4_30 = db.getTable("route6")
  if L4_30 == nil then
    return "ERROR", "No exisitng routes to delete"
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_30) do
    L3_29[_FORV_9_["route6._ROWID_"]] = _FORV_9_["route6._ROWID_"]
  end
  L0_26, L2_28 = iproute.deleteIpv6Route(L3_29)
  if L0_26 == "OK" then
    db.save()
  end
  return L0_26, L2_28
end
function routeCfgInit(A0_31)
  local L1_32, L2_33, L3_34
  L1_32 = A0_31[1]
  L2_33 = -1
  L3_34 = db
  L3_34 = L3_34.getRow
  L3_34 = L3_34("route", "routeName", L1_32)
  if L3_34 == nil then
    L3_34 = {}
    L3_34["route.routeName"] = L1_32
    L3_34["route.interface"] = "LAN"
    L3_34["route.private"] = 0
    L3_34["route.prefix"] = "default"
    L3_34["route.active"] = 0
  else
    L2_33 = L3_34["route._ROWID_"]
  end
  return L2_33, L3_34
end
function routeV6CfgInit(A0_35)
  local L1_36, L2_37, L3_38
  L1_36 = A0_35[1]
  L2_37 = -1
  L3_38 = db
  L3_38 = L3_38.getRow
  L3_38 = L3_38("route6", "routeName", L1_36)
  if L3_38 == nil then
    L3_38 = {}
    L3_38["route6.routeName"] = L1_36
  else
    L2_37 = L3_38["route6._ROWID_"]
  end
  return L2_37, L3_38
end
function routeCfgInputVal(A0_39)
  if A0_39["route.dstIpAddr"] == nil then
    printCLIError("Invalid destination IP address")
    return false
  end
  if A0_39["route.ipSNetMask"] == nil then
    printCLIError("Invalid IP subnetmask for the route.")
    return false
  end
  if A0_39["route.gwIpAddr"] == nil then
    printCLIError("Invalid gateway IP Address.")
    return false
  end
  if A0_39["route.metric"] == nil or tonumber(A0_39["route.metric"]) < 2 or tonumber(A0_39["route.metric"]) > 15 then
    printCLIError("Invalid Metric. Please enter a value between 2 and 15.")
    return false
  end
  if routeInterFaceValidate(A0_39["route.interfaceName"]) == false then
    printCLIError("Invalid interfaceName.Check avail_interface command to see available interfaces.")
    return false
  end
  if routeCfgGW_subnetval(A0_39) == false then
    return false
  end
end
function routeCfgGW_subnetval(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L1_41 = A0_40["route.gwIpAddr"]
  L2_42 = A0_40["route.interfaceName"]
  L3_43 = 0
  L4_44 = _UPVALUE0_
  L4_44 = L4_44.interfaceSubnetCheck
  L4_44 = L4_44(L2_42, L1_41)
  if L4_44 ~= 0 then
    statusErrorMessage = _UPVALUE1_.errorStringGet(L4_44)
    printCLIError(statusErrorMessage)
    return false
  end
end
function routeCfgV6InputVal(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50
  L1_46 = db
  L1_46 = L1_46.getRow
  L2_47 = "networkInfo"
  L3_48 = "_ROWID_"
  L4_49 = "1"
  L1_46 = L1_46(L2_47, L3_48, L4_49)
  L2_47 = L1_46["networkInfo.netWorkMode"]
  if L2_47 == "1" then
    L2_47 = printCLIError
    L3_48 = "Please Set IP Mode to IPv4/IPv6 to configure IPv6 Static Routes."
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.dstIpAddr"]
  if L2_47 == nil then
    L2_47 = printCLIError
    L3_48 = "Invalid destination IP address"
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.prefix"]
  if L2_47 == nil then
    L2_47 = printCLIError
    L3_48 = "Invalid prefix length for the route."
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.gwIpAddr"]
  if L2_47 == nil then
    L2_47 = printCLIError
    L3_48 = "Invalid gateway IP Address."
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.metric"]
  if L2_47 ~= nil then
    L2_47 = tonumber
    L3_48 = A0_45["route6.metric"]
    L2_47 = L2_47(L3_48)
    if not (L2_47 < 2) then
      L2_47 = tonumber
      L3_48 = A0_45["route6.metric"]
      L2_47 = L2_47(L3_48)
    end
  elseif L2_47 > 15 then
    L2_47 = printCLIError
    L3_48 = "Invalid Metric. Please enter a value between 2 and 15."
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.interfaceName"]
  if L2_47 ~= nil then
    L2_47 = A0_45["route6.interfaceName"]
    if L2_47 ~= "WAN1" then
      L2_47 = A0_45["route6.interfaceName"]
      if L2_47 ~= "WAN2" then
        L2_47 = A0_45["route6.interfaceName"]
        if L2_47 ~= "LAN" then
          L2_47 = A0_45["route6.interfaceName"]
        end
      end
    end
  elseif L2_47 ~= "sit0-WAN1" then
    L2_47 = printCLIError
    L3_48 = "Invalid interfaceName. please give LAN or WAN or sito-Tunnel"
    L2_47(L3_48)
    L2_47 = false
    return L2_47
  end
  L2_47 = A0_45["route6.active"]
  if L2_47 ~= nil then
    L2_47 = A0_45["route6.active"]
    if L2_47 ~= " " then
      L2_47 = A0_45["route6.active"]
    end
  elseif L2_47 == "" then
    A0_45["route6.active"] = 0
  end
  L2_47 = nil
  L3_48 = validations
  L3_48 = L3_48.ipv6AddrValidate
  L4_49 = A0_45["route6.gwIpAddr"]
  L5_50 = ""
  L5_50 = L3_48(L4_49, L5_50, "")
  c = L5_50
  b = L4_49
  a = L3_48
  L3_48 = b
  if L3_48 ~= "OK" then
    L3_48 = db
    L3_48 = L3_48.getAttribute
    L4_49 = "stringsMap"
    L5_50 = "stringId"
    L3_48 = L3_48(L4_49, L5_50, b, "en_US")
    L2_47 = L3_48
    L3_48 = print
    L4_49 = L2_47
    L5_50 = " for Static route Gateway Address."
    L4_49 = L4_49 .. L5_50
    L3_48(L4_49)
    L3_48 = false
    return L3_48
  end
  L3_48 = validations
  L3_48 = L3_48.ipv6LoopBackCheck
  L4_49 = A0_45["route6.gwIpAddr"]
  L3_48 = L3_48(L4_49)
  L2_47 = L3_48
  if L2_47 ~= "OK" then
    L3_48 = printCLIError
    L4_49 = L2_47
    L5_50 = " for Static route Gateway Address."
    L4_49 = L4_49 .. L5_50
    L3_48(L4_49)
    L3_48 = false
    return L3_48
  end
  L3_48 = nil
  L4_49 = validations
  L4_49 = L4_49.ipv6AddrValidate
  L5_50 = A0_45["route6.dstIpAddr"]
  c, L4_49 = "", L4_49(L5_50, "", "")
  c, L5_50 = "", L4_49(L5_50, "", "")
  b = L5_50
  a = L4_49
  L4_49 = b
  if L4_49 ~= "OK" then
    L4_49 = db
    L4_49 = L4_49.getAttribute
    L5_50 = "stringsMap"
    L4_49 = L4_49(L5_50, "stringId", b, "en_US")
    L3_48 = L4_49
    L4_49 = print
    L5_50 = L3_48
    L5_50 = L5_50 .. " for Static route Destination Address."
    L4_49(L5_50)
    L4_49 = false
    return L4_49
  end
  L4_49 = validations
  L4_49 = L4_49.ipv6LoopBackCheck
  L5_50 = A0_45["route6.dstIpAddr"]
  L4_49 = L4_49(L5_50)
  L3_48 = L4_49
  if L3_48 ~= "OK" then
    L4_49 = printCLIError
    L5_50 = L3_48
    L5_50 = L5_50 .. " for Static route Destination Address."
    L4_49(L5_50)
    L4_49 = false
    return L4_49
  end
  L4_49 = db
  L4_49 = L4_49.getRowsWhere
  L5_50 = "ipAddressTable"
  L4_49 = L4_49(L5_50, "LogicalIfName ='" .. A0_45["route6.interfaceName"] .. [[
' and 
				addressFamily=']] .. _UPVALUE0_ .. [[
' and 
				]] .. _UPVALUE1_ .. [[
!= '' and 
				]] .. _UPVALUE1_ .. " != '" .. _UPVALUE2_ .. "'", false)
  L5_50 = #L4_49
  if L5_50 == 0 then
    L5_50 = printCLIError
    L5_50("Selected interface does not have a valid ip address")
    L5_50 = false
    return L5_50
  else
    L5_50 = #L4_49
    if L5_50 > 0 then
      L5_50 = _UPVALUE3_
      for _FORV_9_, _FORV_10_ in pairs(L4_49) do
        L5_50 = validationsLuaLib.ipv6SingleMaskCheck(A0_45["route6.gwIpAddr"], _FORV_10_[_UPVALUE4_ .. "." .. _UPVALUE1_], _FORV_10_[_UPVALUE4_ .. "." .. _UPVALUE5_])
        if L5_50 == _UPVALUE6_ then
          return true
        end
      end
      if L5_50 == _UPVALUE3_ then
        printCLIError("Gateway IP Address must be in Selected Interface Subnet")
        return false
      end
    end
  end
  L5_50 = true
  return L5_50
end
function routingV6Get(A0_51)
  local L1_52
  L1_52 = {}
  L1_52 = db.getTable("route6")
  if db.getAttribute("networkInfo", "_ROWID_", "1", "netWorkMode") == "1" then
    print("Please Set IP Mode to IPv4/IPv6 to configure IPv6 Static Routes.")
  else
    if L1_52 == nil then
      print("Currently no static  routes are configured\n")
    end
    print("Name" .. "\t" .. "\t" .. "Destination" .. "\t" .. "\t" .. "Gateway" .. "\t" .. "\t" .. "Interface" .. "\t" .. "Metric" .. "\t" .. "Active\n")
    print("----" .. "\t" .. "\t" .. "-----------" .. "\t" .. "\t" .. "-------" .. "\t" .. "\t" .. "---------" .. "\t" .. "------" .. "\t" .. "-------\n")
    for _FORV_5_, _FORV_6_ in pairs(L1_52) do
      if _FORV_6_["route.interfaceName"] == "WAN1PPPOE2" or _FORV_6_["route.interfaceName"] == "WAN2PPPOE2" then
        if db.existsRowWhere("networkInterface", "LogicalIfName='" .. _FORV_6_["route.interfaceName"] .. "' and IfStatus = 1") then
          print(_FORV_6_["route6.routeName"] .. "\t" .. "\t" .. _FORV_6_["route6.dstIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route6.gwIpAddr"] .. "\t " .. "\t" .. _FORV_6_["route6.interfaceName"] .. "\t" .. "\t" .. _FORV_6_["route6.metric"] .. "\t" .. _FORV_6_["route6.active"] .. "\n")
        end
      else
        print(_FORV_6_["route6.routeName"] .. "\t" .. "\t" .. _FORV_6_["route6.dstIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route6.gwIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route6.interfaceName"] .. "\t" .. "\t" .. _FORV_6_["route6.metric"] .. "\t" .. _FORV_6_["route6.active"] .. "\n")
      end
    end
  end
end
function routingGet(A0_53)
  local L1_54
  L1_54 = {}
  L1_54 = db.getTable("route")
  if L1_54 == nil then
    print("Currently no static  routes are configured\n")
  end
  print("Name" .. "\t" .. "\t" .. "Destination" .. "\t" .. "\t" .. "Gateway" .. "\t" .. "\t" .. "Interface" .. "\t" .. "Metric" .. "\t" .. "Active" .. "\t" .. "Private\n")
  print("----" .. "\t" .. "\t" .. "-----------" .. "\t" .. "\t" .. "-------" .. "\t" .. "\t" .. "---------" .. "\t" .. "------" .. "\t" .. "-------" .. "\t" .. "-------\n")
  for _FORV_5_, _FORV_6_ in pairs(L1_54) do
    if _FORV_6_["route.interfaceName"] == "WAN1PPPOE2" or _FORV_6_["route.interfaceName"] == "WAN2PPPOE2" then
      if db.existsRowWhere("networkInterface", "LogicalIfName='" .. _FORV_6_["route.interfaceName"] .. "' and IfStatus = 1") then
        print(_FORV_6_["route.routeName"] .. "\t" .. "\t" .. _FORV_6_["route.dstIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route.gwIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route.interfaceName"] .. "\t" .. "\t" .. _FORV_6_["route.metric"] .. "\t" .. _FORV_6_["route.active"] .. "\t" .. _FORV_6_["route.private"] .. "\n")
      end
    else
      print(_FORV_6_["route.routeName"] .. "\t" .. "\t" .. _FORV_6_["route.dstIpAddr"] .. "\t" .. "\t" .. _FORV_6_["route.gwIpAddr"] .. "\t " .. "\t" .. _FORV_6_["route.interfaceName"] .. "\t" .. "\t" .. _FORV_6_["route.metric"] .. "\t" .. _FORV_6_["route.active"] .. "\t" .. _FORV_6_["route.private"] .. "\n")
    end
  end
end
function routingGetInterface(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63
  L1_56 = {}
  L2_57 = printLabel
  L3_58 = "Interface"
  L2_57(L3_58)
  L2_57 = 1
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "S.No.   "
  L6_61 = L2_57
  L3_58(L4_59, L5_60, L6_61)
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "Interface"
  L6_61 = "WAN1"
  L3_58(L4_59, L5_60, L6_61)
  L2_57 = L2_57 + 1
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "S.No.   "
  L6_61 = L2_57
  L3_58(L4_59, L5_60, L6_61)
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "Interface"
  L6_61 = "WAN2"
  L3_58(L4_59, L5_60, L6_61)
  L3_58 = UNIT_NAME
  if L3_58 ~= "DSR-1000" then
    L3_58 = UNIT_NAME
    if L3_58 ~= "DSR-1000N" then
      L3_58 = UNIT_NAME
    end
  elseif L3_58 == "DSR-1000AC" then
    L2_57 = L2_57 + 1
    L3_58 = resTab
    L3_58 = L3_58.insertField
    L4_59 = L1_56
    L5_60 = "S.No.   "
    L6_61 = L2_57
    L3_58(L4_59, L5_60, L6_61)
    L3_58 = resTab
    L3_58 = L3_58.insertField
    L4_59 = L1_56
    L5_60 = "Interface"
    L6_61 = "WAN3"
    L3_58(L4_59, L5_60, L6_61)
  end
  L2_57 = L2_57 + 1
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "S.No.   "
  L6_61 = L2_57
  L3_58(L4_59, L5_60, L6_61)
  L3_58 = resTab
  L3_58 = L3_58.insertField
  L4_59 = L1_56
  L5_60 = "Interface"
  L6_61 = "DMZ"
  L3_58(L4_59, L5_60, L6_61)
  L3_58 = db
  L3_58 = L3_58.getTable
  L4_59 = "vlanStatus"
  L3_58 = L3_58(L4_59)
  L4_59 = L3_58[1]
  L5_60 = ""
  if L4_59 then
    L5_60 = L4_59["vlanStatus.VlanState"]
  end
  if L5_60 == "0" then
    L2_57 = L2_57 + 1
    L6_61 = resTab
    L6_61 = L6_61.insertField
    L7_62 = L1_56
    L8_63 = "S.No."
    L6_61(L7_62, L8_63, L2_57)
    L6_61 = resTab
    L6_61 = L6_61.insertField
    L7_62 = L1_56
    L8_63 = "Interface"
    L6_61(L7_62, L8_63, "LAN")
  else
    L6_61 = 0
    L7_62 = "ifType = 'bridge'"
    L8_63 = db
    L8_63 = L8_63.getRowsWhere
    L8_63 = L8_63("networkInterface", L7_62)
    for _FORV_12_, _FORV_13_ in pairs(L8_63) do
      L6_61 = L6_61 + 1
      L2_57 = L2_57 + 1
      resTab.insertField(L1_56, "S.No.   ", L2_57)
      resTab.insertField(L1_56, "Interface", L8_63[L6_61]["networkInterface.LogicalIfName"])
    end
  end
  L6_61 = _UPVALUE0_
  L6_61 = L6_61.staticRouteGetExtraPhyInterfaceName
  L7_62 = L6_61()
  if L6_61 == "Wan1Phy" then
    L2_57 = L2_57 + 1
    L8_63 = resTab
    L8_63 = L8_63.insertField
    L8_63(L1_56, "S.No.   ", L2_57)
    L8_63 = resTab
    L8_63 = L8_63.insertField
    L8_63(L1_56, "Interface", L6_61)
  elseif L7_62 == "Wan2Phy" then
    L2_57 = L2_57 + 1
    L8_63 = resTab
    L8_63 = L8_63.insertField
    L8_63(L1_56, "S.No.   ", L2_57)
    L8_63 = resTab
    L8_63 = L8_63.insertField
    L8_63(L1_56, "Interface", L7_62)
  end
  L8_63 = resTab
  L8_63 = L8_63.print
  L8_63(L1_56, 0)
end
function routeInterFaceValidate(A0_64)
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-1000N" then
    if A0_64 ~= nil and (A0_64 == "WAN1" or A0_64 == "WAN2" or A0_64 == "WAN3" or string.sub(A0_64, 1, 3) == "LAN" or _UPVALUE0_.staticRouteGetExtraPhyInterfaceName() == A0_64 or _UPVALUE0_.staticRouteGetExtraPhyInterfaceName() == A0_64) then
      return true
    else
      return false
    end
  elseif A0_64 ~= nil and (A0_64 == "WAN1" or A0_64 == "WAN2" or string.sub(A0_64, 1, 3) == "LAN" or _UPVALUE0_.staticRouteGetExtraPhyInterfaceName() == A0_64 or _UPVALUE0_.staticRouteGetExtraPhyInterfaceName() == A0_64) then
    return true
  else
    return false
  end
end
