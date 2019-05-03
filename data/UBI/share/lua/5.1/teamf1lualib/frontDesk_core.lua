local L0_0
L0_0 = module
L0_0("com.teamf1.core.frontDesk", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("captivePortalLib")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).username = "UserName"
;({}).password = "Password"
;({}).batchGenVal = "BatchGenValue"
;({}).flag = "Flag"
;({}).curTimeUsage = "currentTimeUsage"
;({}).curTraficUsage = "currentTrafficUsage"
;({}).profileId = "ProfileId"
;({}).cstAccName = "CstmAccName"
;({}).idleTimeout = "IdleTimeout"
;({}).limitChecks = "Limitchecks"
;({}).loginCheck = "LoginCheck"
;({}).beginDate = "BeginDate"
;({}).expirationDate = "ExpirationDate"
;({}).maxUsageTimeInfo = "MaxUsageTimeInfo"
;({}).maxUsageTraficInfo = "MaxUsageTrafficInfo"
;({}).multiLogin = "MultiLogin"
;({}).groupId = "GroupId"
;({}).groupname = "GroupName"
;({}).tmpUser = "Temp-CP"
;({}).validDurCheck = "ValidDurationCheck"
;({}).modifyDuration = "ModifyDuration"
;({}).durationType = "DurationType"
;({}).startTimeType = "StartTimeType"
;({}).startTimeVal = "StartTimeValue"
;({}).maxUsageTimeCheck = "MaxUsageTimeCheck"
;({}).modifyUsage = "ModifyUsage"
;({}).maxUsageTimeType = "MaxUsageTimeType"
;({}).maxUsageTimeVal = "MaxUsageTimeValue"
;({}).maxUsageTrafficCheck = "MaxUsageTrafficCheck"
;({}).maxUsageTrafficType = "MaxUsageTrafficType"
;({}).maxUsageTrafficVal = "MaxUsageTrafficValue"
;({}).beginTimeCheck = "BeginEndTimeCheck"
;({}).validDurationCheck = "ValidDurationCheck"
;({}).sessionIdleTimeOut = "SessionIdealTimeout"
;({}).startTime = "StartTime"
;({}).endTime = "EndTime"
;({}).maxUsageTime = "MaxUsageTime"
;({}).maxUsageTraffic = "MaxUsageTraffic"
;({}).usageTimeLeft = "usageTimeLeft"
;({}).usageTraficLeft = "usageTraficLeft"
;({}).extendTimeUsage = "extendTimeUsage"
;({}).extendTrafficUsage = "extendTrafficUsage"
;({}).extendTime = "extendEndTime"
;({}).accountType = "accountType"
;({}).userCount = "userCount"
;({}).batchLimitCookie = "batchLimitCookie"
;({}).tableName = "tableName"
;({}).operationFlag = "operationFlag"
;({}).cookie = "cookie"
;({}).dayLightSaving = "DayLightSaving"
TABLE_ROW_INSERT = 0
TABLE_ROW_UPDATE = 1
TABLE_ROW_DELETE = 2
MAX_FD_TEMP_USER_NUMBER = 256
;({}).createQuery = function(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L2_3 = ""
  L3_4 = "INSERT INTO "
  L4_5 = A0_1
  L5_6 = " ("
  L3_4 = L3_4 .. L4_5 .. L5_6
  L4_5 = ") VALUES ("
  L5_6 = db
  L5_6 = L5_6.getColNames
  L6_7 = A0_1
  L5_6 = L5_6(L6_7)
  L6_7 = db
  L6_7 = L6_7.getDefaults
  L6_7 = L6_7(L7_8, L8_9)
  for L10_11, L11_12 in L7_8(L8_9) do
    L3_4 = L3_4 .. "'" .. L11_12 .. "', "
    if L11_12 == "_ROWID_" then
      L4_5 = L4_5 .. "(select OID from oidRecord where tableName=\"" .. A0_1 .. "\"), "
    elseif util.tableKeyExists(A1_2, A0_1 .. "." .. L11_12) then
      L4_5 = L4_5 .. "'" .. A1_2[A0_1 .. "." .. L11_12] .. "', "
    elseif L6_7[A0_1 .. "." .. L11_12] then
      L4_5 = L4_5 .. "'" .. L6_7[A0_1 .. "." .. L11_12] .. "', "
    else
      L4_5 = L4_5 .. "NULL, "
    end
  end
  L11_12 = L3_4
  L10_11 = L3_4.len
  L10_11 = L10_11(L11_12)
  L10_11 = L10_11 - 2
  L3_4 = L7_8
  L11_12 = L4_5
  L10_11 = L4_5.len
  L10_11 = L10_11(L11_12)
  L10_11 = L10_11 - 2
  L4_5 = L7_8
  L4_5 = L7_8 .. L8_9
  L2_3 = L7_8 .. L8_9
  return L2_3
end
function genTmpUser(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25, L13_26, L14_27, L15_28, L16_29, L17_30, L18_31, L19_32, L20_33, L21_34, L22_35, L23_36, L24_37, L25_38, L26_39
  L3_16 = ""
  L4_17 = "swType = 1"
  L5_18 = db
  L5_18 = L5_18.getRowsWhere
  L6_19 = "tempUsers"
  L7_20 = L4_17
  L5_18 = L5_18(L6_19, L7_20)
  L6_19 = _UPVALUE0_
  L7_20 = "."
  L8_21 = _UPVALUE1_
  L8_21 = L8_21.batchGenVal
  L6_19 = L6_19 .. L7_20 .. L8_21
  L6_19 = A0_13[L6_19]
  L6_19 = L6_19 or 1
  L7_20 = db
  L7_20 = L7_20.getAttribute
  L8_21 = _UPVALUE2_
  L9_22 = _UPVALUE3_
  L10_23 = "1"
  L11_24 = _UPVALUE1_
  L11_24 = L11_24.userCount
  L7_20 = L7_20(L8_21, L9_22, L10_23, L11_24)
  if L7_20 == nil then
    L8_21 = _UPVALUE4_
    L8_21 = L8_21.FAILURE
    return L8_21
  end
  L8_21 = nil
  L9_22 = tonumber
  L10_23 = L7_20
  L9_22 = L9_22(L10_23)
  L9_22 = L9_22 + L6_19
  if A2_15 then
    L10_23 = tonumber
    L11_24 = L7_20
    L10_23 = L10_23(L11_24)
    L8_21 = L10_23
  else
    L10_23 = tonumber
    L11_24 = L7_20
    L10_23 = L10_23(L11_24)
    L8_21 = L10_23 + L6_19
  end
  L10_23 = MAX_FD_TEMP_USER_NUMBER
  if L8_21 <= L10_23 then
    L10_23 = {}
    CPAccTableUser = L10_23
    L10_23 = false
    L11_24 = {}
    L12_25 = _UPVALUE5_
    L13_26 = "."
    L14_27 = _UPVALUE1_
    L14_27 = L14_27.tableName
    L12_25 = L12_25 .. L13_26 .. L14_27
    L11_24[L12_25] = "auto"
    L12_25 = _UPVALUE5_
    L13_26 = "."
    L14_27 = _UPVALUE1_
    L14_27 = L14_27.operationFlag
    L12_25 = L12_25 .. L13_26 .. L14_27
    L13_26 = TABLE_ROW_INSERT
    L11_24[L12_25] = L13_26
    L12_25 = db
    L12_25 = L12_25.execute
    L13_26 = "ATTACH '/tmp/cpAcc.db' as cpAccDB"
    L12_25(L13_26)
    L12_25 = "update tempUsers set Flag=0"
    L13_26 = db
    L13_26 = L13_26.execute
    L14_27 = L12_25
    L13_26 = L13_26(L14_27)
    L10_23 = L13_26
    L13_26 = captivePortalLib
    L13_26 = L13_26.genBatchCookie
    L14_27 = L13_26()
    L15_28 = tonumber
    L16_29 = L13_26
    L15_28 = L15_28(L16_29)
    if 1 ~= L15_28 then
      L15_28 = db
      L15_28 = L15_28.execute
      L16_29 = "DETACH cpAccDB"
      L15_28(L16_29)
      L15_28 = _UPVALUE4_
      L15_28 = L15_28.FAILURE
      return L15_28
    end
    L15_28 = _UPVALUE5_
    L16_29 = "."
    L15_28 = L15_28 .. L16_29 .. L17_30
    L11_24[L15_28] = L14_27
    if L10_23 then
      L15_28 = tempUsertableValidations
      L16_29 = A0_13
      L15_28 = L15_28(L16_29, L17_30)
      if L15_28 then
        L16_29 = _UPVALUE0_
        L16_29 = L16_29 .. L17_30 .. L18_31
        L16_29 = A0_13[L16_29]
        L16_29 = L16_29 or 1
        for L20_33 = 1, L16_29 do
          L21_34 = captivePortalLib
          L21_34 = L21_34.genCreds
          L22_35 = L21_34()
          if L21_34 and L22_35 then
            L23_36 = _UPVALUE0_
            L24_37 = "."
            L25_38 = _UPVALUE1_
            L25_38 = L25_38.username
            L23_36 = L23_36 .. L24_37 .. L25_38
            L15_28[L23_36] = L21_34
            L23_36 = _UPVALUE0_
            L24_37 = "."
            L25_38 = _UPVALUE1_
            L25_38 = L25_38.password
            L23_36 = L23_36 .. L24_37 .. L25_38
            L15_28[L23_36] = L22_35
            L23_36 = _UPVALUE0_
            L24_37 = "."
            L25_38 = _UPVALUE1_
            L25_38 = L25_38.flag
            L23_36 = L23_36 .. L24_37 .. L25_38
            L15_28[L23_36] = "1"
            L23_36 = _UPVALUE0_
            L24_37 = "."
            L25_38 = _UPVALUE1_
            L25_38 = L25_38.batchLimitCookie
            L23_36 = L23_36 .. L24_37 .. L25_38
            L15_28[L23_36] = L14_27
            if A2_15 then
              L23_36 = _UPVALUE0_
              L24_37 = "."
              L25_38 = _UPVALUE1_
              L25_38 = L25_38.accountType
              L23_36 = L23_36 .. L24_37 .. L25_38
              L15_28[L23_36] = "1"
            end
            L23_36 = db
            L23_36 = L23_36.getAttribute
            L24_37 = _UPVALUE6_
            L25_38 = _UPVALUE1_
            L25_38 = L25_38.username
            L26_39 = L21_34
            L23_36 = L23_36(L24_37, L25_38, L26_39, _UPVALUE7_)
            L3_16 = L23_36
            L23_36 = _UPVALUE4_
            L23_36 = L23_36.NIL
            if L3_16 ~= L23_36 then
              L23_36 = _UPVALUE4_
              L23_36 = L23_36.EMPTY
            elseif L3_16 == L23_36 then
              L23_36 = CPAccTableUser
              L24_37 = _UPVALUE6_
              L25_38 = "."
              L26_39 = _UPVALUE1_
              L26_39 = L26_39.username
              L24_37 = L24_37 .. L25_38 .. L26_39
              L23_36[L24_37] = L21_34
              L23_36 = CPAccTableUser
              L24_37 = _UPVALUE6_
              L25_38 = "."
              L26_39 = _UPVALUE1_
              L26_39 = L26_39.curTimeUsage
              L24_37 = L24_37 .. L25_38 .. L26_39
              L23_36[L24_37] = "0"
              L23_36 = CPAccTableUser
              L24_37 = _UPVALUE6_
              L25_38 = "."
              L26_39 = _UPVALUE1_
              L26_39 = L26_39.curTraficUsage
              L24_37 = L24_37 .. L25_38 .. L26_39
              L23_36[L24_37] = "0"
              L23_36 = CPAccTableUser
              L24_37 = _UPVALUE6_
              L25_38 = "."
              L26_39 = _UPVALUE1_
              L26_39 = L26_39.batchLimitCookie
              L24_37 = L24_37 .. L25_38 .. L26_39
              L23_36[L24_37] = L14_27
              L23_36 = db
              L23_36 = L23_36.insert
              L24_37 = _UPVALUE6_
              L25_38 = CPAccTableUser
              L23_36 = L23_36(L24_37, L25_38)
              L10_23 = L23_36
            end
            if L10_23 then
              L23_36 = _UPVALUE8_
              while true do
                L24_37 = _UPVALUE8_
                if L23_36 == L24_37 then
                  L24_37 = _UPVALUE9_
                  L24_37 = L24_37.createQuery
                  L25_38 = "tempUsers"
                  L26_39 = L15_28
                  L24_37 = L24_37(L25_38, L26_39)
                  L25_38 = accountTableWrapper
                  L26_39 = L15_28
                  L25_38 = L25_38(L26_39)
                  L26_39 = _UPVALUE9_
                  L26_39 = L26_39.createQuery
                  L26_39 = L26_39("CPAccConf", L25_38)
                  L10_23, L23_36 = captivePortalLib.createFDUsers(L24_37, L26_39)
                  if L10_23 == 0 then
                    L10_23 = false
                  end
                  else
                    L10_23 = false
                  end
                end
              end
            end
        end
      end
    end
    if L10_23 then
      L15_28 = db
      L15_28 = L15_28.update
      L16_29 = _UPVALUE5_
      L15_28(L16_29, L17_30, L18_31)
      L15_28 = db
      L15_28 = L15_28.execute
      L16_29 = "DETACH cpAccDB"
      L15_28(L16_29)
      L15_28 = db
      L15_28 = L15_28.setAttribute
      L16_29 = _UPVALUE2_
      L20_33 = L9_22
      L15_28 = L15_28(L16_29, L17_30, L18_31, L19_32, L20_33)
      status = L15_28
      L15_28 = status
      if not L15_28 then
        L15_28 = _UPVALUE4_
        L15_28 = L15_28.FAILURE
        return L15_28
      end
      L15_28 = db
      L15_28 = L15_28.save
      L15_28()
      L15_28 = _UPVALUE4_
      L15_28 = L15_28.SUCCESS
      return L15_28
    else
      L15_28 = db
      L15_28 = L15_28.execute
      L16_29 = "DETACH cpAccDB"
      L15_28(L16_29)
      L15_28 = _UPVALUE4_
      L15_28 = L15_28.FAILURE
      return L15_28
    end
  else
    L10_23 = #L5_18
    L11_24 = MAX_FD_TEMP_USER_NUMBER
    if L10_23 == L11_24 then
      L10_23 = _UPVALUE10_
      L10_23 = L10_23.CHECK_FD_TEMP_USER_LIMIT_REACHED
      return L10_23
    else
      L10_23 = MAX_FD_TEMP_USER_NUMBER
      if L8_21 > L10_23 then
        L10_23 = _UPVALUE10_
        L10_23 = L10_23.CHECK_FD_TEMP_USER_CHANGE_LIMIT
        return L10_23
      end
    end
  end
end
function tempUsertableValidations(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46
  L2_42 = {}
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.profileId
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = A1_41
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.cstAccName
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = " "
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.idleTimeout
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.limitChecks
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.loginCheck
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.beginDate
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.expirationDate
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.maxUsageTimeInfo
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE0_
  L4_44 = "."
  L5_45 = _UPVALUE1_
  L5_45 = L5_45.maxUsageTraficInfo
  L3_43 = L3_43 .. L4_44 .. L5_45
  L2_42[L3_43] = "0"
  L3_43 = _UPVALUE2_
  L2_42["tempUsers.DayLightSaving"] = L3_43
  L3_43 = false
  L4_44 = db
  L4_44 = L4_44.getRow
  L5_45 = _UPVALUE3_
  L6_46 = _UPVALUE1_
  L6_46 = L6_46.profileId
  L4_44 = L4_44(L5_45, L6_46, A1_41)
  L5_45 = db
  L5_45 = L5_45.getAttribute
  L6_46 = "ntp"
  L5_45 = L5_45(L6_46, "_ROWID_", "1", "autoDaylight")
  if L4_44 then
    L6_46 = _UPVALUE0_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.idleTimeout
    L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.idleTimeout]
    L6_46 = _UPVALUE0_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.multiLogin
    L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.multiLogin]
    L6_46 = _UPVALUE0_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.cstAccName
    L2_42[L6_46] = A0_40[_UPVALUE0_ .. "." .. _UPVALUE1_.cstAccName]
    L6_46 = _UPVALUE0_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.groupId
    L2_42[L6_46] = db.getAttribute(_UPVALUE4_, _UPVALUE1_.groupname, _UPVALUE1_.tmpUser, _UPVALUE1_.groupId)
    if L5_45 == "1" then
      L6_46 = _UPVALUE5_
      L2_42["tempUsers.DayLightSaving"] = L6_46
    elseif L5_45 == "0" then
      L6_46 = _UPVALUE2_
      L2_42["tempUsers.DayLightSaving"] = L6_46
    end
    L6_46 = _UPVALUE3_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.validDurCheck
    L6_46 = L4_44[L6_46]
    if L6_46 == "1" then
      L6_46 = _UPVALUE0_
      L6_46 = L6_46 .. "." .. _UPVALUE1_.expirationDate
      L2_42[L6_46] = dateToDB(A0_40[_UPVALUE0_ .. "." .. _UPVALUE1_.expirationDate])
      L6_46 = _UPVALUE3_
      L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyDuration
      L6_46 = L4_44[L6_46]
      if L6_46 == "1" then
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.durationType
        L6_46 = L4_44[L6_46]
        if L6_46 ~= "2" then
          L6_46 = nil
          if A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeType] == "0" then
            L6_46 = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeVal] * 60 * 60
          elseif A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeType] == "1" then
            L6_46 = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeVal] * 60 * 60 * 24
          end
          if L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.durationType] == "0" then
            L2_42[_UPVALUE0_ .. "." .. _UPVALUE1_.beginDate] = util.date().year .. "/" .. util.date().month .. "/" .. util.date().date .. "@" .. util.date().hours .. ":" .. util.date().minutes
          elseif L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.durationType] == "1" then
            L2_42[_UPVALUE0_ .. "." .. _UPVALUE1_.loginCheck] = L6_46
          end
        else
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.durationType
          L6_46 = L4_44[L6_46]
          if L6_46 == "2" then
            L6_46 = _UPVALUE0_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.beginDate
            L2_42[L6_46] = dateToDB(A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.beginDate])
          end
        end
      else
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyDuration
        L6_46 = L4_44[L6_46]
        if L6_46 == "0" then
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.durationType
          L6_46 = L4_44[L6_46]
          if L6_46 ~= "2" then
            L6_46 = nil
            if L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeType] == "0" then
              L6_46 = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeVal] * 60 * 60
            elseif L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeType] == "1" then
              L6_46 = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.startTimeVal] * 60 * 60 * 24
            end
            if L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.durationType] == "0" then
              L2_42[_UPVALUE0_ .. "." .. _UPVALUE1_.beginDate] = util.date().year .. "/" .. util.date().month .. "/" .. util.date().date .. "@" .. util.date().hours .. ":" .. util.date().minutes
            elseif L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.durationType] == "1" then
              L2_42[_UPVALUE0_ .. "." .. _UPVALUE1_.loginCheck] = L6_46
            end
          else
            L6_46 = _UPVALUE3_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.durationType
            L6_46 = L4_44[L6_46]
            if L6_46 == "2" then
              L6_46 = _UPVALUE0_
              L6_46 = L6_46 .. "." .. _UPVALUE1_.beginDate
              L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.beginDate]
            end
          end
        end
      end
    end
    L6_46 = _UPVALUE3_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeCheck
    L6_46 = L4_44[L6_46]
    if L6_46 == "1" then
      L6_46 = _UPVALUE3_
      L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyUsage
      L6_46 = L4_44[L6_46]
      if L6_46 == "1" then
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeType
        L6_46 = A0_40[L6_46]
        if L6_46 == "0" then
          L6_46 = _UPVALUE0_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeInfo
          L2_42[L6_46] = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTimeVal] * 60 * 60
        else
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeType
          L6_46 = A0_40[L6_46]
          if L6_46 == "1" then
            L6_46 = _UPVALUE0_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeInfo
            L2_42[L6_46] = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTimeVal] * 60 * 60 * 24
          end
        end
      else
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyUsage
        L6_46 = L4_44[L6_46]
        if L6_46 == "0" then
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeType
          L6_46 = L4_44[L6_46]
          if L6_46 == "0" then
            L6_46 = _UPVALUE0_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeInfo
            L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTimeVal] * 60 * 60
          else
            L6_46 = _UPVALUE3_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeType
            L6_46 = L4_44[L6_46]
            if L6_46 == "1" then
              L6_46 = _UPVALUE0_
              L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTimeInfo
              L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTimeVal] * 60 * 60 * 24
            end
          end
        end
      end
    end
    L6_46 = _UPVALUE3_
    L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTrafficCheck
    L6_46 = L4_44[L6_46]
    if L6_46 == "1" then
      L6_46 = _UPVALUE3_
      L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyUsage
      L6_46 = L4_44[L6_46]
      if L6_46 == "1" then
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTrafficType
        L6_46 = A0_40[L6_46]
        if L6_46 == "2" then
          L6_46 = _UPVALUE0_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTraficInfo
          L2_42[L6_46] = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTrafficVal]
        else
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTrafficType
          L6_46 = A0_40[L6_46]
          if L6_46 == "3" then
            L6_46 = _UPVALUE0_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTraficInfo
            L2_42[L6_46] = A0_40[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTrafficVal] * 1024
          end
        end
      else
        L6_46 = _UPVALUE3_
        L6_46 = L6_46 .. "." .. _UPVALUE1_.modifyUsage
        L6_46 = L4_44[L6_46]
        if L6_46 == "0" then
          L6_46 = _UPVALUE3_
          L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTrafficType
          L6_46 = L4_44[L6_46]
          if L6_46 == "2" then
            L6_46 = _UPVALUE0_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTraficInfo
            L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTrafficVal]
          else
            L6_46 = _UPVALUE3_
            L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTrafficType
            L6_46 = L4_44[L6_46]
            if L6_46 == "3" then
              L6_46 = _UPVALUE0_
              L6_46 = L6_46 .. "." .. _UPVALUE1_.maxUsageTraficInfo
              L2_42[L6_46] = L4_44[_UPVALUE3_ .. "." .. _UPVALUE1_.maxUsageTrafficVal] * 1024
            end
          end
        end
      end
    end
    return L2_42
  else
    L6_46 = nil
    return L6_46
  end
