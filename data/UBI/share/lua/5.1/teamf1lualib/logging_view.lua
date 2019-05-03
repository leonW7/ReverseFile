local L0_0
L0_0 = module
L0_0("com.teamf1.core.logging.view", package.seeall)
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
;({}).facilityID = "facilityID"
;({}).logLevel = "logLevel"
;({}).category = "category"
;({}).component = "component"
;({}).sslvpnLogFile = "UMI_COMP_SSLVPN"
;({}).vpnLogFile = "VPN_LOG_FILE_NAME"
;({}).name = "name"
;({}).value = "value"
;({}).textMessage = "textMessage"
;({}).component = "component"
;({}).captiveportalLogFile = "UMI_COMP_CAPTIVEPORTAL"
;({})._ROWID_ = "_ROWID_"
;({}).facilityId = "facilityId"
;({}).component = "component"
;({}).logLevel = "logLevel"
;({}).category = "category"
;({}).kernelToken = "UMI_COMP_KERNEL_LOG"
;({}).systemToken = "UMI_COMP_SYSTEM_LOG"
;({}).wirelessToken = "UMI_COMP_WIRELESS_LOG"
;({}).networkToken = "UMI_COMP_NETWORKING_LOG"
;({}).vpnToken = "UMI_COMP_VPN_LOG"
;({}).wcfToken = "UMI_COMP_WCF_LOG"
;({}).firewallToken = "UMI_COMP_FIREWALL_LOG"
;({}).pkgMngrToken = "UMI_COMP_PKGMGMT"
function logEncValuesSet(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = db.setAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.facilityID, A0_1)
  if not L3_4 then
    return returnCode.ERROR
  end
  L3_4 = db.setAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.logLevel, A1_2)
  if not L3_4 then
    return returnCode.ERROR
  end
  L3_4 = db.setAttribute(_UPVALUE0_, "_ROWID_", _UPVALUE1_, _UPVALUE2_.category, A2_3)
  if not L3_4 then
    return returnCode.ERROR
  end
  return _UPVALUE3_.SUCCESS
end
function logEncLogValuesDelete(A0_5)
  local L1_6
  L1_6 = db
  L1_6 = L1_6.execute
  L1_6("ATTACH '" .. _UPVALUE0_ .. "' as loggingDB")
  L1_6 = nil
  L1_6 = db.deleteRow(_UPVALUE1_, "_ROWID_", A0_5)
  if not L1_6 then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
function logEncLogValuesDeleteAll(A0_7)
  local L1_8, L2_9, L3_10, L4_11, L5_12
  L1_8 = db
  L1_8 = L1_8.execute
  L2_9 = "ATTACH '"
  L3_10 = _UPVALUE0_
  L4_11 = "' as loggingDB"
  L2_9 = L2_9 .. L3_10 .. L4_11
  L1_8(L2_9)
  L1_8 = _UPVALUE1_
  L1_8 = L1_8.NIL
  L2_9 = _UPVALUE1_
  L2_9 = L2_9.NIL
  L3_10 = _UPVALUE1_
  L3_10 = L3_10.NIL
  L4_11 = _UPVALUE1_
  L4_11 = L4_11.NIL
  L5_12 = nil
  L1_8 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.facilityID)
  L2_9 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.logLevel)
  L3_10 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.category)
  if L1_8 == _UPVALUE1_.NIL or L2_9 == _UPVALUE1_.NIL or L3_10 == _UPVALUE1_.NIL then
    return _UPVALUE1_.ERROR
  end
  L1_8 = tonumber(L1_8)
  L2_9 = tonumber(L2_9)
  tempTab = {}
  if L1_8 == 0 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.kernelToken .. "'"
  elseif L1_8 == 3 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.systemToken .. "'"
  elseif L1_8 == 16 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.wirelessToken .. "'"
  elseif L1_8 == 18 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.networkToken .. "'"
  elseif L1_8 == 19 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.vpnToken .. "'"
  elseif L1_8 == 20 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.wcfToken .. "'"
  elseif L1_8 == 21 then
    L4_11 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.firewallToken .. "'"
  else
    L4_11 = "(" .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.kernelToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.systemToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.wirelessToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.networkToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.vpnToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.wcfToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.firewallToken .. "')"
  end
  if L2_9 ~= 0 then
    if L4_11 == _UPVALUE1_.NIL then
      L4_11 = _UPVALUE5_.logLevel .. "=" .. L2_9
    else
      L4_11 = L4_11 .. " and " .. _UPVALUE5_.logLevel .. "=" .. L2_9
    end
  end
  if L3_10 ~= "all" then
    if L4_11 == _UPVALUE1_.NIL then
      L4_11 = _UPVALUE5_.category .. "='" .. L3_10 .. "'"
    else
      L4_11 = L4_11 .. " and " .. _UPVALUE5_.category .. "='" .. L3_10 .. "'"
    end
  end
  L5_12 = db.deleteRowWhere(_UPVALUE7_, L4_11)
  return _UPVALUE1_.SUCCESS
