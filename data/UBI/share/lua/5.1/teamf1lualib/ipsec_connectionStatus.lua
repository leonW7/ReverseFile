local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipsec.connectionstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
connectionstatusTable = "ConnectionStatus"
ROW_ID = "_ROWID_"
;({}).policyName = "PolicyName"
;({}).txData = "TxData"
;({}).txPackets = "TxPackets"
;({}).rxData = "RxData"
;({}).rxPackets = "RxPackets"
;({}).connectionStatus = "ConnectionStatus"
;({}).actionStatus = "ActionStatus"
;({}).action = "Action"
;({}).outSPI = "OutSPI"
;({}).remoteEndPoint = "RemoteEndpoint"
;({}).ikePort = "IKEPort"
;({}).autoPolicyType = "AutopolicyType"
;({}).vpnState = "vpnState"
function policyNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = "0"
  L0_1 = L0_1(L1_2, connectionstatusTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(connectionstatusTable, ROW_ID, L0_1, _UPVALUE0_.policyName)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_1, L1_2
end
function policyNameGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 ~= L1_4 then
    L1_4 = tonumber
    L2_5 = A0_3
    L1_4 = L1_4(L2_5)
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NIL
  elseif L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = connectionstatusTable
  L1_4 = L1_4(L2_5, ROW_ID, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.getNextRowId
  L2_5 = A0_3
  L1_4 = L1_4(L2_5, connectionstatusTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(connectionstatusTable, ROW_ID, L1_4, _UPVALUE1_.policyName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function policyNameSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function policyNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function txDataGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = "0"
  L0_12 = L0_12(L1_13, connectionstatusTable)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(connectionstatusTable, ROW_ID, L0_12, _UPVALUE0_.txData)
  if L1_13 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_12, L1_13
end
function txDataGetNext(A0_14)
  local L1_15, L2_16
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NIL
  if A0_14 ~= L1_15 then
    L1_15 = tonumber
    L2_16 = A0_14
    L1_15 = L1_15(L2_16)
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NIL
  elseif L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.existsRow
  L2_16 = connectionstatusTable
  L1_15 = L1_15(L2_16, ROW_ID, A0_14)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.FALSE
  if L1_15 == L2_16 then
    L1_15 = _UPVALUE0_
    L1_15 = L1_15.INVALID_ARGUMENT
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getNextRowId
  L2_16 = A0_14
  L1_15 = L1_15(L2_16, connectionstatusTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(connectionstatusTable, ROW_ID, L1_15, _UPVALUE1_.txData)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function txDataSet(A0_17, A1_18)
  local L3_19
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.NOT_SUPPORTED
  return L3_19, A0_17
end
function txPacketsGet()
  local L0_20, L1_21
  L0_20 = db
  L0_20 = L0_20.getNextRowId
  L1_21 = "0"
  L0_20 = L0_20(L1_21, connectionstatusTable)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(connectionstatusTable, ROW_ID, L0_20, _UPVALUE0_.txPackets)
  if L1_21 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_20, L1_21
end
function txPacketsGetNext(A0_22)
  local L1_23, L2_24
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.NIL
  if A0_22 ~= L1_23 then
    L1_23 = tonumber
    L2_24 = A0_22
    L1_23 = L1_23(L2_24)
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NIL
  elseif L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.existsRow
  L2_24 = connectionstatusTable
  L1_23 = L1_23(L2_24, ROW_ID, A0_22)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.FALSE
  if L1_23 == L2_24 then
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.INVALID_ARGUMENT
    return L1_23
  end
  L1_23 = db
  L1_23 = L1_23.getNextRowId
  L2_24 = A0_22
  L1_23 = L1_23(L2_24, connectionstatusTable)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if L1_23 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NOT_EXIST
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L2_24 = L2_24(connectionstatusTable, ROW_ID, L1_23, _UPVALUE1_.txPackets)
  if L2_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L2_24
end
function txPacketsSet(A0_25, A1_26)
  local L3_27
  L3_27 = _UPVALUE0_
  L3_27 = L3_27.NOT_SUPPORTED
  return L3_27, A0_25
end
function rxDataGet()
  local L0_28, L1_29, L2_30
  L0_28 = db
  L0_28 = L0_28.getNextRowId
  L1_29 = "0"
  L2_30 = connectionstatusTable
  L0_28 = L0_28(L1_29, L2_30)
  L1_29 = nil
  L2_30 = db
  L2_30 = L2_30.getAttribute
  L2_30 = L2_30(connectionstatusTable, ROW_ID, L0_28, _UPVALUE0_.rxData)
  if L2_30 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_28, L2_30
end
function rxDataGetNext(A0_31)
  local L1_32, L2_33
  L1_32 = _UPVALUE0_
  L1_32 = L1_32.NIL
  if A0_31 ~= L1_32 then
    L1_32 = tonumber
    L2_33 = A0_31
    L1_32 = L1_32(L2_33)
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.NIL
  elseif L1_32 == L2_33 then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.INVALID_ARGUMENT
    return L1_32
  end
  L1_32 = db
  L1_32 = L1_32.existsRow
  L2_33 = connectionstatusTable
  L1_32 = L1_32(L2_33, ROW_ID, A0_31)
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.FALSE
  if L1_32 == L2_33 then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.INVALID_ARGUMENT
    return L1_32
  end
  L1_32 = db
  L1_32 = L1_32.getNextRowId
  L2_33 = A0_31
  L1_32 = L1_32(L2_33, connectionstatusTable)
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NIL
  if L1_32 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.NOT_EXIST
    return L2_33
  end
  L2_33 = db
  L2_33 = L2_33.getAttribute
  L2_33 = L2_33(connectionstatusTable, ROW_ID, L1_32, _UPVALUE1_.rxData)
  if L2_33 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_32
  end
  return _UPVALUE0_.SUCCESS, L1_32, L2_33
end
function rxDataSet(A0_34, A1_35)
  local L3_36
  L3_36 = _UPVALUE0_
  L3_36 = L3_36.NOT_SUPPORTED
  return L3_36, A0_34
end
function rxPacketsGet()
  local L0_37, L1_38
  L0_37 = db
  L0_37 = L0_37.getNextRowId
  L1_38 = "0"
  L0_37 = L0_37(L1_38, connectionstatusTable)
  L1_38 = db
  L1_38 = L1_38.getAttribute
  L1_38 = L1_38(connectionstatusTable, ROW_ID, L0_37, _UPVALUE0_.rxPackets)
  if L1_38 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_37, L1_38
end
function rxPacketsGetNext(A0_39)
  local L1_40, L2_41
  L1_40 = _UPVALUE0_
  L1_40 = L1_40.NIL
  if A0_39 ~= L1_40 then
    L1_40 = tonumber
    L2_41 = A0_39
    L1_40 = L1_40(L2_41)
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NIL
  elseif L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.existsRow
  L2_41 = connectionstatusTable
  L1_40 = L1_40(L2_41, ROW_ID, A0_39)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.FALSE
  if L1_40 == L2_41 then
    L1_40 = _UPVALUE0_
    L1_40 = L1_40.INVALID_ARGUMENT
    return L1_40
  end
  L1_40 = db
  L1_40 = L1_40.getNextRowId
  L2_41 = A0_39
  L1_40 = L1_40(L2_41, connectionstatusTable)
  L2_41 = _UPVALUE0_
  L2_41 = L2_41.NIL
  if L1_40 == L2_41 then
    L2_41 = _UPVALUE0_
    L2_41 = L2_41.NOT_EXIST
    return L2_41
  end
  L2_41 = db
  L2_41 = L2_41.getAttribute
  L2_41 = L2_41(connectionstatusTable, ROW_ID, L1_40, _UPVALUE1_.rxPackets)
  if L2_41 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_40
  end
  return _UPVALUE0_.SUCCESS, L1_40, L2_41
end
function rxPacketsSet(A0_42, A1_43)
  local L3_44
  L3_44 = _UPVALUE0_
  L3_44 = L3_44.NOT_SUPPORTED
  return L3_44, A0_42
end
function connectionStatusGet()
  local L0_45, L1_46
  L0_45 = db
  L0_45 = L0_45.getNextRowId
  L1_46 = "0"
  L0_45 = L0_45(L1_46, connectionstatusTable)
  L1_46 = db
  L1_46 = L1_46.getAttribute
  L1_46 = L1_46(connectionstatusTable, ROW_ID, L0_45, _UPVALUE0_.connectionStatus)
  if L1_46 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_45, L1_46
end
function connectionStatusGetNext(A0_47)
  local L1_48, L2_49
  L1_48 = _UPVALUE0_
  L1_48 = L1_48.NIL
  if A0_47 ~= L1_48 then
    L1_48 = tonumber
    L2_49 = A0_47
    L1_48 = L1_48(L2_49)
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NIL
  elseif L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.existsRow
  L2_49 = connectionstatusTable
  L1_48 = L1_48(L2_49, ROW_ID, A0_47)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.FALSE
  if L1_48 == L2_49 then
    L1_48 = _UPVALUE0_
    L1_48 = L1_48.INVALID_ARGUMENT
    return L1_48
  end
  L1_48 = db
  L1_48 = L1_48.getNextRowId
  L2_49 = A0_47
  L1_48 = L1_48(L2_49, connectionstatusTable)
  L2_49 = _UPVALUE0_
  L2_49 = L2_49.NIL
  if L1_48 == L2_49 then
    L2_49 = _UPVALUE0_
    L2_49 = L2_49.NOT_EXIST
    return L2_49
  end
  L2_49 = db
  L2_49 = L2_49.getAttribute
  L2_49 = L2_49(connectionstatusTable, ROW_ID, L1_48, _UPVALUE1_.connectionStatus)
  if L2_49 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_48
  end
  return _UPVALUE0_.SUCCESS, L1_48, L2_49
end
function connectionStatusSet(A0_50, A1_51)
  local L3_52
  L3_52 = _UPVALUE0_
  L3_52 = L3_52.NOT_SUPPORTED
  return L3_52, A0_50
end
function isactionStatusEnabled()
  local L0_53, L1_54
  L0_53 = db
  L0_53 = L0_53.getNextRowId
  L1_54 = "0"
  L0_53 = L0_53(L1_54, connectionstatusTable)
  L1_54 = db
  L1_54 = L1_54.getAttribute
  L1_54 = L1_54(connectionstatusTable, ROW_ID, L0_53, _UPVALUE0_.actionStatus)
  if L1_54 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_53, L1_54
end
function isactionStatusEnabledNext(A0_55)
  local L1_56, L2_57
  L1_56 = _UPVALUE0_
  L1_56 = L1_56.NIL
  if A0_55 ~= L1_56 then
    L1_56 = tonumber
    L2_57 = A0_55
    L1_56 = L1_56(L2_57)
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NIL
  elseif L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.existsRow
  L2_57 = connectionstatusTable
  L1_56 = L1_56(L2_57, ROW_ID, A0_55)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.FALSE
  if L1_56 == L2_57 then
    L1_56 = _UPVALUE0_
    L1_56 = L1_56.INVALID_ARGUMENT
    return L1_56
  end
  L1_56 = db
  L1_56 = L1_56.getNextRowId
  L2_57 = A0_55
  L1_56 = L1_56(L2_57, connectionstatusTable)
  L2_57 = _UPVALUE0_
  L2_57 = L2_57.NIL
  if L1_56 == L2_57 then
    L2_57 = _UPVALUE0_
    L2_57 = L2_57.NOT_EXIST
    return L2_57
  end
  L2_57 = db
  L2_57 = L2_57.getAttribute
  L2_57 = L2_57(connectionstatusTable, ROW_ID, L1_56, _UPVALUE1_.actionStatus)
  if L2_57 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_56
  end
  return _UPVALUE0_.SUCCESS, L1_56, L2_57
end
function actionStatusEnable(A0_58)
  local L2_59
  L2_59 = _UPVALUE0_
  L2_59 = L2_59.NOT_SUPPORTED
  return L2_59, A0_58
end
function actionStatusDisable(A0_60)
  local L2_61
  L2_61 = _UPVALUE0_
  L2_61 = L2_61.NOT_SUPPORTED
  return L2_61, A0_60
end
function actionGet()
  local L0_62, L1_63
  L0_62 = db
  L0_62 = L0_62.getNextRowId
  L1_63 = "0"
  L0_62 = L0_62(L1_63, connectionstatusTable)
  L1_63 = db
  L1_63 = L1_63.getAttribute
  L1_63 = L1_63(connectionstatusTable, ROW_ID, L0_62, _UPVALUE0_.action)
  if L1_63 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_62, L1_63
end
function actionGetNext(A0_64)
  local L1_65, L2_66
  L1_65 = _UPVALUE0_
  L1_65 = L1_65.NIL
  if A0_64 ~= L1_65 then
    L1_65 = tonumber
    L2_66 = A0_64
    L1_65 = L1_65(L2_66)
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.NIL
  elseif L1_65 == L2_66 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = db
  L1_65 = L1_65.existsRow
  L2_66 = connectionstatusTable
  L1_65 = L1_65(L2_66, ROW_ID, A0_64)
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.FALSE
  if L1_65 == L2_66 then
    L1_65 = _UPVALUE0_
    L1_65 = L1_65.INVALID_ARGUMENT
    return L1_65
  end
  L1_65 = db
  L1_65 = L1_65.getNextRowId
  L2_66 = A0_64
  L1_65 = L1_65(L2_66, connectionstatusTable)
  L2_66 = _UPVALUE0_
  L2_66 = L2_66.NIL
  if L1_65 == L2_66 then
    L2_66 = _UPVALUE0_
    L2_66 = L2_66.NOT_EXIST
    return L2_66
  end
  L2_66 = db
  L2_66 = L2_66.getAttribute
  L2_66 = L2_66(connectionstatusTable, ROW_ID, L1_65, _UPVALUE1_.action)
  if L2_66 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_65
  end
  return _UPVALUE0_.SUCCESS, L1_65, L2_66
end
function actionSet(A0_67, A1_68)
  if A0_67 == _UPVALUE0_.NIL or tonumber(A0_67) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.existsRow(connectionstatusTable, ROW_ID, A0_67) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(connectionstatusTable, ROW_ID, A0_67, _UPVALUE1_.action, A1_68) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_67
  end
  return _UPVALUE0_.SUCCESS, A0_67
end
function outSPIGet()
  local L0_69, L1_70
  L0_69 = db
  L0_69 = L0_69.getNextRowId
  L1_70 = "0"
  L0_69 = L0_69(L1_70, connectionstatusTable)
  L1_70 = db
  L1_70 = L1_70.getAttribute
  L1_70 = L1_70(connectionstatusTable, ROW_ID, L0_69, _UPVALUE0_.outSPI)
  if L1_70 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_69, L1_70
end
function outSPIGetNext(A0_71)
  local L1_72, L2_73
  L1_72 = _UPVALUE0_
  L1_72 = L1_72.NIL
  if A0_71 ~= L1_72 then
    L1_72 = tonumber
    L2_73 = A0_71
    L1_72 = L1_72(L2_73)
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.NIL
  elseif L1_72 == L2_73 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.existsRow
  L2_73 = connectionstatusTable
  L1_72 = L1_72(L2_73, ROW_ID, A0_71)
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.FALSE
  if L1_72 == L2_73 then
    L1_72 = _UPVALUE0_
    L1_72 = L1_72.INVALID_ARGUMENT
    return L1_72
  end
  L1_72 = db
  L1_72 = L1_72.getNextRowId
  L2_73 = A0_71
  L1_72 = L1_72(L2_73, connectionstatusTable)
  L2_73 = _UPVALUE0_
  L2_73 = L2_73.NIL
  if L1_72 == L2_73 then
    L2_73 = _UPVALUE0_
    L2_73 = L2_73.NOT_EXIST
    return L2_73
  end
  L2_73 = db
  L2_73 = L2_73.getAttribute
  L2_73 = L2_73(connectionstatusTable, ROW_ID, L1_72, _UPVALUE1_.outSPI)
  if L2_73 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_72
  end
  return _UPVALUE0_.SUCCESS, L1_72, L2_73
end
function outSPISet(A0_74, A1_75)
  local L3_76
  L3_76 = _UPVALUE0_
  L3_76 = L3_76.NOT_SUPPORTED
  return L3_76, A0_74
end
function remoteEndPointGet()
  local L0_77, L1_78
  L0_77 = db
  L0_77 = L0_77.getNextRowId
  L1_78 = "0"
  L0_77 = L0_77(L1_78, connectionstatusTable)
  L1_78 = db
  L1_78 = L1_78.getAttribute
  L1_78 = L1_78(connectionstatusTable, ROW_ID, L0_77, _UPVALUE0_.remoteEndPoint)
  if L1_78 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_77, L1_78
end
function remoteEndPointGetNext(A0_79)
  local L1_80, L2_81
  L1_80 = _UPVALUE0_
  L1_80 = L1_80.NIL
  if A0_79 ~= L1_80 then
    L1_80 = tonumber
    L2_81 = A0_79
    L1_80 = L1_80(L2_81)
    L2_81 = _UPVALUE0_
    L2_81 = L2_81.NIL
  elseif L1_80 == L2_81 then
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.INVALID_ARGUMENT
    return L1_80
  end
  L1_80 = db
  L1_80 = L1_80.existsRow
  L2_81 = connectionstatusTable
  L1_80 = L1_80(L2_81, ROW_ID, A0_79)
  L2_81 = _UPVALUE0_
  L2_81 = L2_81.FALSE
  if L1_80 == L2_81 then
    L1_80 = _UPVALUE0_
    L1_80 = L1_80.INVALID_ARGUMENT
    return L1_80
  end
  L1_80 = db
  L1_80 = L1_80.getNextRowId
  L2_81 = A0_79
  L1_80 = L1_80(L2_81, connectionstatusTable)
  L2_81 = _UPVALUE0_
  L2_81 = L2_81.NIL
  if L1_80 == L2_81 then
    L2_81 = _UPVALUE0_
    L2_81 = L2_81.NOT_EXIST
    return L2_81
  end
  L2_81 = db
  L2_81 = L2_81.getAttribute
  L2_81 = L2_81(connectionstatusTable, ROW_ID, L1_80, _UPVALUE1_.remoteEndPoint)
  if L2_81 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_80
  end
  return _UPVALUE0_.SUCCESS, L1_80, L2_81
end
function remoteEndPointSet(A0_82, A1_83)
  local L3_84
  L3_84 = _UPVALUE0_
  L3_84 = L3_84.NOT_SUPPORTED
  return L3_84, A0_82
end
function ikePortGet()
  local L0_85, L1_86
  L0_85 = db
  L0_85 = L0_85.getNextRowId
  L1_86 = "0"
  L0_85 = L0_85(L1_86, connectionstatusTable)
  L1_86 = db
  L1_86 = L1_86.getAttribute
  L1_86 = L1_86(connectionstatusTable, ROW_ID, L0_85, _UPVALUE0_.ikePort)
  if L1_86 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_85, L1_86
end
function ikePortGetNext(A0_87)
  local L1_88, L2_89
  L1_88 = _UPVALUE0_
  L1_88 = L1_88.NIL
  if A0_87 ~= L1_88 then
    L1_88 = tonumber
    L2_89 = A0_87
    L1_88 = L1_88(L2_89)
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.NIL
  elseif L1_88 == L2_89 then
    L1_88 = _UPVALUE0_
    L1_88 = L1_88.INVALID_ARGUMENT
    return L1_88
  end
  L1_88 = db
  L1_88 = L1_88.existsRow
  L2_89 = connectionstatusTable
  L1_88 = L1_88(L2_89, ROW_ID, A0_87)
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.FALSE
  if L1_88 == L2_89 then
    L1_88 = _UPVALUE0_
    L1_88 = L1_88.INVALID_ARGUMENT
    return L1_88
  end
  L1_88 = db
  L1_88 = L1_88.getNextRowId
  L2_89 = A0_87
  L1_88 = L1_88(L2_89, connectionstatusTable)
  L2_89 = _UPVALUE0_
  L2_89 = L2_89.NIL
  if L1_88 == L2_89 then
    L2_89 = _UPVALUE0_
    L2_89 = L2_89.NOT_EXIST
    return L2_89
  end
  L2_89 = db
  L2_89 = L2_89.getAttribute
  L2_89 = L2_89(connectionstatusTable, ROW_ID, L1_88, _UPVALUE1_.ikePort)
  if L2_89 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_88
  end
  return _UPVALUE0_.SUCCESS, L1_88, L2_89
end
function ikePortSet(A0_90, A1_91)
  local L3_92
  L3_92 = _UPVALUE0_
  L3_92 = L3_92.NOT_SUPPORTED
  return L3_92, A0_90
end
function isautoPolicyTypeEnabled()
  local L0_93, L1_94
  L0_93 = db
  L0_93 = L0_93.getNextRowId
  L1_94 = "0"
  L0_93 = L0_93(L1_94, connectionstatusTable)
  L1_94 = db
  L1_94 = L1_94.getAttribute
  L1_94 = L1_94(connectionstatusTable, ROW_ID, L0_93, _UPVALUE0_.autoPolicyType)
  if L1_94 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_93, L1_94
end
function isautoPolicyTypeEnabledNext(A0_95)
  local L1_96, L2_97
  L1_96 = _UPVALUE0_
  L1_96 = L1_96.NIL
  if A0_95 ~= L1_96 then
    L1_96 = tonumber
    L2_97 = A0_95
    L1_96 = L1_96(L2_97)
    L2_97 = _UPVALUE0_
    L2_97 = L2_97.NIL
  elseif L1_96 == L2_97 then
    L1_96 = _UPVALUE0_
    L1_96 = L1_96.INVALID_ARGUMENT
    return L1_96
  end
  L1_96 = db
  L1_96 = L1_96.existsRow
  L2_97 = connectionstatusTable
  L1_96 = L1_96(L2_97, ROW_ID, A0_95)
  L2_97 = _UPVALUE0_
  L2_97 = L2_97.FALSE
  if L1_96 == L2_97 then
    L1_96 = _UPVALUE0_
    L1_96 = L1_96.INVALID_ARGUMENT
    return L1_96
  end
  L1_96 = db
  L1_96 = L1_96.getNextRowId
  L2_97 = A0_95
  L1_96 = L1_96(L2_97, connectionstatusTable)
  L2_97 = _UPVALUE0_
  L2_97 = L2_97.NIL
  if L1_96 == L2_97 then
    L2_97 = _UPVALUE0_
    L2_97 = L2_97.NOT_EXIST
    return L2_97
  end
  L2_97 = db
  L2_97 = L2_97.getAttribute
  L2_97 = L2_97(connectionstatusTable, ROW_ID, L1_96, _UPVALUE1_.autoPolicyType)
  if L2_97 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_96
  end
  return _UPVALUE0_.SUCCESS, L1_96, L2_97
end
function autoPolicyTypeEnable(A0_98)
  local L2_99
  L2_99 = _UPVALUE0_
  L2_99 = L2_99.NOT_SUPPORTED
  return L2_99, A0_98
end
function autoPolicyTypeDisable(A0_100)
  local L2_101
  L2_101 = _UPVALUE0_
  L2_101 = L2_101.NOT_SUPPORTED
  return L2_101, A0_100
end
function vpnStateGet()
  local L0_102, L1_103
  L0_102 = db
  L0_102 = L0_102.getNextRowId
  L1_103 = "0"
  L0_102 = L0_102(L1_103, connectionstatusTable)
  L1_103 = db
  L1_103 = L1_103.getAttribute
  L1_103 = L1_103(connectionstatusTable, ROW_ID, L0_102, _UPVALUE0_.vpnState)
  if L1_103 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L0_102, L1_103
end
function vpnStateGetNext(A0_104)
  local L1_105, L2_106
  L1_105 = _UPVALUE0_
  L1_105 = L1_105.NIL
  if A0_104 ~= L1_105 then
    L1_105 = tonumber
    L2_106 = A0_104
    L1_105 = L1_105(L2_106)
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NIL
  elseif L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.existsRow
  L2_106 = connectionstatusTable
  L1_105 = L1_105(L2_106, ROW_ID, A0_104)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.FALSE
  if L1_105 == L2_106 then
    L1_105 = _UPVALUE0_
    L1_105 = L1_105.INVALID_ARGUMENT
    return L1_105
  end
  L1_105 = db
  L1_105 = L1_105.getNextRowId
  L2_106 = A0_104
  L1_105 = L1_105(L2_106, connectionstatusTable)
  L2_106 = _UPVALUE0_
  L2_106 = L2_106.NIL
  if L1_105 == L2_106 then
    L2_106 = _UPVALUE0_
    L2_106 = L2_106.NOT_EXIST
    return L2_106
  end
  L2_106 = db
  L2_106 = L2_106.getAttribute
  L2_106 = L2_106(connectionstatusTable, ROW_ID, L1_105, _UPVALUE1_.vpnState)
  if L2_106 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_105
  end
  return _UPVALUE0_.SUCCESS, L1_105, L2_106
end
function vpnStateSet(A0_107, A1_108)
  local L3_109
  L3_109 = _UPVALUE0_
  L3_109 = L3_109.NOT_SUPPORTED
  return L3_109, A0_107
end
function connectionStatusConfigGet()
  local L0_110, L1_111, L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121, L12_122, L13_123, L14_124
  L0_110 = db
  L0_110 = L0_110.getNextRowId
  L1_111 = "0"
  L2_112 = connectionstatusTable
  L0_110 = L0_110(L1_111, L2_112)
  L1_111 = db
  L1_111 = L1_111.getRow
  L2_112 = connectionstatusTable
  L3_113 = ROW_ID
  L4_114 = L0_110
  L1_111 = L1_111(L2_112, L3_113, L4_114)
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NIL
  if L1_111 == L2_112 then
    L2_112 = _UPVALUE0_
    L2_112 = L2_112.FAILURE
    return L2_112
  end
  L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121, L12_122, L13_123, L14_124 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_112 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.policyName]
  L3_113 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.txData]
  L4_114 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.txPackets]
  L5_115 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.rxData]
  L6_116 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.rxPackets]
  L7_117 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.connectionStatus]
  L8_118 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.actionStatus]
  L9_119 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.action]
  L10_120 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.outSPI]
  L11_121 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.remoteEndPoint]
  L12_122 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.ikePort]
  L13_123 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.autoPolicyType]
  L14_124 = L1_111[connectionstatusTable .. "." .. _UPVALUE1_.vpnState]
  return _UPVALUE0_.SUCCESS, L0_110, L2_112, L3_113, L4_114, L5_115, L6_116, L7_117, L8_118, L9_119, L10_120, L11_121, L12_122, L13_123, L14_124