end
function accountTableWrapper(A0_47)
  local L1_48
  L1_48 = {}
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.username] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.username]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.beginTimeCheck] = db.getAttribute(_UPVALUE3_, _UPVALUE1_.profileId, A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.profileId], _UPVALUE1_.validDurationCheck)
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.sessionIdleTimeOut] = db.getAttribute(_UPVALUE3_, _UPVALUE1_.profileId, A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.profileId], _UPVALUE1_.idleTimeout) * 60
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.startTime] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.beginDate]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.endTime] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.expirationDate]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.loginCheck] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.loginCheck]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTime] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.maxUsageTimeInfo]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTraffic] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.maxUsageTraficInfo]
  L1_48[_UPVALUE0_ .. "." .. _UPVALUE1_.batchLimitCookie] = A0_47[_UPVALUE2_ .. "." .. _UPVALUE1_.batchLimitCookie]
  return L1_48
end
function dateToDB(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54
  L1_50 = {}
  for L5_54 in L2_51(L3_52, L4_53) do
    valid = table.insert(L1_50, L5_54)
  end
  if L2_51 ~= 0 then
    L5_54 = L1_50[1]
    L5_54 = "/"
    return L2_51
  end
  return L2_51
end
function lpad(A0_55, A1_56)
  return A0_55.rep(0, A1_56 - #A0_55) .. A0_55
end
function viewAccountDetails(A0_57)
  local L1_58, L2_59
  L1_58 = {}
  L2_59 = db
  L2_59 = L2_59.getRowsWithJoin
  L2_59 = L2_59({
    "tempUsers:tempCPUserProfiles:ProfileId"
  }, _UPVALUE0_ .. "." .. _UPVALUE1_.profileId, A0_57)
  for _FORV_6_, _FORV_7_ in pairs(L2_59) do
    if _FORV_7_["tempUsers.accountType"] == "1" then
      L2_59[_FORV_6_] = nil
    end
  end
  L1_58 = L2_59
  if L2_59[1] then
    profileHeading = L2_59[1]["tempCPUserProfiles.ProfileName"]
  else
    profileHeading = db.getAttribute("tempCPUserProfiles", _UPVALUE1_.profileId, A0_57, "ProfileName")
  end
  db.execute("ATTACH '/tmp/cpAcc.db' as cpAccDB")
  for _FORV_6_, _FORV_7_ in pairs(L2_59) do
    if db.getRow(_UPVALUE2_, _UPVALUE1_.username, _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.username]) then
      if _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTimeInfo] ~= "0" then
        usageTimeLeft = _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTimeInfo] - db.getRow(_UPVALUE2_, _UPVALUE1_.username, _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.username])[_UPVALUE2_ .. "." .. _UPVALUE1_.curTimeUsage]
      else
        usageTimeLeft = "NA"
      end
      if _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTraficInfo] ~= "0" then
        usageTrafficLeft = _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTraficInfo] - db.getRow(_UPVALUE2_, _UPVALUE1_.username, _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.username])[_UPVALUE2_ .. "." .. _UPVALUE1_.curTraficUsage]
      else
        usageTrafficLeft = "NA"
      end
    else
      usageTimeLeft = "NA"
      usageTrafficLeft = "NA"
    end
    if _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.expirationDate] == "0" then
      expDate = "NA"
    else
      expDate = dateToGUI(_FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.expirationDate])
    end
    L1_58[_FORV_6_][_UPVALUE3_] = _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE3_]
    L1_58[_FORV_6_][_UPVALUE1_.username] = _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.username]
    L1_58[_FORV_6_][_UPVALUE1_.expirationDate] = expDate
    L1_58[_FORV_6_][_UPVALUE1_.usageTimeLeft] = usageTimeLeft
    L1_58[_FORV_6_][_UPVALUE1_.usageTraficLeft] = usageTrafficLeft
    L1_58[_FORV_6_][_UPVALUE1_.dayLightSaving] = _FORV_7_[_UPVALUE0_ .. "." .. _UPVALUE1_.dayLightSaving]
  end
  return L1_58
