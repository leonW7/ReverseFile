local L0_0
L0_0 = module
L0_0("com.teamf1.bl.diagnostics.network", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/diagnostics_network")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wan_multiwan")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0("teamf1lualib/wan_status")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
;({}).tcpdumpEnabled = "tcpdumpEnabled"
;({}).ifName = "LogicalIfName"
function capturePacketSet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L2_3 = _UPVALUE0_
  L3_4 = ACCESS_LEVEL
  if L3_4 ~= 0 then
    L3_4 = util
    L3_4 = L3_4.appendDebugOut
    L4_5 = "Detected unauthorized access for capture Packet"
    L3_4(L4_5)
    L3_4 = _UPVALUE1_
    L3_4 = L3_4.UNAUTHORIZED
    return L3_4
  end
  L3_4 = A0_1.cookie
  L4_5 = A0_1.ifName
  L5_6 = "/tmp/stats.db"
  if L4_5 == nil then
    L6_7 = util
    L6_7 = L6_7.appenDebugOut
    L6_7("Set : Invalid Cookie")
    L6_7 = _UPVALUE1_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  if L3_4 == nil then
    L6_7 = util
    L6_7 = L6_7.appenDebugOut
    L6_7("GetNext : Invalid packet capture status ")
    L6_7 = _UPVALUE1_
    L6_7 = L6_7.BAD_PARAMETER
    return L6_7
  end
  L6_7 = db
  L6_7 = L6_7.getAttribute
  L6_7 = L6_7(_UPVALUE2_, _UPVALUE3_, _UPVALUE4_, _UPVALUE5_)
  if L6_7 ~= nil then
    util.appendDebugOut("Exec = " .. os.execute(L6_7 .. "  " .. L5_6 .. " " .. _UPVALUE6_ .. " " .. _UPVALUE7_))
    util.appendDebugOut("Exec = " .. os.execute(L6_7 .. "  " .. L5_6 .. " " .. _UPVALUE6_ .. " " .. _UPVALUE8_))
    util.appendDebugOut("Exec = " .. os.execute(L6_7 .. "  " .. L5_6 .. " " .. _UPVALUE9_ .. " " .. _UPVALUE7_))
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
      util.appendDebugOut("Exec = " .. os.execute(L6_7 .. "  " .. L5_6 .. " " .. _UPVALUE10_ .. " " .. _UPVALUE7_))
    end
  end
  L6_7 = db.getAttribute(_UPVALUE2_, _UPVALUE3_, _UPVALUE11_, _UPVALUE5_)
  if L6_7 ~= nil then
    util.appendDebugOut("Exec = " .. os.execute(L6_7 .. "  " .. DB_FILE_NAME .. " " .. _UPVALUE12_))
  end
  _UPVALUE13_.start()
  if L3_4 == _UPVALUE14_ then
    if L4_5 == _UPVALUE6_ then
      L1_2, L2_3 = _UPVALUE15_.linkStateGet(L4_5, _UPVALUE7_)
      if L1_2 ~= _UPVALUE1_.SUCCESS then
        return L1_2
      end
    end
    if L4_5 == _UPVALUE9_ then
      if UNIT_NAME == "DSR-250N" or UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-150N" or UNIT_NAME == "DSR-150" then
        L1_2, L2_3 = _UPVALUE15_.linkStateGet(L4_5, _UPVALUE7_)
        if L1_2 ~= _UPVALUE1_.SUCCESS then
          return L1_2
        end
      else
        L1_2, dummyCookie, configDmz = _UPVALUE16_.configPortUsageGet()
        if L1_2 ~= _UPVALUE1_.SUCCESS then
          return L1_2
        end
        L1_2, L2_3 = _UPVALUE15_.linkStateGet(configDmz, _UPVALUE7_)
        if L1_2 ~= _UPVALUE1_.SUCCESS then
          return L1_2
        end
      end
    end
    if (UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx") and L4_5 == _UPVALUE10_ then
      L1_2, L2_3 = _UPVALUE15_.linkStateGet(L4_5, _UPVALUE7_)
      if L1_2 ~= _UPVALUE1_.SUCCESS then
        return L1_2
      end
    end
  end
  if L2_3 == _UPVALUE0_ then
    L1_2, cookie = _UPVALUE17_.packetCaptureSet(L4_5, L3_4)
    if L1_2 ~= _UPVALUE1_.SUCCESS then
      util.appendDebugOut("Error in Configuring values in capture Packets page" .. L1_2)
      _UPVALUE13_.abort()
      return L1_2
    end
  else
    _UPVALUE13_.abort()
    return _UPVALUE18_.INTERFACE_DOWN
  end
  _UPVALUE13_.complete()
  return L1_2, cookie
end
function capturePacketGet()
  local L0_8, L1_9
  returnCode, L0_8, L1_9 = _UPVALUE0_.packetCaptureGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_8, L1_9
end
function capturePacketGetNext(A0_10)
  local L1_11, L2_12, L3_13
  L1_11 = A0_10[_UPVALUE0_ .. "." .. _UPVALUE1_.ifName]
  if L1_11 == nil then
    util.appenDebugOut("GetNext : Invalid Cookie ")
    return _UPVALUE2_.BAD_PARAMETER
  end
  returnCode, L3_13, L2_12 = _UPVALUE3_.packetCaptureGetNext(L1_11)
  if returnCode ~= _UPVALUE2_.SUCCESS then
    return returnCode
  end
  return returnCode, L3_13, L2_12
end
function lanInterfaceGet()
  local L0_14, L1_15, L2_16, L3_17
  L0_14 = 0
  L1_15 = {}
  L2_16 = "ifType = 'bridge'"
  L3_17 = db
  L3_17 = L3_17.getRowsWhere
  L3_17 = L3_17("networkInterface", L2_16)
  if L3_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_17) do
    L0_14 = L0_14 + 1
    L1_15[L0_14] = L3_17[L0_14]["networkInterface.LogicalIfName"]
  end
  return _UPVALUE0_.SUCCESS, L1_15
