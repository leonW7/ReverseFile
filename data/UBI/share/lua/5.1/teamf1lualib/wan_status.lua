local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.status", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/stats_db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).logicalIfName = "LogicalIfName"
;({}).virtualIfName = "VirtualIfName"
;({}).addressFamily = "addressFamily"
;({}).nameserver1 = "nameserver1"
;({}).nameserver2 = "nameserver2"
;({}).nameserver3 = "nameserver3"
;({}).nameserver4 = "nameserver4"
;({}).nextHopGateway = "nextHopGateway"
;({}).interfaceName = "interfaceName"
;({}).macAddress = "macAddress"
;({}).Linkstatus = "Linkstatus"
;({}).Nimfstatus = "Nimfstatus"
;({}).IfStatus = "IfStatus"
;({}).primaryDns = "PrimaryDns"
;({}).secondaryDns = "SecondaryDns"
;({}).rowid = "_ROWID_"
function ipAddressInfoGet(A0_1, A1_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.logicalIfName
  L3_4 = "='"
  L2_3 = L2_3 .. L3_4 .. A0_1 .. "'  and " .. _UPVALUE0_.addressFamily .. " = '" .. A1_2 .. "'"
  L3_4 = db
  L3_4 = L3_4.getRowsWhere
  L3_4 = L3_4(_UPVALUE1_, L2_3)
  if L3_4 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L3_4
end
function dnsServersGet(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.logicalIfName
  L3_8 = " = '"
  L4_9 = A0_5
  L5_10 = "' and "
  L2_7 = L2_7 .. L3_8 .. L4_9 .. L5_10 .. _UPVALUE0_.addressFamily .. " = '" .. A1_6 .. "'"
  L3_8 = {}
  L4_9 = ""
  L5_10 = ""
  L3_8 = db.getRowWhere(_UPVALUE1_, L2_7)
  L4_9 = L3_8[_UPVALUE1_ .. "." .. _UPVALUE0_.nameserver1]
  L5_10 = L3_8[_UPVALUE1_ .. "." .. _UPVALUE0_.nameserver2]
  thirdDnsIps = L3_8[_UPVALUE1_ .. "." .. _UPVALUE0_.nameserver3]
  fourthDnsIps = L3_8[_UPVALUE1_ .. "." .. _UPVALUE0_.nameserver4]
  return _UPVALUE2_.SUCCESS, L4_9, L5_10, thirdDnsIps, fourthDnsIps
end
function gatewayRoutesGet(A0_11)
  local L1_12, L2_13, L3_14
  L1_12 = _UPVALUE0_
  L1_12 = L1_12.logicalIfName
  L2_13 = " = '"
  L3_14 = A0_11
  L1_12 = L1_12 .. L2_13 .. L3_14 .. "'"
  L2_13 = db
  L2_13 = L2_13.getRowsWhere
  L3_14 = _UPVALUE1_
  L2_13 = L2_13(L3_14, L1_12)
  L3_14 = ""
  if L2_13 then
    for _FORV_8_, _FORV_9_ in pairs(L2_13) do
      if L2_13[0 + 1][_UPVALUE1_ .. "." .. _UPVALUE0_.nextHopGateway] ~= _UPVALUE2_.NIL and L2_13[0 + 1][_UPVALUE1_ .. "." .. _UPVALUE0_.nextHopGateway] ~= _UPVALUE2_.EMPTY then
        if L3_14 == "" then
          L3_14 = L3_14 .. L2_13[0 + 1][_UPVALUE1_ .. "." .. _UPVALUE0_.nextHopGateway]
        else
          L3_14 = L3_14 .. ", " .. L2_13[0 + 1][_UPVALUE1_ .. "." .. _UPVALUE0_.nextHopGateway]
        end
      end
    end
  end
  return _UPVALUE2_.SUCCESS, L3_14
end
function macAddressGet(A0_15)
  local L1_16, L2_17, L3_18
  L1_16 = db
  L1_16 = L1_16.getAttribute
  L2_17 = _UPVALUE0_
  L3_18 = _UPVALUE1_
  L3_18 = L3_18.logicalIfName
  L1_16 = L1_16(L2_17, L3_18, A0_15, _UPVALUE1_.interfaceName)
  L2_17 = db
  L2_17 = L2_17.getAttribute
  L3_18 = _UPVALUE0_
  L2_17 = L2_17(L3_18, _UPVALUE1_.logicalIfName, A0_15, _UPVALUE1_.virtualIfName)
  L3_18 = ""
  if L1_16 ~= _UPVALUE2_.NIL then
    if string.sub(L2_17, 1, 3) == "ppp" then
      L3_18 = "00:00:00:00:00:00"
    elseif string.sub(L2_17, 1, 3) == "usb" then
      if io.popen("ifconfig usb0") ~= nil then
        if io.popen("ifconfig usb0"):read() ~= nil then
          L3_18 = io.popen("ifconfig usb0"):read():match("HWaddr ([%:%x]*)")
        else
          L3_18 = "N/A"
        end
        io.popen("ifconfig usb0"):close()
      end
    else
      L3_18 = db.getAttribute(_UPVALUE3_, _UPVALUE1_.interfaceName, L1_16, _UPVALUE1_.macAddress) or ""
    end
  end
  return _UPVALUE2_.SUCCESS, L3_18
end
function optionStatusGet(A0_19)
  local L1_20
  L1_20 = db
  L1_20 = L1_20.getAttribute
  L1_20 = L1_20(_UPVALUE0_, _UPVALUE1_.logicalIfName, A0_19, _UPVALUE1_.IfStatus)
  if L1_20 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_20
end
function linkStateGet(A0_21, A1_22)
  local L2_23, L3_24
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.logicalIfName
  L3_24 = " = '"
  L2_23 = L2_23 .. L3_24 .. A0_21 .. "' and " .. _UPVALUE0_.addressFamily .. " = '" .. A1_22 .. "'"
  L3_24 = db
  L3_24 = L3_24.getAttributeWhere
  L3_24 = L3_24(_UPVALUE1_, L2_23, _UPVALUE0_.Linkstatus)
  if L3_24 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L3_24
end
function connectionStatusGet(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.logicalIfName
  L3_28 = " = '"
  L2_27 = L2_27 .. L3_28 .. A0_25 .. "' and " .. _UPVALUE0_.addressFamily .. " = '" .. A1_26 .. "'"
  L3_28 = stats_db
  L3_28 = L3_28.getAttributeWhere
  L3_28 = L3_28(_UPVALUE1_, L2_27, _UPVALUE0_.Nimfstatus)
  L3_28 = L3_28 or ""
  return _UPVALUE2_.SUCCESS, L3_28
end
