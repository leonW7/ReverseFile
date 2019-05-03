local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.radio", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wireless.accesspoints")
;({}).maxValue = "maxValue"
;({}).vapEnabled = "vapEnabled"
;({}).txRate = "txRate"
;({}).txPower = "txPower"
;({}).puren = "puren"
;({}).ROWID = "_ROWID_"
;({}).vapName = "vapName"
;({}).profileName = "profileName"
;({}).apIsolation = "apIsolation"
;({}).security = "security"
;({}).pairwiseCiphers = "pairwiseCiphers"
;({}).profileName = "profileName"
;({}).name = "name"
;({}).value = "value"
;({}).startHour = "startHour"
;({}).startMinute = "startMinute"
;({}).startMeridian = "startMeridian"
;({}).unit = "unit"
;({}).command = "command"
;({}).scheduleControl = "scheduleControl"
;({}).startMeridian = "startMeridian"
;({}).minute = "minute"
;({}).stopHour = "stopHour"
;({}).stopMinute = "stopMinute"
;({}).stopMeridian = "stopMeridian"
;({}).hour = "hour"
;({}).interfaceName = "interfaceName"
;({}).vapName = "vapName"
;({}).cardNo = "cardNo"
;({}).band = "band"
;({}).radioNo = "radioNo"
;({}).opMode = "opMode"
;({}).txRate = "txRate"
;({}).txPower = "txPower"
;({}).currentChannel = "currentChannel"
;({}).dothEnabled = "dothEnabled"
;({}).configuredChannel = "configuredChannel"
;({}).preambleMode = "preambleMode"
;({}).ROWID = "_ROWID_"
;({}).cardNo = "cardNo"
;({}).ROWID = "_ROWID_"
;({}).country = "country"
;({}).countrycode = "countrycode"
;({}).country = "country"
;({}).ROWID = "_ROWID_"
;({}).chanWidth = "chanWidth"
;({}).radioNo = "radioNo"
;({}).puren = "puren"
;({}).mimoPreamble = "mimoPreamble"
;({}).ctlSideBand = "ctlSideBand"
;({}).pureAc = "pure11ac"
;({}).ROWID = "_ROWID_"
;({}).badParam = "BAD PARAMETER : "
;({}).dbError = "Not able to get values from the database."
;({}).opSuccess = "Operation Succeeded."
;({}).opFailed = "Operation Failed."
;({}).errCountry = "Invalid Country Code."
;({}).errchanWidth = "Invalid Channel Spacing."
;({}).errctlSideBand = "Invalid Control Side Band."
;({}).errband = "Invalid Band."
;({}).erropMode = "Invalid operational Mode."
;({}).errconfiguredChannel = "Invalid channel configured."
;({}).errtxRate = "Invalid Transmission Rate."
;({}).errtxPower = "Invalid Transmission Power."
;({}).regionInfo = "regionInfo"
GHZ2_RADIO_NUMBER = "2"
GHZ5_RADIO_NUMBER = "1"
GHZ2_RADIO = "b"
GHZ5_RADIO = "a"
function radioTXPowerGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.NIL
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NIL
  L3_4 = _UPVALUE0_
  L3_4 = L3_4.NIL
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.NIL
  L5_6 = _UPVALUE0_
  L5_6 = L5_6.NIL
  L6_7 = _UPVALUE0_
  L6_7 = L6_7.FAILURE
  L7_8 = _UPVALUE0_
  L7_8 = L7_8.NIL
  L8_9 = UNIT_NAME
  if L8_9 ~= "DSR-1000AC" then
    L8_9 = UNIT_NAME
  else
    if L8_9 == "DSR-500AC" then
      L2_3 = -1
      L8_9 = tonumber
      L8_9 = L8_9(A0_1)
      if L8_9 == 2 then
        L8_9 = "radioList = '2' and vapEnabled = '1'"
        L3_4 = db.getAttributeWhere(_UPVALUE1_, L8_9, _UPVALUE2_.vapName)
        if UNIT_NAME == "DSR-1000AC" and L3_4 == nil then
          L8_9 = "radioList = '1,2' and vapEnabled = '1'"
          L3_4 = db.getAttributeWhere(_UPVALUE1_, L8_9, _UPVALUE2_.vapName)
        end
        if L3_4 ~= nil and L3_4 ~= "" and L3_4 ~= " " then
          L8_9 = "radioNo = '2' and vapName = '" .. L3_4 .. "'"
          L3_4 = db.getAttributeWhere(_UPVALUE3_, L8_9, _UPVALUE4_.interfaceName)
        end
      else
        L8_9 = "radioList = '1' and vapEnabled = '1'"
        L3_4 = db.getAttributeWhere(_UPVALUE1_, L8_9, _UPVALUE2_.vapName)
        if UNIT_NAME == "DSR-1000AC" and L3_4 == nil then
          L8_9 = "radioList = '1,2' and vapEnabled = '1'"
          L3_4 = db.getAttributeWhere(_UPVALUE1_, L8_9, _UPVALUE2_.vapName)
        end
        if L3_4 ~= nil and L3_4 ~= "" and L3_4 ~= " " then
          L8_9 = "radioNo = '1' and vapName = '" .. L3_4 .. "'"
          L3_4 = db.getAttributeWhere(_UPVALUE3_, L8_9, _UPVALUE4_.interfaceName)
        end
      end
      if L3_4 ~= nil and L3_4 ~= "" and L3_4 ~= " " then
        L8_9 = os
        L8_9 = L8_9.execute
        L8_9(_UPVALUE5_ .. L3_4 .. " > " .. _UPVALUE6_)
        L8_9 = assert
        L8_9 = L8_9(io.open(_UPVALUE6_, "r"))
        if L8_9 then
          L2_3 = L8_9:read("*all")
          L8_9:close()
        end
      else
        L2_3 = 0
      end
  end
  else
    L8_9 = db
    L8_9 = L8_9.getAttribute
    L8_9 = L8_9(_UPVALUE1_, _UPVALUE2_.vapEnabled, _UPVALUE7_, _UPVALUE2_.vapName)
    L5_6 = L8_9
    L2_3 = -1
    if L5_6 then
      L8_9 = db
      L8_9 = L8_9.getAttribute
      L8_9 = L8_9(_UPVALUE3_, _UPVALUE4_.vapName, L5_6, _UPVALUE4_.interfaceName)
      L4_5 = L8_9
      L8_9 = os
      L8_9 = L8_9.execute
      L8_9(_UPVALUE5_ .. L4_5 .. " > " .. _UPVALUE6_)
      L8_9 = assert
      L8_9 = L8_9(io.open(_UPVALUE6_, "r"))
      if L8_9 then
        L2_3 = L8_9:read("*all")
        L8_9:close()
        L2_3 = tonumber(L2_3) + 3
      end
    end
  end
  L8_9 = tonumber
  L8_9 = L8_9(L2_3)
  if L8_9 < 0 then
    L2_3 = 0
  end
  L8_9 = _UPVALUE0_
  L6_7 = L8_9.SUCCESS
  L8_9 = L6_7
  return L8_9, _UPVALUE8_.opSuccess, L2_3
