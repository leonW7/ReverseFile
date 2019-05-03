local L0_0
L0_0 = module
L0_0("com.teamf1.core.sslvpn.currentusers", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslvpn_returnCodes")
L0_0 = require
L0_0("teamf1lualib/sslAdmin")
L0_0 = require
L0_0("sslvpnLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.sslvpn.returnCodes")
currentusersTable = "SSLVPNActiveUsers"
groupsTable = "UserGroups"
usersTable = "Users"
;({}).userName = "UserName"
;({}).sessionId = "SessionID"
;({}).cookie = "Cookie"
;({}).groupName = "GroupName"
;({}).groupId = "GroupId"
;({}).loginTime = "LoginTime"
;({}).loginAddress = "LoginAddress"
;({}).lastAccessTime = "LastAccessTime"
;({}).pppInterfaceName = "PPPInterface"
;({}).pppInterfaceIP = "PPPInterfaceIP"
;({}).peerPPPInterfaceIP = "PeerPPPInterfaceIP"
;({}).sessionStatus = "SessionStatus"
;({}).txPackets = "TxPackets"
;({}).txPacketsDropped = "TxPacketsDropped"
;({}).txBytes = "TxBytes"
;({}).rxPackets = "RxPackets"
;({}).rxPacketsDropped = "RxPacketsDropped"
;({}).rxBytes = "RxBytes"
;({}).refererValue = "RefererValue"
;({}).password = "Password"
function userNameGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, currentusersTable)
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(currentusersTable, _UPVALUE1_, L0_1, _UPVALUE2_.userName)
  if L1_2 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_1, L1_2
end
function userNameGetNext(A0_3)
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
  L2_5 = currentusersTable
  L1_4 = L1_4(L2_5, _UPVALUE1_, A0_3)
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
  L1_4 = L1_4(L2_5, currentusersTable)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(currentusersTable, _UPVALUE1_, L1_4, _UPVALUE2_.userName)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function userNameSet(A0_6, A1_7)
  local L3_8
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  return L3_8, A0_6
end
function userNameDelete(A0_9, A1_10)
  local L3_11
  L3_11 = _UPVALUE0_
  L3_11 = L3_11.NOT_SUPPORTED
  return L3_11, A0_9
end
function sessionIdGet()
  local L0_12, L1_13
  L0_12 = db
  L0_12 = L0_12.getNextRowId
  L1_13 = _UPVALUE0_
  L0_12 = L0_12(L1_13, currentusersTable)
  L1_13 = db
  L1_13 = L1_13.getAttribute
  L1_13 = L1_13(currentusersTable, _UPVALUE1_, L0_12, _UPVALUE2_.sessionId)
  if L1_13 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_12, L1_13
end
function sessionIdGetNext(A0_14)
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
  L2_16 = currentusersTable
  L1_15 = L1_15(L2_16, _UPVALUE1_, A0_14)
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
  L1_15 = L1_15(L2_16, currentusersTable)
  L2_16 = _UPVALUE0_
  L2_16 = L2_16.NIL
  if L1_15 == L2_16 then
    L2_16 = _UPVALUE0_
    L2_16 = L2_16.NOT_EXIST
    return L2_16
  end
  L2_16 = db
  L2_16 = L2_16.getAttribute
  L2_16 = L2_16(currentusersTable, _UPVALUE1_, L1_15, _UPVALUE2_.sessionId)
  if L2_16 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_15
  end
  return _UPVALUE0_.SUCCESS, L1_15, L2_16
end
function sessionIdSet(A0_17, A1_18)
  local L3_19
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.NOT_SUPPORTED
  return L3_19, A0_17
end
function cookieGet()
  local L0_20, L1_21
  L0_20 = db
  L0_20 = L0_20.getNextRowId
  L1_21 = _UPVALUE0_
  L0_20 = L0_20(L1_21, currentusersTable)
  L1_21 = db
  L1_21 = L1_21.getAttribute
  L1_21 = L1_21(currentusersTable, _UPVALUE1_, L0_20, _UPVALUE2_.cookie)
  if L1_21 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_20, L1_21
end
function cookieGetNext(A0_22)
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
  L2_24 = currentusersTable
  L1_23 = L1_23(L2_24, _UPVALUE1_, A0_22)
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
  L1_23 = L1_23(L2_24, currentusersTable)
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NIL
  if L1_23 == L2_24 then
    L2_24 = _UPVALUE0_
    L2_24 = L2_24.NOT_EXIST
    return L2_24
  end
  L2_24 = db
  L2_24 = L2_24.getAttribute
  L2_24 = L2_24(currentusersTable, _UPVALUE1_, L1_23, _UPVALUE2_.cookie)
  if L2_24 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_23
  end
  return _UPVALUE0_.SUCCESS, L1_23, L2_24
end
function cookieSet(A0_25, A1_26)
  local L3_27
  L3_27 = _UPVALUE0_
  L3_27 = L3_27.NOT_SUPPORTED
  return L3_27, A1_26
end
function groupNameGet()
  local L0_28, L1_29
  L0_28 = db
  L0_28 = L0_28.getNextRowId
  L1_29 = _UPVALUE0_
  L0_28 = L0_28(L1_29, currentusersTable)
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29(currentusersTable, _UPVALUE1_, L0_28, _UPVALUE2_.groupName)
  if L1_29 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_28, L1_29
end
function groupNameGetNext(A0_30)
  local L1_31, L2_32
  L1_31 = _UPVALUE0_
  L1_31 = L1_31.NIL
  if A0_30 ~= L1_31 then
    L1_31 = tonumber
    L2_32 = A0_30
    L1_31 = L1_31(L2_32)
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NIL
  elseif L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.existsRow
  L2_32 = currentusersTable
  L1_31 = L1_31(L2_32, _UPVALUE1_, A0_30)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.FALSE
  if L1_31 == L2_32 then
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.INVALID_ARGUMENT
    return L1_31
  end
  L1_31 = db
  L1_31 = L1_31.getNextRowId
  L2_32 = A0_30
  L1_31 = L1_31(L2_32, currentusersTable)
  L2_32 = _UPVALUE0_
  L2_32 = L2_32.NIL
  if L1_31 == L2_32 then
    L2_32 = _UPVALUE0_
    L2_32 = L2_32.NOT_EXIST
    return L2_32
  end
  L2_32 = db
  L2_32 = L2_32.getAttribute
  L2_32 = L2_32(currentusersTable, _UPVALUE1_, L1_31, _UPVALUE2_.groupName)
  if L2_32 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_31
  end
  return _UPVALUE0_.SUCCESS, L1_31, L2_32