end
function dateToGUI(A0_60)
  local L1_61, L2_62, L3_63, L4_64, L5_65
  L1_61 = {}
  for L5_65 in L2_62(L3_63, L4_64) do
    valid = table.insert(L1_61, L5_65)
  end
  if L2_62 ~= nil then
    L5_65 = "/"
    return L2_62
  end
  return L2_62
end
function trafficConv(A0_66)
  local L1_67, L2_68, L3_69, L4_70
  L1_67 = "2"
  L2_68 = A0_66 / 1024
  if L2_68 > 1 then
    L1_67 = "3"
    L3_69 = L1_67
    L4_70 = L2_68
    return L3_69, L4_70
  else
    L3_69 = L1_67
    L4_70 = A0_66
    return L3_69, L4_70
  end
end
function timeConv(A0_71)
  local L1_72, L2_73, L3_74, L4_75, L5_76
  L1_72 = "0"
  L2_73 = A0_71 / 3600
  L3_74 = L2_73 / 24
  if L3_74 > 1 then
    L1_72 = "1"
    L4_75 = L1_72
    L5_76 = L3_74
    return L4_75, L5_76
  else
    L4_75 = L1_72
    L5_76 = L2_73
    return L4_75, L5_76
  end
end
function viewProfileDetails(A0_77)
  local L1_78, L2_79
  L1_78 = db
  L1_78 = L1_78.getRow
  L2_79 = _UPVALUE0_
  L1_78 = L1_78(L2_79, _UPVALUE1_, A0_77)
  L2_79 = db
  L2_79 = L2_79.getRow
  L2_79 = L2_79(_UPVALUE2_, _UPVALUE3_.profileId, L1_78[_UPVALUE0_ .. "." .. _UPVALUE3_.profileId])
  return L1_78, L2_79