end
function logEncLogValuesSend(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19
  L1_14 = _UPVALUE0_
  L1_14 = L1_14.NIL
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NIL
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NIL
  L4_17 = _UPVALUE0_
  L4_17 = L4_17.NIL
  L5_18 = _UPVALUE0_
  L5_18 = L5_18.NIL
  L6_19 = nil
  L1_14 = db.getAttribute(_UPVALUE1_, "_ROWID_", _UPVALUE2_, _UPVALUE3_.facilityID)
  L2_15 = db.getAttribute(_UPVALUE1_, "_ROWID_", _UPVALUE2_, _UPVALUE3_.logLevel)
  L3_16 = db.getAttribute(_UPVALUE1_, "_ROWID_", _UPVALUE2_, _UPVALUE3_.category)
  if L1_14 == _UPVALUE0_.NIL or L2_15 == _UPVALUE0_.NIL or L3_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.ERROR
  end
  L1_14 = tonumber(L1_14)
  L2_15 = tonumber(L2_15)
  tempTab = {}
  if L1_14 == 0 then
    L5_18 = _UPVALUE4_.kernelToken
  elseif L1_14 == 3 then
    L5_18 = _UPVALUE4_.systemToken
  elseif L1_14 == 16 then
    L5_18 = _UPVALUE4_.wirelessToken
  elseif L1_14 == 18 then
    L5_18 = _UPVALUE4_.networkToken
  elseif L1_14 == 19 then
    L5_18 = _UPVALUE4_.vpnToken
  elseif L1_14 == 20 then
    L5_18 = _UPVALUE4_.wcfToken
  elseif L1_14 == 21 then
    L5_18 = _UPVALUE4_.firewallToken
  end
  L4_17 = db.getAttribute(_UPVALUE5_, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_)
  if L4_17 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  L4_17 = L4_17 .. " " .. DB_FILE_NAME
  if L5_18 ~= _UPVALUE0_.NIL then
    L4_17 = L4_17 .. " -c " .. L5_18
  end
  if L2_15 ~= 0 then
    L4_17 = L4_17 .. " -l " .. L2_15
  end
  if A0_13 ~= -1 then
    L4_17 = L4_17 .. " -r " .. A0_13
  end
  L6_19 = os.execute(L4_17)
  return L6_19
end
function logEncValuesGet()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25
  L0_20 = db
  L0_20 = L0_20.execute
  L1_21 = "ATTACH '"
  L2_22 = _UPVALUE0_
  L3_23 = "' as loggingDB"
  L1_21 = L1_21 .. L2_22 .. L3_23
  L0_20(L1_21)
  L0_20 = _UPVALUE1_
  L0_20 = L0_20.NIL
  L1_21 = _UPVALUE1_
  L1_21 = L1_21.NIL
  L2_22 = _UPVALUE1_
  L2_22 = L2_22.NIL
  L3_23 = _UPVALUE1_
  L3_23 = L3_23.NIL
  L4_24 = {}
  L5_25 = {}
  L0_20 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.facilityID)
  L1_21 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.logLevel)
  L2_22 = db.getAttribute(_UPVALUE2_, "_ROWID_", _UPVALUE3_, _UPVALUE4_.category)
  if L0_20 == _UPVALUE1_.NIL or L1_21 == _UPVALUE1_.NIL or L2_22 == _UPVALUE1_.NIL then
    L0_20 = 0
    L1_21 = 0
    L2_22 = "all"
    L5_25 = {}
    return L0_20, L1_21, L2_22, tempTab
  end
  L0_20 = tonumber(L0_20)
  L1_21 = tonumber(L1_21)
  tempTab = {}
  if L0_20 == 0 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.kernelToken .. "'"
  elseif L0_20 == 3 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.systemToken .. "'"
  elseif L0_20 == 16 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.wirelessToken .. "'"
  elseif L0_20 == 18 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.networkToken .. "'"
  elseif L0_20 == 19 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.vpnToken .. "'"
  elseif L0_20 == 20 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.wcfToken .. "'"
  elseif L0_20 == 21 then
    L3_23 = _UPVALUE5_.component .. "='" .. _UPVALUE6_.firewallToken .. "'"
  else
    L3_23 = "(" .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.kernelToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.systemToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.wirelessToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.networkToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.vpnToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.wcfToken .. "' or " .. _UPVALUE5_.component .. "='" .. _UPVALUE6_.firewallToken .. "')"
  end
  if L1_21 ~= 0 then
    if L3_23 == _UPVALUE1_.NIL then
      L3_23 = _UPVALUE5_.logLevel .. "=" .. L1_21
    else
      L3_23 = L3_23 .. " and " .. _UPVALUE5_.logLevel .. "=" .. L1_21
    end
  end
  if L2_22 ~= "all" then
    if L3_23 == _UPVALUE1_.NIL then
      L3_23 = _UPVALUE5_.category .. "='" .. L2_22 .. "'"
    else
      L3_23 = L3_23 .. " and " .. _UPVALUE5_.category .. "='" .. L2_22 .. "'"
    end
  end
  L3_23 = L3_23 .. " ORDER BY logTimeStamp DESC"
  tempTab = db.getRowsWhere(_UPVALUE7_, L3_23)
  return L0_20, L1_21, L2_22, tempTab