end
function groupNameSet(A0_33, A1_34)
  local L3_35
  L3_35 = _UPVALUE0_
  L3_35 = L3_35.NOT_SUPPORTED
  return L3_35, A0_33
end
function loginTimeGet()
  local L0_36, L1_37
  L0_36 = db
  L0_36 = L0_36.getNextRowId
  L1_37 = _UPVALUE0_
  L0_36 = L0_36(L1_37, currentusersTable)
  L1_37 = db
  L1_37 = L1_37.getAttribute
  L1_37 = L1_37(currentusersTable, _UPVALUE1_, L0_36, _UPVALUE2_.loginTime)
  if L1_37 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_36, L1_37
end
function loginTimeGetNext(A0_38)
  local L1_39, L2_40
  L1_39 = _UPVALUE0_
  L1_39 = L1_39.NIL
  if A0_38 ~= L1_39 then
    L1_39 = tonumber
    L2_40 = A0_38
    L1_39 = L1_39(L2_40)
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.NIL
  elseif L1_39 == L2_40 then
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.INVALID_ARGUMENT
    return L1_39
  end
  L1_39 = db
  L1_39 = L1_39.existsRow
  L2_40 = currentusersTable
  L1_39 = L1_39(L2_40, _UPVALUE1_, A0_38)
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.FALSE
  if L1_39 == L2_40 then
    L1_39 = _UPVALUE0_
    L1_39 = L1_39.INVALID_ARGUMENT
    return L1_39
  end
  L1_39 = db
  L1_39 = L1_39.getNextRowId
  L2_40 = A0_38
  L1_39 = L1_39(L2_40, currentusersTable)
  L2_40 = _UPVALUE0_
  L2_40 = L2_40.NIL
  if L1_39 == L2_40 then
    L2_40 = _UPVALUE0_
    L2_40 = L2_40.NOT_EXIST
    return L2_40
  end
  L2_40 = db
  L2_40 = L2_40.getAttribute
  L2_40 = L2_40(currentusersTable, _UPVALUE1_, L1_39, _UPVALUE2_.loginTime)
  if L2_40 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_39
  end
  return _UPVALUE0_.SUCCESS, L1_39, L2_40
end
function loginTimeSet(A0_41, A1_42)
  local L3_43
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NOT_SUPPORTED
  return L3_43, A0_41
end
function loginAddressGet()
  local L0_44, L1_45
  L0_44 = db
  L0_44 = L0_44.getNextRowId
  L1_45 = _UPVALUE0_
  L0_44 = L0_44(L1_45, currentusersTable)
  L1_45 = db
  L1_45 = L1_45.getAttribute
  L1_45 = L1_45(currentusersTable, _UPVALUE1_, L0_44, _UPVALUE2_.loginAddress)
  if L1_45 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_44, L1_45
end
function loginAddressGetNext(A0_46)
  local L1_47, L2_48
  L1_47 = _UPVALUE0_
  L1_47 = L1_47.NIL
  if A0_46 ~= L1_47 then
    L1_47 = tonumber
    L2_48 = A0_46
    L1_47 = L1_47(L2_48)
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NIL
  elseif L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.existsRow
  L2_48 = currentusersTable
  L1_47 = L1_47(L2_48, _UPVALUE1_, A0_46)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.FALSE
  if L1_47 == L2_48 then
    L1_47 = _UPVALUE0_
    L1_47 = L1_47.INVALID_ARGUMENT
    return L1_47
  end
  L1_47 = db
  L1_47 = L1_47.getNextRowId
  L2_48 = A0_46
  L1_47 = L1_47(L2_48, currentusersTable)
  L2_48 = _UPVALUE0_
  L2_48 = L2_48.NIL
  if L1_47 == L2_48 then
    L2_48 = _UPVALUE0_
    L2_48 = L2_48.NOT_EXIST
    return L2_48
  end
  L2_48 = db
  L2_48 = L2_48.getAttribute
  L2_48 = L2_48(currentusersTable, _UPVALUE1_, L1_47, _UPVALUE2_.loginAddress)
  if L2_48 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_47
  end
  return _UPVALUE0_.SUCCESS, L1_47, L2_48
end
function loginAddressSet(A0_49, A1_50)
  local L3_51
  L3_51 = _UPVALUE0_
  L3_51 = L3_51.NOT_SUPPORTED
  return L3_51, A0_49
end
function lastAccessTimeGet()
  local L0_52, L1_53
  L0_52 = db
  L0_52 = L0_52.getNextRowId
  L1_53 = _UPVALUE0_
  L0_52 = L0_52(L1_53, currentusersTable)
  L1_53 = db
  L1_53 = L1_53.getAttribute
  L1_53 = L1_53(currentusersTable, _UPVALUE1_, L0_52, _UPVALUE2_.lastAccessTime)
  if L1_53 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_52, L1_53
end
function lastAccessTimeGetNext(A0_54)
  local L1_55, L2_56
  L1_55 = _UPVALUE0_
  L1_55 = L1_55.NIL
  if A0_54 ~= L1_55 then
    L1_55 = tonumber
    L2_56 = A0_54
    L1_55 = L1_55(L2_56)
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.NIL
  elseif L1_55 == L2_56 then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.INVALID_ARGUMENT
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.existsRow
  L2_56 = currentusersTable
  L1_55 = L1_55(L2_56, _UPVALUE1_, A0_54)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.FALSE
  if L1_55 == L2_56 then
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.INVALID_ARGUMENT
    return L1_55
  end
  L1_55 = db
  L1_55 = L1_55.getNextRowId
  L2_56 = A0_54
  L1_55 = L1_55(L2_56, currentusersTable)
  L2_56 = _UPVALUE0_
  L2_56 = L2_56.NIL
  if L1_55 == L2_56 then
    L2_56 = _UPVALUE0_
    L2_56 = L2_56.NOT_EXIST
    return L2_56
  end
  L2_56 = db
  L2_56 = L2_56.getAttribute
  L2_56 = L2_56(currentusersTable, _UPVALUE1_, L1_55, _UPVALUE2_.lastAccessTime)
  if L2_56 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_55
  end
  return _UPVALUE0_.SUCCESS, L1_55, L2_56
