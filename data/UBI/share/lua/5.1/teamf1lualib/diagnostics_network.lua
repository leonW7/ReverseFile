local L0_0
L0_0 = module
L0_0("com.teamf1.core.diagnostics.network", package.seeall)
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
attribute = {}
attribute.key = "_ROWID_"
attribute.keyValue = "1"
attribute.ipv4RouteTable = "ipv4RouteTable"
attribute.ipv6RouteTable = "ipv6RouteTable"
attribute.address = "address"
attribute.ping = "ping"
attribute.traceroute = "traceroute"
attribute.dnsLookup = "dnsLookup"
attribute.interface = "LogicalIfName"
attribute.packetCapture = "tcpdumpEnabled"
attribute.routeProgram = "ROUTE_PROGRAM"
attribute.route6Program = "ROUTE6_PROGRAM"
attribute.privateRouteProgram = "PRIVATE_ROUTE_PROGRAM"
attribute.privateRouteFileName = "PRIVATE_ROUTE_FILE_NAME"
attribute.pingFileName = "PING_FILE_NAME"
attribute.vpnPingProgram = "VPN_PING_PROGRAM"
attribute.pingProgram = "PING_PROGRAM"
attribute.ping6Program = "PING6_PROGRAM"
attribute.tracerouteProgram = "TRACEROUTE_PROGRAM"
attribute.traceroute6Program = "TRACEROUTE6_PROGRAM"
attribute.nsLookupProgram = "NSLOOKUP_PROGRAM"
function ipv4RouteTableGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L1_2 = _UPVALUE0_
  L2_3 = "name"
  L3_4 = attribute
  L3_4 = L3_4.routeProgram
  L4_5 = "value"
  L0_1 = L0_1(L1_2, L2_3, L3_4, L4_5)
  L1_2 = _UPVALUE1_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE1_
    L1_2 = L1_2.FAILURE
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L2_3 = _UPVALUE0_
  L3_4 = "name"
  L4_5 = attribute
  L4_5 = L4_5.pingFileName
  L5_6 = "value"
  L1_2 = L1_2(L2_3, L3_4, L4_5, L5_6)
  L2_3 = _UPVALUE2_
  L2_3 = L2_3.execute
  L3_4 = L0_1
  L4_5 = " > "
  L5_6 = L1_2
  L3_4 = L3_4 .. L4_5 .. L5_6
  L2_3(L3_4)
  L2_3 = _UPVALUE1_
  L2_3 = L2_3.NIL
  if L1_2 == L2_3 then
    L2_3 = _UPVALUE1_
    L2_3 = L2_3.FAILURE
    return L2_3
  end
  L2_3 = {}
  L3_4 = util
  L3_4 = L3_4.fileToString
  L4_5 = L1_2
  L3_4 = L3_4(L4_5)
  L2_3 = L3_4
  L3_4 = _UPVALUE1_
  L3_4 = L3_4.NIL
  if L2_3 == L3_4 then
    L3_4 = _UPVALUE1_
    L3_4 = L3_4.FAILURE
    return L3_4
  end
  L3_4 = db
  L3_4 = L3_4.getAttribute
  L4_5 = _UPVALUE0_
  L5_6 = "name"
  L6_7 = attribute
  L6_7 = L6_7.privateRouteProgram
  L3_4 = L3_4(L4_5, L5_6, L6_7, "value")
  L4_5 = _UPVALUE1_
  L4_5 = L4_5.NIL
  if L3_4 == L4_5 then
    L4_5 = _UPVALUE1_
    L4_5 = L4_5.FAILURE
    return L4_5
  end
  L4_5 = db
  L4_5 = L4_5.getAttribute
  L5_6 = _UPVALUE0_
  L6_7 = "name"
  L4_5 = L4_5(L5_6, L6_7, attribute.privateRouteFileName, "value")
  L5_6 = _UPVALUE2_
  L5_6 = L5_6.execute
  L6_7 = L3_4
  L6_7 = L6_7 .. " > " .. L4_5
  L5_6(L6_7)
  L5_6 = _UPVALUE1_
  L5_6 = L5_6.NIL
  if L1_2 == L5_6 then
    L5_6 = _UPVALUE1_
    L5_6 = L5_6.FAILURE
    return L5_6
  end
  L5_6 = {}
  L6_7 = util
  L6_7 = L6_7.fileToString
  L6_7 = L6_7(L4_5)
  L5_6 = L6_7
  L6_7 = _UPVALUE1_
  L6_7 = L6_7.NIL
  if L5_6 == L6_7 then
    L6_7 = _UPVALUE1_
    L6_7 = L6_7.FAILURE
    return L6_7
  end
  L6_7 = {}
  if L5_6 ~= _UPVALUE1_.EMPTY then
    L6_7 = L2_3 .. _UPVALUE3_ .. _UPVALUE4_ .. L5_6
  else
    L6_7 = L2_3
  end
  return _UPVALUE1_.SUCCESS, 1, L6_7