end
function extendSession(A0_80, A1_81)
  local L2_82, L3_83, L4_84, L5_85, L6_86, L7_87, L8_88
  L3_83 = captivePortalLib
  L3_83 = L3_83.genBatchCookie
  L4_84 = L3_83()
  L5_85 = tonumber
  L6_86 = L3_83
  L5_85 = L5_85(L6_86)
  if 1 ~= L5_85 then
    L5_85 = _UPVALUE0_
    L5_85 = L5_85.FAILURE
    return L5_85
  end
  L5_85 = {}
  L5_85["autoConfigPush.tableName"] = "CPAccUserAccountExtend"
  L5_85["autoConfigPush.cookie"] = L4_84
  L6_86 = _UPVALUE1_
  L7_87 = "."
  L8_88 = _UPVALUE2_
  L8_88 = L8_88.maxUsageTrafficVal
  L6_86 = L6_86 .. L7_87 .. L8_88
  L6_86 = A0_80[L6_86]
  if L6_86 ~= nil then
    L6_86 = _UPVALUE1_
    L7_87 = "."
    L8_88 = _UPVALUE2_
    L8_88 = L8_88.maxUsageTrafficType
    L6_86 = L6_86 .. L7_87 .. L8_88
    L6_86 = A0_80[L6_86]
    if L6_86 == "2" then
      L6_86 = _UPVALUE1_
      L7_87 = "."
      L8_88 = _UPVALUE2_
      L8_88 = L8_88.maxUsageTraficInfo
      L6_86 = L6_86 .. L7_87 .. L8_88
      L7_87 = _UPVALUE1_
      L8_88 = "."
      L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.maxUsageTrafficVal
      L7_87 = A0_80[L7_87]
      A0_80[L6_86] = L7_87
    else
      L6_86 = _UPVALUE1_
      L7_87 = "."
      L8_88 = _UPVALUE2_
      L8_88 = L8_88.maxUsageTrafficType
      L6_86 = L6_86 .. L7_87 .. L8_88
      L6_86 = A0_80[L6_86]
      if L6_86 == "3" then
        L6_86 = _UPVALUE1_
        L7_87 = "."
        L8_88 = _UPVALUE2_
        L8_88 = L8_88.maxUsageTraficInfo
        L6_86 = L6_86 .. L7_87 .. L8_88
        L7_87 = _UPVALUE1_
        L8_88 = "."
        L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.maxUsageTrafficVal
        L7_87 = A0_80[L7_87]
        L7_87 = L7_87 * 1024
        A0_80[L6_86] = L7_87
      end
    end
  end
  L6_86 = _UPVALUE1_
  L7_87 = "."
  L8_88 = _UPVALUE2_
  L8_88 = L8_88.maxUsageTimeVal
  L6_86 = L6_86 .. L7_87 .. L8_88
  L6_86 = A0_80[L6_86]
  L7_87 = _UPVALUE0_
  L7_87 = L7_87.NIL
  if L6_86 ~= L7_87 then
    L6_86 = _UPVALUE1_
    L7_87 = "."
    L8_88 = _UPVALUE2_
    L8_88 = L8_88.maxUsageTimeType
    L6_86 = L6_86 .. L7_87 .. L8_88
    L6_86 = A0_80[L6_86]
    if L6_86 == "0" then
      L6_86 = _UPVALUE1_
      L7_87 = "."
      L8_88 = _UPVALUE2_
      L8_88 = L8_88.maxUsageTimeInfo
      L6_86 = L6_86 .. L7_87 .. L8_88
      L7_87 = _UPVALUE1_
      L8_88 = "."
      L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.maxUsageTimeVal
      L7_87 = A0_80[L7_87]
      L7_87 = L7_87 * 3600
      A0_80[L6_86] = L7_87
    else
      L6_86 = _UPVALUE1_
      L7_87 = "."
      L8_88 = _UPVALUE2_
      L8_88 = L8_88.maxUsageTimeType
      L6_86 = L6_86 .. L7_87 .. L8_88
      L6_86 = A0_80[L6_86]
      if L6_86 == "1" then
        L6_86 = _UPVALUE1_
        L7_87 = "."
        L8_88 = _UPVALUE2_
        L8_88 = L8_88.maxUsageTimeInfo
        L6_86 = L6_86 .. L7_87 .. L8_88
        L7_87 = _UPVALUE1_
        L8_88 = "."
        L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.maxUsageTimeVal
        L7_87 = A0_80[L7_87]
        L7_87 = L7_87 * 3600
        L7_87 = L7_87 * 24
        A0_80[L6_86] = L7_87
      end
    end
  end
  L6_86 = _UPVALUE1_
  L7_87 = "."
  L8_88 = _UPVALUE2_
  L8_88 = L8_88.expirationDate
  L6_86 = L6_86 .. L7_87 .. L8_88
  L6_86 = A0_80[L6_86]
  L7_87 = _UPVALUE0_
  L7_87 = L7_87.NIL
  if L6_86 ~= L7_87 then
    L6_86 = dateToDB
    L7_87 = _UPVALUE1_
    L8_88 = "."
    L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.expirationDate
    L7_87 = A0_80[L7_87]
    L6_86 = L6_86(L7_87)
    L7_87 = _UPVALUE1_
    L8_88 = "."
    L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.expirationDate
    A0_80[L7_87] = L6_86
  end
  L6_86 = _UPVALUE1_
  L7_87 = "."
  L8_88 = _UPVALUE2_
  L8_88 = L8_88.batchLimitCookie
  L6_86 = L6_86 .. L7_87 .. L8_88
  A0_80[L6_86] = L4_84
  L6_86 = tempUserConfig
  L7_87 = A0_80
  L8_88 = A1_81
  L6_86 = L6_86(L7_87, L8_88)
  L2_82 = L6_86
  if L2_82 then
    L6_86 = accountExtendWrapper
    L7_87 = A0_80
    L6_86 = L6_86(L7_87)
    L7_87 = _UPVALUE3_
    L8_88 = "."
    L7_87 = L7_87 .. L8_88 .. _UPVALUE2_.batchLimitCookie
    L6_86[L7_87] = L4_84
    L7_87 = cpAccountConfWrapper
    L8_88 = A0_80
    L7_87 = L7_87(L8_88)
    L8_88 = _UPVALUE4_
    L8_88 = L8_88 .. "." .. _UPVALUE2_.batchLimitCookie
    L7_87[L8_88] = L4_84
    L8_88 = "UserName='"
    L8_88 = L8_88 .. A0_80["tempUsers.UserName"] .. "'"
    if A0_80["tempUsers.ExpirationDate"] ~= nil then
      L2_82 = db.setAttribute("CPAccConf", "UserName", A0_80["tempUsers.UserName"], "EndTime", A0_80["tempUsers.ExpirationDate"])
    end
    if L2_82 and db.getRowWhere("CPAccConf", L8_88) then
      L2_82 = db.update("CPAccConf", L7_87, db.getRowWhere("CPAccConf", L8_88)["CPAccConf._ROWID_"])
    end
    if L2_82 and db.getRowWhere(_UPVALUE3_, L8_88) then
      L2_82 = db.update(_UPVALUE3_, L6_86, db.getRowWhere(_UPVALUE3_, L8_88)[_UPVALUE3_ .. "." .. _UPVALUE5_])
      L5_85[_UPVALUE6_ .. "." .. _UPVALUE2_.operationFlag] = TABLE_ROW_UPDATE
    else
      L2_82 = db.insert(_UPVALUE3_, L6_86)
      L5_85[_UPVALUE6_ .. "." .. _UPVALUE2_.operationFlag] = TABLE_ROW_INSERT
    end
  end
  if L2_82 then
    L6_86 = db
    L6_86 = L6_86.update
    L7_87 = _UPVALUE6_
    L8_88 = L5_85
    L6_86(L7_87, L8_88, 1)
    L6_86 = _UPVALUE0_
    L6_86 = L6_86.SUCCESS
    return L6_86
  else
    L6_86 = _UPVALUE0_
    L6_86 = L6_86.ERROR
    return L6_86
  end
