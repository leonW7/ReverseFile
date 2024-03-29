local L0_0
L0_0 = module
L0_0("com.teamf1.core.network.trafficSelector", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/trafficSelectorReturnCodes")
L0_0 = require
L0_0("teamf1lualib/bandwidthProfilesReturnCodes")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wan_configurablePort")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).ProfileName = "ProfileName"
;({}).ROWID = "_ROWID_"
;({}).ServiceName = "ServiceName"
;({}).MatchType = "MatchType"
;({}).IPAddress = "IPAddress"
;({}).SubnetMask = "SubnetMask"
;({}).MACAddress = "MACAddress"
;({}).PortName = "PortName"
;({}).VapName = "VapName"
;({}).VlanId = "VlanId"
;({}).Status = "Status"
;({}).LogicalIfName = "LogicalIfName"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
elseif PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
else
end
function trafficSelectorInfoGetAll()
  local L0_1, L1_2, L2_3
  L0_1 = {}
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.FAILURE
  L0_1 = db.getTable(_UPVALUE1_)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_1, L1_2
  end
  L1_2 = db.getAttribute(_UPVALUE3_, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.Status)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L0_1, L1_2
  end
  L2_3 = _UPVALUE0_.SUCCESS
  return L2_3, L0_1, L1_2
end
function deleteAvailableTrafficSelectors(A0_4)
  local L1_5, L2_6
  L1_5 = {}
  L2_6 = _UPVALUE0_
  L2_6 = L2_6.NIL
  for _FORV_7_, _FORV_8_ in pairs(A0_4) do
    L1_5 = {}
    L1_5[_UPVALUE1_ .. "." .. _UPVALUE2_.ROWID] = _FORV_8_
    L2_6 = db.delete(_UPVALUE1_, L1_5)
    if not L2_6 then
      break
    end
  end
  if L2_6 then
  else
  end
  return _UPVALUE3_.TS_OP_FAILED
end
function trafficSelectorValuesGet(A0_7)
  local L1_8, L2_9
  L1_8 = {}
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.FAILURE
  if configRowId == "-1" then
    L1_8 = db.getDefaults(_UPVALUE1_, _UPVALUE2_)
  else
    L1_8 = db.getRow(_UPVALUE2_, _UPVALUE3_, A0_7)
  end
  if L1_8 == _UPVALUE0_.NIL then
    return _UPVALUE4_.DB_OP_FAILED, L1_8
  end
  L2_9 = _UPVALUE0_.SUCCESS
  return L2_9, L1_8
end
function servicesInfoGetAll(A0_10)
  local L1_11, L2_12
  L1_11 = {}
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.FAILURE
  L1_11 = db.getTable(_UPVALUE1_)
  if L1_11 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L1_11
  end
  L2_12 = _UPVALUE0_.SUCCESS
  return L2_12, L1_11
end
function configPortValueGet(A0_13)
  local L1_14, L2_15
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.FAILURE
  L1_14 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.LogicalIfName) or ""
  if L1_14 == _UPVALUE0_.NIL then
    return _UPVALUE5_.DB_OP_FAILED, L1_14
  end
  L2_15 = _UPVALUE0_.SUCCESS
  return L2_15, L1_14