end
function connectionStatusConfigGetNext(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134, L10_135, L11_136, L12_137, L13_138, L14_139, L15_140
  L1_126 = _UPVALUE0_
  L1_126 = L1_126.NIL
  if A0_125 ~= L1_126 then
    L1_126 = tonumber
    L2_127 = A0_125
    L1_126 = L1_126(L2_127)
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NIL
  elseif L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.existsRow
  L2_127 = connectionstatusTable
  L3_128 = ROW_ID
  L4_129 = A0_125
  L1_126 = L1_126(L2_127, L3_128, L4_129)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.FALSE
  if L1_126 == L2_127 then
    L1_126 = _UPVALUE0_
    L1_126 = L1_126.INVALID_ARGUMENT
    return L1_126
  end
  L1_126 = db
  L1_126 = L1_126.getNextRowId
  L2_127 = A0_125
  L3_128 = connectionstatusTable
  L1_126 = L1_126(L2_127, L3_128)
  L2_127 = _UPVALUE0_
  L2_127 = L2_127.NIL
  if L1_126 == L2_127 then
    L2_127 = _UPVALUE0_
    L2_127 = L2_127.NOT_EXIST
    return L2_127
  end
  L2_127 = db
  L2_127 = L2_127.getRow
  L3_128 = connectionstatusTable
  L4_129 = ROW_ID
  L5_130 = L1_126
  L2_127 = L2_127(L3_128, L4_129, L5_130)
  L3_128 = _UPVALUE0_
  L3_128 = L3_128.NIL
  if L2_127 == L3_128 then
    L3_128 = _UPVALUE0_
    L3_128 = L3_128.FAILURE
    L4_129 = A0_125
    return L3_128, L4_129
  end
  L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134, L10_135, L11_136, L12_137, L13_138, L14_139, L15_140 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_128 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.policyName]
  L4_129 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.txData]
  L5_130 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.txPackets]
  L6_131 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.rxData]
  L7_132 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.rxPackets]
  L8_133 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.connectionStatus]
  L9_134 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.actionStatus]
  L10_135 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.action]
  L11_136 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.outSPI]
  L12_137 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.remoteEndPoint]
  L13_138 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.ikePort]
  L14_139 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.autoPolicyType]
  L15_140 = L2_127[connectionstatusTable .. "." .. _UPVALUE1_.vpnState]
  return _UPVALUE0_.SUCCESS, L1_126, L3_128, L4_129, L5_130, L6_131, L7_132, L8_133, L9_134, L10_135, L11_136, L12_137, L13_138, L14_139, L15_140