end
function ipv4RouteTableGetNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, rowId
end
function ipv4RouteTableSet(A0_10, A1_11)
  local L3_12
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  return L3_12, A0_10
end
function ipv6RouteTableGet()
  local L0_13, L1_14, L2_15
  L0_13 = db
  L0_13 = L0_13.getAttribute
  L1_14 = _UPVALUE0_
  L2_15 = "name"
  L0_13 = L0_13(L1_14, L2_15, attribute.pingFileName, "value")
  L1_14 = db
  L1_14 = L1_14.getAttribute
  L2_15 = _UPVALUE0_
  L1_14 = L1_14(L2_15, "name", attribute.route6Program, "value")
  L2_15 = _UPVALUE1_
  L2_15 = L2_15.NIL
  if L1_14 == L2_15 then
    L2_15 = _UPVALUE1_
    L2_15 = L2_15.FAILURE
    return L2_15
  end
  L2_15 = _UPVALUE2_
  L2_15 = L2_15.execute
  L2_15(L1_14 .. " > " .. L0_13)
  L2_15 = _UPVALUE1_
  L2_15 = L2_15.NIL
  if L0_13 == L2_15 then
    L2_15 = _UPVALUE1_
    L2_15 = L2_15.FAILURE
    return L2_15
  end
  L2_15 = {}
  L2_15 = util.fileToString(L0_13)
  if L2_15 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L2_15
end
function ipv6RouteTableGetNext(A0_16)
  local L2_17
  L2_17 = _UPVALUE0_
  L2_17 = L2_17.NOT_SUPPORTED
  return L2_17, rowId
end
function ipv6RouteTableSet(A0_18, A1_19)
  local L3_20
  L3_20 = _UPVALUE0_
  L3_20 = L3_20.NOT_SUPPORTED
  return L3_20, A0_18
end
function addressGet()
  local L1_21
  L1_21 = _UPVALUE0_
  L1_21 = L1_21.NOT_SUPPORTED
  return L1_21
end
function addressGetNext(A0_22)
  local L2_23
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NOT_SUPPORTED
  return L2_23, A0_22
end
function addressSet(A0_24, A1_25)
  local L3_26
  L3_26 = _UPVALUE0_
  L3_26 = L3_26.NOT_SUPPORTED
  return L3_26, A0_24
end
function pingGet(A0_27, A1_28)
  return _UPVALUE0_.NOT_SUPPORTED
end
function pingGetNext(A0_29)
  local L2_30
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NOT_SUPPORTED
  return L2_30, A0_29
