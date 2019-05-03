local L0_0
L0_0 = module
L0_0("com.teamf1.core.accounting", package.seeall)
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
userAccountingEnableTbl = "userAccountingEnable"
radAcctRouteTable = "radAcctRouteTbl"
radClientTable = "radiusClient"
wanModeTbl = "WanMode"
ifStaticTbl = "ifStatic"
;({}).captivePortal = "captivePortal"
;({}).interimInterval = "interimInterval"
;({}).nasIfaceName = "routeIfaceName"
;({}).routeIp = "routeIp"
;({}).routeIface = "routeIface"
;({}).serverIp = "serverIp"
;({}).logicalIface = "LogicalIfName"
;({}).staticIp = "StaticIp"
;({}).netmask = "NetMask"
;({}).acctserver = "acctserver"
;({}).wanMode = "Wanmode"
function accountingSet(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7, L7_8
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.NIL
  if A1_2 == L4_5 then
    L4_5 = _UPVALUE0_
    L4_5 = L4_5.INVALID_ARGUMENT
    return L4_5
  end
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.NIL
  if A2_3 == L4_5 then
    L4_5 = _UPVALUE0_
    L4_5 = L4_5.INVALID_ARGUMENT
    return L4_5
  end
  L4_5 = tonumber
  L5_6 = A2_3
  L4_5 = L4_5(L5_6)
  L5_6 = _UPVALUE1_
  if not (L4_5 < L5_6) then
    L5_6 = _UPVALUE2_
  elseif L4_5 > L5_6 then
    L5_6 = _UPVALUE0_
    L5_6 = L5_6.INVALID_ARGUMENT
    return L5_6
  end
  L5_6 = db
  L5_6 = L5_6.getAttribute
  L6_7 = wanModeTbl
  L7_8 = _UPVALUE3_
  L5_6 = L5_6(L6_7, L7_8, A0_1, _UPVALUE4_.wanMode)
  L6_7 = tonumber
  L7_8 = L5_6
  L6_7 = L6_7(L7_8)
  L7_8 = _UPVALUE5_
  if L6_7 ~= L7_8 then
    L6_7 = tonumber
    L7_8 = L5_6
    L6_7 = L6_7(L7_8)
    L7_8 = _UPVALUE6_
  elseif L6_7 == L7_8 then
    L6_7 = _UPVALUE0_
    L6_7 = L6_7.NIL
    if A3_4 == L6_7 then
      L6_7 = _UPVALUE0_
      L6_7 = L6_7.INVALID_ARGUMENT
      return L6_7
    end
  end
  L6_7 = {}
  L7_8 = userAccountingEnableTbl
  L7_8 = L7_8 .. "." .. _UPVALUE4_.captivePortal
  L6_7[L7_8] = A1_2
  L7_8 = userAccountingEnableTbl
  L7_8 = L7_8 .. "." .. _UPVALUE4_.interimInterval
  L6_7[L7_8] = A2_3
  L7_8 = userAccountingEnableTbl
  L7_8 = L7_8 .. "." .. _UPVALUE4_.nasIfaceName
  L6_7[L7_8] = A3_4
  L7_8 = nil
  if db.existsRow(userAccountingEnableTbl, _UPVALUE3_, A0_1) then
    L7_8 = db.update(userAccountingEnableTbl, L6_7, A0_1)
  else
    L7_8 = db.insert(userAccountingEnableTbl, L6_7)
  end
  if not L7_8 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, A0_1
end
function accountingGetAll()
  local L0_9, L1_10, L2_11, L3_12, L4_13
  L0_9 = db
  L0_9 = L0_9.getRow
  L1_10 = userAccountingEnableTbl
  L2_11 = _UPVALUE0_
  L3_12 = _UPVALUE1_
  L0_9 = L0_9(L1_10, L2_11, L3_12)
  L1_10, L2_11, L3_12, L4_13 = nil, nil, nil, nil
  if L0_9 == _UPVALUE2_.NIL then
    L0_9 = {}
    L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.captivePortal] = _UPVALUE4_
    L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.interimInterval] = _UPVALUE5_
    L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.nasIfaceName] = _UPVALUE6_
  end
  L1_10 = L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.captivePortal]
  L2_11 = L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.interimInterval]
  L3_12 = L0_9[userAccountingEnableTbl .. "." .. _UPVALUE3_.nasIfaceName]
  L4_13 = db.getAttribute(wanModeTbl, _UPVALUE0_, _UPVALUE1_, _UPVALUE3_.wanMode)
  return _UPVALUE2_.SUCCESS, L1_10, L2_11, L3_12, L4_13