end
function radioConfigGet(A0_10)
  local L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24
  L1_11 = _UPVALUE0_
  L1_11 = L1_11.NIL
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.NIL
  L3_13 = _UPVALUE0_
  L3_13 = L3_13.NIL
  L4_14 = _UPVALUE0_
  L4_14 = L4_14.NIL
  L5_15 = _UPVALUE0_
  L5_15 = L5_15.NIL
  L6_16 = _UPVALUE0_
  L6_16 = L6_16.FAILURE
  L7_17 = _UPVALUE0_
  L7_17 = L7_17.NIL
  L8_18 = _UPVALUE0_
  L8_18 = L8_18.NIL
  L9_19 = _UPVALUE0_
  L9_19 = L9_19.NIL
  L10_20 = _UPVALUE0_
  L10_20 = L10_20.NIL
  L11_21 = {}
  L12_22 = {}
  L13_23 = {}
  if L14_24 ~= "DSR-1000AC" then
  else
    if L14_24 == "DSR-500AC" then
      L11_21 = L14_24
  end
  else
    L11_21 = L14_24
  end
  if L11_21 ~= L14_24 then
    L12_22 = L14_24
    if L12_22 == L14_24 then
      return L14_24, _UPVALUE7_.dbError, L12_22
    end
    L11_21 = L14_24
    L8_18 = _UPVALUE13_
    if L11_21 ~= L14_24 then
      L8_18 = L11_21[L14_24]
    end
    L12_22[L14_24] = L8_18
    L1_11 = L14_24 or ""
    L12_22[L14_24] = db.getAttribute(_UPVALUE18_, _UPVALUE19_.countrycode, L1_11, _UPVALUE19_.country) or L1_11
    L1_11 = L12_22[L14_24]
    L12_22[L14_24] = db.getAttribute(_UPVALUE20_, _UPVALUE21_.radioNo, L1_11, _UPVALUE21_.chanWidth) or ""
    L12_22[L14_24] = db.getAttribute(_UPVALUE20_, _UPVALUE21_.radioNo, L1_11, _UPVALUE21_.puren) or ""
    L12_22[L14_24] = db.getAttribute(_UPVALUE20_, _UPVALUE21_.radioNo, L1_11, _UPVALUE21_.mimoPreamble) or ""
    if L14_24 ~= "DSR-1000AC" then
    elseif L14_24 == "DSR-500AC" then
      L12_22[L14_24] = db.getAttribute(_UPVALUE20_, _UPVALUE21_.radioNo, L1_11, _UPVALUE21_.pureAc) or ""
    end
    L1_11 = L12_22[L14_24]
    if L14_24 then
      L12_22[L14_24] = _UPVALUE23_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE25_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE27_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE29_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE31_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE33_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE35_
    end
    if L14_24 then
      L12_22[L14_24] = _UPVALUE37_
    end
    if L14_24 ~= "DSR-1000AC" then
    elseif L14_24 == "DSR-500AC" then
      if L14_24 then
        if L14_24 == _UPVALUE39_ then
          L12_22[L14_24] = _UPVALUE40_
        else
          L12_22[L14_24] = _UPVALUE41_
        end
      end
    end
    if L14_24 == _UPVALUE39_ then
      L12_22[L14_24] = _UPVALUE42_
    end
  end
  L2_12 = L14_24
  L3_13 = L14_24
  if L2_12 ~= L14_24 then
    if L3_13 ~= L14_24 then
      L14_24(L2_12 .. " " .. _UPVALUE48_ .. " " .. L3_13)
      L1_11 = L11_21[L14_24]
      L12_22[L14_24] = db.getAttribute(_UPVALUE4_, _UPVALUE5_.cardNo, L1_11, _UPVALUE5_.currentChannel)
    end
  end
  if L14_24 ~= "DSR-1000AC" then
  else
    if L14_24 == "DSR-500AC" then
      L1_11 = nil
      if L14_24 == 2 then
        L1_11 = db.getAttributeWhere(_UPVALUE10_, L14_24, _UPVALUE49_.vapName)
        if UNIT_NAME == "DSR-1000AC" and L1_11 == nil then
          L1_11 = db.getAttributeWhere(_UPVALUE10_, L14_24, _UPVALUE49_.vapName)
        end
        if L1_11 ~= nil and L1_11 ~= "" and L1_11 ~= " " then
          L1_11 = db.getAttributeWhere(_UPVALUE46_, L14_24, _UPVALUE47_.interfaceName)
        end
      else
        L1_11 = db.getAttributeWhere(_UPVALUE10_, L14_24, _UPVALUE49_.vapName)
        if UNIT_NAME == "DSR-1000AC" and L1_11 == nil then
          L1_11 = db.getAttributeWhere(_UPVALUE10_, L14_24, _UPVALUE49_.vapName)
        end
        if L1_11 ~= nil and L1_11 ~= "" and L1_11 ~= " " then
          L1_11 = db.getAttributeWhere(_UPVALUE46_, L14_24, _UPVALUE47_.interfaceName)
        end
      end
      if L1_11 ~= nil and L1_11 ~= "" and L1_11 ~= " " then
        L9_19 = L14_24
        if L9_19 then
          L10_20 = L14_24
          L14_24(L9_19)
        end
      end
  end
  else
    L1_11 = L14_24
    L9_19 = L14_24
    if L9_19 then
      L10_20 = L14_24
      L14_24(L9_19)
    end
  end
  if L10_20 then
    L12_22[L14_24] = L10_20
  else
    L12_22[L14_24] = "-1"
  end
  L12_22[L14_24] = db.getAttribute(_UPVALUE52_, _UPVALUE2_, _UPVALUE3_, _UPVALUE53_.regionInfo)
  if L14_24 ~= "DSR-1000AC" then
  else
    if L14_24 == "DSR-500AC" then
      L1_11 = L14_24
  end
  else
    L1_11 = L14_24
  end
  L12_22[L14_24] = L1_11
  L11_21 = L14_24
  i = L14_24
  L1_11 = 0
  for _FORV_17_, _FORV_18_ in L14_24(L11_21) do
    i = i + 1
    L13_23 = L11_21[i]
    L4_14 = db.getAttribute(_UPVALUE54_, _UPVALUE55_.profileName, L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.profileName], _UPVALUE55_.security)
    L5_15 = db.getAttribute(_UPVALUE54_, _UPVALUE55_.profileName, L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.profileName], _UPVALUE55_.pairwiseCiphers)
    if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
      if L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.vapEnabled] == "1" and L4_14 == "WEP" then
        if tonumber(db.getRowWhere("dot11Interface", "vapName='" .. L11_21[_FORV_17_]["dot11VAP.vapName"] .. "'", false).radioNo) == A0_10 then
          L1_11 = L1_11 + 1
        end
      elseif L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.vapEnabled] == "1" and L4_14 == "WPA" and L5_15 == "TKIP" and tonumber(db.getRowWhere("dot11Interface", "vapName='" .. L11_21[_FORV_17_]["dot11VAP.vapName"] .. "'", false).radioNo) == A0_10 then
        L1_11 = L1_11 + 1
      end
    elseif L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.vapEnabled] == "1" and L4_14 == "WEP" then
      L1_11 = L1_11 + 1
    elseif L13_23[_UPVALUE10_ .. "." .. _UPVALUE49_.vapEnabled] == "1" and L4_14 == "WPA" and L5_15 == "TKIP" then
      L1_11 = L1_11 + 1
    end
  end
  L12_22[L14_24] = L1_11
  L6_16 = L14_24.SUCCESS
  return L14_24, _UPVALUE7_.opSuccess, L12_22
