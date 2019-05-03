local L0_0
L0_0 = module
L0_0("com.teamf1.core.network.sessionLimitProfiles", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).ROWID = "_ROWID_"
;({}).profileName = "profileName"
;({}).sourceType = "sourceType"
;({}).startIpAddress = "startIpAddr"
;({}).endIpAddress = "endIpAddr"
;({}).netMask = "netMask"
;({}).interface = "interface"
;({}).sessionLimit = "sessionLimit"
;({}).enableSchedule = "enableSchedule"
;({}).scheduleProfile = "scheduleProfile"
;({}).ROWID = "_ROWID_"
;({}).profileName = "profileName"
;({}).currentSessions = "currentSessions"
;({}).warningMessage = "warningMessage"
;({}).profileName = "profileName"
;({}).profileBlockAllTraffic = "profileBlockAllTraffic"
;({}).ROWID = "_ROWID_"
;({}).ROWID = "_ROWID_"
;({}).profileName = "profileName"
;({}).startIpAddress = "startIpAddress"
;({}).endIpAddress = "endIpAddress"
;({}).interface = "interface"
;({}).currentSessions = "currentSessions"
;({}).sessionLimit = "maximumSessions"
attribute = {}
attribute.addressFamily = "AddressFamily"
attribute.interfaceName = "LogicalIfName"
attribute.ifstatic = "ifStatic"
attribute.configPort = "configPort"
attribute.schedules = "schedules"
function sessionLimitProfileInfoGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = {}
  L1_2 = {}
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NIL
  L3_4 = _UPVALUE0_
  L3_4 = L3_4.FAILURE
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.NIL
  L0_1 = db.getTable(_UPVALUE1_)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_3, L0_1
  end
  L4_5 = _UPVALUE2_ .. "=" .. _UPVALUE3_
  L1_2 = db.getRowWhere(_UPVALUE4_, L4_5)
  if L1_2 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_3, L0_1
  end
  L2_3 = L1_2[_UPVALUE4_ .. "." .. _UPVALUE5_.warningMessage]
  if L2_3 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L2_3, L0_1
  end
  L3_4 = _UPVALUE0_.SUCCESS
  return L3_4, L2_3, L0_1
end
function warningMessageModify(A0_6)
  local L1_7, L2_8, L3_9
  L1_7 = {}
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  L3_9 = _UPVALUE0_
  L3_9 = L3_9.NIL
  L3_9 = _UPVALUE1_ .. "=" .. _UPVALUE2_
  L1_7 = db.getRowWhere(_UPVALUE3_, L3_9)
  if L1_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L1_7[_UPVALUE3_ .. "." .. _UPVALUE4_.warningMessage] = A0_6
  L2_8 = db.update(_UPVALUE3_, L1_7, _UPVALUE2_)
  if not L2_8 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function deleteAvailableProfiles(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15
  L1_11 = _UPVALUE0_
  L2_12 = _UPVALUE1_
  L2_12 = L2_12.FAILURE
  L3_13 = _UPVALUE1_
  L3_13 = L3_13.NIL
  L4_14 = _UPVALUE1_
  L4_14 = L4_14.NIL
  L5_15 = nil
  L1_11 = db.existsRow(_UPVALUE2_, _UPVALUE3_, A0_10)
  if L1_11 then
    L3_13 = db.getAttribute(_UPVALUE2_, _UPVALUE3_, A0_10, _UPVALUE4_.profileName)
  end
  if L3_13 ~= _UPVALUE1_.NIL then
    L4_14 = _UPVALUE4_.profileName .. "='" .. L3_13 .. "'"
    L5_15 = db.deleteRowWhere(_UPVALUE5_, L4_14)
  end
  if L5_15 then
    L1_11 = db.deleteRow(_UPVALUE2_, _UPVALUE3_, A0_10)
  end
  if L1_11 then
    L2_12 = _UPVALUE1_.SUCCESS
  else
    L2_12 = _UPVALUE1_.FAILURE
  end
  return L2_12
end
function sessionLimitProfileDeleteAll()
  local L0_16
  L0_16 = db.deleteAllRows(_UPVALUE0_)
  if not L0_16 then
    return _UPVALUE1_.FAILURE
  end
  L0_16 = db.deleteAllRows(_UPVALUE2_)
  if not L0_16 then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS
end
function sessionLimitProfileInfoGet(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27
  L1_18 = {}
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.FAILURE
  L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27 = nil, nil, nil, nil, nil, nil, nil, nil
  if A0_17 == "-1" then
    L1_18 = db.getDefaults(_UPVALUE1_, _UPVALUE2_)
  else
    L1_18 = db.getRow(_UPVALUE2_, _UPVALUE3_, A0_17)
  end
  if L1_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_18
  end
  L3_20 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.profileName]
  L4_21 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.sourceType]
  L5_22 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.startIpAddress]
  L6_23 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.endIpAddress]
  L7_24 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.interface]
  L8_25 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.sessionLimit]
  L9_26 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.enableSchedule]
  L10_27 = L1_18[_UPVALUE2_ .. "." .. _UPVALUE4_.scheduleProfile]
  L2_19 = _UPVALUE0_.SUCCESS
  return L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25, L9_26, L10_27
