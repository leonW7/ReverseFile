local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = module
L1_1 = "com.teamf1.bl.system.remoteManagement"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/system_remoteManagement"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/platform_returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.platform.returnCodes"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.returnCodes"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.system.remotemanagement"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "com.teamf1.core.config"
L3_3 = L3_3(L4_4)
L4_4 = nil
if UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-500N" then
  L4_4 = "/pfrm2.0/bin/"
else
  L4_4 = "/bin/"
end
function remoteHttpsMgmtTblUpdate(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NIL
  L4_9 = ACCESS_LEVEL
  if L4_9 ~= 0 then
    L4_9 = util
    L4_9 = L4_9.appendDebugOut
    L4_9(L5_10)
    L4_9 = _UPVALUE0_
    L4_9 = L4_9.UNAUTHORIZED
    return L4_9
  end
  L2_7 = A0_5["httpsMgmt.httpsMgmtEnable"]
  L3_8 = A0_5["httpsMgmt.httpsMgmtPort"]
  if L3_8 == "0" then
    L4_9 = _UPVALUE0_
    L4_9 = L4_9.FAILURE
    return L4_9
  end
  L4_9 = os
  L4_9 = L4_9.execute
  L4_9(L5_10)
  L4_9 = {}
  for L8_13 in L5_10(L6_11) do
    L9_14 = table
    L9_14 = L9_14.insert
    L9_14(L4_9, L8_13)
  end
  for L8_13, L9_14 in L5_10(L6_11) do
    if tonumber(L9_14) == tonumber(port) then
      return _UPVALUE3_.OPEN_PORT
    end
  end
  L5_10()
  L1_6 = L5_10
  if L1_6 ~= L5_10 then
    L5_10()
    return L1_6
  end
  L5_10()
  L5_10()
  return L1_6
end
function remoteManagementSectionGet()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24
  returnCode, L8_23, L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L9_24 = _UPVALUE0_.remoteManagementSetupGet()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L8_23, L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L9_24
end
function remoteManagementGetNext(A0_25)
  local L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33, L9_34, L10_35
  L10_35 = A0_25["remoteManagement.cookie"]
  if L10_35 == nil then
    util.appenDebugOut("GetNext : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, L9_34, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33 = _UPVALUE1_.remoteManagementSetupGetNext(L10_35)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    return returnCode
  end
  return returnCode, L9_34, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33
end
function remoteManagementSectionSet(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45, L10_46, L11_47, L12_48, L13_49, L14_50, L15_51, L16_52
  L1_37 = ACCESS_LEVEL
  if L1_37 ~= 0 then
    L1_37 = util
    L1_37 = L1_37.appendDebugOut
    L2_38 = "Detected unauthorized access for remoteManagement"
    L1_37(L2_38)
    L1_37 = _UPVALUE0_
    L1_37 = L1_37.UNAUTHORIZED
    return L1_37
  end
  L1_37 = A0_36["remoteManagement.cookie"]
  L2_38 = A0_36["remoteManagement.remoteManagement"]
  L3_39 = A0_36["remoteManagement.remoteManagement"]
  L4_40 = A0_36["remoteManagement.port"]
  L5_41 = A0_36["remoteManagement.ssh"]
  L6_42 = A0_36["remoteManagement.snmp"]
  L7_43 = A0_36["remoteManagement.fromIpAddress"]
  L8_44 = A0_36["remoteManagement.toIpAddress"]
  L9_45 = A0_36["remoteManagement.accessType"]
  L10_46 = A0_36["remoteManagement.selectedPcAddress"]
  if L1_37 == nil then
    L11_47 = util
    L11_47 = L11_47.appendDebugOut
    L11_47(L12_48)
    L11_47 = _UPVALUE0_
    L11_47 = L11_47.BAD_PARAMETER
    return L11_47
  end
  if L2_38 == nil then
    L11_47 = util
    L11_47 = L11_47.appendDebugOut
    L11_47(L12_48)
    L11_47 = _UPVALUE0_
    L11_47 = L11_47.BAD_PARAMETER
    return L11_47
  end
  if L5_41 == nil then
    L11_47 = util
    L11_47 = L11_47.appendDebugOut
    L11_47(L12_48)
    L11_47 = _UPVALUE0_
    L11_47 = L11_47.BAD_PARAMETER
    return L11_47
  end
  if L6_42 == nil then
    L11_47 = util
    L11_47 = L11_47.appendDebugOut
    L11_47(L12_48)
    L11_47 = _UPVALUE0_
    L11_47 = L11_47.BAD_PARAMETER
    return L11_47
  end
  L11_47 = _UPVALUE1_
  if L2_38 ~= L11_47 then
    L11_47 = _UPVALUE1_
  elseif L5_41 == L11_47 then
    if L9_45 == nil then
      L11_47 = util
      L11_47 = L11_47.appendDebugOut
      L11_47(L12_48)
      L11_47 = _UPVALUE0_
      L11_47 = L11_47.BAD_PARAMETER
      return L11_47
    end
    L11_47 = _UPVALUE1_
    if L2_38 == L11_47 and L4_40 == nil then
      L11_47 = util
      L11_47 = L11_47.appendDebugOut
      L11_47(L12_48)
      L11_47 = _UPVALUE0_
      L11_47 = L11_47.BAD_PARAMETER
      return L11_47
    end
    if L9_45 == "1" then
      L9_45 = "0"
    elseif L9_45 == "2" then
      L9_45 = "1"
    elseif L9_45 == "3" then
      L9_45 = "2"
    end
    if L9_45 == "1" and (L7_43 == nil or L8_44 == nil) then
      L11_47 = _UPVALUE0_
      L11_47 = L11_47.BAD_PARAMETER
      return L11_47
    end
    if L9_45 == "2" and L10_46 == nil then
      L11_47 = _UPVALUE0_
      L11_47 = L11_47.BAD_PARAMETER
      return L11_47
    end
  end
  L11_47 = os
  L11_47 = L11_47.execute
  L11_47(L12_48)
  L11_47 = {}
  for L15_51 in L12_48(L13_49) do
    L16_52 = table
    L16_52 = L16_52.insert
    L16_52(L11_47, L15_51)
  end
  for L15_51, L16_52 in L12_48(L13_49) do
    if tonumber(L16_52) == tonumber(L4_40) then
      return _UPVALUE4_.OPEN_PORT
    end
  end
  if L2_38 == L12_48 then
    if L12_48 == "HIGH" and L4_40 ~= nil then
      if L12_48 == 80 then
        L12_48(L13_49)
        return L12_48
      end
    end
  end
  L12_48()
  L15_51 = L3_39
  L16_52 = L4_40
  cookie = L13_49
  returnCode = L12_48
  if L12_48 ~= L13_49 then
    L12_48(L13_49)
    L12_48()
    return L12_48
  end
  L12_48()
  L12_48()
  return L12_48, L13_49
end
function externalPingGet()
  local L0_53, L1_54
  returnCode, L1_54, L0_53 = _UPVALUE0_.isrespondToPingEnabled()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L1_54, L0_53
end
function externalPingSet(A0_55)
  local L1_56
  L1_56 = ACCESS_LEVEL
  if L1_56 ~= 0 then
    L1_56 = util
    L1_56 = L1_56.appendDebugOut
    L1_56("Detected unauthorized access for remoteMgmt ")
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.UNAUTHORIZED
    return L1_56
  end
  L1_56 = A0_55["remoteManagement.cookie"]
  if L1_56 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set: Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if A0_55["remoteManagement.respondToPing"] == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Parameters")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  if A0_55["remoteManagement.respondToPing"] == _UPVALUE2_ then
    returnCode, cookie = _UPVALUE3_.respondToPingEnable(L1_56)
  else
    returnCode, cookie = _UPVALUE3_.respondToPingDisable(L1_56)
  end
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in remote Management" .. returnCode)
    _UPVALUE1_.abort()
    return returnCode
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return returnCode, cookie
end