end
function logEncValuesSaveToFile()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43
  L0_26 = db
  L0_26 = L0_26.execute
  L1_27 = "ATTACH '"
  L2_28 = _UPVALUE0_
  L3_29 = "' as loggingDB"
  L1_27 = L1_27 .. L2_28 .. L3_29
  L0_26(L1_27)
  L0_26 = _UPVALUE1_
  L0_26 = L0_26.FAILURE
  L1_27 = _UPVALUE1_
  L1_27 = L1_27.NIL
  L2_28 = _UPVALUE1_
  L2_28 = L2_28.NIL
  L3_29 = _UPVALUE1_
  L3_29 = L3_29.NIL
  L4_30 = _UPVALUE1_
  L4_30 = L4_30.NIL
  L5_31 = {}
  L6_32 = {}
  L7_33, L8_34 = nil, nil
  L7_33 = L9_35
  if L7_33 == nil then
    return L0_26
  end
  if L7_33 ~= nil then
    L9_35(L10_36, L11_37)
    L9_35(L10_36, L11_37)
    L8_34 = L9_35
    if L8_34 == nil then
      L9_35(L10_36)
      L7_33 = nil
      return L0_26
    end
    L12_38 = L8_34
    L13_39 = "\n"
    L9_35(L10_36, L11_37)
    L9_35(L10_36, L11_37)
    L9_35(L10_36, L11_37)
    L9_35(L10_36, L11_37)
  end
  L12_38 = _UPVALUE4_
  L13_39 = _UPVALUE5_
  L13_39 = L13_39.facilityID
  L1_27 = L9_35
  L12_38 = _UPVALUE4_
  L13_39 = _UPVALUE5_
  L13_39 = L13_39.logLevel
  L2_28 = L9_35
  L12_38 = _UPVALUE4_
  L13_39 = _UPVALUE5_
  L13_39 = L13_39.category
  L3_29 = L9_35
  if L1_27 ~= L9_35 then
  elseif L3_29 == L9_35 then
    L1_27 = 0
    L2_28 = 0
    L3_29 = "all"
    L6_32 = L9_35
    if L7_33 ~= nil then
      L9_35(L10_36)
    end
    return L0_26
  end
  L1_27 = L9_35
  L2_28 = L9_35
  tempTab = L9_35
  if L1_27 == 0 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 3 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 16 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 18 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 19 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 20 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  elseif L1_27 == 21 then
    L12_38 = "'"
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
  else
    L12_38 = _UPVALUE7_
    L12_38 = L12_38.kernelToken
    L13_39 = "' or "
    L14_40 = _UPVALUE6_
    L14_40 = L14_40.component
    L15_41 = "='"
    L16_42 = _UPVALUE7_
    L16_42 = L16_42.systemToken
    L17_43 = "' or "
    L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38 .. L13_39 .. L14_40 .. L15_41 .. L16_42 .. L17_43 .. _UPVALUE6_.component .. "='" .. _UPVALUE7_.wirelessToken .. "' or " .. _UPVALUE6_.component .. "='" .. _UPVALUE7_.networkToken .. "' or " .. _UPVALUE6_.component .. "='" .. _UPVALUE7_.vpnToken .. "' or " .. _UPVALUE6_.component .. "='" .. _UPVALUE7_.wcfToken .. "' or " .. _UPVALUE6_.component .. "='" .. _UPVALUE7_.firewallToken .. "')"
  end
  if L2_28 ~= 0 then
    if L4_30 == L9_35 then
      L4_30 = L9_35 .. L10_36 .. L11_37
    else
      L12_38 = "="
      L13_39 = L2_28
      L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38 .. L13_39
    end
  end
  if L3_29 ~= "all" then
    if L4_30 == L9_35 then
      L12_38 = "'"
      L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38
    else
      L12_38 = "='"
      L13_39 = L3_29
      L14_40 = "'"
      L4_30 = L9_35 .. L10_36 .. L11_37 .. L12_38 .. L13_39 .. L14_40
    end
  end
  tempTab = L9_35
  if L9_35 ~= nil and L7_33 ~= nil then
    if L9_35 >= 1 then
      for L12_38, L13_39 in L9_35(L10_36) do
        L14_40 = tempTab
        L14_40 = L14_40[L12_38]
        L15_41 = L14_40["eventLogging.facilityId"]
        if L15_41 == "0" then
          L15_41 = "KERNEL"
        elseif L15_41 == "3" then
          L15_41 = "SYSTEM"
        elseif L15_41 == "16" then
          L15_41 = "WIRELESS"
        elseif L15_41 == "18" then
          L15_41 = "NETWORK"
        elseif L15_41 == "19" then
          L15_41 = "VPN"
        elseif L15_41 == "20" then
          L15_41 = "WCF"
        elseif L15_41 == "21" then
          L15_41 = "FIREWALL"
        else
          L15_41 = "All"
        end
        L16_42 = L14_40["eventLogging.logLevel"]
        if L16_42 == "1" then
          L16_42 = "Emergency"
        elseif L16_42 == "2" then
          L16_42 = "Alert"
        elseif L16_42 == "4" then
          L16_42 = "Critical"
        elseif L16_42 == "8" then
          L16_42 = "Error"
        elseif L16_42 == "16" then
          L16_42 = "Warning"
        elseif L16_42 == "32" then
          L16_42 = "Notice"
        elseif L16_42 == "64" then
          L16_42 = "Information"
        elseif L16_42 == "128" then
          L16_42 = "Debug"
        end
        L17_43 = L14_40["eventLogging.textMessage"]
        L7_33:write(L15_41 .. "        " .. L16_42 .. "        " .. L17_43 .. "\n")
      end
    end
  end
  if L7_33 ~= nil then
    L9_35(L10_36)
  end
  L0_26 = L9_35.SUCCESS
  return L0_26