end
function lastAccessTimeSet(A0_57, A1_58)
  local L3_59
  L3_59 = _UPVALUE0_
  L3_59 = L3_59.NOT_SUPPORTED
  return L3_59, A0_57
end
function pppInterfaceNameGet()
  local L0_60, L1_61
  L0_60 = db
  L0_60 = L0_60.getNextRowId
  L1_61 = _UPVALUE0_
  L0_60 = L0_60(L1_61, currentusersTable)
  L1_61 = db
  L1_61 = L1_61.getAttribute
  L1_61 = L1_61(currentusersTable, _UPVALUE1_, L0_60, _UPVALUE2_.pppInterfaceName)
  if L1_61 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_60, L1_61
end
function pppInterfaceNameGetNext(A0_62)
  local L1_63, L2_64
  L1_63 = _UPVALUE0_
  L1_63 = L1_63.NIL
  if A0_62 ~= L1_63 then
    L1_63 = tonumber
    L2_64 = A0_62
    L1_63 = L1_63(L2_64)
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NIL
  elseif L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.existsRow
  L2_64 = currentusersTable
  L1_63 = L1_63(L2_64, _UPVALUE1_, A0_62)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.FALSE
  if L1_63 == L2_64 then
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.INVALID_ARGUMENT
    return L1_63
  end
  L1_63 = db
  L1_63 = L1_63.getNextRowId
  L2_64 = A0_62
  L1_63 = L1_63(L2_64, currentusersTable)
  L2_64 = _UPVALUE0_
  L2_64 = L2_64.NIL
  if L1_63 == L2_64 then
    L2_64 = _UPVALUE0_
    L2_64 = L2_64.NOT_EXIST
    return L2_64
  end
  L2_64 = db
  L2_64 = L2_64.getAttribute
  L2_64 = L2_64(currentusersTable, _UPVALUE1_, L1_63, _UPVALUE2_.pppInterfaceName)
  if L2_64 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_63
  end
  return _UPVALUE0_.SUCCESS, L1_63, L2_64
end
function pppInterfaceNameSet(A0_65, A1_66)
  local L3_67
  L3_67 = _UPVALUE0_
  L3_67 = L3_67.NOT_SUPPORTED
  return L3_67, A0_65
end
function pppInterfaceIPGet()
  local L0_68, L1_69
  L0_68 = db
  L0_68 = L0_68.getNextRowId
  L1_69 = _UPVALUE0_
  L0_68 = L0_68(L1_69, currentusersTable)
  L1_69 = db
  L1_69 = L1_69.getAttribute
  L1_69 = L1_69(currentusersTable, _UPVALUE1_, L0_68, _UPVALUE2_.pppInterfaceIP)
  if L1_69 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_68, L1_69
end
function pppInterfaceIPGetNext(A0_70)
  local L1_71, L2_72
  L1_71 = _UPVALUE0_
  L1_71 = L1_71.NIL
  if A0_70 ~= L1_71 then
    L1_71 = tonumber
    L2_72 = A0_70
    L1_71 = L1_71(L2_72)
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NIL
  elseif L1_71 == L2_72 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = db
  L1_71 = L1_71.existsRow
  L2_72 = currentusersTable
  L1_71 = L1_71(L2_72, _UPVALUE1_, A0_70)
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.FALSE
  if L1_71 == L2_72 then
    L1_71 = _UPVALUE0_
    L1_71 = L1_71.INVALID_ARGUMENT
    return L1_71
  end
  L1_71 = db
  L1_71 = L1_71.getNextRowId
  L2_72 = A0_70
  L1_71 = L1_71(L2_72, currentusersTable)
  L2_72 = _UPVALUE0_
  L2_72 = L2_72.NIL
  if L1_71 == L2_72 then
    L2_72 = _UPVALUE0_
    L2_72 = L2_72.NOT_EXIST
    return L2_72
  end
  L2_72 = db
  L2_72 = L2_72.getAttribute
  L2_72 = L2_72(currentusersTable, _UPVALUE1_, L1_71, _UPVALUE2_.pppInterfaceIP)
  if L2_72 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_71
  end
  return _UPVALUE0_.SUCCESS, L1_71, L2_72
end
function pppInterfaceIPSet(A0_73, A1_74)
  local L3_75
  L3_75 = _UPVALUE0_
  L3_75 = L3_75.NOT_SUPPORTED
  return L3_75, A0_73
end
function peerPPPInterfaceIPGet()
  local L0_76, L1_77
  L0_76 = db
  L0_76 = L0_76.getNextRowId
  L1_77 = _UPVALUE0_
  L0_76 = L0_76(L1_77, currentusersTable)
  L1_77 = db
  L1_77 = L1_77.getAttribute
  L1_77 = L1_77(currentusersTable, _UPVALUE1_, L0_76, _UPVALUE2_.peerPPPInterfaceIP)
  if L1_77 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_76, L1_77
end
function peerPPPInterfaceIPGetNext(A0_78)
  local L1_79, L2_80
  L1_79 = _UPVALUE0_
  L1_79 = L1_79.NIL
  if A0_78 ~= L1_79 then
    L1_79 = tonumber
    L2_80 = A0_78
    L1_79 = L1_79(L2_80)
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NIL
  elseif L1_79 == L2_80 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.existsRow
  L2_80 = currentusersTable
  L1_79 = L1_79(L2_80, _UPVALUE1_, A0_78)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.FALSE
  if L1_79 == L2_80 then
    L1_79 = _UPVALUE0_
    L1_79 = L1_79.INVALID_ARGUMENT
    return L1_79
  end
  L1_79 = db
  L1_79 = L1_79.getNextRowId
  L2_80 = A0_78
  L1_79 = L1_79(L2_80, currentusersTable)
  L2_80 = _UPVALUE0_
  L2_80 = L2_80.NIL
  if L1_79 == L2_80 then
    L2_80 = _UPVALUE0_
    L2_80 = L2_80.NOT_EXIST
    return L2_80
  end
  L2_80 = db
  L2_80 = L2_80.getAttribute
  L2_80 = L2_80(currentusersTable, _UPVALUE1_, L1_79, _UPVALUE2_.peerPPPInterfaceIP)
  if L2_80 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_79
  end
  return _UPVALUE0_.SUCCESS, L1_79, L2_80
end
function peerPPPInterfaceIPSet(A0_81, A1_82)
  local L3_83
  L3_83 = _UPVALUE0_
  L3_83 = L3_83.NOT_SUPPORTED
  return L3_83, A0_81