end
function wanInterfaceGet()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23
  L4_22 = {}
  L5_23 = _UPVALUE0_
  L2_20, L0_18, L1_19 = _UPVALUE1_.multiWanModeGet()
  if L2_20 ~= _UPVALUE2_.SUCCESS then
    return L2_20
  end
  if L1_19 == _UPVALUE3_ then
    L2_20, L0_18, L3_21 = _UPVALUE1_.defaultWanPortGet()
    if L2_20 ~= _UPVALUE2_.SUCCESS then
      return L2_20
    end
    L2_20, L0_18, L5_23 = _UPVALUE4_.configPortUsageGet()
    if L2_20 ~= _UPVALUE2_.SUCCESS then
      return L2_20
    end
    if L5_23 ~= _UPVALUE5_ then
      if L3_21 == _UPVALUE6_ then
        L4_22[_UPVALUE7_] = L3_21
      else
        L4_22[_UPVALUE8_] = L3_21
      end
      L5_23 = _UPVALUE0_
    else
      L4_22[_UPVALUE7_] = _UPVALUE6_
      L4_22[_UPVALUE9_] = _UPVALUE10_
    end
  else
    L4_22[_UPVALUE7_] = _UPVALUE6_
    L4_22[_UPVALUE8_] = _UPVALUE11_
    if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" then
      L4_22[_UPVALUE12_] = _UPVALUE13_
    end
  end
  return _UPVALUE2_.SUCCESS, L4_22, L5_23
end
function capTureInfo()
  local L0_24, L1_25, L2_26
  L2_26 = "DUMMY"
  L1_25, L0_24 = _UPVALUE0_.packetCaptureGroupGet()
  if L1_25 ~= _UPVALUE1_.SUCCESS then
    return L1_25
  end
  for _FORV_6_, _FORV_7_ in pairs(L0_24) do
    if _FORV_7_.tcpdumpEnabled == "1" then
      L2_26 = _FORV_7_.LogicalIfName
    end
  end
  if L2_26 == _UPVALUE2_ then
    L1_25, dummyCookie, configDmz = _UPVALUE3_.configPortUsageGet()
    if L1_25 ~= _UPVALUE1_.SUCCESS then
      return L1_25
    end
    if configDmz == _UPVALUE4_ then
      L2_26 = _UPVALUE5_
      return _UPVALUE1_.SUCCESS, L2_26, _UPVALUE2_
    end
  end
  return _UPVALUE1_.SUCCESS, L2_26
end
function capturePacketDownload()
  local L0_27
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected unauthorized access for capture Packet")
    return _UPVALUE0_.UNAUTHORIZED
  end
  return _UPVALUE0_.SUCCESS
end
