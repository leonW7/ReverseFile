local L0_0
L0_0 = module
L0_0("com.teamf1.core.statistics.activeinfo", package.seeall)
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
;({}).connectionStatus = "ConnectionStatus"
;({}).portName = "portName"
;({}).ifStatus = "IfStatus"
;({}).dummy = "dummy"
function icmpReceivedGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L1_2 = _UPVALUE0_
  L2_3 = "|"
  L3_4 = _UPVALUE1_
  L4_5 = "| awk '{print $1}'"
  L1_2 = L1_2 .. L2_3 .. L3_4 .. L4_5 .. " > " .. _UPVALUE2_
  L2_3 = _UPVALUE3_
  L2_3 = L2_3.execute
  L3_4 = L1_2
  L2_3 = L2_3(L3_4)
  status = L2_3
  L2_3 = assert
  L3_4 = io
  L3_4 = L3_4.open
  L4_5 = _UPVALUE2_
  L4_5 = L3_4(L4_5, "r")
  L2_3 = L2_3(L3_4, L4_5, L3_4(L4_5, "r"))
  L4_5 = L2_3
  L3_4 = L2_3.read
  L3_4 = L3_4(L4_5, "*all")
  L4_5 = L2_3.close
  L4_5(L2_3)
  L4_5 = {}
  L4_5 = fileToString(L3_4)
  if L4_5 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS, 1, L4_5
end
function icmpReceivedGetNext(A0_6)
  local L2_7
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  return L2_7, A0_6
end
function icmpReceivedSet(A0_8, A1_9)
  local L3_10
  L3_10 = _UPVALUE0_
  L3_10 = L3_10.NOT_SUPPORTED
  return L3_10, A0_8
end
function activeVpnTunnelsGet()
  local L0_11, L1_12
  L1_12 = db
  L1_12 = L1_12.getAttribute
  L1_12 = L1_12(ConnnectionStatusTable, _UPVALUE0_.connectionStatus, "Connected", "count(*)")
  if L1_12 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L1_12
end
function activeVpnTunnelsGetNext(A0_13)
  local L2_14
  L2_14 = _UPVALUE0_
  L2_14 = L2_14.NOT_SUPPORTED
  return L2_14, A0_13
end
function activeVpnTunnelsSet(A0_15, A1_16)
  local L3_17
  L3_17 = _UPVALUE0_
  L3_17 = L3_17.NOT_SUPPORTED
  return L3_17, A0_15
end
function availableVlansGet()
  local L0_18, L1_19, L2_20, L3_21
  L1_19 = db
  L1_19 = L1_19.getTable
  L2_20 = _UPVALUE0_
  L1_19 = L1_19(L2_20)
  L2_20 = 0
  L3_21 = 0
  for _FORV_7_, _FORV_8_ in pairs(L1_19) do
    L2_20 = L2_20 + 1
    if L1_19[L2_20][_UPVALUE0_ .. "." .. _UPVALUE1_.portName] == _UPVALUE1_.dummy then
      L3_21 = L3_21 + 1
    end
  end
  if L3_21 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L3_21
end
function availableVlansGetNext(A0_22)
  local L2_23
  L2_23 = _UPVALUE0_
  L2_23 = L2_23.NOT_SUPPORTED
  return L2_23, A0_22
end
function availableVlansSet(A0_24, A1_25)
  local L3_26
  L3_26 = _UPVALUE0_
  L3_26 = L3_26.FAILURE
  return L3_26, A0_24
end
function activeInterfacesGet()
  local L0_27, L1_28, L2_29
  L0_27 = db
  L0_27 = L0_27.getTable
  L1_28 = _UPVALUE0_
  L0_27 = L0_27(L1_28)
  L1_28 = 0
  L2_29 = 0
  for _FORV_6_, _FORV_7_ in pairs(L0_27) do
    L1_28 = L1_28 + 1
    if L0_27[L1_28][_UPVALUE0_ .. "." .. _UPVALUE1_.ifStatus] == _UPVALUE2_ then
      L2_29 = L2_29 + 1
    end
  end
  if L2_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L2_29
end
function activeInterfacesGetNext(A0_30)
  local L2_31
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.NOT_SUPPORTED
  return L2_31, A0_30
end
function activeInterfacesSet(A0_32, A1_33)
  local L3_34
  L3_34 = _UPVALUE0_
  L3_34 = L3_34.NOT_SUPPORTED
  return L3_34, A0_32
end
function miscDataGet()
  local L0_35, L1_36, L2_37, L3_38, L4_39, L5_40, L6_41, L7_42, L8_43
  L0_35 = db
  L0_35 = L0_35.getTable
  L1_36 = _UPVALUE0_
  L0_35 = L0_35(L1_36)
  L1_36 = 0
  L2_37 = 0
  for L6_41, L7_42 in L3_38(L4_39) do
    L1_36 = L1_36 + 1
    if L8_43[_UPVALUE0_ .. "." .. _UPVALUE1_.portName] == _UPVALUE1_.dummy then
      L2_37 = L2_37 + 1
    end
  end
  for _FORV_9_, _FORV_10_ in L6_41(L7_42) do
  end
  status = L7_42
  icmpReceivedCount = L8_43
  if L8_43 == "" then
    icmpReceivedCount = L8_43
  end
  L8_43(L7_42)
  if L2_37 == _UPVALUE8_.NIL or L5_40 == _UPVALUE8_.NIL or icmpReceivedCount == _UPVALUE8_.NIL or L8_43 == _UPVALUE8_.NIL then
    return _UPVALUE8_.FAILURE
  end
  return _UPVALUE8_.SUCCESS, 1, icmpReceivedCount, L8_43, L2_37, L5_40
end
function miscDataGetNext(A0_44)
  local L2_45
  L2_45 = _UPVALUE0_
  L2_45 = L2_45.NOT_SUPPORTED
  return L2_45, A0_44
end
function miscDataSet(A0_46, A1_47, A2_48, A3_49, A4_50)
  local L6_51
  L6_51 = _UPVALUE0_
  L6_51 = L6_51.NOT_SUPPORTED
  return L6_51, A0_46
end
function miscDataCreate(A0_52, A1_53, A2_54, A3_55)
  return _UPVALUE0_.NOT_SUPPORTED
end
function miscDataDelete(A0_56)
  local L1_57
  L1_57 = NOT_SUPPORTED
  return L1_57
end
;({}).execute = function(A0_58)
  status = os.execute(A0_58)
  return status
end