end
function sessionLimitProfileAdd(A0_28, A1_29, A2_30, A3_31, A4_32, A5_33, A6_34, A7_35, A8_36)
  local L9_37, L10_38, L11_39, L12_40, L13_41
  L9_37 = _UPVALUE0_
  L9_37 = L9_37.NIL
  L10_38 = {}
  L11_39 = {}
  L12_40 = _UPVALUE0_
  L12_40 = L12_40.NIL
  L13_41 = _UPVALUE0_
  L13_41 = L13_41.NIL
  if A0_28 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L9_37 = db.getAttribute(_UPVALUE1_, _UPVALUE1_ .. "." .. _UPVALUE2_.profileName, A0_28, _UPVALUE3_)
  if L9_37 ~= _UPVALUE0_.NIL then
    return _UPVALUE0_.NAME_ALREADY_EXIST
  end
  if A1_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_29) == SLP_IPADDRESS and A2_30 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif tonumber(A1_29) == _UPVALUE4_ and (A2_30 == _UPVALUE0_.NIL or A3_31 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif tonumber(A1_29) == _UPVALUE5_ and (A2_30 == _UPVALUE0_.NIL or A4_32 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A6_34) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A7_35) == _UPVALUE6_ and A8_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.profileName] = A0_28
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.sourceType] = A1_29
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.startIpAddress] = A2_30
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.endIpAddress] = A3_31
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.netMask] = A4_32
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.interface] = A5_33
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.sessionLimit] = A6_34
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.enableSchedule] = A7_35
  L10_38[_UPVALUE1_ .. "." .. _UPVALUE2_.scheduleProfile] = A8_36
  L13_41 = db.insert(_UPVALUE1_, L10_38)
  if not L13_41 then
    return _UPVALUE0_.FAILURE
  end
  L11_39[_UPVALUE7_ .. "." .. _UPVALUE8_.profileName] = A0_28
  L11_39[_UPVALUE7_ .. "." .. _UPVALUE8_.currentSessions] = 0
  L13_41 = db.insert(_UPVALUE7_, L11_39)
  if not L13_41 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function sessionLimitProfileSet(A0_42, A1_43, A2_44, A3_45, A4_46, A5_47, A6_48, A7_49, A8_50, A9_51)
  local L10_52, L11_53
  L10_52 = {}
  L11_53 = {}
  L11_53 = db.getRow(_UPVALUE1_, _UPVALUE2_, A9_51)
  if L11_53 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if A0_42 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_43 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A1_43) == _UPVALUE3_ and A2_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif tonumber(A1_43) == _UPVALUE4_ and (A2_44 == _UPVALUE0_.NIL or A3_45 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.INVALID_ARGUMENT
  elseif tonumber(A1_43) == _UPVALUE5_ and (A2_44 == _UPVALUE0_.NIL or A4_46 == _UPVALUE0_.NIL) then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A6_48) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A7_49) == _UPVALUE6_ and A8_50 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A9_51 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.profileName] = A0_42
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.sourceType] = A1_43
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.startIpAddress] = A2_44
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.endIpAddress] = A3_45
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.netMask] = A4_46
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.interface] = A5_47
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.sessionLimit] = A6_48
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.enableSchedule] = A7_49
  L10_52[_UPVALUE1_ .. "." .. _UPVALUE7_.scheduleProfile] = A8_50
  status = db.update(_UPVALUE1_, L10_52, A9_51)
  if status then
  else
  end
  return recturnCodes.FAILURE
