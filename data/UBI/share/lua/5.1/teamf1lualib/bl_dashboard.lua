local L0_0
L0_0 = module
L0_0("com.teamf1.bl.statistics.traffic", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/statistics_traffic")
L0_0 = require
L0_0("teamf1lualib/user-management_users")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
if "DSR-1000AC_Ax" == PRODUCT_ID or "DSR-500AC_Ax" == PRODUCT_ID or "DSR-1000_Bx" == PRODUCT_ID or "DSR-500_Bx" == PRODUCT_ID then
end
;({}).INCOMINGPKTS = 1
;({}).OUTGOINGPKTS = 2
;({}).INCOMINGDROPPEDPKTS = 3
;({}).OUTGOINGDROPPEDPKTS = 4
;({}).INCOMINGBYTES = 5
;({}).OUTGOINGBYTES = 6
;({}).INCOMINGDROPPEDBYTES = 7
;({}).OUTGOINGDROPPEDBYTES = 8
function lanInterfaceTrafficGet()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.interfaceStatsGet(_UPVALUE1_)
  if L0_1 ~= _UPVALUE2_.SUCCESS then
    return L0_1
  end
  L1_2 = util.removePrefix(L1_2, _UPVALUE3_)
  return L0_1, L1_2
end
function wlanTrafficStatsGet()
  local L0_3, L1_4, L2_5
  L1_4 = {}
  L2_5 = nil
  L0_3, L2_5 = wlanstats.wlanstatsGet()
  if L0_3 ~= _UPVALUE0_.SUCCESS then
    return L0_3
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
    L1_4[_FORV_6_] = L2_5[_FORV_7_]
  end
  return L0_3, L1_4
end
function wan1TrafficStatsGet()
  local L0_6, L1_7, L2_8, L3_9
  L1_7 = {}
  L2_8, L3_9 = nil, nil
  L0_6, L2_8 = _UPVALUE0_.wanConnectionTypeGet("WAN1")
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    return L0_6
  end
  if L2_8 == _UPVALUE2_ or L2_8 == _UPVALUE3_ then
    L3_9 = _UPVALUE4_
  elseif L2_8 == _UPVALUE5_ then
    L3_9 = _UPVALUE6_
  else
    L3_9 = _UPVALUE7_
  end
  L0_6, L1_7 = _UPVALUE0_.interfaceStatsGet(L3_9)
  if L0_6 ~= _UPVALUE1_.SUCCESS then
    return L0_6
  end
  L1_7 = util.removePrefix(L1_7, _UPVALUE8_)
  return L0_6, L1_7
end
function wan2TrafficStatsGet()
  local L0_10, L1_11, L2_12, L3_13
  L1_11 = {}
  L2_12, L3_13 = nil, nil
  L0_10, L2_12 = _UPVALUE0_.wanConnectionTypeGet("WAN2")
  if L0_10 ~= _UPVALUE1_.SUCCESS then
    return L0_10
  end
  if L2_12 == _UPVALUE2_ or L2_12 == _UPVALUE3_ then
    if UNIT_NAME ~= "DSR-250N" and UNIT_NAME ~= "DSR-250" and UNIT_NAME ~= "DSR-150N" and UNIT_NAME ~= "DSR-150" then
      L3_13 = _UPVALUE4_
    else
      L3_13 = "eth0.4093"
    end
  elseif L2_12 == _UPVALUE5_ then
    L3_13 = _UPVALUE6_
  else
    L3_13 = _UPVALUE7_
  end
  L0_10, L1_11 = _UPVALUE0_.interfaceStatsGet(L3_13)
  if L0_10 ~= _UPVALUE1_.SUCCESS then
    return L0_10
  end
  L1_11 = util.removePrefix(L1_11, _UPVALUE8_)
  return L0_10, L1_11
end
function wan3TrafficStatsGet()
  local L0_14, L1_15, L2_16, L3_17
  L1_15 = {}
  L2_16, L3_17 = nil, nil
  L0_14, L2_16 = _UPVALUE0_.wanConnectionTypeGet("WAN3")
  if L0_14 ~= _UPVALUE1_.SUCCESS then
    return L0_14
  end
  L3_17 = _UPVALUE2_
  L0_14, L1_15 = _UPVALUE0_.interfaceStatsGet(L3_17)
  if L0_14 ~= _UPVALUE1_.SUCCESS then
    return L0_14
  end
  L1_15 = util.removePrefix(L1_15, _UPVALUE3_)
  return L0_14, L1_15
end
function managedDashboardGet()
  local L0_18, L1_19, L2_20
  L1_19 = {}
  L2_20 = nil
  wherePart = "ipaddr = '" .. SAPI.Request.servervariable("REMOTE_ADDR") .. "'"
  L2_20 = db.getAttributeWhere("loginSession", wherePart, "username")
  if L2_20 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L0_18, L1_19 = _UPVALUE1_.usersDashboardGetRow(L2_20)
  if L0_18 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.FAILURE
  end
  return L0_18, L1_19
end
function systemUtilizationGet()
  local L0_21, L1_22, L2_23
  L1_22 = {}
  L2_23 = db
  L2_23 = L2_23.getAttribute
  L2_23 = L2_23("environment", "name", "RESOURCE_UTILITY_PROGRAM", "value")
  if L2_23 ~= nil then
    util.appendDebugOut("Exec = " .. os.execute(L2_23 .. " " .. DB_FILE_NAME))
  end
  L1_22 = db.getTable(_UPVALUE0_, false)
  if L1_22 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_22[1]
end
function bwUsageGet()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29
  L1_25 = {}
  L2_26 = {}
  L3_27 = {}
  L4_28 = {}
  L5_29 = util
  L5_29 = L5_29.appendDebugOut
  L5_29("Exec = " .. os.execute("/pfrm2.0/bin/fwBwMon /tmp/system.db update"))
  L5_29 = db
  L5_29 = L5_29.getTable
  L5_29 = L5_29(_UPVALUE0_, false)
  if L5_29 ~= _UPVALUE1_.NIL then
    for _FORV_9_, _FORV_10_ in pairs(L5_29) do
      if _FORV_10_[_UPVALUE2_] == _UPVALUE3_ then
        if _FORV_10_[_UPVALUE4_] == _UPVALUE5_ then
          L1_25.appDns = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE7_ then
          L1_25.appHttp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE8_ then
          L1_25.appHttps = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE9_ then
          L1_25.appNfs = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE10_ then
          L1_25.appSnmp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE11_ then
          L1_25.appSmtp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE12_ then
          L1_25.appSsh = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE13_ then
          L1_25.appTelnet = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE14_ then
          L1_25.appPop3 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE15_ then
          L1_25.appImap2 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE16_ then
          L1_25.appImap3 = _FORV_10_[_UPVALUE6_]
        end
      elseif _FORV_10_[_UPVALUE2_] == _UPVALUE17_ then
        if _FORV_10_[_UPVALUE4_] == _UPVALUE5_ then
          L2_26.appDns = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE7_ then
          L2_26.appHttp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE8_ then
          L2_26.appHttps = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE9_ then
          L2_26.appNfs = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE10_ then
          L2_26.appSnmp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE11_ then
          L2_26.appSmtp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE12_ then
          L2_26.appSsh = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE13_ then
          L2_26.appTelnet = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE14_ then
          L2_26.appPop3 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE15_ then
          L2_26.appImap2 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE16_ then
          L2_26.appImap3 = _FORV_10_[_UPVALUE6_]
        end
      elseif _FORV_10_[_UPVALUE2_] == _UPVALUE18_ then
        if _FORV_10_[_UPVALUE4_] == _UPVALUE5_ then
          L3_27.appDns = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE7_ then
          L3_27.appHttp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE8_ then
          L3_27.appHttps = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE9_ then
          L3_27.appNfs = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE10_ then
          L3_27.appSnmp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE11_ then
          L3_27.appSmtp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE12_ then
          L3_27.appSsh = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE13_ then
          L3_27.appTelnet = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE14_ then
          L3_27.appPop3 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE15_ then
          L3_27.appImap2 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE16_ then
          L3_27.appImap3 = _FORV_10_[_UPVALUE6_]
        end
      elseif _FORV_10_[_UPVALUE2_] == _UPVALUE19_ then
        if _FORV_10_[_UPVALUE4_] == _UPVALUE5_ then
          L4_28.appDns = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE7_ then
          L4_28.appHttp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE8_ then
          L4_28.appHttps = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE9_ then
          L4_28.appNfs = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE10_ then
          L4_28.appSnmp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE11_ then
          L4_28.appSmtp = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE12_ then
          L4_28.appSsh = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE13_ then
          L4_28.appTelnet = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE14_ then
          L4_28.appPop3 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE15_ then
          L4_28.appImap2 = _FORV_10_[_UPVALUE6_]
        elseif _FORV_10_[_UPVALUE4_] == _UPVALUE16_ then
          L4_28.appImap3 = _FORV_10_[_UPVALUE6_]
        end
      end
    end
    return _UPVALUE1_.SUCCESS, L1_25, L2_26, L3_27, L4_28
  else
    return _UPVALUE1_.FAILURE
  end
end
function loggedUserGet()
  local L0_30, L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L13_43, L14_44, L15_45, L16_46, L17_47, L18_48, L19_49, L20_50, L21_51, L22_52
  L1_31 = 0
  L2_32 = 0
  L3_33 = 0
  L4_34 = 0
  L5_35 = 0
  L6_36 = 0
  L7_37 = 0
  L8_38 = _UPVALUE0_
  L9_39 = _UPVALUE1_
  L9_39 = L9_39.NIL
  if L8_38 ~= L9_39 then
    L9_39 = os
    L9_39 = L9_39.execute
    L10_40 = L8_38
    L11_41 = " "
    L12_42 = DB_FILE_NAME
    L10_40 = L10_40 .. L11_41 .. L12_42
    L9_39(L10_40)
  end
  L9_39 = _UPVALUE2_
  L10_40 = _UPVALUE1_
  L10_40 = L10_40.NIL
  if L9_39 ~= L10_40 then
    L10_40 = os
    L10_40 = L10_40.execute
    L11_41 = L9_39
    L12_42 = " "
    L13_43 = DB_FILE_NAME
    L11_41 = L11_41 .. L12_42 .. L13_43
    L10_40(L11_41)
  end
  L10_40 = db
  L10_40 = L10_40.getTable
  L11_41 = _UPVALUE3_
  L12_42 = false
  L10_40 = L10_40(L11_41, L12_42)
  L11_41 = _UPVALUE1_
  L11_41 = L11_41.NIL
  if L10_40 == L11_41 then
    L11_41 = _UPVALUE1_
    L11_41 = L11_41.FAILURE
    return L11_41
  end
  L11_41 = db
  L11_41 = L11_41.getTable
  L12_42 = _UPVALUE4_
  L13_43 = false
  L11_41 = L11_41(L12_42, L13_43)
  L12_42 = _UPVALUE1_
  L12_42 = L12_42.NIL
  if L11_41 == L12_42 then
    L12_42 = _UPVALUE1_
    L12_42 = L12_42.FAILURE
    return L12_42
  end
  L12_42 = db
  L12_42 = L12_42.getTable
  L13_43 = _UPVALUE5_
  L14_44 = false
  L12_42 = L12_42(L13_43, L14_44)
  L13_43 = _UPVALUE1_
  L13_43 = L13_43.NIL
  if L12_42 == L13_43 then
    L13_43 = _UPVALUE1_
    L13_43 = L13_43.FAILURE
    return L13_43
  end
  L13_43 = db
  L13_43 = L13_43.getTable
  L14_44 = _UPVALUE6_
  L13_43 = L13_43(L14_44, L15_45)
  L14_44 = _UPVALUE1_
  L14_44 = L14_44.NIL
  if L13_43 == L14_44 then
    L14_44 = _UPVALUE1_
    L14_44 = L14_44.FAILURE
    return L14_44
  end
  L14_44 = db
  L14_44 = L14_44.getTable
  L14_44 = L14_44(L15_45, L16_46)
  if L14_44 ~= L15_45 then
    for L18_48, L19_49 in L15_45(L16_46) do
      L20_50 = _UPVALUE8_
      L21_51 = " = '"
      L22_52 = _UPVALUE9_
      L22_52 = L19_49[L22_52]
      L20_50 = L20_50 .. L21_51 .. L22_52 .. "'"
      L21_51 = db
      L21_51 = L21_51.getRowWhere
      L22_52 = _UPVALUE10_
      L21_51 = L21_51(L22_52, L20_50, false)
      L22_52 = _UPVALUE1_
      L22_52 = L22_52.NIL
      if L21_51 ~= L22_52 then
        L22_52 = _UPVALUE11_
        L22_52 = L21_51[L22_52]
        if L22_52 == "" or L22_52 == " " then
          if L21_51[_UPVALUE8_] == _UPVALUE12_ then
            L3_33 = L3_33 + 1
          else
            L2_32 = L2_32 + 1
          end
        else
          for _FORV_26_ in string.gmatch(L22_52, "%d+") do
            if _FORV_26_ == _UPVALUE13_ then
              L3_33 = L3_33 + 1
            elseif _FORV_26_ == _UPVALUE14_ then
              L2_32 = L2_32 + 1
            elseif _FORV_26_ == _UPVALUE15_ then
              L1_31 = L1_31 + 1
            end
          end
        end
      end
    end
    L4_34 = #L10_40
    L5_35 = #L11_41
    L6_36 = #L12_42
    L7_37 = #L13_43
    L18_48 = L4_34
    L19_49 = L1_31
    L20_50 = L5_35
    L21_51 = L6_36
    L22_52 = L7_37
    return L15_45, L16_46, L17_47, L18_48, L19_49, L20_50, L21_51, L22_52
  else
    return L15_45
  end
end
function activeInfoGet()
  local L0_53, L1_54, L2_55, L3_56, L4_57
  L3_56, L0_53, L1_54, L2_55, L4_57 = _UPVALUE0_.activeInformationGet()
  if L3_56 ~= _UPVALUE1_.SUCCESS then
    return L3_56
  end
  return _UPVALUE1_.SUCCESS, L0_53, L1_54, L2_55, L4_57
end
function ipsInfoGet()
  local L0_58, L1_59, L2_60
  L0_58 = _UPVALUE0_
  L0_58 = L0_58.ipsInfoGet
  L2_60 = L0_58()
  if L0_58 ~= _UPVALUE1_.SUCCESS then
    return L0_58
  end
  return _UPVALUE1_.SUCCESS, L1_59, L2_60
end