end
function logTypeGet(A0_44)
  local L1_45, L2_46, L3_47
  L1_45 = db
  L1_45 = L1_45.execute
  L2_46 = "ATTACH '"
  L3_47 = _UPVALUE0_
  L2_46 = L2_46 .. L3_47 .. "' as loggingDB"
  L1_45(L2_46)
  L1_45 = nil
  if A0_44 == nil then
    L2_46 = _UPVALUE1_
    L2_46 = L2_46.INVALID_ARGUMENT
    return L2_46
  end
  if A0_44 ~= "lan" and A0_44 ~= "wan" and A0_44 ~= "firewall" and A0_44 ~= "wlan" and A0_44 ~= "ipsec" and A0_44 ~= "wcf" and A0_44 ~= "sslvpn" and A0_44 ~= "syslog" and A0_44 ~= "captiveportal" then
    L2_46 = _UPVALUE1_
    L2_46 = L2_46.INVALID_LOGTYPE
    return L2_46
  end
  if A0_44 == "firewall" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = _UPVALUE2_
    L2_46 = L2_46.component
    L3_47 = " = 'UMI_COMP_FIREWALL' or "
    L2_46 = L2_46 .. L3_47 .. _UPVALUE2_.component .. " = 'UMI_COMP_KERNEL_FIREWALL'"
    L3_47 = db
    L3_47 = L3_47.getRowsWhere
    L3_47 = L3_47(_UPVALUE3_, L2_46)
    if L3_47 == nil then
      return _UPVALUE1_.FAILURE
    else
      return _UPVALUE1_.SUCCESS, L3_47
    end
  end
  if A0_44 == "syslog" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = db
    L2_46 = L2_46.getTable
    L3_47 = _UPVALUE3_
    L2_46 = L2_46(L3_47)
    if L2_46 == nil then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    else
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.SUCCESS
      return L3_47, L2_46
    end
  end
  if A0_44 == "wcf" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = _UPVALUE2_
    L2_46 = L2_46.component
    L3_47 = " = 'UMI_COMP_WCF' or "
    L2_46 = L2_46 .. L3_47 .. _UPVALUE2_.component .. " = 'UMI_COMP_KERNEL_WCF'"
    L3_47 = db
    L3_47 = L3_47.getRowsWhere
    L3_47 = L3_47(_UPVALUE3_, L2_46)
    if L3_47 == nil then
      return _UPVALUE1_.FAILURE
    else
      return _UPVALUE1_.SUCCESS, L3_47
    end
  end
  if A0_44 == "wlan" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = db
    L2_46 = L2_46.getRows
    L3_47 = _UPVALUE3_
    L2_46 = L2_46(L3_47, _UPVALUE2_.component, "UMI_COMP_WIRELESS_CTRL")
    if L2_46 == nil then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    else
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.SUCCESS
      return L3_47, L2_46
    end
  end
  if A0_44 == "sslvpn" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = db
    L2_46 = L2_46.getRows
    L3_47 = _UPVALUE3_
    L2_46 = L2_46(L3_47, _UPVALUE2_.component, _UPVALUE2_.sslvpnLogFile)
    if L2_46 == nil then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    else
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.SUCCESS
      return L3_47, L2_46
    end
  end
  if A0_44 == "captiveportal" then
    L2_46 = {}
    logsTable = L2_46
    L2_46 = db
    L2_46 = L2_46.getRows
    L3_47 = _UPVALUE3_
    L2_46 = L2_46(L3_47, _UPVALUE2_.component, _UPVALUE2_.captiveportalLogFile)
    if L2_46 == nil then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    else
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.SUCCESS
      return L3_47, L2_46
    end
  end
  if A0_44 == "ipsec" then
    L2_46 = db
    L2_46 = L2_46.getAttribute
    L3_47 = _UPVALUE4_
    L2_46 = L2_46(L3_47, _UPVALUE2_.name, _UPVALUE2_.vpnLogFile, _UPVALUE2_.value)
    L3_47 = _UPVALUE1_
    L3_47 = L3_47.NIL
    if L2_46 == L3_47 then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    end
    L3_47 = util
    L3_47 = L3_47.fileToString
    L3_47 = L3_47(L2_46)
    vpnLogsText = L3_47
    L3_47 = vpnLogsText
    if L3_47 == _UPVALUE1_.NIL then
      L3_47 = _UPVALUE1_
      L3_47 = L3_47.FAILURE
      return L3_47
    end
    L3_47 = ""
    vpnLogs = L3_47
    L3_47 = "\n"
    sep = L3_47
    L3_47 = {}
    fields = L3_47
    L3_47 = vpnLogsText
    L3_47 = L3_47.gsub
    L3_47(L3_47, "([^" .. sep .. "]*)" .. sep, function(A0_48)
      table.insert(fields, A0_48)
    end)
    L3_47 = {}
    for _FORV_7_, _FORV_8_ in pairs(fields) do
      L3_47[_FORV_7_] = fields[_FORV_7_ + 1]
    end
    return _UPVALUE1_.SUCCESS, L3_47
  end
  if A0_44 == nil then
    L2_46 = _UPVALUE1_
    L2_46 = L2_46.FAILURE
    return L2_46
  end
  L2_46 = _UPVALUE1_
  L2_46 = L2_46.SUCCESS
  L3_47 = 1
  return L2_46, L3_47, A0_44