end
function connectionStatusConfigSet(A0_141, A1_142, A2_143, A3_144, A4_145, A5_146, A6_147, A7_148, A8_149, A9_150, A10_151, A11_152, A12_153, A13_154)
  local L15_155
  L15_155 = _UPVALUE0_
  L15_155 = L15_155.NOT_SUPPORTED
  return L15_155, A0_141
end
function connectionStatusConfigCreate(A0_156, A1_157, A2_158, A3_159, A4_160, A5_161, A6_162, A7_163, A8_164, A9_165, A10_166, A11_167, A12_168)
  local L14_169
  L14_169 = _UPVALUE0_
  L14_169 = L14_169.NOT_SUPPORTED
  return L14_169, cookie
end
function connectionStatusConfigDelete(A0_170)
  local L2_171
  L2_171 = _UPVALUE0_
  L2_171 = L2_171.NOT_SUPPORTED
  return L2_171, A0_170
end
function connectionStatusConfigGetAll()
  local L0_172
  L0_172 = db
  L0_172 = L0_172.getTable
  L0_172 = L0_172(connectionstatusTable, false)
  if L0_172 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  for _FORV_4_, _FORV_5_ in pairs(L0_172) do
    if db.existsRowWhere("IpsecVPNPolicy", "VPNPolicyName='" .. L0_172[_FORV_4_].PolicyName .. "' AND PolicyType=2") ~= _UPVALUE0_.FALSE then
      L0_172[_FORV_4_].ConnectionStatus = "Manual Policy"
    end
  end
  return _UPVALUE0_.SUCCESS, L0_172