end
function VAP_ConfigGet(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.FAILURE
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.dbError
  L3_28 = _UPVALUE0_
  L3_28 = L3_28.NIL
  L4_29 = _UPVALUE0_
  L4_29 = L4_29.NIL
  L5_30 = _UPVALUE0_
  L5_30 = L5_30.NIL
  L6_31 = _UPVALUE0_
  L6_31 = L6_31.NIL
  L7_32 = {}
  L8_33 = {}
  L9_34 = {}
  L10_35 = {}
  L3_28 = db.getAttribute(_UPVALUE1_, _UPVALUE2_.ROWID, A0_25, _UPVALUE2_.vapName) or ""
  L4_29 = _UPVALUE3_
  L5_30 = string.format(L4_29, 1, L3_28)
  L6_31 = string.format(L4_29, 0, L3_28)
  L7_32 = db.getRowsWhere(_UPVALUE4_, "command like '%stopStartVapInstance.sh%" .. L3_28 .. "'")
  L8_33 = L7_32[1]
  L9_34 = L7_32[2]
  L10_35 = {}
  if L8_33 == _UPVALUE0_.NIL then
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMinute] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.unit] = _UPVALUE6_
  else
    if L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.command] == L5_30 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.scheduleControl] = _UPVALUE6_
    else
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.scheduleControl] = _UPVALUE7_
    end
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.unit] = L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.unit]
    if tonumber(L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) == 0 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = "0"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = "12"
    elseif tonumber(L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) > 12 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = "1"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = tonumber(L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) - 12
    elseif tonumber(L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) == 12 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = "1"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = "12"
    else
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = "0"
    end
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.startMinute] = L8_33[_UPVALUE4_ .. "." .. _UPVALUE5_.minute]
  end
  if L9_34 == _UPVALUE0_.NIL then
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMinute] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = ""
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.unit] = _UPVALUE6_
  else
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.unit] = L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.unit]
    if tonumber(L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) == 0 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = "0"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = "12"
    elseif tonumber(L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) > 12 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = "1"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = tonumber(L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) - 12
    elseif tonumber(L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]) == 12 then
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = "1"
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = "12"
    else
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.hour]
      L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = "0"
    end
    L10_35[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMinute] = L9_34[_UPVALUE4_ .. "." .. _UPVALUE5_.minute]
  end
  L1_26 = _UPVALUE0_.SUCCESS
  return L1_26, _UPVALUE8_.opSuccess, L10_35