end
function logTypeGetNext(A0_49)
  local L2_50
  L2_50 = _UPVALUE0_
  L2_50 = L2_50.NOT_SUPPORTED
  return L2_50, A0_49
end
function logTypeSet(A0_51, A1_52)
  local L3_53
  L3_53 = _UPVALUE0_
  L3_53 = L3_53.NOT_SUPPORTED
  return L3_53, A0_51
end
function logGet()
  local L1_54
  L1_54 = _UPVALUE0_
  L1_54 = L1_54.NOT_SUPPORTED
  return L1_54
end
function logGetNext(A0_55)
  local L2_56
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NOT_SUPPORTED
  return L2_56, A0_55
end
function logSet(A0_57, A1_58)
  local L3_59
  L3_59 = _UPVALUE0_
  L3_59 = L3_59.NOT_SUPPORTED
  return L3_59, A0_57
end
function logDelete(A0_60)
  local L1_61, L2_62
  L1_61 = db
  L1_61 = L1_61.execute
  L2_62 = "ATTACH '"
  L2_62 = L2_62 .. _UPVALUE0_ .. "' as loggingDB"
  L1_61(L2_62)
  L1_61 = nil
  if A0_60 == nil then
    L2_62 = _UPVALUE1_
    L2_62 = L2_62.INVALID_ARGUMENT
    return L2_62
  end
  if A0_60 ~= "firewall" and A0_60 ~= "wlan" and A0_60 ~= "ipsec" and A0_60 ~= "wcf" and A0_60 ~= "sslvpn" and A0_60 ~= "syslog" and A0_60 ~= "captiveportal" then
    L2_62 = _UPVALUE1_
    L2_62 = L2_62.INVALID_LOGTYPE
    return L2_62
  end
  if A0_60 == "firewall" then
    L2_62 = _UPVALUE2_
    L2_62 = L2_62.component
    L2_62 = L2_62 .. " = 'UMI_COMP_FIREWALL' or " .. _UPVALUE2_.component .. " = 'UMI_COMP_KERNEL_FIREWALL'"
    status = db.deleteRowWhere(_UPVALUE3_, L2_62)
  elseif A0_60 == "sslvpn" then
    L2_62 = db
    L2_62 = L2_62.deleteRow
    L2_62 = L2_62(_UPVALUE3_, _UPVALUE2_.component, "UMI_COMP_SSLVPN")
    status = L2_62
  elseif A0_60 == "captiveportal" then
    L2_62 = db
    L2_62 = L2_62.deleteRow
    L2_62 = L2_62(_UPVALUE3_, _UPVALUE2_.component, "UMI_COMP_CAPTIVEPORTAL")
    status = L2_62
  elseif A0_60 == "ipsec" then
    L2_62 = db
    L2_62 = L2_62.getAttribute
    L2_62 = L2_62(_UPVALUE4_, _UPVALUE2_.name, _UPVALUE2_.vpnLogFile, _UPVALUE2_.value)
    vpnLogsFile = L2_62
    L2_62 = os
    L2_62 = L2_62.execute
    L2_62 = L2_62("echo '' > " .. vpnLogsFile)
    status = L2_62
    L2_62 = status
    if L2_62 == nil then
      L2_62 = _UPVALUE1_
      L2_62 = L2_62.FAILURE
      return L2_62, A0_60
    end
  elseif A0_60 == "wlan" then
    L2_62 = db
    L2_62 = L2_62.deleteRow
    L2_62 = L2_62(_UPVALUE3_, _UPVALUE2_.component, "UMI_COMP_WIRELESS_CTRL")
    status = L2_62
  elseif A0_60 == "wcf" then
    L2_62 = _UPVALUE2_
    L2_62 = L2_62.component
    L2_62 = L2_62 .. " = 'UMI_COMP_WCF' or " .. _UPVALUE2_.component .. " = 'UMI_COMP_KERNEL_WCF'"
    status = db.deleteRowWhere(_UPVALUE3_, L2_62)
  elseif A0_60 == "syslog" then
    L2_62 = db
    L2_62 = L2_62.deleteAllEntries
    L2_62 = L2_62(_UPVALUE3_)
    status = L2_62
  end
  L2_62 = status
  if L2_62 == nil then
    L2_62 = _UPVALUE1_
    L2_62 = L2_62.FAILURE
    return L2_62, A0_60
  end
  L2_62 = _UPVALUE1_
  L2_62 = L2_62.SUCCESS
  return L2_62
end