end
function tempUserConfig(A0_89, A1_90)
  local L2_91
  L2_91 = false
  L2_91 = db.update(_UPVALUE0_, A0_89, A1_90)
  if L2_91 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE1_.ERROR
  end
end
function accountExtendWrapper(A0_92)
  local L1_93
  L1_93 = {}
  MaxUsageTimeInfo = db.getAttribute(_UPVALUE0_, _UPVALUE1_.username, A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.username], _UPVALUE1_.maxUsageTimeInfo)
  MaxUsageTrafficInfo = db.getAttribute(_UPVALUE0_, _UPVALUE1_.username, A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.username], _UPVALUE1_.maxUsageTraficInfo)
  L1_93[_UPVALUE2_ .. "." .. _UPVALUE1_.username] = A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.username]
  L1_93[_UPVALUE2_ .. "." .. _UPVALUE1_.extendTimeUsage] = A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTimeInfo] or MaxUsageTimeInfo
  L1_93[_UPVALUE2_ .. "." .. _UPVALUE1_.extendTrafficUsage] = A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTraficInfo] or MaxUsageTrafficInfo
  L1_93[_UPVALUE2_ .. "." .. _UPVALUE1_.extendTime] = A0_92[_UPVALUE0_ .. "." .. _UPVALUE1_.expirationDate] or "0"
  return L1_93