end
function radioConfigManagement(A0_36, A1_37, A2_38, A3_39, A4_40, A5_41, A6_42, A7_43, A8_44, A9_45)
  local L10_46, L11_47, L12_48, L13_49, L14_50, L15_51, L16_52, L17_53, L18_54, L19_55, L20_56
  L10_46 = _UPVALUE0_
  L10_46 = L10_46.FAILURE
  L11_47 = _UPVALUE0_
  L11_47 = L11_47.NIL
  L12_48 = _UPVALUE0_
  L12_48 = L12_48.NIL
  L13_49 = _UPVALUE0_
  L13_49 = L13_49.TRUE
  L14_50 = _UPVALUE0_
  L14_50 = L14_50.NIL
  L15_51 = _UPVALUE0_
  L15_51 = L15_51.NIL
  L16_52 = _UPVALUE0_
  L16_52 = L16_52.NIL
  L17_53 = {}
  L18_54 = {}
  L19_55 = {}
  L19_55 = L20_56
  if L20_56 >= 0 then
    for _FORV_23_, _FORV_24_ in L20_56(L19_55) do
      _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.txPower] = A0_36
      _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.txRate] = A1_37
      _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.puren] = A2_38
      L12_48 = _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.ROWID]
      L10_46, L11_47, timeConfig = VAP_ConfigGet(L12_48)
      if L10_46 ~= _UPVALUE0_.SUCCESS then
        return L10_46, _UPVALUE3_.opFailed
      end
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.unit]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.unit] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.startMinute]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startMinute] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMinute]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMinute] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian] = L12_48
      L12_48 = timeConfig[_UPVALUE4_ .. "." .. _UPVALUE5_.scheduleControl]
      _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.scheduleControl] = L12_48
      L13_49 = _UPVALUE6_.accessPointSet(_FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.ROWID], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.vapName], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.profileName], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.unit], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.scheduleControl], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startHour], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startMinute], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.startMeridian], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopHour], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMinute], _FORV_24_[_UPVALUE4_ .. "." .. _UPVALUE5_.stopMeridian], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.apIsolation], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.txPower], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.txRate], _FORV_24_[_UPVALUE1_ .. "." .. _UPVALUE2_.puren])
      if L13_49 ~= _UPVALUE0_.SUCCESS then
        L13_49 = _UPVALUE0_.NIL
        L10_46 = _UPVALUE0_.FAILURE
        return L10_46, _UPVALUE3_.opFailed
      end
    end
  end
  if L13_49 and L20_56 ~= _UPVALUE0_.NIL then
    A3_39 = db.getAttribute(_UPVALUE10_, _UPVALUE11_, _UPVALUE9_, _UPVALUE12_.regionInfo)
    L20_56[_UPVALUE7_ .. "." .. _UPVALUE8_.country] = A3_39
    L13_49 = db.update(_UPVALUE7_, L20_56, _UPVALUE9_)
  else
    L13_49 = _UPVALUE0_.NIL
  end
  if L13_49 then
    L17_53 = db.getRow(_UPVALUE13_, _UPVALUE14_.ROWID, _UPVALUE9_)
    L15_51 = L17_53[_UPVALUE13_ .. "." .. _UPVALUE14_.cardNo]
    if L15_51 ~= _UPVALUE0_.NIL then
      L18_54 = db.getRow(_UPVALUE15_, _UPVALUE16_.cardNo, L15_51)
      if L18_54 ~= _UPVALUE0_.NIL then
        if L13_49 then
          L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.opMode] = A4_40
          L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.configuredChannel] = A5_41
          L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.txPower] = A0_36
          L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.txRate] = A1_37
          L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.band] = A6_42
          if A7_43 ~= _UPVALUE0_.NI then
            L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.dothEnabled] = A7_43
          end
          L12_48 = L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.ROWID]
          L13_49 = db.update(_UPVALUE15_, L18_54, L12_48)
        end
        L16_52 = db.getRow(_UPVALUE17_, _UPVALUE18_.radioNo, L18_54[_UPVALUE15_ .. "." .. _UPVALUE16_.radioNo])
        if L16_52 ~= _UPVALUE0_.NIL then
          L16_52[_UPVALUE17_ .. "." .. _UPVALUE18_.chanWidth] = A8_44
          L16_52[_UPVALUE17_ .. "." .. _UPVALUE18_.puren] = A2_38
          L16_52[_UPVALUE17_ .. "." .. _UPVALUE18_.mimoPreamble] = A9_45
          L12_48 = L16_52[_UPVALUE17_ .. "." .. _UPVALUE18_.ROWID]
          L13_49 = db.update(_UPVALUE17_, L16_52, L12_48)
        end
      end
    end
  end
  L10_46 = _UPVALUE0_.SUCCESS
  return L10_46, _UPVALUE3_.opSuccess