end
function sessionStatusGet()
  local L0_84, L1_85
  L0_84 = db
  L0_84 = L0_84.getNextRowId
  L1_85 = _UPVALUE0_
  L0_84 = L0_84(L1_85, currentusersTable)
  L1_85 = db
  L1_85 = L1_85.getAttribute
  L1_85 = L1_85(currentusersTable, _UPVALUE1_, L0_84, _UPVALUE2_.sessionStatus)
  if L1_85 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, 1, L1_85
end
function sessionStatusGetNext(A0_86)
  local L1_87, L2_88
  L1_87 = _UPVALUE0_
  L1_87 = L1_87.NIL
  if A0_86 ~= L1_87 then
    L1_87 = tonumber
    L2_88 = A0_86
    L1_87 = L1_87(L2_88)
    L2_88 = _UPVALUE0_
    L2_88 = L2_88.NIL
  elseif L1_87 == L2_88 then
    L1_87 = _UPVALUE0_
    L1_87 = L1_87.INVALID_ARGUMENT
    return L1_87
  end
  L1_87 = db
  L1_87 = L1_87.existsRow
  L2_88 = currentusersTable
  L1_87 = L1_87(L2_88, _UPVALUE1_, A0_86)
  L2_88 = _UPVALUE0_
  L2_88 = L2_88.FALSE
  if L1_87 == L2_88 then
    L1_87 = _UPVALUE0_
    L1_87 = L1_87.INVALID_ARGUMENT
    return L1_87
  end
  L1_87 = db
  L1_87 = L1_87.getNextRowId
  L2_88 = A0_86
  L1_87 = L1_87(L2_88, currentusersTable)
  L2_88 = _UPVALUE0_
  L2_88 = L2_88.NIL
  if L1_87 == L2_88 then
    L2_88 = _UPVALUE0_
    L2_88 = L2_88.NOT_EXIST
    return L2_88
  end
  L2_88 = db
  L2_88 = L2_88.getAttribute
  L2_88 = L2_88(currentusersTable, _UPVALUE1_, L1_87, _UPVALUE2_.sessionStatus)
  if L2_88 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_87
  end
  return _UPVALUE0_.SUCCESS, L1_87, L2_88
end
function sessionStatusSet(A0_89, A1_90)
  local L3_91
  L3_91 = _UPVALUE0_
  L3_91 = L3_91.NOT_SUPPORTED
  return L3_91, A0_89
end
function txPacketsGet()
  local L0_92, L1_93
  L0_92 = db
  L0_92 = L0_92.getNextRowId
  L1_93 = _UPVALUE0_
  L0_92 = L0_92(L1_93, currentusersTable)
  L1_93 = db
  L1_93 = L1_93.getAttribute
  L1_93 = L1_93(currentusersTable, _UPVALUE1_, L0_92, _UPVALUE2_.txPackets)
  if L1_93 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_92, L1_93
end
function txPacketsGetNext(A0_94)
  local L1_95, L2_96
  L1_95 = _UPVALUE0_
  L1_95 = L1_95.NIL
  if A0_94 ~= L1_95 then
    L1_95 = tonumber
    L2_96 = A0_94
    L1_95 = L1_95(L2_96)
    L2_96 = _UPVALUE0_
    L2_96 = L2_96.NIL
  elseif L1_95 == L2_96 then
    L1_95 = _UPVALUE0_
    L1_95 = L1_95.INVALID_ARGUMENT
    return L1_95
  end
  L1_95 = db
  L1_95 = L1_95.existsRow
  L2_96 = currentusersTable
  L1_95 = L1_95(L2_96, _UPVALUE1_, A0_94)
  L2_96 = _UPVALUE0_
  L2_96 = L2_96.FALSE
  if L1_95 == L2_96 then
    L1_95 = _UPVALUE0_
    L1_95 = L1_95.INVALID_ARGUMENT
    return L1_95
  end
  L1_95 = db
  L1_95 = L1_95.getNextRowId
  L2_96 = A0_94
  L1_95 = L1_95(L2_96, currentusersTable)
  L2_96 = _UPVALUE0_
  L2_96 = L2_96.NIL
  if L1_95 == L2_96 then
    L2_96 = _UPVALUE0_
    L2_96 = L2_96.NOT_EXIST
    return L2_96
  end
  L2_96 = db
  L2_96 = L2_96.getAttribute
  L2_96 = L2_96(currentusersTable, _UPVALUE1_, L1_95, _UPVALUE2_.txPackets)
  if L2_96 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_95
  end
  return _UPVALUE0_.SUCCESS, L1_95, L2_96
end
function txPacketsSet(A0_97, A1_98)
  local L3_99
  L3_99 = _UPVALUE0_
  L3_99 = L3_99.NOT_SUPPORTED
  return L3_99, A0_97
end
function txPacketsDroppedGet()
  local L0_100, L1_101
  L0_100 = db
  L0_100 = L0_100.getNextRowId
  L1_101 = _UPVALUE0_
  L0_100 = L0_100(L1_101, currentusersTable)
  L1_101 = db
  L1_101 = L1_101.getAttribute
  L1_101 = L1_101(currentusersTable, _UPVALUE1_, L0_100, _UPVALUE2_.txPacketsDropped)
  if L1_101 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_100, L1_101
end
function txPacketsDroppedGetNext(A0_102)
  local L1_103, L2_104
  L1_103 = _UPVALUE0_
  L1_103 = L1_103.NIL
  if A0_102 ~= L1_103 then
    L1_103 = tonumber
    L2_104 = A0_102
    L1_103 = L1_103(L2_104)
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.NIL
  elseif L1_103 == L2_104 then
    L1_103 = _UPVALUE0_
    L1_103 = L1_103.INVALID_ARGUMENT
    return L1_103
  end
  L1_103 = db
  L1_103 = L1_103.existsRow
  L2_104 = currentusersTable
  L1_103 = L1_103(L2_104, _UPVALUE1_, A0_102)
  L2_104 = _UPVALUE0_
  L2_104 = L2_104.FALSE
  if L1_103 == L2_104 then
    L1_103 = _UPVALUE0_
    L1_103 = L1_103.INVALID_ARGUMENT
    return L1_103
  end
  L1_103 = db
  L1_103 = L1_103.getNextRowId
  L2_104 = A0_102
  L1_103 = L1_103(L2_104, currentusersTable)
  L2_104 = _UPVALUE0_
  L2_104 = L2_104.NIL
  if L1_103 == L2_104 then
    L2_104 = _UPVALUE0_
    L2_104 = L2_104.NOT_EXIST
    return L2_104
  end
  L2_104 = db
  L2_104 = L2_104.getAttribute
  L2_104 = L2_104(currentusersTable, _UPVALUE1_, L1_103, _UPVALUE2_.txPacketsDropped)
  if L2_104 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_103
  end
  return _UPVALUE0_.SUCCESS, L1_103, L2_104