end
function cpAccountConfWrapper(A0_94)
  local L1_95
  L1_95 = {}
  MaxUsageTimeInfo = db.getAttribute(_UPVALUE0_, _UPVALUE1_.username, A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.username], _UPVALUE1_.maxUsageTimeInfo)
  MaxUsageTrafficInfo = db.getAttribute(_UPVALUE0_, _UPVALUE1_.username, A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.username], _UPVALUE1_.maxUsageTraficInfo)
  L1_95[_UPVALUE2_ .. "." .. _UPVALUE1_.username] = A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.username]
  L1_95[_UPVALUE2_ .. "." .. _UPVALUE1_.maxUsageTime] = A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTimeInfo] or MaxUsageTimeInfo
  L1_95[_UPVALUE2_ .. "." .. _UPVALUE1_.maxUsageTraffic] = A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.maxUsageTimeInfo] or MaxUsageTrafficInfo
  L1_95[_UPVALUE2_ .. "." .. _UPVALUE1_.endTime] = A0_94[_UPVALUE0_ .. "." .. _UPVALUE1_.expirationDate] or "0"
  return L1_95
end
function tmpUserProfilesGetAll()
  local L0_96
  L0_96 = {}
  L0_96 = db.getTable(_UPVALUE0_)
  if L0_96 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_96