end
function pingSet(A0_31, A1_32)
  local L2_33, L3_34, L4_35, L5_36
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NIL
  if A1_32 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_ARGUMENT
    return L2_33
  end
  if A1_32 == "start" then
    L2_33 = db
    L2_33 = L2_33.getAttribute
    L3_34 = _UPVALUE1_
    L4_35 = "name"
    L5_36 = attribute
    L5_36 = L5_36.pingFileName
    L2_33 = L2_33(L3_34, L4_35, L5_36, "value")
    L3_34 = ""
    L5_36 = A0_31
    L4_35 = A0_31.find
    L4_35 = L4_35(L5_36, ":")
    if L4_35 then
      L4_35 = db
      L4_35 = L4_35.getAttribute
      L5_36 = _UPVALUE1_
      L4_35 = L4_35(L5_36, "name", attribute.ping6Program, "value")
      L3_34 = L4_35
      L4_35 = _UPVALUE0_
      L4_35 = L4_35.NIL
      if L3_34 == L4_35 then
        L4_35 = _UPVALUE0_
        L4_35 = L4_35.FAILURE
        return L4_35
      end
      L4_35 = " 2>&1 "
      L5_36 = L3_34
      L5_36 = L5_36 .. " " .. A0_31 .. L4_35 .. " > " .. L2_33
      _UPVALUE2_.execute(L5_36)
    else
      L4_35 = db
      L4_35 = L4_35.getAttribute
      L5_36 = _UPVALUE1_
      L4_35 = L4_35(L5_36, "name", attribute.pingProgram, "value")
      L3_34 = L4_35
      L4_35 = _UPVALUE0_
      L4_35 = L4_35.NIL
      if L3_34 == L4_35 then
        L4_35 = _UPVALUE0_
        L4_35 = L4_35.FAILURE
        return L4_35
      end
      L4_35 = " 2>&1 "
      options1 = L4_35
      L4_35 = L3_34
      L5_36 = " "
      L4_35 = L4_35 .. L5_36 .. A0_31 .. " " .. options1 .. " > " .. L2_33
      L5_36 = _UPVALUE2_
      L5_36 = L5_36.execute
      L5_36(L4_35)
    end
    L4_35 = db
    L4_35 = L4_35.getAttribute
    L5_36 = _UPVALUE1_
    L4_35 = L4_35(L5_36, "name", attribute.pingFileName, "value")
    L5_36 = util
    L5_36 = L5_36.fileToString
    L5_36 = L5_36(L4_35)
    outputText = L5_36
  else
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.NOT_SUPPORTED
    return L2_33
  end
  L2_33 = outputText
  L3_34 = _UPVALUE0_
  L3_34 = L3_34.NIL
  if L2_33 == L3_34 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.FAILURE
    return L2_33
  end
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.SUCCESS
  L3_34 = outputText
  return L2_33, L3_34
end
function tracerouteGet(A0_37)
  return _UPVALUE0_.NOT_SUPPORTED
end
function tracerouteGetNext(A0_38)
  local L2_39
  L2_39 = _UPVALUE0_
  L2_39 = L2_39.NOT_SUPPORTED
  return L2_39, A0_38
end
function tracerouteSet(A0_40, A1_41)
  local L2_42, L3_43, L4_44
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.NIL
  if A1_41 == L2_42 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.INVALID_ARGUMENT
    return L2_42
  end
  if A1_41 == "start" then
    L2_42 = ""
    L4_44 = A0_40
    L3_43 = A0_40.find
    L3_43 = L3_43(L4_44, ".")
    if L3_43 then
      L3_43 = db
      L3_43 = L3_43.getAttribute
      L4_44 = _UPVALUE1_
      L3_43 = L3_43(L4_44, "name", attribute.tracerouteProgram, "value")
      L2_42 = L3_43
    else
      L3_43 = db
      L3_43 = L3_43.getAttribute
      L4_44 = _UPVALUE1_
      L3_43 = L3_43(L4_44, "name", attribute.traceroute6Program, "value")
      L2_42 = L3_43
    end
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.NIL
    if L2_42 == L3_43 then
      L3_43 = _UPVALUE0_
      L3_43 = L3_43.FAILURE
      return L3_43
    end
    L3_43 = " 2>&1 | grep -v argc"
    L4_44 = L2_42
    L4_44 = L4_44 .. " " .. A0_40 .. L3_43
    cmdOutput = runShellCmd(L4_44)
  else
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.NOT_SUPPORTED
    return L2_42
  end
  L2_42 = cmdOutput
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NIL
  if L2_42 == L3_43 then
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.FAILURE
    L3_43 = cmdOutput
    return L2_42, L3_43
  end
  L2_42 = _UPVALUE0_
  L2_42 = L2_42.SUCCESS
  L3_43 = cmdOutput
  return L2_42, L3_43