end
function txPacketsDroppedSet(A0_105, A1_106)
  local L3_107
  L3_107 = _UPVALUE0_
  L3_107 = L3_107.NOT_SUPPORTED
  return L3_107, A0_105
end
function txBytesGet()
  local L0_108, L1_109
  L0_108 = db
  L0_108 = L0_108.getNextRowId
  L1_109 = _UPVALUE0_
  L0_108 = L0_108(L1_109, currentusersTable)
  L1_109 = db
  L1_109 = L1_109.getAttribute
  L1_109 = L1_109(currentusersTable, _UPVALUE1_, L0_108, _UPVALUE2_.txBytes)
  if L1_109 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_108, L1_109
end
function txBytesGetNext(A0_110)
  local L1_111, L2_112
  L1_111 = _UPVALUE0_
  L1_111 = L1_111.NIL
  if A0_110 ~= L1_111 then
    L1_111 = tonumber
    L2_112 = A0_110
    L1_111 = L1_111(L2_112)
    L2_112 = _UPVALUE0_
    L2_112 = L2_112.NIL
  elseif L1_111 == L2_112 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.INVALID_ARGUMENT
    return L1_111
  end
  L1_111 = db
  L1_111 = L1_111.existsRow
  L2_112 = currentusersTable
  L1_111 = L1_111(L2_112, _UPVALUE1_, A0_110)
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.FALSE
  if L1_111 == L2_112 then
    L1_111 = _UPVALUE0_
    L1_111 = L1_111.INVALID_ARGUMENT
    return L1_111
  end
  L1_111 = db
  L1_111 = L1_111.getNextRowId
  L2_112 = A0_110
  L1_111 = L1_111(L2_112, currentusersTable)
  L2_112 = _UPVALUE0_
  L2_112 = L2_112.NIL
  if L1_111 == L2_112 then
    L2_112 = _UPVALUE0_
    L2_112 = L2_112.NOT_EXIST
    return L2_112
  end
  L2_112 = db
  L2_112 = L2_112.getAttribute
  L2_112 = L2_112(currentusersTable, _UPVALUE1_, L1_111, _UPVALUE2_.txBytes)
  if L2_112 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_111
  end
  return _UPVALUE0_.SUCCESS, L1_111, L2_112
end
function txBytesSet(A0_113, A1_114)
  local L3_115
  L3_115 = _UPVALUE0_
  L3_115 = L3_115.NOT_SUPPORTED
  return L3_115, A0_113
end
function rxPacketsGet()
  local L0_116, L1_117
  L0_116 = db
  L0_116 = L0_116.getNextRowId
  L1_117 = _UPVALUE0_
  L0_116 = L0_116(L1_117, currentusersTable)
  L1_117 = db
  L1_117 = L1_117.getAttribute
  L1_117 = L1_117(currentusersTable, _UPVALUE1_, L0_116, _UPVALUE2_.rxPackets)
  if L1_117 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_116, L1_117
end
function rxPacketsGetNext(A0_118)
  local L1_119, L2_120
  L1_119 = _UPVALUE0_
  L1_119 = L1_119.NIL
  if A0_118 ~= L1_119 then
    L1_119 = tonumber
    L2_120 = A0_118
    L1_119 = L1_119(L2_120)
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NIL
  elseif L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.existsRow
  L2_120 = currentusersTable
  L1_119 = L1_119(L2_120, _UPVALUE1_, A0_118)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.FALSE
  if L1_119 == L2_120 then
    L1_119 = _UPVALUE0_
    L1_119 = L1_119.INVALID_ARGUMENT
    return L1_119
  end
  L1_119 = db
  L1_119 = L1_119.getNextRowId
  L2_120 = A0_118
  L1_119 = L1_119(L2_120, currentusersTable)
  L2_120 = _UPVALUE0_
  L2_120 = L2_120.NIL
  if L1_119 == L2_120 then
    L2_120 = _UPVALUE0_
    L2_120 = L2_120.NOT_EXIST
    return L2_120
  end
  L2_120 = db
  L2_120 = L2_120.getAttribute
  L2_120 = L2_120(currentusersTable, _UPVALUE1_, L1_119, _UPVALUE2_.rxPackets)
  if L2_120 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_119
  end
  return _UPVALUE0_.SUCCESS, L1_119, L2_120
end
function rxPacketsSet(A0_121, A1_122)
  local L3_123
  L3_123 = _UPVALUE0_
  L3_123 = L3_123.NOT_SUPPORTED
  return L3_123, A0_121
end
function rxPacketsDroppedGet()
  local L0_124, L1_125
  L0_124 = db
  L0_124 = L0_124.getNextRowId
  L1_125 = _UPVALUE0_
  L0_124 = L0_124(L1_125, currentusersTable)
  L1_125 = db
  L1_125 = L1_125.getAttribute
  L1_125 = L1_125(currentusersTable, _UPVALUE1_, L0_124, _UPVALUE2_.rxPacketsDropped)
  if L1_125 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_124, L1_125
end
function rxPacketsDroppedGetNext(A0_126)
  local L1_127, L2_128
  L1_127 = _UPVALUE0_
  L1_127 = L1_127.NIL
  if A0_126 ~= L1_127 then
    L1_127 = tonumber
    L2_128 = A0_126
    L1_127 = L1_127(L2_128)
    L2_128 = _UPVALUE0_
    L2_128 = L2_128.NIL
  elseif L1_127 == L2_128 then
    L1_127 = _UPVALUE0_
    L1_127 = L1_127.INVALID_ARGUMENT
    return L1_127
  end
  L1_127 = db
  L1_127 = L1_127.existsRow
  L2_128 = currentusersTable
  L1_127 = L1_127(L2_128, _UPVALUE1_, A0_126)
  L2_128 = _UPVALUE0_
  L2_128 = L2_128.FALSE
  if L1_127 == L2_128 then
    L1_127 = _UPVALUE0_
    L1_127 = L1_127.INVALID_ARGUMENT
    return L1_127
  end
  L1_127 = db
  L1_127 = L1_127.getNextRowId
  L2_128 = A0_126
  L1_127 = L1_127(L2_128, currentusersTable)
  L2_128 = _UPVALUE0_
  L2_128 = L2_128.NIL
  if L1_127 == L2_128 then
    L2_128 = _UPVALUE0_
    L2_128 = L2_128.NOT_EXIST
    return L2_128
  end
  L2_128 = db
  L2_128 = L2_128.getAttribute
  L2_128 = L2_128(currentusersTable, _UPVALUE1_, L1_127, _UPVALUE2_.rxPacketsDropped)
  if L2_128 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_127
  end
  return _UPVALUE0_.SUCCESS, L1_127, L2_128
