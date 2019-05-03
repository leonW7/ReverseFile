local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.configurableport", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/nimf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).configPortUsage = "LogicalIfName"
;({}).interfaceName = "LogicalIfName"
;({}).groupID = "IfGroupId"
;({}).name = "name"
;({}).value = "value"
;({}).addressFamily = "AddressFamily"
;({}).dhcpInterface = "logicalIfName"
;({}).dhcpEnable = "dhcpEnabled"
;({}).oldState = "oldState"
;({}).gateway = "LocalGateway"
;({}).profileKey = "ProfileKey"
;({}).configDefault = "ConfigDefault"
;({}).routeInterface = "interfaceName"
;({}).mirroringEnable = "MirroringEnable"
;({}).capturePort = "CapturePort"
;({}).multiWanMode = "Wanmode"
;({}).defaultWanPort = "DedicatedLogicalIfName"
;({}).failOverPriLogicalIfName = "FailoverPriLogicalIfName"
;({}).failOverSecLogicalIfName = "FailoverSecLogicalIfName"
function configPortUsageGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.configPortUsage)
  if L0_1 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L0_1
end
function configPortUsageGetNext(A0_2)
  local L2_3, L3_4
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  L3_4 = 0
  return L2_3, L3_4, 0
end
function configPortUsageSet(A0_5, A1_6)
  local L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  if A1_6 == L2_7 then
    L2_7 = _UPVALUE0_
    L2_7 = L2_7.INVALID_ARGUMENT
    return L2_7
  end
  L2_7 = _UPVALUE1_
  if A1_6 ~= L2_7 then
    L2_7 = _UPVALUE2_
    if A1_6 ~= L2_7 then
      L2_7 = _UPVALUE0_
      L2_7 = L2_7.INVALID_ARGUMENT
      return L2_7
    end
  end
  L2_7 = _UPVALUE2_
  if A1_6 == L2_7 then
    L2_7 = wanmodeCheck
    L2_7 = L2_7()
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.SUCCESS
    if L2_7 ~= L3_8 then
      return L2_7
    end
  end
  L2_7, L3_8 = nil, nil
  L4_9 = checkOptionwanconfTables
  L5_10 = A1_6
  L5_10 = L4_9(L5_10)
  L3_8 = L5_10
  L2_7 = L4_9
  L4_9 = _UPVALUE0_
  L4_9 = L4_9.SUCCESS
  if L2_7 ~= L4_9 then
    L4_9 = "Please remove Optional WAN Configurations from "
    L5_10 = L3_8
    L4_9 = L4_9 .. L5_10
    L5_10 = L2_7
    L6_11 = L4_9
    return L5_10, L6_11
  end
  L4_9 = _UPVALUE3_
  L5_10 = " = '"
  L6_11 = _UPVALUE1_
  L7_12 = "' and "
  L8_13 = _UPVALUE4_
  L9_14 = " = '"
  L10_15 = _UPVALUE5_
  L11_16 = "'"
  L4_9 = L4_9 .. L5_10 .. L6_11 .. L7_12 .. L8_13 .. L9_14 .. L10_15 .. L11_16
  L5_10 = db
  L5_10 = L5_10.existsRowWhere
  L6_11 = _UPVALUE6_
  L7_12 = L4_9
  L5_10 = L5_10(L6_11, L7_12)
  if L5_10 then
    L6_11 = configPortUsageGet
    L8_13 = L6_11()
    L9_14 = _UPVALUE0_
    L9_14 = L9_14.SUCCESS
    if L6_11 ~= L9_14 then
      L9_14 = _UPVALUE0_
      L9_14 = L9_14.FAILURE
      return L9_14
    end
    if L8_13 ~= A1_6 then
      L9_14 = _UPVALUE7_
      L9_14 = L9_14.PORT_IN_USE_CAPTURE_PACKET
      return L9_14
    end
  end
  L6_11 = _UPVALUE8_
  L7_12 = _UPVALUE9_
  L8_13 = _UPVALUE2_
  if A1_6 == L8_13 then
    L7_12 = _UPVALUE10_
  end
  L8_13 = {}
  L9_14 = _UPVALUE11_
  L10_15 = "."
  L11_16 = _UPVALUE12_
  L11_16 = L11_16.interfaceName
  L9_14 = L9_14 .. L10_15 .. L11_16
  L8_13[L9_14] = A1_6
  L9_14 = _UPVALUE11_
  L10_15 = "."
  L11_16 = _UPVALUE12_
  L11_16 = L11_16.groupID
  L9_14 = L9_14 .. L10_15 .. L11_16
  L8_13[L9_14] = L7_12
  L9_14 = db
  L9_14 = L9_14.update
  L10_15 = _UPVALUE11_
  L11_16 = L8_13
  L12_17 = L6_11
  L9_14 = L9_14(L10_15, L11_16, L12_17)
  L10_15 = nil
  L11_16 = db
  L11_16 = L11_16.setAttribute
  L12_17 = _UPVALUE13_
  L11_16 = L11_16(L12_17, _UPVALUE14_, _UPVALUE15_, _UPVALUE12_.configPortUsage, A1_6)
  L10_15 = L11_16
  L11_16 = nil
  L12_17 = db
  L12_17 = L12_17.getRow
  L12_17 = L12_17(_UPVALUE16_, _UPVALUE12_.dhcpInterface, _UPVALUE2_)
  if L12_17 ~= _UPVALUE0_.NIL then
    if A1_6 ~= _UPVALUE2_ and L12_17[_UPVALUE16_ .. "." .. _UPVALUE12_.dhcpEnable] == _UPVALUE5_ then
      L12_17[_UPVALUE16_ .. "." .. _UPVALUE12_.oldState] = _UPVALUE5_
      L12_17[_UPVALUE16_ .. "." .. _UPVALUE12_.dhcpEnable] = _UPVALUE17_
    end
    L11_16 = db.update(_UPVALUE16_, L12_17, L12_17[_UPVALUE16_ .. "." .. _UPVALUE14_])
  end
  if L10_15 == _UPVALUE0_.FALSE or L9_14 == _UPVALUE0_.NIL or L11_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_5
  end
  return _UPVALUE0_.SUCCESS, A0_5