end
function tmpUserProfilesGetCur(A0_97)
  local L1_98
  L1_98 = {}
  L1_98 = db.getRow(_UPVALUE0_, _UPVALUE1_, A0_97)
  if L1_98 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L1_98
end
function getPreviewDetails(A0_99)
  local L1_100, L2_101
  L1_100 = db
  L1_100 = L1_100.getRow
  L2_101 = _UPVALUE0_
  L1_100 = L1_100(L2_101, _UPVALUE1_.profileId, A0_99)
  L2_101 = db
  L2_101 = L2_101.getRowsWhere
  L2_101 = L2_101(_UPVALUE2_, "Flag=1")
  return L1_100, L2_101
end
function tempUsersDelete(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107, L6_108, L7_109, L8_110, L9_111, L10_112, L11_113, L12_114, L13_115, L14_116
  L1_103 = "tempUsers"
  L2_104 = "CPAccInfoIP"
  L3_105 = "CPAccConf"
  L4_106 = "CPAccInfoUserAccount"
  L5_107 = "CPAccUserAccountExtend"
  L6_108 = "TempUsersLatestLogin"
  L7_109 = {}
  L8_110 = db
  L8_110 = L8_110.getAttribute
  L9_111 = _UPVALUE0_
  L10_112 = _UPVALUE1_
  L11_113 = "1"
  L12_114 = _UPVALUE2_
  L12_114 = L12_114.userCount
  L8_110 = L8_110(L9_111, L10_112, L11_113, L12_114)
  if L8_110 == nil then
    L9_111 = _UPVALUE3_
    L9_111 = L9_111.FAILURE
    return L9_111
  end
  L9_111 = "UserName ="
  L10_112 = A0_102
  L9_111 = L9_111 .. L10_112
  L10_112 = db
  L10_112 = L10_112.getRows
  L11_113 = "CaptivePortalSession"
  L12_114 = "UserName"
  L13_115 = A0_102
  L10_112 = L10_112(L11_113, L12_114, L13_115)
  L7_109 = L10_112
  L10_112 = captivePortalLib
  L10_112 = L10_112.genBatchCookie
  L11_113 = L10_112()
  L12_114 = tonumber
  L13_115 = L10_112
  L12_114 = L12_114(L13_115)
  if 1 ~= L12_114 then
    L12_114 = db
    L12_114 = L12_114.execute
    L13_115 = "DETACH cpAccDB"
    L12_114(L13_115)
    L12_114 = _UPVALUE3_
    L12_114 = L12_114.ERROR
    return L12_114
  end
  L12_114 = #L7_109
  if L12_114 == 0 then
    L12_114 = {}
    L12_114["tempUsersBatchLimit.cookie"] = L11_113
    L13_115 = db
    L13_115 = L13_115.update
    L14_116 = "tempUsersBatchLimit"
    L13_115 = L13_115(L14_116, L12_114, 1)
    if not L13_115 then
      L14_116 = db
      L14_116 = L14_116.execute
      L14_116("DETACH cpAccDB")
      L14_116 = _UPVALUE3_
      L14_116 = L14_116.FAILURE
      return L14_116
    end
    L14_116 = db
    L14_116 = L14_116.deleteRow
    L14_116 = L14_116(L1_103, "UserName", A0_102)
    L13_115 = L14_116
    if not L13_115 then
      L14_116 = _UPVALUE3_
      L14_116 = L14_116.FAILURE
      return L14_116
    end
    L14_116 = db
    L14_116 = L14_116.deleteRow
    L14_116 = L14_116(L3_105, "UserName", A0_102)
    L13_115 = L14_116
    if not L13_115 then
      L14_116 = _UPVALUE3_
      L14_116 = L14_116.FAILURE
      return L14_116
    end
    L14_116 = db
    L14_116 = L14_116.getRows
    L14_116 = L14_116(L5_107, "UserName", A0_102)
    L7_109 = L14_116
    if L7_109 ~= nil then
      L14_116 = db
      L14_116 = L14_116.deleteRow
      L14_116 = L14_116(L5_107, "UserName", A0_102)
      L13_115 = L14_116
      if not L13_115 then
        L14_116 = db
        L14_116 = L14_116.rollback
        L14_116()
        L14_116 = _UPVALUE3_
        L14_116 = L14_116.FAILURE
        return L14_116
      end
    end
    L14_116 = db
    L14_116 = L14_116.deleteRow
    L14_116 = L14_116(L4_106, "UserName", A0_102)
    L13_115 = L14_116
    if not L13_115 then
      L14_116 = _UPVALUE3_
      L14_116 = L14_116.FAILURE
      return L14_116
    end
    L14_116 = db
    L14_116 = L14_116.getRows
    L14_116 = L14_116(L2_104, "UserName", A0_102)
    L7_109 = L14_116
    if L7_109 ~= nil then
      L14_116 = db
      L14_116 = L14_116.deleteRow
      L14_116 = L14_116(L2_104, "UserName", A0_102)
      L13_115 = L14_116
      if not L13_115 then
        L14_116 = _UPVALUE3_
        L14_116 = L14_116.FAILURE
        return L14_116
      end
    end
    L14_116 = db
    L14_116 = L14_116.getRows
    L14_116 = L14_116(L6_108, "TempUsersLatestLogin", A0_102)
    L7_109 = L14_116
    if L7_109 ~= nil then
      L14_116 = db
      L14_116 = L14_116.deleteRow
      L14_116 = L14_116(L6_108, "UserName", A0_102)
      L13_115 = L14_116
      if not L13_115 then
        L14_116 = db
        L14_116 = L14_116.rollback
        L14_116()
        L14_116 = DEL_TEMP_USER_FAILURE
        return L14_116, DEL_TEMP_USER_FAILURE_MESSEGE
      end
    end
    L14_116 = tonumber
    L14_116 = L14_116(L8_110)
    L8_110 = L14_116 - 1
    L14_116 = db
    L14_116 = L14_116.setAttribute
    L14_116 = L14_116(_UPVALUE0_, _UPVALUE1_, "1", _UPVALUE2_.userCount, L8_110)
    status = L14_116
    L14_116 = status
    if not L14_116 then
      L14_116 = db
      L14_116 = L14_116.rollback
      L14_116()
      L14_116 = _UPVALUE3_
      L14_116 = L14_116.FAILURE
      return L14_116
    end
    L14_116 = {}
    L14_116["autoConfigPush.tableName"] = "auto"
    L14_116["autoConfigPush.cookie"] = L11_113
    L14_116["autoConfigPush.operationFlag"] = TABLE_ROW_DELETE
    db.update("autoConfigPush", L14_116, 1)
    return _UPVALUE3_.SUCCESS
  else
    L12_114 = _UPVALUE4_
    L12_114 = L12_114.TEMP_USER_ALREADY_LOGIN
    return L12_114
  end
end
function tempUsersDeleteAll(A0_117)
  local L1_118, L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125, L9_126, L10_127, L11_128, L12_129, L13_130, L14_131, L15_132, L16_133, L17_134, L18_135, L19_136, L20_137, L21_138, L22_139, L23_140, L24_141, L25_142, L26_143, L27_144, L28_145
  L1_118 = "tempUsers.UserName"
  L2_119 = 0
  L3_120 = 0
  L4_121 = tempUsersGetAll
  L5_122 = A0_117
  L5_122 = L4_121(L5_122)
  L6_123 = db
  L6_123 = L6_123.getAttribute
  L7_124 = _UPVALUE0_
  L8_125 = _UPVALUE1_
  L9_126 = "1"
  L10_127 = _UPVALUE2_
  L10_127 = L10_127.userCount
  L6_123 = L6_123(L7_124, L8_125, L9_126, L10_127)
  if L6_123 == nil then
    L7_124 = _UPVALUE3_
    L7_124 = L7_124.FAILURE
    return L7_124
  end
  L7_124 = _UPVALUE3_
  L7_124 = L7_124.SUCCESS
  if L4_121 ~= L7_124 then
    L7_124 = _UPVALUE3_
    L7_124 = L7_124.FAILURE
    L8_125 = cookie
    return L7_124, L8_125
  end
  L3_120 = #L5_122
  L7_124 = captivePortalLib
  L7_124 = L7_124.genBatchCookie
  L8_125 = L7_124()
  L9_126 = tonumber
  L10_127 = L7_124
  L9_126 = L9_126(L10_127)
  if 1 ~= L9_126 then
    L9_126 = db
    L9_126 = L9_126.execute
    L10_127 = "DETACH cpAccDB"
    L9_126(L10_127)
    L9_126 = _UPVALUE3_
    L9_126 = L9_126.ERROR
    return L9_126
  end
  L9_126 = {}
  L9_126["tempUsersBatchLimit.cookie"] = L8_125
  L10_127 = db
  L10_127 = L10_127.update
  L10_127 = L10_127(L11_128, L12_129, L13_130)
  for L14_131, L15_132 in L11_128(L12_129) do
    for L19_136, L20_137 in L16_133(L17_134) do
      L21_138 = L15_132[L1_118]
      L22_139 = "tempUsers"
      L23_140 = "CPAccInfoIP"
      L24_141 = "CPAccConf"
      L25_142 = "CPAccInfoUserAccount"
      L26_143 = "CPAccUserAccountExtend"
      L27_144 = "TempUsersLatestLogin"
      L28_145 = {}
      L28_145 = db.getRows("CaptivePortalSession", "UserName", L21_138)
      if #L28_145 == 0 then
        L10_127 = db.deleteRow(L22_139, "UserName", L21_138)
        if not L10_127 then
          return _UPVALUE3_.FAILURE
        end
        L10_127 = db.deleteRow(L24_141, "UserName", L21_138)
        if not L10_127 then
          return _UPVALUE3_.FAILURE
        end
        L28_145 = db.getRows(L26_143, "UserName", L21_138)
        if L28_145 ~= nil then
          L10_127 = db.deleteRow(L26_143, "UserName", L21_138)
          if not L10_127 then
            db.rollback()
            return _UPVALUE3_.FAILURE
          end
        end
        L10_127 = db.deleteRow(L25_142, "UserName", L21_138)
        if not L10_127 then
          return _UPVALUE3_.FAILURE
        end
        L28_145 = db.getRows(L23_140, "UserName", L21_138)
        if L28_145 ~= nil then
          L10_127 = db.deleteRow(L23_140, "UserName", L21_138)
          if not L10_127 then
            return _UPVALUE3_.FAILURE
          end
        end
        L28_145 = db.getRows(L27_144, "TempUsersLatestLogin", L21_138)
        if L28_145 ~= nil then
          L10_127 = db.deleteRow(L27_144, "UserName", L21_138)
          if not L10_127 then
            db.rollback()
            return DEL_TEMP_USER_FAILURE, DEL_TEMP_USER_FAILURE_MESSEGE
          end
        end
      else
        L2_119 = L2_119 + 1
      end
    end
  end
  L6_123 = L11_128 - L3_120
  if L2_119 == 0 then
    L14_131 = "1"
    L15_132 = _UPVALUE2_
    L15_132 = L15_132.userCount
    status = L11_128
    if not L11_128 then
      L11_128()
      return L11_128
    end
    L11_128["autoConfigPush.tableName"] = "auto"
    L11_128["autoConfigPush.cookie"] = L8_125
    L11_128["autoConfigPush.operationFlag"] = L12_129
    L14_131 = L11_128
    L15_132 = 1
    L12_129(L13_130, L14_131, L15_132)
    return L12_129, L13_130
  elseif L2_119 > 0 then
    return L11_128, L12_129
  end
end
function tempUsersGetAll(A0_146)
  local L1_147, L2_148
  L1_147 = _UPVALUE0_
  L1_147 = L1_147.profileId
  L2_148 = "='"
  L1_147 = L1_147 .. L2_148 .. A0_146 .. "' and " .. _UPVALUE0_.accountType .. "='0'"
  L2_148 = db
  L2_148 = L2_148.getRowsWhere
  L2_148 = L2_148(_UPVALUE1_, L1_147)
  if L2_148 == NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L2_148
end
function getTempMultilogin(A0_149)
  return (db.getRows("CaptivePortalSession", "UserName", A0_149))
end
function latestLogin(A0_150)
  return "\"NA\""
end