end
function rxPacketsDroppedSet(A0_129, A1_130)
  local L3_131
  L3_131 = _UPVALUE0_
  L3_131 = L3_131.NOT_SUPPORTED
  return L3_131, A0_129
end
function rxBytesGet()
  local L0_132, L1_133
  L0_132 = db
  L0_132 = L0_132.getNextRowId
  L1_133 = _UPVALUE0_
  L0_132 = L0_132(L1_133, currentusersTable)
  L1_133 = db
  L1_133 = L1_133.getAttribute
  L1_133 = L1_133(currentusersTable, _UPVALUE1_, L0_132, _UPVALUE2_.rxBytes)
  if L1_133 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_132, L1_133
end
function rxBytesGetNext(A0_134)
  local L1_135, L2_136
  L1_135 = _UPVALUE0_
  L1_135 = L1_135.NIL
  if A0_134 ~= L1_135 then
    L1_135 = tonumber
    L2_136 = A0_134
    L1_135 = L1_135(L2_136)
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.NIL
  elseif L1_135 == L2_136 then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = db
  L1_135 = L1_135.existsRow
  L2_136 = currentusersTable
  L1_135 = L1_135(L2_136, _UPVALUE1_, A0_134)
  L2_136 = _UPVALUE0_
  L2_136 = L2_136.FALSE
  if L1_135 == L2_136 then
    L1_135 = _UPVALUE0_
    L1_135 = L1_135.INVALID_ARGUMENT
    return L1_135
  end
  L1_135 = db
  L1_135 = L1_135.getNextRowId
  L2_136 = A0_134
  L1_135 = L1_135(L2_136, currentusersTable)
  L2_136 = _UPVALUE0_
  L2_136 = L2_136.NIL
  if L1_135 == L2_136 then
    L2_136 = _UPVALUE0_
    L2_136 = L2_136.NOT_EXIST
    return L2_136
  end
  L2_136 = db
  L2_136 = L2_136.getAttribute
  L2_136 = L2_136(currentusersTable, _UPVALUE1_, L1_135, _UPVALUE2_.rxBytes)
  if L2_136 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_135
  end
  return _UPVALUE0_.SUCCESS, L1_135, L2_136
end
function rxBytesSet(A0_137, A1_138)
  local L3_139
  L3_139 = _UPVALUE0_
  L3_139 = L3_139.NOT_SUPPORTED
  return L3_139, A0_137
end
function refererValueGet()
  local L0_140, L1_141
  L0_140 = db
  L0_140 = L0_140.getNextRowId
  L1_141 = _UPVALUE0_
  L0_140 = L0_140(L1_141, currentusersTable)
  L1_141 = db
  L1_141 = L1_141.getAttribute
  L1_141 = L1_141(currentusersTable, _UPVALUE1_, L0_140, _UPVALUE2_.refererValue)
  if L1_141 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, L0_140, L1_141
end
function refererValueGetNext(A0_142)
  local L1_143, L2_144
  L1_143 = _UPVALUE0_
  L1_143 = L1_143.NIL
  if A0_142 ~= L1_143 then
    L1_143 = tonumber
    L2_144 = A0_142
    L1_143 = L1_143(L2_144)
    L2_144 = _UPVALUE0_
    L2_144 = L2_144.NIL
  elseif L1_143 == L2_144 then
    L1_143 = _UPVALUE0_
    L1_143 = L1_143.INVALID_ARGUMENT
    return L1_143
  end
  L1_143 = db
  L1_143 = L1_143.existsRow
  L2_144 = currentusersTable
  L1_143 = L1_143(L2_144, _UPVALUE1_, A0_142)
  L2_144 = _UPVALUE0_
  L2_144 = L2_144.FALSE
  if L1_143 == L2_144 then
    L1_143 = _UPVALUE0_
    L1_143 = L1_143.INVALID_ARGUMENT
    return L1_143
  end
  L1_143 = db
  L1_143 = L1_143.getNextRowId
  L2_144 = A0_142
  L1_143 = L1_143(L2_144, currentusersTable)
  L2_144 = _UPVALUE0_
  L2_144 = L2_144.NIL
  if L1_143 == L2_144 then
    L2_144 = _UPVALUE0_
    L2_144 = L2_144.NOT_EXIST
    return L2_144
  end
  L2_144 = db
  L2_144 = L2_144.getAttribute
  L2_144 = L2_144(currentusersTable, _UPVALUE1_, L1_143, _UPVALUE2_.refererValue)
  if L2_144 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_143
  end
  return _UPVALUE0_.SUCCESS, L1_143, L2_144
end
function refererValueSet(A0_145, A1_146)
  local L3_147
  L3_147 = _UPVALUE0_
  L3_147 = L3_147.NOT_SUPPORTED
  return L3_147, A0_145
