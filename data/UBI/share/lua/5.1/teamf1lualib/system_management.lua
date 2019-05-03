local L0_0
L0_0 = module
L0_0("com.teamf1.core.system.management", package.seeall)
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
;({}).systemname = "name"
;({}).language = "LanguageId"
;({}).powerSaveViaLinkStatus = "PowerMode"
;({}).powerSaveViaCableLengthDetection = "LengthMode"
;({}).adminUserSessionTimeout = "adminUserSessionTimeout"
;({}).guestUserSessionTimeout = "guestUserSessionTimeout"
;({}).checkNow = "CheckNow"
ROW_ID = "_ROWID_"
FIRST_ROWID = "1"
function systemnameGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.systemname)
  if L0_1 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_1
end
function systemnameGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function systemnameSet(A0_4, A1_5)
  if A1_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT, A0_4
  end
  if A1_5 == _UPVALUE1_ then
    return _UPVALUE2_, A0_4
  end
  if string.len(A1_5) > _UPVALUE3_ then
    return _UPVALUE4_, A0_4
  end
  if db.setAttribute(_UPVALUE5_, ROW_ID, FIRST_ROWID, _UPVALUE6_.systemname, A1_5) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_4
  end
  return _UPVALUE0_.SUCCESS, A0_4
end
function languageGet()
  local L0_6
  L0_6 = db
  L0_6 = L0_6.getAttribute
  L0_6 = L0_6(languagesTable, ROW_ID, FIRST_ROWID, _UPVALUE0_.langauge)
  if L0_6 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_6
end
function languageGetNext(A0_7)
  local L2_8
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NOT_SUPPORTED
  return L2_8, A0_7
end
function languageSet(A0_9, A1_10)
  if A1_10 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if db.setAttribute(languagesTable, ROW_ID, FIRST_ROWID, _UPVALUE1_.language, A1_10) == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, A0_9
  end
  return _UPVALUE0_.SUCCESS, A0_9
end
function adminUserSessionTimeoutGet()
  local L1_11
  L1_11 = _UPVALUE0_
  L1_11 = L1_11.NOT_SUPPORTED
  return L1_11
end
function adminUserSessionTimeoutGetNext(A0_12)
  local L2_13
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NOT_SUPPORTED
  return L2_13, A0_12
end
function adminUserSessionTimeoutSet(A0_14, A1_15)
  local L3_16
  L3_16 = _UPVALUE0_
  L3_16 = L3_16.NOT_SUPPORTED
  return L3_16, A0_14
end
function guestUserSessionTimeoutGet()
  local L1_17
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NOT_SUPPORTED
  return L1_17
end
function guestUserSessionTimeoutGetNext(A0_18)
  local L2_19
  L2_19 = _UPVALUE0_
  L2_19 = L2_19.NOT_SUPPORTED
  return L2_19, A0_18
end
function guestUserSessionTimeoutSet(A0_20, A1_21)
  local L3_22
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.FAILURE
  return L3_22, A0_20
end
function ispowerSaveViaLinkStatusEnabled()
  local L0_23
  L0_23 = db
  L0_23 = L0_23.getAttribute
  L0_23 = L0_23(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaLinkStatus)
  if L0_23 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_23
end
function ispowerSaveViaLinkStatusEnabledNext(A0_24)
  local L2_25
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NOT_SUPPORTED
  return L2_25, A0_24
end
function powerSaveViaLinkStatusEnable(A0_26)
  if db.setAttribute(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaLinkStatus, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_26
  end
  return _UPVALUE3_.SUCCESS, A0_26
end
function powerSaveViaLinkStatusDisable(A0_27)
  if db.setAttribute(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaLinkStatus, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_27
  end
  return _UPVALUE3_.SUCCESS, A0_27
end
function ispowerSaveViaCableLengthDetectionEnabled()
  local L0_28
  L0_28 = db
  L0_28 = L0_28.getAttribute
  L0_28 = L0_28(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaCableLengthDetection)
  if L0_28 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_28
end
function ispowerSaveViaCableLengthDetectionEnabledNext(A0_29)
  local L2_30
  L2_30 = _UPVALUE0_
  L2_30 = L2_30.NOT_SUPPORTED
  return L2_30, A0_29
end
function powerSaveViaCableLengthDetectionEnable(A0_31)
  if db.setAttribute(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaCableLengthDetection, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_31
  end
  return _UPVALUE3_.SUCCESS, A0_31
end
function powerSaveViaCableLengthDetectionDisable(A0_32)
  if db.setAttribute(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaCableLengthDetection, _UPVALUE2_) == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE, A0_32
  end
  return _UPVALUE3_.SUCCESS, A0_32
end
function firmwareCheckSet(A0_33)
  local L1_34, L2_35, L3_36
  L1_34 = "1"
  L2_35 = {}
  L3_36 = {}
  L2_35["FirmConf.CheckNow"] = A0_33
  L3_36["FirmStatus.StatusAvailable"] = 1
  if db.setAttribute(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.checkNow, L2_35["FirmConf.CheckNow"]) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_33
  end
  if db.update("FirmStatus", L3_36, L1_34) == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE, A0_33
  end
  return _UPVALUE2_.SUCCESS, A0_33
end
function firmwareCheckGet()
  local L0_37
  L0_37 = ""
  L0_37 = db.getRow("FirmStatus", "_ROWID_", "1")["FirmStatus.StatusAvailable"]
  return _UPVALUE0_.SUCCESS, 1, L0_37
end
function powerSaveValueSet(A0_38, A1_39, A2_40)
  local L3_41, L4_42, L5_43, L6_44, L7_45
  L7_45 = {}
  if A1_39 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_41 = _UPVALUE1_.isBoolean(A1_39)
  if L3_41 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A2_40 == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_41 = _UPVALUE1_.isBoolean(A2_40)
  if L3_41 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if A1_39 == "1" then
    L4_42 = _UPVALUE2_
  else
    L4_42 = _UPVALUE3_
  end
  if A2_40 == "1" then
    L5_43 = _UPVALUE2_
  else
    L5_43 = _UPVALUE3_
  end
  L7_45[_UPVALUE4_ .. "." .. _UPVALUE5_.powerSaveViaLinkStatus] = L4_42
  L7_45[_UPVALUE4_ .. "." .. _UPVALUE5_.powerSaveViaCableLengthDetection] = L5_43
  L6_44 = db.update(_UPVALUE4_, L7_45, FIRST_ROWID)
  if L6_44 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, cookie
  end
  return _UPVALUE0_.SUCCESS, cookie
end
function powerSavingStatusGet()
  local L0_46, L1_47
  L0_46 = db
  L0_46 = L0_46.getAttribute
  L1_47 = _UPVALUE0_
  L0_46 = L0_46(L1_47, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaLinkStatus)
  L1_47 = db
  L1_47 = L1_47.getAttribute
  L1_47 = L1_47(_UPVALUE0_, ROW_ID, FIRST_ROWID, _UPVALUE1_.powerSaveViaCableLengthDetection)
  if L0_46 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  if L1_47 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, 1, L0_46, L1_47
end