end
function checkOptionwanconfTables(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29
  L1_19 = db
  L1_19 = L1_19.getAttribute
  L2_20 = _UPVALUE0_
  L3_21 = _UPVALUE1_
  L4_22 = _UPVALUE2_
  L5_23 = _UPVALUE3_
  L5_23 = L5_23.configPortUsage
  L1_19 = L1_19(L2_20, L3_21, L4_22, L5_23)
  L2_20 = {}
  L3_21 = _UPVALUE3_
  L3_21 = L3_21.profileKey
  L4_22 = " = 2 and "
  L5_23 = _UPVALUE3_
  L5_23 = L5_23.configDefault
  L6_24 = " != 1"
  L3_21 = L3_21 .. L4_22 .. L5_23 .. L6_24
  L4_22 = db
  L4_22 = L4_22.getRowsWhere
  L5_23 = _UPVALUE4_
  L6_24 = L3_21
  L4_22 = L4_22(L5_23, L6_24)
  L2_20 = L4_22
  L4_22 = db
  L4_22 = L4_22.getRowsWhere
  L5_23 = _UPVALUE5_
  L6_24 = _UPVALUE6_
  L4_22 = L4_22(L5_23, L6_24)
  L5_23 = db
  L5_23 = L5_23.getRowsWhere
  L6_24 = _UPVALUE7_
  L7_25 = _UPVALUE3_
  L7_25 = L7_25.gateway
  L8_26 = " = 2"
  L7_25 = L7_25 .. L8_26
  L5_23 = L5_23(L6_24, L7_25)
  L6_24 = db
  L6_24 = L6_24.getRowsWhere
  L7_25 = _UPVALUE8_
  L8_26 = _UPVALUE3_
  L8_26 = L8_26.routeInterface
  L9_27 = " = '"
  L10_28 = _UPVALUE9_
  L11_29 = "'"
  L8_26 = L8_26 .. L9_27 .. L10_28 .. L11_29
  L6_24 = L6_24(L7_25, L8_26)
  L7_25 = db
  L7_25 = L7_25.getRowsWhere
  L8_26 = _UPVALUE10_
  L9_27 = _UPVALUE3_
  L9_27 = L9_27.gateway
  L10_28 = " = 1"
  L9_27 = L9_27 .. L10_28
  L7_25 = L7_25(L8_26, L9_27)
  L8_26 = db
  L8_26 = L8_26.getRowsWhere
  L9_27 = _UPVALUE11_
  L10_28 = _UPVALUE3_
  L10_28 = L10_28.mirroringEnable
  L11_29 = " = 1 and "
  L10_28 = L10_28 .. L11_29 .. _UPVALUE3_.capturePort .. " = '" .. _UPVALUE12_ .. "'"
  L8_26 = L8_26(L9_27, L10_28)
  L9_27 = _UPVALUE9_
  if L1_19 == L9_27 then
    L9_27 = _UPVALUE9_
    if A0_18 ~= L9_27 then
      L9_27 = 0
      L10_28 = {}
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L2_20 ~= L11_29 then
        L11_29 = #L2_20
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE14_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L4_22 ~= L11_29 then
        L11_29 = #L4_22
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE15_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L5_23 ~= L11_29 then
        L11_29 = #L5_23
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE16_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L6_24 ~= L11_29 then
        L11_29 = #L6_24
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE17_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L7_25 ~= L11_29 then
        L11_29 = #L7_25
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE18_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = _UPVALUE13_
      L11_29 = L11_29.NIL
      if L8_26 ~= L11_29 then
        L11_29 = #L8_26
        if L11_29 ~= 0 then
          L9_27 = L9_27 + 1
          L11_29 = _UPVALUE19_
          L10_28[L9_27] = L11_29
        end
      end
      L11_29 = L10_28[1]
      L11_29 = L11_29 or ""
      if L9_27 ~= 1 then
        for _FORV_15_ = 2, L9_27 do
          if _FORV_15_ ~= L9_27 then
            L11_29 = L11_29 .. ", " .. L10_28[_FORV_15_]
          else
            L11_29 = L11_29 .. " and " .. L10_28[_FORV_15_]
          end
        end
      end
      if L9_27 ~= 0 then
        return _UPVALUE20_.PORT_IN_USE, L11_29
      end
    end
  end
  L9_27 = _UPVALUE13_
  L9_27 = L9_27.SUCCESS
  return L9_27
end
function dummyUpdate(A0_30)
  local L1_31, L2_32, L3_33, L4_34
  L1_31 = db
  L1_31 = L1_31.getAttribute
  L2_32 = _UPVALUE0_
  L3_33 = _UPVALUE1_
  L4_34 = _UPVALUE2_
  L1_31 = L1_31(L2_32, L3_33, L4_34, _UPVALUE3_.configPortUsage)
  if A0_30 ~= L1_31 then
    L2_32 = _UPVALUE4_
    L2_32 = L2_32.FALSE
    L3_33 = _UPVALUE4_
    L3_33 = L3_33.FALSE
    L4_34 = _UPVALUE5_
    if A0_30 == L4_34 then
      L4_34 = db
      L4_34 = L4_34.getRowWhere
      L4_34 = L4_34(_UPVALUE6_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE5_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)
      if L4_34 ~= _UPVALUE4_.NIL then
        L2_32 = db.setAttribute(_UPVALUE6_, _UPVALUE1_, L4_34[_UPVALUE6_ .. "." .. _UPVALUE1_], _UPVALUE3_.interfaceName, L4_34[_UPVALUE6_ .. "." .. _UPVALUE3_.interfaceName])
      end
    else
      L4_34 = _UPVALUE8_
      if A0_30 == L4_34 then
        L4_34 = db
        L4_34 = L4_34.getRowWhere
        L4_34 = L4_34(_UPVALUE9_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE8_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)
        if L4_34 ~= _UPVALUE4_.NIL then
          L2_32 = db.setAttribute(_UPVALUE9_, _UPVALUE1_, L4_34[_UPVALUE9_ .. "." .. _UPVALUE1_], _UPVALUE3_.interfaceName, L4_34[_UPVALUE9_ .. "." .. _UPVALUE3_.interfaceName])
        end
      end
    end
    L4_34 = db
    L4_34 = L4_34.getAttribute
    L4_34 = L4_34(_UPVALUE10_, _UPVALUE3_.name, _UPVALUE11_, _UPVALUE3_.value)
    if L4_34 ~= _UPVALUE4_.NIL then
      util.appendDebugOut("Exec = " .. os.execute(L4_34 .. " " .. A0_30 .. " " .. L1_31))
    end
    if L1_31 == _UPVALUE5_ then
      if db.getRowWhere(_UPVALUE6_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE5_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_) ~= _UPVALUE4_.NIL then
        L3_33 = db.setAttribute(_UPVALUE6_, _UPVALUE1_, db.getRowWhere(_UPVALUE6_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE5_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)[_UPVALUE6_ .. "." .. _UPVALUE1_], _UPVALUE3_.interfaceName, db.getRowWhere(_UPVALUE6_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE5_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)[_UPVALUE6_ .. "." .. _UPVALUE3_.interfaceName])
      end
    elseif L1_31 == _UPVALUE8_ and db.getRowWhere(_UPVALUE9_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE8_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_) ~= _UPVALUE4_.NIL then
      L3_33 = db.setAttribute(_UPVALUE9_, _UPVALUE1_, db.getRowWhere(_UPVALUE9_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE8_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)[_UPVALUE9_ .. "." .. _UPVALUE1_], _UPVALUE3_.interfaceName, db.getRowWhere(_UPVALUE9_, _UPVALUE3_.interfaceName .. " = '" .. _UPVALUE8_ .. "' AND " .. _UPVALUE3_.addressFamily .. " = " .. _UPVALUE7_)[_UPVALUE9_ .. "." .. _UPVALUE3_.interfaceName])
    end
    if L2_32 == _UPVALUE4_.FALSE or L3_33 == _UPVALUE4_.FALSE then
      return _UPVALUE12_.DUMMY_UPDATE_FAILURE, cookie
    end
  end
  L2_32 = _UPVALUE4_
  L2_32 = L2_32.SUCCESS
  return L2_32
end
function wanmodeCheck()
  if db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  if db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] ~= nil and db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] == "0" then
    if db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.defaultWanPort] ~= nil and db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.defaultWanPort] == _UPVALUE5_ then
      return _UPVALUE6_.WAN2_SINGLE_WAN_PORT
    end
  elseif db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] ~= nil and db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] == "2" then
    if db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.failOverPriLogicalIfName] ~= nil and db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.failOverPriLogicalIfName] == _UPVALUE5_ or db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.failOverSecLogicalIfName] ~= nil and db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.failOverSecLogicalIfName] == _UPVALUE5_ then
      return _UPVALUE6_.WAN2_AUTOROLLOVER_WAN_PORT
    end
  elseif db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] ~= nil and (db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] == "1" or db.getRow(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)[_UPVALUE0_ .. "." .. _UPVALUE4_.multiWanMode] == "3") then
    return _UPVALUE6_.WAN2_LOAD_BALANCING_WAN_PORT
  end
  return _UPVALUE3_.SUCCESS
end
function dmzRows()
  local L0_35
  L0_35 = db.getRowWhere(_UPVALUE0_, _UPVALUE1_.interfaceName .. " = '" .. _UPVALUE2_ .. "' AND " .. _UPVALUE1_.addressFamily .. " = " .. _UPVALUE3_)
  return L0_35
end