end
function acRadioConfigManagement(A0_57, A1_58, A2_59, A3_60, A4_61, A5_62, A6_63, A7_64, A8_65, A9_66, A10_67)
  local L11_68, L12_69, L13_70, L14_71, L15_72, L16_73, L17_74, L18_75, L19_76, L20_77, L21_78, L22_79
  L11_68 = _UPVALUE0_
  L11_68 = L11_68.FAILURE
  L12_69 = _UPVALUE0_
  L12_69 = L12_69.NIL
  L13_70 = _UPVALUE0_
  L13_70 = L13_70.NIL
  L14_71 = _UPVALUE0_
  L14_71 = L14_71.TRUE
  L15_72 = _UPVALUE0_
  L15_72 = L15_72.NIL
  L16_73 = _UPVALUE0_
  L16_73 = L16_73.NIL
  L17_74 = _UPVALUE0_
  L17_74 = L17_74.NIL
  L18_75 = {}
  L19_76 = {}
  L20_77 = {}
  L21_78 = db
  L21_78 = L21_78.getRow
  L22_79 = _UPVALUE1_
  L21_78 = L21_78(L22_79, _UPVALUE2_.ROWID, _UPVALUE3_)
  L22_79 = _UPVALUE0_
  L22_79 = L22_79.NIL
  if L21_78 ~= L22_79 then
    L22_79 = db
    L22_79 = L22_79.getAttribute
    L22_79 = L22_79(_UPVALUE4_, _UPVALUE5_, _UPVALUE3_, _UPVALUE6_.regionInfo)
    A3_60 = L22_79
    L22_79 = _UPVALUE1_
    L22_79 = L22_79 .. "." .. _UPVALUE2_.country
    L21_78[L22_79] = A3_60
    L22_79 = db
    L22_79 = L22_79.update
    L22_79 = L22_79(_UPVALUE1_, L21_78, _UPVALUE3_)
    L14_71 = L22_79
  else
    L22_79 = _UPVALUE0_
    L14_71 = L22_79.NIL
  end
  if L14_71 then
    L22_79 = UNIT_NAME
    if L22_79 == "DSR-1000AC" then
      L22_79 = GHZ2_RADIO
      if A6_63 == L22_79 then
        L22_79 = GHZ2_RADIO_NUMBER
        cardNumber = L22_79
      else
        L22_79 = GHZ5_RADIO_NUMBER
        cardNumber = L22_79
      end
    else
      L22_79 = GHZ5_RADIO_NUMBER
      cardNumber = L22_79
    end
    L22_79 = db
    L22_79 = L22_79.getRow
    L22_79 = L22_79(_UPVALUE7_, _UPVALUE8_.ROWID, cardNumber)
    L18_75 = L22_79
    L22_79 = _UPVALUE7_
    L22_79 = L22_79 .. "." .. _UPVALUE8_.cardNo
    L16_73 = L18_75[L22_79]
    L22_79 = _UPVALUE0_
    L22_79 = L22_79.NIL
    if L16_73 ~= L22_79 then
      L22_79 = db
      L22_79 = L22_79.getRow
      L22_79 = L22_79(_UPVALUE9_, _UPVALUE10_.cardNo, L16_73)
      L19_76 = L22_79
      L22_79 = _UPVALUE0_
      L22_79 = L22_79.NIL
      if L19_76 ~= L22_79 then
        if L14_71 then
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.opMode
          L19_76[L22_79] = A4_61
          if A4_61 ~= "b and g" then
            L22_79 = _UPVALUE9_
            L22_79 = L22_79 .. "." .. _UPVALUE10_.preambleMode
            L19_76[L22_79] = "Long"
          end
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.configuredChannel
          L19_76[L22_79] = A5_62
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.txPower
          L19_76[L22_79] = A0_57
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.txRate
          L19_76[L22_79] = A1_58
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.band
          L19_76[L22_79] = A6_63
          L22_79 = _UPVALUE0_
          L22_79 = L22_79.NI
          if A7_64 ~= L22_79 then
            L22_79 = _UPVALUE9_
            L22_79 = L22_79 .. "." .. _UPVALUE10_.dothEnabled
            L19_76[L22_79] = A7_64
          end
          L22_79 = _UPVALUE9_
          L22_79 = L22_79 .. "." .. _UPVALUE10_.ROWID
          L13_70 = L19_76[L22_79]
          L22_79 = UNIT_NAME
          if L22_79 == "DSR-1000AC" then
            L22_79 = GHZ2_RADIO
            if A6_63 == L22_79 then
              L13_70 = GHZ2_RADIO_NUMBER
            else
              L13_70 = GHZ5_RADIO_NUMBER
            end
          else
            L13_70 = GHZ5_RADIO_NUMBER
          end
          L22_79 = db
          L22_79 = L22_79.update
          L22_79 = L22_79(_UPVALUE9_, L19_76, L13_70)
          L14_71 = L22_79
        end
        L22_79 = db
        L22_79 = L22_79.getRow
        L22_79 = L22_79(_UPVALUE11_, _UPVALUE12_.radioNo, L19_76[_UPVALUE9_ .. "." .. _UPVALUE10_.radioNo])
        L17_74 = L22_79
        L22_79 = _UPVALUE0_
        L22_79 = L22_79.NIL
        if L17_74 ~= L22_79 then
          L22_79 = _UPVALUE11_
          L22_79 = L22_79 .. "." .. _UPVALUE12_.chanWidth
          L17_74[L22_79] = A8_65
          L22_79 = _UPVALUE11_
          L22_79 = L22_79 .. "." .. _UPVALUE12_.puren
          L17_74[L22_79] = A2_59
          L22_79 = _UPVALUE11_
          L22_79 = L22_79 .. "." .. _UPVALUE12_.mimoPreamble
          L17_74[L22_79] = A9_66
          L22_79 = _UPVALUE11_
          L22_79 = L22_79 .. "." .. _UPVALUE12_.pureAc
          L17_74[L22_79] = A10_67
          L22_79 = _UPVALUE11_
          L22_79 = L22_79 .. "." .. _UPVALUE12_.ROWID
          L13_70 = L17_74[L22_79]
          L22_79 = UNIT_NAME
          if L22_79 == "DSR-1000AC" then
            L22_79 = GHZ2_RADIO
            if A6_63 == L22_79 then
              L22_79 = GHZ2_RADIO_NUMBER
              cardNumber = L22_79
            else
              L22_79 = GHZ5_RADIO_NUMBER
              cardNumber = L22_79
            end
          else
            L22_79 = GHZ5_RADIO_NUMBER
            cardNumber = L22_79
          end
          L22_79 = db
          L22_79 = L22_79.update
          L22_79 = L22_79(_UPVALUE11_, L17_74, L13_70)
          L14_71 = L22_79
        end
      end
    end
  end
  L22_79 = db
  L22_79 = L22_79.getAttribute
  L22_79 = L22_79(_UPVALUE9_, _UPVALUE10_.cardNo, L16_73, _UPVALUE10_.radioNo)
  L22_79 = L22_79 or 1
  L20_77 = db.getRowsWhere(_UPVALUE13_, "radioList LIKE '%" .. L22_79 .. "%'")
  if #L20_77 >= 0 then
    for _FORV_26_, _FORV_27_ in pairs(L20_77) do
      _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.txPower] = A0_57
      _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.txRate] = A1_58
      _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.puren] = A2_59
      L13_70 = _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.ROWID]
      L11_68, L12_69, timeConfig = VAP_ConfigGet(L13_70)
      if L11_68 ~= _UPVALUE0_.SUCCESS then
        return L11_68, _UPVALUE15_.opFailed
      end
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.unit]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.unit] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.startHour]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startHour] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.startMinute]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startMinute] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.startMeridian]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startMeridian] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.stopHour]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopHour] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMinute]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMinute] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMeridian]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMeridian] = L13_70
      L13_70 = timeConfig[_UPVALUE16_ .. "." .. _UPVALUE17_.scheduleControl]
      _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.scheduleControl] = L13_70
      L14_71 = _UPVALUE18_.accessPointSet(_FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.ROWID], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.vapName], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.profileName], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.unit], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.scheduleControl], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startHour], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startMinute], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.startMeridian], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopHour], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMinute], _FORV_27_[_UPVALUE16_ .. "." .. _UPVALUE17_.stopMeridian], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.apIsolation], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.txPower], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.txRate], _FORV_27_[_UPVALUE13_ .. "." .. _UPVALUE14_.puren])
      if L14_71 ~= _UPVALUE0_.SUCCESS then
        L14_71 = _UPVALUE0_.NIL
        L11_68 = _UPVALUE0_.FAILURE
        return L11_68, _UPVALUE15_.opFailed
      end
    end
  end
  L11_68 = _UPVALUE0_.SUCCESS
  return L11_68, _UPVALUE15_.opSuccess
