local L0_0
L0_0 = module
L0_0("com.teamf1.core.threeg.threeg_createSms", package.seeall)
L0_0 = require
L0_0("smsLib")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).receiver = "receiver"
;({}).text = "text"
;({}).dedicatedLogicalIfname = "DedicatedLogicalIfName"
;({}).failoverPriLogicalIfname = "FailoverPriLogicalIfName"
;({}).failoverSecLogicalIfname = "FailoverSecLogicalIfName"
;({}).wanMode = "Wanmode"
;({}).connectionType = "ConnectionType"
function createSmsGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = ""
  L1_2, L2_3 = nil, nil
  L3_4 = io
  L3_4 = L3_4.open
  L4_5 = _UPVALUE0_
  L5_6 = "r"
  L3_4 = L3_4(L4_5, L5_6)
  if L3_4 ~= nil then
    L5_6 = L3_4
    L4_5 = L3_4.read
    L4_5 = L4_5(L5_6, "*all")
    L4_5 = L4_5 or ""
    L5_6 = util
    L5_6 = L5_6.split
    L5_6 = L5_6(L4_5, ":")
    if L5_6 ~= nil and #L5_6 >= 4 then
      L1_2 = string.match(L4_5, _UPVALUE1_)
    end
  else
    L4_5 = io
    L4_5 = L4_5.open
    L5_6 = _UPVALUE2_
    L4_5 = L4_5(L5_6, "r")
    if L4_5 ~= nil then
      L5_6 = L4_5.read
      L5_6 = L5_6(L4_5, "*all")
      L5_6 = L5_6 or ""
      if util.split(L5_6, ":") ~= nil and #util.split(L5_6, ":") > 4 then
        L2_3 = string.match(L5_6, _UPVALUE1_)
      end
    end
  end
  L4_5 = _UPVALUE1_
  if L1_2 ~= L4_5 then
    L4_5 = _UPVALUE1_
  else
    if L2_3 == L4_5 then
      L4_5 = "AddressFamily = 2"
      L5_6 = db
      L5_6 = L5_6.getRowWhere
      L5_6 = L5_6(_UPVALUE3_, L4_5)
      if L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.wanMode] == _UPVALUE8_ then
        if L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.dedicatedLogicalIfname] == _UPVALUE9_ then
          L0_1 = _UPVALUE10_
        elseif L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.dedicatedLogicalIfname] == _UPVALUE6_ and UNIT_NAME ~= "DSR-1000AC" and UNIT_NAME ~= "DSR-1000N" and UNIT_NAME ~= "DSR-1000" and db.getAttribute(_UPVALUE4_, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.connectionType) == _UPVALUE11_ then
          L0_1 = _UPVALUE10_
        end
      elseif L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.wanMode] == _UPVALUE12_ then
        if L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.failoverPriLogicalIfname] == _UPVALUE9_ or L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.failoverSecLogicalIfname] == _UPVALUE9_ then
          L0_1 = _UPVALUE10_
        elseif (L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.failoverPriLogicalIfname] == _UPVALUE6_ or L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.failoverSecLogicalIfname] == _UPVALUE6_) and UNIT_NAME ~= "DSR-1000AC" and UNIT_NAME ~= "DSR-1000N" and UNIT_NAME ~= "DSR-1000" and db.getAttribute(_UPVALUE4_, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.connectionType) == _UPVALUE11_ then
          L0_1 = _UPVALUE10_
        end
      elseif (L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.wanMode] == _UPVALUE13_ or L5_6[_UPVALUE3_ .. "." .. _UPVALUE7_.wanMode] == _UPVALUE14_) and (UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME ~= "DSR-1000AC" and UNIT_NAME ~= "DSR-1000N" and UNIT_NAME ~= "DSR-1000" and db.getAttribute(_UPVALUE4_, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_.connectionType) == _UPVALUE11_) then
        L0_1 = _UPVALUE10_
      end
  end
  else
    L0_1 = _UPVALUE15_
  end
  L4_5 = _UPVALUE10_
  if L0_1 == L4_5 then
    L4_5 = _UPVALUE16_
    L4_5 = L4_5.UNABLE_FETCH_MESSAGES
    L5_6 = L0_1
    return L4_5, L5_6
  else
    L4_5 = _UPVALUE15_
    if L0_1 == L4_5 then
      L4_5 = _UPVALUE16_
      L4_5 = L4_5.THREEG_NOT_AVAILABLE
      L5_6 = L0_1
      return L4_5, L5_6
    end
  end
  L4_5 = _UPVALUE17_
  L4_5 = L4_5.SUCCESS
  L5_6 = L0_1
  return L4_5, L5_6
end
function createSmsSet(A0_7, A1_8)
  local L2_9, L3_10
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NIL
  if A0_7 ~= L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.NIL
  elseif A1_8 == L2_9 then
    L2_9 = _UPVALUE0_
    L2_9 = L2_9.INVALID_ARGUMENT
    return L2_9
  end
  L2_9 = nil
  L3_10 = _UPVALUE1_
  if smsLib.smsCreate(L3_10, A0_7, A1_8) == _UPVALUE2_ then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