end
function userGet()
  local L0_148, L1_149, L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157, L10_158, L11_159, L12_160, L13_161, L14_162, L15_163, L16_164, L17_165, L18_166, L19_167
  L0_148 = db
  L0_148 = L0_148.getNextRowId
  L1_149 = _UPVALUE0_
  L2_150 = currentusersTable
  L0_148 = L0_148(L1_149, L2_150)
  L1_149 = db
  L1_149 = L1_149.getRow
  L2_150 = currentusersTable
  L3_151 = _UPVALUE1_
  L4_152 = L0_148
  L1_149 = L1_149(L2_150, L3_151, L4_152)
  L2_150 = _UPVALUE2_
  L2_150 = L2_150.NIL
  if L1_149 == L2_150 then
    L2_150 = _UPVALUE2_
    L2_150 = L2_150.FAILURE
    return L2_150
  end
  L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157, L10_158, L11_159, L12_160, L13_161, L14_162, L15_163, L16_164, L17_165, L18_166, L19_167 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_150 = L1_149[currentusersTable .. "." .. _UPVALUE3_.userName]
  L3_151 = L1_149[currentusersTable .. "." .. _UPVALUE3_.sessionId]
  L4_152 = L1_149[currentusersTable .. "." .. _UPVALUE3_.cookie]
  L5_153 = L1_149[currentusersTable .. "." .. _UPVALUE3_.groupName]
  L6_154 = L1_149[currentusersTable .. "." .. _UPVALUE3_.loginTime]
  L7_155 = L1_149[currentusersTable .. "." .. _UPVALUE3_.loginAddress]
  L8_156 = L1_149[currentusersTable .. "." .. _UPVALUE3_.lastAccessTime]
  L9_157 = L1_149[currentusersTable .. "." .. _UPVALUE3_.pppInterfaceName]
  L10_158 = L1_149[currentusersTable .. "." .. _UPVALUE3_.pppInterfaceIP]
  L11_159 = L1_149[currentusersTable .. "." .. _UPVALUE3_.peerPPPInterfaceIP]
  L12_160 = L1_149[currentusersTable .. "." .. _UPVALUE3_.sessionStatus]
  L13_161 = L1_149[currentusersTable .. "." .. _UPVALUE3_.txPackets]
  L14_162 = L1_149[currentusersTable .. "." .. _UPVALUE3_.txPacketsDropped]
  L15_163 = L1_149[currentusersTable .. "." .. _UPVALUE3_.txBytes]
  L16_164 = L1_149[currentusersTable .. "." .. _UPVALUE3_.rxPackets]
  L17_165 = L1_149[currentusersTable .. "." .. _UPVALUE3_.rxPacketsDropped]
  L18_166 = L1_149[currentusersTable .. "." .. _UPVALUE3_.rxBytes]
  L19_167 = L1_149[currentusersTable .. "." .. _UPVALUE3_.refererValue]
  return _UPVALUE2_.SUCCESS, L0_148, L2_150, L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157, L10_158, L11_159, L12_160, L13_161, L14_162, L15_163, L16_164, L17_165, L18_166, L19_167
end
function userGetNext(A0_168)
  local L1_169, L2_170, L3_171, L4_172, L5_173, L6_174, L7_175, L8_176, L9_177, L10_178, L11_179, L12_180, L13_181, L14_182, L15_183, L16_184, L17_185, L18_186, L19_187, L20_188
  L1_169 = _UPVALUE0_
  L1_169 = L1_169.NIL
  if A0_168 ~= L1_169 then
    L1_169 = tonumber
    L2_170 = A0_168
    L1_169 = L1_169(L2_170)
    L2_170 = _UPVALUE0_
    L2_170 = L2_170.NIL
  elseif L1_169 == L2_170 then
    L1_169 = _UPVALUE0_
    L1_169 = L1_169.INVALID_ARGUMENT
    return L1_169
  end
  L1_169 = db
  L1_169 = L1_169.existsRow
  L2_170 = currentusersTable
  L3_171 = _UPVALUE1_
  L4_172 = A0_168
  L1_169 = L1_169(L2_170, L3_171, L4_172)
  L2_170 = _UPVALUE0_
  L2_170 = L2_170.FALSE
  if L1_169 == L2_170 then
    L1_169 = _UPVALUE2_
    L1_169 = L1_169.SSLVPN_COOKIE_INVALID
    return L1_169
  end
  L1_169 = db
  L1_169 = L1_169.getNextRowId
  L2_170 = A0_168
  L3_171 = currentusersTable
  L1_169 = L1_169(L2_170, L3_171)
  L2_170 = _UPVALUE0_
  L2_170 = L2_170.NIL
  if L1_169 == L2_170 then
    L2_170 = _UPVALUE2_
    L2_170 = L2_170.SSLVPN_NEXTCOOKIE_INVALID
    return L2_170
  end
  L2_170 = db
  L2_170 = L2_170.getRow
  L3_171 = currentusersTable
  L4_172 = _UPVALUE1_
  L5_173 = L1_169
  L2_170 = L2_170(L3_171, L4_172, L5_173)
  L3_171 = _UPVALUE0_
  L3_171 = L3_171.NIL
  if L2_170 == L3_171 then
    L3_171 = _UPVALUE0_
    L3_171 = L3_171.FAILURE
    return L3_171
  end
  L3_171, L4_172, L5_173, L6_174, L7_175, L8_176, L9_177, L10_178, L11_179, L12_180, L13_181, L14_182, L15_183, L16_184, L17_185, L18_186, L19_187, L20_188 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L3_171 = L2_170[currentusersTable .. "." .. _UPVALUE3_.userName]
  L4_172 = L2_170[currentusersTable .. "." .. _UPVALUE3_.sessionId]
  L5_173 = L2_170[currentusersTable .. "." .. _UPVALUE3_.cookie]
  L6_174 = L2_170[currentusersTable .. "." .. _UPVALUE3_.groupName]
  L7_175 = L2_170[currentusersTable .. "." .. _UPVALUE3_.loginTime]
  L8_176 = L2_170[currentusersTable .. "." .. _UPVALUE3_.loginAddress]
  L9_177 = L2_170[currentusersTable .. "." .. _UPVALUE3_.lastAccessTime]
  L10_178 = L2_170[currentusersTable .. "." .. _UPVALUE3_.pppInterfaceName]
  L11_179 = L2_170[currentusersTable .. "." .. _UPVALUE3_.pppInterfaceIP]
  L12_180 = L2_170[currentusersTable .. "." .. _UPVALUE3_.peerPPPInterfaceIP]
  L13_181 = L2_170[currentusersTable .. "." .. _UPVALUE3_.sessionStatus]
  L14_182 = L2_170[currentusersTable .. "." .. _UPVALUE3_.txPackets]
  L15_183 = L2_170[currentusersTable .. "." .. _UPVALUE3_.txPacketsDropped]
  L16_184 = L2_170[currentusersTable .. "." .. _UPVALUE3_.txBytes]
  L17_185 = L2_170[currentusersTable .. "." .. _UPVALUE3_.rxPackets]
  L18_186 = L2_170[currentusersTable .. "." .. _UPVALUE3_.rxPacketsDropped]
  L19_187 = L2_170[currentusersTable .. "." .. _UPVALUE3_.rxBytes]
  L20_188 = L2_170[currentusersTable .. "." .. _UPVALUE3_.refererValue]
  return _UPVALUE0_.SUCCESS, L1_169, L3_171, L4_172, L5_173, L6_174, L7_175, L8_176, L9_177, L10_178, L11_179, L12_180, L13_181, L14_182, L15_183, L16_184, L17_185, L18_186, L19_187, L20_188