end
function radioConfigSet(A0_80, A1_81, A2_82, A3_83, A4_84, A5_85, A6_86, A7_87, A8_88, A9_89)
  local L10_90, L11_91, L12_92, L13_93, L14_94, L15_95, L16_96, L17_97, L18_98, L19_99
  L10_90 = _UPVALUE0_
  L10_90 = L10_90.NIL
  L11_91 = _UPVALUE0_
  L11_91 = L11_91.NIL
  L12_92 = _UPVALUE0_
  L12_92 = L12_92.NIL
  L13_93 = _UPVALUE0_
  L13_93 = L13_93.NIL
  L14_94 = _UPVALUE1_
  L15_95 = _UPVALUE1_
  L16_96 = {}
  L17_97 = ""
  L18_98 = ""
  L19_99 = db
  L19_99 = L19_99.getAttribute
  L19_99 = L19_99(_UPVALUE2_, _UPVALUE3_.country, A6_86, _UPVALUE3_.countrycode)
  L13_93 = L19_99 or A6_86
  L19_99 = UNIT_NAME
  if L19_99 ~= "DSR-1000AC" then
    L19_99 = UNIT_NAME
  else
    if L19_99 == "DSR-500AC" then
      if A2_82 ~= "80" and A2_82 ~= "20" then
        L17_97 = "40"
      elseif A2_82 ~= "20" then
        L17_97 = "80"
      end
  end
  elseif A2_82 ~= "20" then
    L17_97 = "40"
  end
  L19_99 = _UPVALUE4_
  if A3_83 == L19_99 then
    L18_98 = "-"
  end
  L19_99 = _UPVALUE5_
  if A3_83 == L19_99 then
    L18_98 = "+"
  end
  L19_99 = _UPVALUE1_
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L19_99 = _UPVALUE1_
    if A1_81 == _UPVALUE6_ then
      A1_81 = _UPVALUE7_
      L19_99 = _UPVALUE8_
    elseif A1_81 == _UPVALUE9_ then
      A1_81 = _UPVALUE7_
    end
  end
  if A1_81 == _UPVALUE10_ then
    A1_81 = _UPVALUE11_
  elseif A1_81 == _UPVALUE12_ then
    A1_81 = _UPVALUE13_
  elseif A1_81 == _UPVALUE14_ then
    A1_81 = _UPVALUE15_
  elseif A1_81 == _UPVALUE16_ then
    A1_81 = _UPVALUE17_
  else
    if A1_81 == _UPVALUE18_ then
      A1_81 = _UPVALUE19_
    elseif A1_81 == _UPVALUE20_ then
      A1_81 = _UPVALUE21_
    elseif A1_81 == _UPVALUE22_ then
      if A0_80 == "b" then
        A1_81 = _UPVALUE19_
      else
        A1_81 = _UPVALUE21_
      end
      L14_94 = _UPVALUE8_
      L15_95 = _UPVALUE1_
    end
    if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
      if L17_97 == "40" or L17_97 == "20" then
        A1_81 = A1_81 .. L17_97 .. L18_98
      elseif L17_97 == "80" then
        A1_81 = A1_81 .. L17_97
      end
    else
      A1_81 = A1_81 .. L17_97 .. L18_98
    end
  end
  if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
    L11_91, L12_92 = acRadioConfigManagement(A7_87, A5_85, L14_94, A6_86, A1_81, A4_84, A0_80, A8_88, A2_82, L15_95, L19_99)
  else
    L11_91, L12_92 = radioConfigManagement(A7_87, A5_85, L14_94, A6_86, A1_81, A4_84, A0_80, A8_88, A2_82, L15_95)
  end
  if L11_91 ~= _UPVALUE0_.SUCCESS then
    return L11_91, L12_92
  end
  L11_91 = _UPVALUE0_.SUCCESS
  return L11_91, _UPVALUE23_.opSuccess