end
function getInterfaceInfo()
  local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L13_67, L14_68, L15_69, L16_70, L17_71, L18_72
  L1_55 = {}
  L2_56 = {}
  L3_57 = nil
  L4_58 = 0
  L5_59 = "LAN"
  L6_60 = attribute
  L6_60 = L6_60.addressFamily
  L7_61 = "="
  L8_62 = _UPVALUE0_
  L12_66 = _UPVALUE1_
  L13_67 = "'"
  L17_71 = _UPVALUE2_
  L18_72 = "'"
  L6_60 = L6_60 .. L7_61 .. L8_62 .. L9_63 .. L10_64 .. L11_65 .. L12_66 .. L13_67 .. L14_68 .. L15_69 .. L16_70 .. L17_71 .. L18_72 .. " and " .. attribute.interfaceName .. " != '" .. _UPVALUE3_ .. "'" .. " and " .. attribute.interfaceName .. " != '" .. _UPVALUE4_ .. "'"
  L7_61 = attribute
  L7_61 = L7_61.addressFamily
  L8_62 = "="
  L12_66 = " != '"
  L13_67 = _UPVALUE1_
  L17_71 = " != '"
  L18_72 = _UPVALUE2_
  L7_61 = L7_61 .. L8_62 .. L9_63 .. L10_64 .. L11_65 .. L12_66 .. L13_67 .. L14_68 .. L15_69 .. L16_70 .. L17_71 .. L18_72 .. "'" .. " and " .. attribute.interfaceName .. " != '" .. _UPVALUE3_ .. "'"
  L8_62 = _UPVALUE5_
  L8_62 = L8_62.NIL
  L12_66 = _UPVALUE7_
  L13_67 = attribute
  L13_67 = L13_67.interfaceName
  L3_57 = L9_63 or ""
  if L9_63 == L10_64 then
    L2_56 = L9_63
  else
    L2_56 = L9_63
  end
  if L2_56 == L9_63 then
    return L9_63, L10_64
  end
  if L2_56 ~= L9_63 then
    for L12_66, L13_67 in L9_63(L10_64) do
      L1_55[L12_66] = L14_68
      for L17_71, L18_72 in L14_68(L15_69) do
        L8_62 = tostring(L18_72)
        if string.find(L8_62, L5_59) ~= _UPVALUE5_.NIL or string.find(L8_62, _UPVALUE4_) ~= _UPVALUE5_.NIL then
          L1_55[L12_66].LogicalIfName = tostring(L18_72)
          L1_55[L12_66].interfaceName = tostring(L18_72)
        end
      end
    end
  end
  if L1_55 == L9_63 then
    return L9_63, L10_64
  end
  L0_54 = L9_63.SUCCESS
  return L9_63, L10_64
end
function getScheduleInfo()
  local L0_73, L1_74
  L1_74 = db
  L1_74 = L1_74.getTable
  L1_74 = L1_74(attribute.schedules, false)
  if L1_74 == NIL then
    return _UPVALUE0_.FAILURE, L1_74
  end
  L0_73 = _UPVALUE0_.SUCCESS
  return L0_73, L1_74
end
function sessionLimitStatsGet()
  local L0_75, L1_76, L2_77, L3_78, L4_79, L5_80, L6_81, L7_82, L8_83, L9_84, L10_85
  L0_75 = _UPVALUE0_
  L0_75 = L0_75.FAILURE
  L1_76 = {}
  L2_77 = {}
  L3_78 = {}
  L4_79 = 0
  L5_80 = db
  L5_80 = L5_80.getTable
  L5_80 = L5_80(L6_81, L7_82)
  L2_77 = L5_80
  L5_80 = db
  L5_80 = L5_80.getTable
  L5_80 = L5_80(L6_81, L7_82)
  L3_78 = L5_80
  L5_80 = _UPVALUE0_
  L5_80 = L5_80.NIL
  if L2_77 == L5_80 then
    L5_80 = _UPVALUE0_
    L5_80 = L5_80.Success
    return L5_80, L6_81
  end
  L5_80 = io
  L5_80 = L5_80.popen
  L5_80 = L5_80(L6_81)
  if L5_80 then
    L6_81(L7_82)
  end
  L5_80 = L6_81
  if L5_80 then
    L6_81(L7_82)
  end
  for L9_84, L10_85 in L6_81(L7_82) do
    L1_76[L9_84] = {}
    for _FORV_14_, _FORV_15_ in pairs(L10_85) do
      L1_76[L9_84][_FORV_14_] = L2_77[L9_84][_FORV_14_]
    end
  end
  for L9_84, L10_85 in L6_81(L7_82) do
    for _FORV_14_, _FORV_15_ in pairs(L10_85) do
      L1_76[L9_84].currentSessions = L3_78[L9_84].currentSessions or "0"
      L1_76[L9_84].totalSessions = L3_78[L9_84].totalSessions or "0"
    end
  end
  return L6_81, L7_82
end
function blockAllTrafficEnable(A0_86)
  local L1_87, L2_88, L3_89
  L1_87 = {}
  L2_88 = _UPVALUE0_
  L2_88 = L2_88.FAILURE
  L3_89 = _UPVALUE1_
  L3_89 = db.existsRow(_UPVALUE2_, _UPVALUE3_.ROWID, A0_86)
  if L3_89 then
    L1_87 = db.getRow(_UPVALUE2_, _UPVALUE4_.ROWID, A0_86)
    L1_87[_UPVALUE2_ .. "." .. _UPVALUE3_.profileBlockAllTraffic] = 1
    L2_88 = db.update(_UPVALUE2_, L1_87, A0_86)
  end
  if not L2_88 then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function warningMessageGet()
  local L0_90
  L0_90 = db.getAttribute(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_.warningMessage)
  return L0_90
end