end
function dnsLookupGet(A0_45)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dnsLookupGetNext(A0_46)
  local L2_47
  L2_47 = _UPVALUE0_
  L2_47 = L2_47.NOT_SUPPORTED
  return L2_47, A0_46
end
function dnsLookupSet(A0_48, A1_49)
  local L2_50, L3_51, L4_52
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NIL
  if A1_49 == L2_50 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.FAILURE
    return L2_50
  end
  if A1_49 == "start" then
    L2_50 = db
    L2_50 = L2_50.getAttribute
    L3_51 = _UPVALUE1_
    L4_52 = "name"
    L2_50 = L2_50(L3_51, L4_52, attribute.nsLookupProgram, "value")
    L3_51 = _UPVALUE0_
    L3_51 = L3_51.NIL
    if A1_49 == L3_51 then
      L3_51 = _UPVALUE0_
      L3_51 = L3_51.FAILURE
      return L3_51
    end
    L3_51 = db
    L3_51 = L3_51.getAttribute
    L4_52 = _UPVALUE1_
    L3_51 = L3_51(L4_52, "name", attribute.pingFileName, "value")
    L4_52 = _UPVALUE0_
    L4_52 = L4_52.NIL
    if L3_51 == L4_52 then
      L4_52 = _UPVALUE0_
      L4_52 = L4_52.FAILURE
      return L4_52
    end
    L4_52 = _UPVALUE2_
    L4_52 = L4_52.execute
    L4_52(L2_50 .. " " .. A0_48 .. " > " .. L3_51)
    L4_52 = db
    L4_52 = L4_52.getAttribute
    L4_52 = L4_52(_UPVALUE1_, "name", "PING_FILE_NAME", "value")
    outputText = util.fileToString(L4_52)
  else
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.NOT_SUPPORTED
    return L2_50
  end
  L2_50 = outputText
  L3_51 = _UPVALUE0_
  L3_51 = L3_51.NIL
  if L2_50 == L3_51 then
    L2_50 = _UPVALUE0_
    L2_50 = L2_50.FAILURE
    L3_51 = A0_48
    return L2_50, L3_51
  end
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.SUCCESS
  L3_51 = outputText
  return L2_50, L3_51
end
function interfaceGet()
  local L0_53
  L0_53 = db
  L0_53 = L0_53.getAttribute
  L0_53 = L0_53(_UPVALUE0_, attribute.key, attribute.keyValue, attribute.interface)
  if L0_53 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_53
end
function interfaceGetNext(A0_54)
  local L1_55, L2_56
  L1_55 = _UPVALUE0_
  L1_55 = L1_55.NIL
  if A0_54 ~= L1_55 then
    L1_55 = tonumber
    L2_56 = A0_54
    L1_55 = L1_55(L2_56)
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.NIL
  elseif L1_55 == L2_56 then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.FAILURE
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.existsRow
  L2_56 = _UPVALUE1_
  L1_55 = L1_55(L2_56, attribute.key, A0_54)
  if L1_55 == false then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.FAILURE
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.getNextRowId
  L2_56 = A0_54
  L1_55 = L1_55(L2_56, _UPVALUE1_)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if L1_55 == L2_56 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.TABLE_IS_FULL
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L2_56 = L2_56(_UPVALUE1_, attribute.key, L1_55, attribute.interface)
  if L2_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_55
  end
  return _UPVALUE0_.SUCCESS, L1_55, L2_56