end
function userSet(A0_189, A1_190, A2_191, A3_192, A4_193, A5_194, A6_195, A7_196, A8_197, A9_198, A10_199, A11_200, A12_201, A13_202, A14_203, A15_204, A16_205, A17_206, A18_207)
  local L20_208
  L20_208 = _UPVALUE0_
  L20_208 = L20_208.NOT_SUPPORTED
  return L20_208, A3_192
end
function userCreate(A0_209, A1_210, A2_211, A3_212, A4_213, A5_214, A6_215, A7_216, A8_217, A9_218, A10_219, A11_220, A12_221, A13_222, A14_223, A15_224, A16_225, A17_226)
  return _UPVALUE0_.NOT_SUPPORTED
end
function userDelete(A0_227)
  local L2_228
  L2_228 = _UPVALUE0_
  L2_228 = L2_228.NOT_SUPPORTED
  return L2_228, A0_227
end
function usersGetAll()
  local L0_229
  L0_229 = db
  L0_229 = L0_229.getTable
  L0_229 = L0_229(currentusersTable, false)
  if L0_229 == _UPVALUE0_.NIL then
    return _UPVALUE1_.SSLVPN_CLINET_TABLENIL
  end
  return _UPVALUE0_.SUCCESS, L0_229
end
function tunnelStatusGet()
  if sslvpnLuaLib.sslTunnelStatsGet() == 0 then
    return 0
  else
    return -1
  end
end
function connectionStateSet(A0_230)
  local L1_231, L2_232, L3_233
  L1_231 = false
  L2_232 = _UPVALUE0_
  L2_232 = L2_232.NIL
  if A0_230 ~= L2_232 then
    L2_232 = tonumber
    L3_233 = A0_230
    L2_232 = L2_232(L3_233)
    L3_233 = _UPVALUE0_
    L3_233 = L3_233.NIL
  elseif L2_232 == L3_233 then
    L2_232 = _UPVALUE0_
    L2_232 = L2_232.INVALID_ARGUMENT
    return L2_232
  end
  L2_232 = db
  L2_232 = L2_232.existsRow
  L3_233 = currentusersTable
  L2_232 = L2_232(L3_233, _UPVALUE1_, A0_230)
  L3_233 = _UPVALUE0_
  L3_233 = L3_233.FALSE
  if L2_232 == L3_233 then
    L2_232 = _UPVALUE0_
    L2_232 = L2_232.INVALID_ARGUMENT
    return L2_232
  end
  L2_232 = db
  L2_232 = L2_232.getRow
  L3_233 = currentusersTable
  L2_232 = L2_232(L3_233, _UPVALUE1_, A0_230)
  L3_233 = _UPVALUE0_
  L3_233 = L3_233.NIL
  if L2_232 ~= L3_233 then
    L3_233 = _UPVALUE2_
    L3_233 = L3_233.loginAddress
    L3_233 = L3_233 .. " = '" .. L2_232[currentusersTable .. "." .. _UPVALUE2_.loginAddress] .. "' And " .. _UPVALUE2_.cookie .. " = '" .. L2_232[currentusersTable .. "." .. _UPVALUE2_.cookie] .. "'"
    L1_231 = db.deleteRowWhere(currentusersTable, L3_233)
  else
    L3_233 = _UPVALUE3_
    L3_233 = L3_233.USER_DISCONNECT_FAILED
    return L3_233
  end
  if L1_231 then
    L3_233 = _UPVALUE0_
    L3_233 = L3_233.SUCCESS
    return L3_233
  else
    L3_233 = _UPVALUE0_
    L3_233 = L3_233.FAILURE
    return L3_233
  end
end
function isSessionTimedOut(A0_234)
  local L1_235, L2_236
  if db.existsRowWhere("loginSession", A0_234) then
    L2_236 = "NextPage"
  else
    L2_236 = "index"
  end
  return _UPVALUE0_.SUCCESS, L2_236
end
function changePassword(A0_237, A1_238, A2_239, A3_240, A4_241)
  local L5_242, L6_243, L7_244, L8_245
  L5_242 = _UPVALUE0_
  L5_242 = L5_242.NIL
  if A0_237 ~= L5_242 then
    L5_242 = db
    L5_242 = L5_242.escape
    L6_243 = A0_237
    L5_242 = L5_242(L6_243)
    A0_237 = L5_242
  end
  L5_242 = db
  L5_242 = L5_242.getAttribute
  L6_243 = currentusersTable
  L7_244 = _UPVALUE1_
  L7_244 = L7_244.cookie
  L8_245 = A0_237
  L5_242 = L5_242(L6_243, L7_244, L8_245, _UPVALUE1_.userName)
  L6_243 = _UPVALUE0_
  L6_243 = L6_243.NIL
  if L5_242 == L6_243 then
    L6_243 = _UPVALUE2_
    L6_243 = L6_243.USER_NOT_EXIST
    return L6_243
  end
  L6_243 = db
  L6_243 = L6_243.getAttribute
  L7_244 = currentusersTable
  L8_245 = _UPVALUE1_
  L8_245 = L8_245.cookie
  L6_243 = L6_243(L7_244, L8_245, A0_237, _UPVALUE1_.groupName)
  L7_244 = _UPVALUE0_
  L7_244 = L7_244.NIL
  if L6_243 == L7_244 then
    L7_244 = _UPVALUE2_
    L7_244 = L7_244.GROUP_NOT_EXIST
    return L7_244
  end
  L7_244 = db
  L7_244 = L7_244.getAttribute
  L8_245 = groupsTable
  L7_244 = L7_244(L8_245, _UPVALUE1_.groupName, L6_243, _UPVALUE1_.groupId)
  L8_245 = _UPVALUE0_
  L8_245 = L8_245.NIL
  if L7_244 == L8_245 then
    L8_245 = _UPVALUE2_
    L8_245 = L8_245.GROUPID_MISSING
    return L8_245
  end
  L8_245 = _UPVALUE1_
  L8_245 = L8_245.userName
  L8_245 = L8_245 .. "='" .. L5_242 .. "' AND " .. _UPVALUE1_.groupId .. "='" .. L7_244 .. "'"
  if db.setAttributeWhere(usersTable, L8_245, _UPVALUE1_.password, A3_240) == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