end
function connectionStatusConfigGetRow(A0_173)
  local L1_174
  L1_174 = db
  L1_174 = L1_174.getRow
  L1_174 = L1_174(connectionstatusTable, ROW_ID, A0_173)
  if L1_174 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L1_174
end
function ipsecConnectionStatusSet(A0_175, A1_176)
  local L2_177, L3_178, L4_179, L5_180
  L2_177 = false
  L3_178 = false
  L4_179 = {}
  L5_180 = nil
  if A1_176 == "1" then
    L2_177 = db.setAttribute("ConnectionStatus", "_ROWID_", A0_175, "Action", A1_176)
  else
    L2_177 = db.setAttribute("ConnectionStatus", "_ROWID_", A0_175, "Action", A1_176)
  end
  if db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A0_175) == nil then
    return _UPVALUE0_.VIPSECURE_CS_CONFIG_FAILED
  else
    L4_179["IpsecUserAction.PolicyName"] = db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A0_175)["ConnectionStatus.PolicyName"]
    if A1_176 == "1" then
      L4_179["IpsecUserAction.userAction"] = "1"
    else
      L4_179["IpsecUserAction.userAction"] = "0"
    end
  end
  L3_178 = db.insert("IpsecUserAction", L4_179)
  if L3_178 == _UPVALUE1_.NIL then
    L3_178 = db.setAttribute("IpsecUserAction", "PolicyName", db.getRow("ConnectionStatus", "ConnectionStatus._ROWID_", A0_175)["ConnectionStatus.PolicyName"], "userAction", L4_179["IpsecUserAction.userAction"])
  end
  if L2_177 and L3_178 then
    return _UPVALUE1_.SUCCESS
  else
    return _UPVALUE0_.VIPSECURE_CS_CONFIG_FAILED
  end
end