end
function accountingRouteTblUpdate(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20, L7_21, L8_22, L9_23, L10_24, L11_25, L12_26, L13_27
  L5_19 = db
  L5_19 = L5_19.getTable
  L5_19 = L5_19(L6_20, L7_21)
  for L9_23, L10_24 in L6_20(L7_21) do
    L3_17 = 0
    L11_25 = {}
    L12_26 = _UPVALUE0_
    L12_26 = L12_26.ipv4SingleMaskCheck
    L13_27 = A0_14
    L12_26 = L12_26(L13_27, L10_24[_UPVALUE1_.acctserver], A1_15)
    L4_18 = L12_26
    L12_26 = _UPVALUE2_
    L12_26 = L12_26.SUCCESS
    if L4_18 == L12_26 then
      L3_17 = 1
    end
    if L3_17 == 1 then
      L12_26 = radAcctRouteTable
      L13_27 = "."
      L12_26 = L12_26 .. L13_27 .. _UPVALUE1_.routeIp
      L11_25[L12_26] = A0_14
      L12_26 = radAcctRouteTable
      L13_27 = "."
      L12_26 = L12_26 .. L13_27 .. _UPVALUE1_.routeIface
      L13_27 = _UPVALUE3_
      L13_27 = L13_27 .. A2_16
      L11_25[L12_26] = L13_27
      L12_26 = db
      L12_26 = L12_26.update
      L13_27 = radAcctRouteTable
      L12_26(L13_27, L11_25, L10_24[_UPVALUE4_])
    else
      L12_26 = _UPVALUE1_
      L12_26 = L12_26.serverIp
      L13_27 = " = '"
      L12_26 = L12_26 .. L13_27 .. L10_24[_UPVALUE1_.acctserver] .. "' AND " .. _UPVALUE1_.routeIface .. " = '" .. _UPVALUE3_ .. A2_16 .. "'"
      L13_27 = db
      L13_27 = L13_27.getRowsWhere
      L13_27 = L13_27(radAcctRouteTable, L12_26)
      if L13_27 then
        for _FORV_17_, _FORV_18_ in pairs(L13_27) do
          L11_25[radAcctRouteTable .. "." .. _UPVALUE1_.routeIp] = _UPVALUE5_
          L11_25[radAcctRouteTable .. "." .. _UPVALUE1_.routeIface] = _UPVALUE6_
          db.update(radAcctRouteTable, L11_25, _FORV_18_[radAcctRouteTable .. "." .. _UPVALUE4_])
        end
      end
    end
  end
  return L6_20
end
function accountingVlanServerRouteTblUpdate(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L9_37, L10_38, L11_39, L12_40, L13_41, L14_42, L15_43, L16_44
  L6_34 = _UPVALUE0_
  L6_34 = L6_34.logicalIface
  L7_35 = " LIKE 'LAN%' AND AddressFamily = 2"
  L6_34 = L6_34 .. L7_35
  L7_35 = db
  L7_35 = L7_35.getRowsWhere
  L8_36 = ifStaticTbl
  L7_35 = L7_35(L8_36, L9_37)
  if L7_35 == nil then
    L8_36 = _UPVALUE1_
    L8_36 = L8_36.FAILURE
    return L8_36
  end
  L8_36 = #L7_35
  if L8_36 ~= 0 then
    L8_36 = #L7_35
  elseif L8_36 == "" then
    L8_36 = _UPVALUE1_
    L8_36 = L8_36.FAILURE
    return L8_36
  end
  L8_36 = nil
  for L12_40, L13_41 in L9_37(L10_38) do
    L8_36 = 0
    L14_42 = ifStaticTbl
    L15_43 = "."
    L16_44 = _UPVALUE0_
    L16_44 = L16_44.logicalIface
    L14_42 = L14_42 .. L15_43 .. L16_44
    L14_42 = L13_41[L14_42]
    L15_43 = _UPVALUE2_
    if L14_42 ~= L15_43 then
      L14_42, L15_43, L16_44 = nil, nil, nil
      L14_42 = L13_41[ifStaticTbl .. "." .. _UPVALUE0_.logicalIface]
      if L14_42 ~= _UPVALUE1_.NIL then
        L16_44 = _UPVALUE3_.split(L14_42, _UPVALUE2_)
        L15_43 = L16_44[2]
        L5_33 = L15_43
      end
    else
      L5_33 = "1"
    end
    L14_42 = ifStaticTbl
    L15_43 = "."
    L16_44 = _UPVALUE0_
    L16_44 = L16_44.staticIp
    L14_42 = L14_42 .. L15_43 .. L16_44
    L2_30 = L13_41[L14_42]
    L14_42 = ifStaticTbl
    L15_43 = "."
    L16_44 = _UPVALUE0_
    L16_44 = L16_44.netmask
    L14_42 = L14_42 .. L15_43 .. L16_44
    L3_31 = L13_41[L14_42]
    L14_42 = _UPVALUE3_
    L14_42 = L14_42.ipv4SingleMaskCheck
    L15_43 = L2_30
    L16_44 = A0_28
    L14_42 = L14_42(L15_43, L16_44, L3_31)
    L4_32 = L14_42
    L14_42 = _UPVALUE1_
    L14_42 = L14_42.SUCCESS
    if L4_32 == L14_42 then
      L8_36 = 1
      break
    end
  end
  L12_40 = _UPVALUE0_
  L12_40 = L12_40.serverIp
  L9_37[L10_38] = A0_28
  if L8_36 == 1 then
    L12_40 = _UPVALUE0_
    L12_40 = L12_40.routeIp
    L9_37[L10_38] = L2_30
    L12_40 = _UPVALUE0_
    L12_40 = L12_40.routeIface
    L12_40 = L5_33
    L9_37[L10_38] = L11_39
  else
    L12_40 = _UPVALUE0_
    L12_40 = L12_40.routeIp
    L9_37[L10_38] = L11_39
    L12_40 = _UPVALUE0_
    L12_40 = L12_40.routeIface
    L9_37[L10_38] = L11_39
  end
  L12_40 = L9_37
  L13_41 = A1_29
  L10_38(L11_39, L12_40, L13_41)
  return L10_38
end
function accountingVlanServerDelete(A0_45)
  local L1_46, L2_47, L3_48, L4_49, L5_50, L6_51, L7_52
  L1_46 = db
  L1_46 = L1_46.getRowsWhere
  L5_50 = _UPVALUE1_
  L6_51 = A0_45
  L7_52 = "'"
  L1_46 = L1_46(L2_47, L3_48)
  for L5_50, L6_51 in L2_47(L3_48) do
    L7_52 = {}
    L7_52 = L1_46[L5_50]
    L7_52[radAcctRouteTable .. "." .. _UPVALUE0_.routeIp] = _UPVALUE2_
    L7_52[radAcctRouteTable .. "." .. _UPVALUE0_.routeIface] = _UPVALUE3_
    if db.update(radAcctRouteTable, L7_52, L7_52[radAcctRouteTable .. "." .. _UPVALUE4_]) == nil then
      return _UPVALUE5_.FAILURE
    end
  end
  return L2_47
end