end
function bwProfileStatusvalueGet(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.FAILURE
  L1_17 = db.getAttribute(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.Status)
  if L1_17 == _UPVALUE0_.NIL then
    return _UPVALUE5_.DB_OP_FAILED, L1_17
  end
  L2_18 = _UPVALUE0_.SUCCESS
  return L2_18, L1_17
end
function PortMgmtInfoGetAll(A0_19)
  local L1_20, L2_21
  L1_20 = {}
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.FAILURE
  L1_20 = db.getTable(_UPVALUE1_)
  if L1_20 == _UPVALUE0_.NIL then
    return _UPVALUE2_.DB_OP_FAILED, L1_20
  end
  L2_21 = _UPVALUE0_.SUCCESS
  return L2_21, L1_20
end
function dot11InterfaceUnusedRowsGet(A0_22)
  local L1_23, L2_24, L3_25
  L1_23 = {}
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  L3_25 = _UPVALUE0_
  L3_25 = L3_25.FAILURE
  L2_24 = "vapName!='unused' and interfaceName LIKE 'vap%'"
  L1_23 = db.getRowsWhere(_UPVALUE1_, L2_24)
  L3_25 = _UPVALUE0_.SUCCESS
  return L3_25, L1_23
end
function trafficSelectorAdd(A0_26, A1_27, A2_28, A3_29, A4_30, A5_31, A6_32, A7_33, A8_34)
  local L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54
  L9_35 = {}
  L10_36 = _UPVALUE0_
  L10_36 = L10_36.NIL
  L11_37 = _UPVALUE0_
  L11_37 = L11_37.FAILURE
  L12_38 = db
  L12_38 = L12_38.getAttribute
  L13_39 = _UPVALUE1_
  L14_40 = _UPVALUE2_
  L15_41 = _UPVALUE3_
  L16_42 = _UPVALUE4_
  L16_42 = L16_42.Status
  L12_38 = L12_38(L13_39, L14_40, L15_41, L16_42)
  L13_39 = tonumber
  L14_40 = L12_38
  L13_39 = L13_39(L14_40)
  if L13_39 ~= 1 then
    L13_39 = _UPVALUE5_
    L13_39 = L13_39.BW_PROFILE_ENABLED
    return L13_39
  end
  L13_39 = _UPVALUE0_
  L13_39 = L13_39.NIL
  if A0_26 ~= L13_39 then
    L13_39 = _UPVALUE6_
    L14_40 = "."
    L15_41 = _UPVALUE7_
    L15_41 = L15_41.ProfileName
    L13_39 = L13_39 .. L14_40 .. L15_41
    L9_35[L13_39] = A0_26
  end
  L13_39 = _UPVALUE0_
  L13_39 = L13_39.NIL
  if A1_27 ~= L13_39 then
    L13_39 = _UPVALUE6_
    L14_40 = "."
    L15_41 = _UPVALUE7_
    L15_41 = L15_41.ServiceName
    L13_39 = L13_39 .. L14_40 .. L15_41
    L9_35[L13_39] = A1_27
  end
  L13_39 = _UPVALUE0_
  L13_39 = L13_39.NIL
  if A2_28 ~= L13_39 then
    L13_39 = _UPVALUE6_
    L14_40 = "."
    L15_41 = _UPVALUE7_
    L15_41 = L15_41.MatchType
    L13_39 = L13_39 .. L14_40 .. L15_41
    L9_35[L13_39] = A2_28
  end
  L13_39 = db
  L13_39 = L13_39.getRowWhere
  L14_40 = "BandWidthProfile"
  L15_41 = "ProfileName='"
  L16_42 = A0_26
  L17_43 = "'"
  L15_41 = L15_41 .. L16_42 .. L17_43
  L13_39 = L13_39(L14_40, L15_41)
  L14_40 = _UPVALUE0_
  L14_40 = L14_40.NIL
  if L13_39 == L14_40 then
    L14_40 = _UPVALUE0_
    L14_40 = L14_40.FAILURE
    return L14_40
  end
  L14_40 = L13_39["BandWidthProfile.Policy"]
  if L14_40 == "1" then
    L15_41 = db
    L15_41 = L15_41.getRowWhere
    L16_42 = "Services"
    L17_43 = "ServiceName = '"
    L17_43 = L17_43 .. L18_44 .. L19_45
    L15_41 = L15_41(L16_42, L17_43)
    L16_42 = L15_41["Services.PortType"]
    if L16_42 ~= "0" then
      L16_42 = L15_41["Services.PortType"]
    elseif L16_42 == "2" then
      L16_42 = tonumber
      L17_43 = L15_41["Services._ROWID_"]
      L16_42 = L16_42(L17_43)
      if L16_42 > 73 then
        L16_42 = tonumber
        L17_43 = L15_41["Services.SourcePortStart"]
        L16_42 = L16_42(L17_43)
        if L16_42 == 0 then
          L16_42 = tonumber
          L17_43 = L15_41["Services.SourcePortEnd"]
          L16_42 = L16_42(L17_43)
          if L16_42 == 0 then
            L16_42 = tonumber
            L17_43 = L15_41["Services.SourceMultiPort"]
            L16_42 = L16_42(L17_43)
            if L16_42 ~= 0 then
              L16_42 = L15_41["Services.SourceMultiPort"]
              if L16_42 ~= nil then
                L16_42 = L15_41["Services.SourceMultiPort"]
              end
            elseif L16_42 == "" then
              L16_42 = _UPVALUE5_
              L16_42 = L16_42.SERVICE_NO_SOURCE_PORT
              return L16_42
            end
          end
        end
      end
    end
  end
  if L14_40 == "0" then
    L15_41 = db
    L15_41 = L15_41.getRowWhere
    L16_42 = "Services"
    L17_43 = "ServiceName = '"
    L17_43 = L17_43 .. L18_44 .. L19_45
    L15_41 = L15_41(L16_42, L17_43)
    L16_42 = L15_41["Services.PortType"]
    if L16_42 ~= "0" then
      L16_42 = L15_41["Services.PortType"]
    elseif L16_42 == "2" then
      L16_42 = tonumber
      L17_43 = L15_41["Services._ROWID_"]
      L16_42 = L16_42(L17_43)
      if L16_42 > 73 then
        L16_42 = tonumber
        L17_43 = L15_41["Services.DestinationPortStart"]
        L16_42 = L16_42(L17_43)
        if L16_42 == 0 then
          L16_42 = tonumber
          L17_43 = L15_41["Services.DestinationPortEnd"]
          L16_42 = L16_42(L17_43)
          if L16_42 == 0 then
            L16_42 = tonumber
            L17_43 = L15_41["Services.MultiPort"]
            L16_42 = L16_42(L17_43)
            if L16_42 ~= 0 then
              L16_42 = L15_41["Services.MultiPort"]
              if L16_42 ~= nil then
                L16_42 = L15_41["Services.MultiPort"]
              end
            elseif L16_42 == "" then
              L16_42 = _UPVALUE5_
              L16_42 = L16_42.SERVICE_NO_DESTINATION_PORT
              return L16_42
            end
          end
        end
      end
    end
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A3_29 ~= L15_41 then
    L15_41 = _UPVALUE8_
    L15_41 = L15_41.split
    L16_42 = A3_29
    L17_43 = "."
    L15_41 = L15_41(L16_42, L17_43)
    L16_42 = tonumber
    L17_43 = L15_41[1]
    L16_42 = L16_42(L17_43)
    if not (L16_42 < 1) then
      L16_42 = tonumber
      L17_43 = L15_41[1]
      L16_42 = L16_42(L17_43)
      if not (L16_42 > 254) then
        L16_42 = tonumber
        L17_43 = L15_41[4]
        L16_42 = L16_42(L17_43)
        if not (L16_42 < 1) then
          L16_42 = tonumber
          L17_43 = L15_41[4]
          L16_42 = L16_42(L17_43)
        end
      end
    else
      if L16_42 > 254 then
        L16_42 = _UPVALUE5_
        L16_42 = L16_42.TS_FIRST_LAST_OCTET
        return L16_42
    end
    else
      L16_42 = _UPVALUE6_
      L17_43 = "."
      L16_42 = L16_42 .. L17_43 .. L18_44
      L9_35[L16_42] = A3_29
    end
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A4_30 ~= L15_41 then
    L15_41 = _UPVALUE6_
    L16_42 = "."
    L17_43 = _UPVALUE7_
    L17_43 = L17_43.SubnetMask
    L15_41 = L15_41 .. L16_42 .. L17_43
    L9_35[L15_41] = A4_30
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A5_31 ~= L15_41 then
    L15_41 = _UPVALUE6_
    L16_42 = "."
    L17_43 = _UPVALUE7_
    L17_43 = L17_43.MACAddress
    L15_41 = L15_41 .. L16_42 .. L17_43
    L9_35[L15_41] = A5_31
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A6_32 ~= L15_41 then
    if A6_32 ~= "Port8" then
      L15_41 = _UPVALUE6_
      L16_42 = "."
      L17_43 = _UPVALUE7_
      L17_43 = L17_43.PortName
      L15_41 = L15_41 .. L16_42 .. L17_43
      L9_35[L15_41] = A6_32
    else
      L15_41 = _UPVALUE9_
      L15_41 = L15_41.configPortUsageGet
      L17_43 = L15_41()
      configPortUsage = L17_43
      cookie = L16_42
      L11_37 = L15_41
      L15_41 = UNIT_NAME
      if L15_41 ~= "DSR-250N" then
        L15_41 = UNIT_NAME
        if L15_41 ~= "DSR-250" then
          L15_41 = UNIT_NAME
          if L15_41 ~= "DSR-150N" then
            L15_41 = UNIT_NAME
          end
        end
      else
        if L15_41 == "DSR-150" then
          L15_41 = configPortUsage
          if L15_41 == "DMZ" then
            L15_41 = _UPVALUE5_
            L15_41 = L15_41.TS_COFIG_PORT_ALREADY_IN_USE
            return L15_41
          end
      end
      else
        L15_41 = _UPVALUE6_
        L16_42 = "."
        L17_43 = _UPVALUE7_
        L17_43 = L17_43.PortName
        L15_41 = L15_41 .. L16_42 .. L17_43
        L9_35[L15_41] = A6_32
      end
    end
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A7_33 ~= L15_41 then
    L15_41 = _UPVALUE6_
    L16_42 = "."
    L17_43 = _UPVALUE7_
    L17_43 = L17_43.VapName
    L15_41 = L15_41 .. L16_42 .. L17_43
    L9_35[L15_41] = A7_33
  end
  L15_41 = _UPVALUE0_
  L15_41 = L15_41.NIL
  if A8_34 ~= L15_41 then
    L15_41 = _UPVALUE6_
    L16_42 = "."
    L17_43 = _UPVALUE7_
    L17_43 = L17_43.VlanId
    L15_41 = L15_41 .. L16_42 .. L17_43
    L9_35[L15_41] = A8_34
  end
  L15_41 = nil
  L16_42 = false
  L17_43 = _UPVALUE7_
  L17_43 = L17_43.ProfileName
  L21_47 = _UPVALUE7_
  L21_47 = L21_47.ServiceName
  L22_48 = " = '"
  L23_49 = A1_27
  L24_50 = "' and "
  L25_51 = _UPVALUE7_
  L25_51 = L25_51.MatchType
  L26_52 = " = '"
  L27_53 = A2_28
  L28_54 = "'"
  L15_41 = L17_43 .. L18_44 .. L19_45 .. L20_46 .. L21_47 .. L22_48 .. L23_49 .. L24_50 .. L25_51 .. L26_52 .. L27_53 .. L28_54
  L17_43 = _UPVALUE10_
  if A2_28 == L17_43 then
    L16_42 = false
    L17_43 = {}
    L17_43 = L18_44 or L18_44
    for L21_47, L22_48 in L18_44(L19_45) do
      L23_49 = _UPVALUE6_
      L24_50 = "."
      L25_51 = _UPVALUE7_
      L25_51 = L25_51.IPAddress
      L23_49 = L23_49 .. L24_50 .. L25_51
      L23_49 = L22_48[L23_49]
      L24_50 = _UPVALUE6_
      L25_51 = "."
      L26_52 = _UPVALUE7_
      L26_52 = L26_52.SubnetMask
      L24_50 = L24_50 .. L25_51 .. L26_52
      L24_50 = L22_48[L24_50]
      L25_51, L26_52, L27_53, L28_54 = nil, nil, nil, nil
      L16_42, L25_51, L26_52 = _UPVALUE8_.ipAddressRangeGet(L23_49, L24_50)
      L16_42, L27_53, L28_54 = _UPVALUE8_.ipAddressRangeGet(A3_29, A4_30)
      L16_42 = _UPVALUE8_.ipAddressRangesMatch(L25_51, L26_52, L27_53, L28_54)
      if L16_42 == _UPVALUE0_.SUCCESS then
        L16_42 = true
        break
      else
        L16_42 = false
      end
    end
  else
    L17_43 = _UPVALUE11_
    if A2_28 == L17_43 then
      L17_43 = L15_41
      L21_47 = A5_31
      L22_48 = "'"
      L15_41 = L17_43 .. L18_44 .. L19_45 .. L20_46 .. L21_47 .. L22_48
      L17_43 = db
      L17_43 = L17_43.existsRowWhere
      L17_43 = L17_43(L18_44, L19_45)
      L16_42 = L17_43
    else
      L17_43 = _UPVALUE12_
      if A2_28 == L17_43 then
        L17_43 = L15_41
        L21_47 = A6_32
        L22_48 = "'"
        L15_41 = L17_43 .. L18_44 .. L19_45 .. L20_46 .. L21_47 .. L22_48
        L17_43 = db
        L17_43 = L17_43.existsRowWhere
        L17_43 = L17_43(L18_44, L19_45)
        L16_42 = L17_43
      else
        L17_43 = _UPVALUE13_
        if A2_28 == L17_43 then
          L17_43 = L15_41
          L21_47 = A8_34
          L22_48 = "'"
          L15_41 = L17_43 .. L18_44 .. L19_45 .. L20_46 .. L21_47 .. L22_48
          L17_43 = db
          L17_43 = L17_43.existsRowWhere
          L17_43 = L17_43(L18_44, L19_45)
          L16_42 = L17_43
        else
          L17_43 = _UPVALUE14_
          if A2_28 == L17_43 then
            L17_43 = L15_41
            L21_47 = A7_33
            L22_48 = "'"
            L15_41 = L17_43 .. L18_44 .. L19_45 .. L20_46 .. L21_47 .. L22_48
            L17_43 = db
            L17_43 = L17_43.existsRowWhere
            L17_43 = L17_43(L18_44, L19_45)
            L16_42 = L17_43
          end
        end
      end
    end
  end
  if L16_42 then
    L17_43 = _UPVALUE5_
    L17_43 = L17_43.TS_PROFILE_EXISTS
    return L17_43
  end
  L17_43 = db
  L17_43 = L17_43.getTable
  L17_43 = L17_43(L18_44)
  if L17_43 ~= nil then
    if L18_44 >= L19_45 then
      return L18_44
    end
  end
  L10_36 = L18_44
  if L10_36 then
    L11_37 = L18_44.SUCCESS
  else
    L11_37 = L18_44.TS_CONFIG_FAILED
  end
  return L11_37
end
function trafficSelectorEdit(A0_55, A1_56, A2_57, A3_58, A4_59, A5_60, A6_61, A7_62, A8_63, A9_64)
  local L10_65, L11_66, L12_67, L13_68, L14_69, L15_70, L16_71, L17_72, L18_73, L19_74, L20_75, L21_76, L22_77, L23_78, L24_79, L25_80, L26_81, L27_82, L28_83, L29_84, L30_85, L31_86
  L10_65 = {}
  L11_66 = _UPVALUE0_
  L11_66 = L11_66.NIL
  L12_67 = _UPVALUE0_
  L12_67 = L12_67.FAILURE
  L13_68 = A9_64
  L14_69 = db
  L14_69 = L14_69.getAttribute
  L15_70 = _UPVALUE1_
  L16_71 = _UPVALUE2_
  L17_72 = _UPVALUE3_
  L18_73 = _UPVALUE4_
  L18_73 = L18_73.Status
  L14_69 = L14_69(L15_70, L16_71, L17_72, L18_73)
  L15_70 = tonumber
  L16_71 = L14_69
  L15_70 = L15_70(L16_71)
  if L15_70 ~= 1 then
    L15_70 = _UPVALUE5_
    L15_70 = L15_70.BW_PROFILE_ENABLED
    return L15_70
  end
  L15_70 = db
  L15_70 = L15_70.getRow
  L16_71 = _UPVALUE6_
  L17_72 = _UPVALUE2_
  L18_73 = A9_64
  L15_70 = L15_70(L16_71, L17_72, L18_73)
  L10_65 = L15_70
  L15_70 = _UPVALUE0_
  L15_70 = L15_70.NIL
  if L10_65 == L15_70 then
    L15_70 = _UPVALUE5_
    L12_67 = L15_70.DB_OP_FAILED
  end
  L15_70 = _UPVALUE0_
  L15_70 = L15_70.NIL
  if A0_55 ~= L15_70 then
    L15_70 = _UPVALUE6_
    L16_71 = "."
    L17_72 = _UPVALUE7_
    L17_72 = L17_72.ProfileName
    L15_70 = L15_70 .. L16_71 .. L17_72
    L10_65[L15_70] = A0_55
  end
  L15_70 = _UPVALUE0_
  L15_70 = L15_70.NIL
  if A1_56 ~= L15_70 then
    L15_70 = _UPVALUE6_
    L16_71 = "."
    L17_72 = _UPVALUE7_
    L17_72 = L17_72.ServiceName
    L15_70 = L15_70 .. L16_71 .. L17_72
    L10_65[L15_70] = A1_56
  end
  L15_70 = _UPVALUE0_
  L15_70 = L15_70.NIL
  if A2_57 ~= L15_70 then
    L15_70 = _UPVALUE6_
    L16_71 = "."
    L17_72 = _UPVALUE7_
    L17_72 = L17_72.MatchType
    L15_70 = L15_70 .. L16_71 .. L17_72
    L10_65[L15_70] = A2_57
  end
  L15_70 = db
  L15_70 = L15_70.getRowWhere
  L16_71 = "BandWidthProfile"
  L17_72 = "ProfileName='"
  L18_73 = A0_55
  L19_74 = "'"
  L17_72 = L17_72 .. L18_73 .. L19_74
  L15_70 = L15_70(L16_71, L17_72)
  L16_71 = _UPVALUE0_
  L16_71 = L16_71.NIL
  if L15_70 == L16_71 then
    L16_71 = _UPVALUE0_
    L16_71 = L16_71.FAILURE
    return L16_71
  end
  L16_71 = L15_70["BandWidthProfile.Policy"]
  if L16_71 == "1" then
    L17_72 = db
    L17_72 = L17_72.getRowWhere
    L18_73 = "Services"
    L19_74 = "ServiceName='"
    L19_74 = L19_74 .. L20_75 .. L21_76
    L17_72 = L17_72(L18_73, L19_74)
    L18_73 = L17_72["Services.PortType"]
    if L18_73 ~= "0" then
      L18_73 = L17_72["Services.PortType"]
    elseif L18_73 == "2" then
      L18_73 = tonumber
      L19_74 = L17_72["Services._ROWID_"]
      L18_73 = L18_73(L19_74)
      if L18_73 > 73 then
        L18_73 = tonumber
        L19_74 = L17_72["Services.SourcePortStart"]
        L18_73 = L18_73(L19_74)
        if L18_73 == 0 then
          L18_73 = tonumber
          L19_74 = L17_72["Services.SourcePortEnd"]
          L18_73 = L18_73(L19_74)
          if L18_73 == 0 then
            L18_73 = tonumber
            L19_74 = L17_72["Services.SourceMultiPort"]
            L18_73 = L18_73(L19_74)
            if L18_73 ~= 0 then
              L18_73 = L17_72["Services.SourceMultiPort"]
              if L18_73 ~= nil then
                L18_73 = L17_72["Services.SourceMultiPort"]
              end
            elseif L18_73 == "" then
              L18_73 = _UPVALUE5_
              L18_73 = L18_73.SERVICE_NO_SOURCE_PORT
              return L18_73
            end
          end
        end
      end
    end
  end
  if L16_71 == "0" then
    L17_72 = db
    L17_72 = L17_72.getRowWhere
    L18_73 = "Services"
    L19_74 = "ServiceName='"
    L19_74 = L19_74 .. L20_75 .. L21_76
    L17_72 = L17_72(L18_73, L19_74)
    L18_73 = L17_72["Services.PortType"]
    if L18_73 ~= "0" then
      L18_73 = L17_72["Services.PortType"]
    elseif L18_73 == "2" then
      L18_73 = tonumber
      L19_74 = L17_72["Services._ROWID_"]
      L18_73 = L18_73(L19_74)
      if L18_73 > 73 then
        L18_73 = tonumber
        L19_74 = L17_72["Services.DestinationPortStart"]
        L18_73 = L18_73(L19_74)
        if L18_73 == 0 then
          L18_73 = tonumber
          L19_74 = L17_72["Services.DestinationPortEnd"]
          L18_73 = L18_73(L19_74)
          if L18_73 == 0 then
            L18_73 = tonumber
            L19_74 = L17_72["Services.MultiPort"]
            L18_73 = L18_73(L19_74)
            if L18_73 ~= 0 then
              L18_73 = L17_72["Services.MultiPort"]
              if L18_73 ~= nil then
                L18_73 = L17_72["Services.MultiPort"]
              end
            elseif L18_73 == "" then
              L18_73 = _UPVALUE5_
              L18_73 = L18_73.SERVICE_NO_DESTINATION_PORT
              return L18_73
            end
          end
        end
      end
    end
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A3_58 ~= L17_72 then
    L17_72 = _UPVALUE8_
    L17_72 = L17_72.split
    L18_73 = A3_58
    L19_74 = "."
    L17_72 = L17_72(L18_73, L19_74)
    L18_73 = tonumber
    L19_74 = L17_72[1]
    L18_73 = L18_73(L19_74)
    if not (L18_73 < 1) then
      L18_73 = tonumber
      L19_74 = L17_72[1]
      L18_73 = L18_73(L19_74)
      if not (L18_73 > 254) then
        L18_73 = tonumber
        L19_74 = L17_72[4]
        L18_73 = L18_73(L19_74)
        if not (L18_73 < 1) then
          L18_73 = tonumber
          L19_74 = L17_72[4]
          L18_73 = L18_73(L19_74)
        end
      end
    else
      if L18_73 > 254 then
        L18_73 = _UPVALUE5_
        L18_73 = L18_73.TS_FIRST_LAST_OCTET
        return L18_73
    end
    else
      L18_73 = _UPVALUE6_
      L19_74 = "."
      L18_73 = L18_73 .. L19_74 .. L20_75
      L10_65[L18_73] = A3_58
    end
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A4_59 ~= L17_72 then
    L17_72 = _UPVALUE6_
    L18_73 = "."
    L19_74 = _UPVALUE7_
    L19_74 = L19_74.SubnetMask
    L17_72 = L17_72 .. L18_73 .. L19_74
    L10_65[L17_72] = A4_59
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A5_60 ~= L17_72 then
    L17_72 = _UPVALUE6_
    L18_73 = "."
    L19_74 = _UPVALUE7_
    L19_74 = L19_74.MACAddress
    L17_72 = L17_72 .. L18_73 .. L19_74
    L10_65[L17_72] = A5_60
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A6_61 ~= L17_72 then
    if A6_61 ~= "Port8" then
      L17_72 = _UPVALUE6_
      L18_73 = "."
      L19_74 = _UPVALUE7_
      L19_74 = L19_74.PortName
      L17_72 = L17_72 .. L18_73 .. L19_74
      L10_65[L17_72] = A6_61
    else
      L17_72 = _UPVALUE9_
      L17_72 = L17_72.configPortUsageGet
      L19_74 = L17_72()
      configPortUsage = L19_74
      A9_64 = L18_73
      L12_67 = L17_72
      L17_72 = UNIT_NAME
      if L17_72 ~= "DSR-250N" then
        L17_72 = UNIT_NAME
        if L17_72 ~= "DSR-250" then
          L17_72 = UNIT_NAME
          if L17_72 ~= "DSR-150N" then
            L17_72 = UNIT_NAME
          end
        end
      else
        if L17_72 == "DSR-150" then
          L17_72 = configPortUsage
          if L17_72 == "DMZ" then
            L17_72 = _UPVALUE5_
            L17_72 = L17_72.TS_COFIG_PORT_ALREADY_IN_USE
            return L17_72
          end
      end
      else
        L17_72 = _UPVALUE6_
        L18_73 = "."
        L19_74 = _UPVALUE7_
        L19_74 = L19_74.PortName
        L17_72 = L17_72 .. L18_73 .. L19_74
        L10_65[L17_72] = A6_61
      end
    end
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A7_62 ~= L17_72 then
    L17_72 = _UPVALUE6_
    L18_73 = "."
    L19_74 = _UPVALUE7_
    L19_74 = L19_74.VapName
    L17_72 = L17_72 .. L18_73 .. L19_74
    L10_65[L17_72] = A7_62
  end
  L17_72 = _UPVALUE0_
  L17_72 = L17_72.NIL
  if A8_63 ~= L17_72 then
    L17_72 = _UPVALUE6_
    L18_73 = "."
    L19_74 = _UPVALUE7_
    L19_74 = L19_74.VlanId
    L17_72 = L17_72 .. L18_73 .. L19_74
    L10_65[L17_72] = A8_63
  end
  L17_72 = nil
  L18_73 = false
  L19_74 = _UPVALUE7_
  L19_74 = L19_74.ProfileName
  L23_78 = _UPVALUE7_
  L23_78 = L23_78.ServiceName
  L24_79 = " = '"
  L25_80 = A1_56
  L26_81 = "' and "
  L27_82 = _UPVALUE7_
  L27_82 = L27_82.MatchType
  L28_83 = " = '"
  L29_84 = A2_57
  L30_85 = "'"
  L17_72 = L19_74 .. L20_75 .. L21_76 .. L22_77 .. L23_78 .. L24_79 .. L25_80 .. L26_81 .. L27_82 .. L28_83 .. L29_84 .. L30_85
  L19_74 = _UPVALUE10_
  if A2_57 == L19_74 then
    L18_73 = false
    L19_74 = {}
    L19_74 = L20_75 or L20_75
    for L23_78, L24_79 in L20_75(L21_76) do
      L25_80 = _UPVALUE6_
      L26_81 = "."
      L27_82 = _UPVALUE2_
      L25_80 = L25_80 .. L26_81 .. L27_82
      L25_80 = L24_79[L25_80]
      if L25_80 ~= L13_68 then
        L26_81 = _UPVALUE6_
        L27_82 = "."
        L28_83 = _UPVALUE7_
        L28_83 = L28_83.IPAddress
        L26_81 = L26_81 .. L27_82 .. L28_83
        L26_81 = L24_79[L26_81]
        L27_82 = _UPVALUE6_
        L28_83 = "."
        L29_84 = _UPVALUE7_
        L29_84 = L29_84.SubnetMask
        L27_82 = L27_82 .. L28_83 .. L29_84
        L27_82 = L24_79[L27_82]
        if L26_81 == A3_58 and L27_82 == A4_59 then
          L28_83 = _UPVALUE5_
          L28_83 = L28_83.TS_PROFILE_EXISTS
          return L28_83
        end
        L28_83, L29_84, L30_85, L31_86 = nil, nil, nil, nil
        L18_73, L28_83, L29_84 = _UPVALUE8_.ipAddressRangeGet(L26_81, L27_82)
        L18_73, L30_85, L31_86 = _UPVALUE8_.ipAddressRangeGet(A3_58, A4_59)
        L18_73 = _UPVALUE8_.ipAddressRangesMatch(L28_83, L29_84, L30_85, L31_86)
        if L18_73 == _UPVALUE0_.SUCCESS then
          L18_73 = true
          break
        else
          L18_73 = false
        end
      end
    end
  else
    L19_74 = _UPVALUE11_
    if A2_57 == L19_74 then
      L19_74 = L17_72
      L23_78 = A5_60
      L24_79 = "'"
      L17_72 = L19_74 .. L20_75 .. L21_76 .. L22_77 .. L23_78 .. L24_79
      L19_74 = db
      L19_74 = L19_74.existsRowWhere
      L19_74 = L19_74(L20_75, L21_76)
      L18_73 = L19_74
    else
      L19_74 = _UPVALUE12_
      if A2_57 == L19_74 then
        L19_74 = L17_72
        L23_78 = A6_61
        L24_79 = "'"
        L17_72 = L19_74 .. L20_75 .. L21_76 .. L22_77 .. L23_78 .. L24_79
        L19_74 = db
        L19_74 = L19_74.existsRowWhere
        L19_74 = L19_74(L20_75, L21_76)
        L18_73 = L19_74
      else
        L19_74 = _UPVALUE13_
        if A2_57 == L19_74 then
          L19_74 = L17_72
          L23_78 = A8_63
          L24_79 = "'"
          L17_72 = L19_74 .. L20_75 .. L21_76 .. L22_77 .. L23_78 .. L24_79
          L19_74 = db
          L19_74 = L19_74.existsRowWhere
          L19_74 = L19_74(L20_75, L21_76)
          L18_73 = L19_74
        else
          L19_74 = _UPVALUE14_
          if A2_57 == L19_74 then
            L19_74 = L17_72
            L23_78 = A7_62
            L24_79 = "'"
            L17_72 = L19_74 .. L20_75 .. L21_76 .. L22_77 .. L23_78 .. L24_79
            L19_74 = db
            L19_74 = L19_74.existsRowWhere
            L19_74 = L19_74(L20_75, L21_76)
            L18_73 = L19_74
          end
        end
      end
    end
  end
  if L18_73 == L13_68 then
    L18_73 = false
  end
  if L18_73 then
    L19_74 = _UPVALUE5_
    L19_74 = L19_74.TS_PROFILE_EXISTS
    return L19_74
  end
  L19_74 = db
  L19_74 = L19_74.update
  L19_74 = L19_74(L20_75, L21_76, L22_77)
  L11_66 = L19_74
  if L11_66 then
    L19_74 = _UPVALUE0_
    L12_67 = L19_74.SUCCESS
  else
    L19_74 = _UPVALUE5_
    L12_67 = L19_74.TS_CONFIG_FAILED
  end
  return L12_67
end
function qosTrafficSelectorDelete(A0_87)
  if A0_87 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_87) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(_UPVALUE1_, _UPVALUE2_, A0_87) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.NOT_EXIST
  end
  if db.deleteRow(_UPVALUE1_, _UPVALUE2_, A0_87) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_87
  end
  return _UPVALUE0_.SUCCESS, A0_87
end