end
function getRadioConfOptionMode()
  local L0_100, L1_101, L2_102, L3_103, L4_104, L5_105, L6_106
  L0_100 = db
  L0_100 = L0_100.getTable
  L1_101 = _UPVALUE0_
  L0_100 = L0_100(L1_101)
  L1_101, L2_102, L3_103, L4_104, L5_105, L6_106 = nil, nil, nil, nil, nil, nil
  if L0_100 ~= _UPVALUE1_.NIL then
    for _FORV_10_, _FORV_11_ in pairs(L0_100) do
      L6_106 = _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.band]
      if _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.band] == "a" then
        L2_102 = _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.opMode]
        L4_104 = db.getAttribute(_UPVALUE3_, _UPVALUE2_.radioNo, _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.radioNo], _UPVALUE4_.puren)
        L5_105 = db.getAttribute(_UPVALUE3_, _UPVALUE2_.radioNo, _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.radioNo], _UPVALUE4_.pureAc)
      elseif _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.band] == "b" then
        L1_101 = _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.opMode]
        L3_103 = db.getAttribute(_UPVALUE3_, _UPVALUE2_.radioNo, _FORV_11_[_UPVALUE0_ .. "." .. _UPVALUE2_.radioNo], _UPVALUE4_.puren)
      end
    end
  end
  return L1_101, L2_102, L3_103, L4_104, L5_105, L6_106
end