end
function interfaceSet(A0_57, A1_58)
  local L3_59
  L3_59 = _UPVALUE0_
  L3_59 = L3_59.NOT_SUPPORTED
  return L3_59, A0_57
end
function packetCaptureGet()
  local L0_60
  L0_60 = db
  L0_60 = L0_60.getAttribute
  L0_60 = L0_60(_UPVALUE0_, attribute.key, attribute.keyValue, attribute.packetCapture)
  if L0_60 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_60
end
function packetCaptureGetNext(A0_61)
  local L1_62, L2_63
  L1_62 = _UPVALUE0_
  L1_62 = L1_62.NIL
  if A0_61 ~= L1_62 then
    L1_62 = tonumber
    L2_63 = A0_61
    L1_62 = L1_62(L2_63)
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.NIL
  elseif L1_62 == L2_63 then
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.INVALID_ARGUMENT
    return L1_62
  end
  L1_62 = db
  L1_62 = L1_62.existsRow
  L2_63 = _UPVALUE1_
  L1_62 = L1_62(L2_63, attribute.key, A0_61)
  if L1_62 == false then
    L1_62 = _UPVALUE0_
    L1_62 = L1_62.INVALID_ARGUMENT
    return L1_62
  end
  L1_62 = db
  L1_62 = L1_62.getNextRowId
  L2_63 = A0_61
  L1_62 = L1_62(L2_63, _UPVALUE1_)
  L2_63 = _UPVALUE0_
  L2_63 = L2_63.NIL
  if L1_62 == L2_63 then
    L2_63 = _UPVALUE0_
    L2_63 = L2_63.TABLE_IS_FULL
    return L2_63
  end
  L2_63 = db
  L2_63 = L2_63.getAttribute
  L2_63 = L2_63(_UPVALUE1_, attribute.key, L1_62, attribute.packetCapture)
  if L2_63 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_62
  end
  return _UPVALUE0_.SUCCESS, L1_62, L2_63
end
function packetCaptureSet(A0_64, A1_65)
  local L2_66, L3_67, L4_68, L5_69
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if A0_64 == L2_66 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.INVALID_ARGUMENT
    return L2_66
  end
  L2_66 = false
  L3_67 = 0
  L4_68 = "ifType = 'bridge'"
  L5_69 = db
  L5_69 = L5_69.getRowsWhere
  L5_69 = L5_69("networkInterface", L4_68)
  if L5_69 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_9_, _FORV_10_ in pairs(L5_69) do
    L3_67 = L3_67 + 1
    if A0_64 == L5_69[L3_67]["networkInterface.LogicalIfName"] then
      L2_66 = true
    end
  end
  if A0_64 ~= "WAN1" and A0_64 ~= "WAN2" and A0_64 ~= "WAN3" and not L2_66 then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_65 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_65 ~= "start" and A1_65 ~= "stop" then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_65 == "start" then
    status = db.setAttribute(_UPVALUE1_, attribute.interface, A0_64, attribute.packetCapture, _UPVALUE2_)
  else
    status = db.setAttribute(_UPVALUE1_, attribute.interface, A0_64, attribute.packetCapture, _UPVALUE3_)
  end
  if status == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_64
  end
  return _UPVALUE0_.SUCCESS, A0_64
end
function packetCaptureGroupGet()
  local L0_70
  L0_70 = db
  L0_70 = L0_70.getTable
  L0_70 = L0_70(_UPVALUE0_, false)
  if L0_70 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_70
end
function runShellCmd(A0_71)
  io.popen(A0_71 .. " 2>&1"):close()
  return (io.popen(A0_71 .. " 2>&1"):read("*a"))
end
;({}).execute = function(A0_72)
  os.execute(A0_72)
end
