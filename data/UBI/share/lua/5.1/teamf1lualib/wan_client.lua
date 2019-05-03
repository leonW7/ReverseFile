local L0_0
L0_0 = module
L0_0("com.teamf1.core.wan.client", package.seeall)
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
;({}).wanPort = "LogicalIfName"
;({}).addressFamily = "AddressFamily"
;({}).clientType = "ConnectionType"
;({}).clientType6 = "ConnectionType6"
;({}).loginRequired = "RequireLogin"
function wanPortGet()
  local L0_1, L1_2
  L0_1 = db
  L0_1 = L0_1.getNextRowId
  L1_2 = _UPVALUE0_
  L0_1 = L0_1(L1_2, _UPVALUE1_)
  L1_2 = _UPVALUE2_
  L1_2 = L1_2.NIL
  if L0_1 == L1_2 then
    L1_2 = _UPVALUE2_
    L1_2 = L1_2.NOT_EXIST
    return L1_2
  end
  L1_2 = db
  L1_2 = L1_2.getAttribute
  L1_2 = L1_2(_UPVALUE0_, _UPVALUE3_, L0_1, _UPVALUE4_.wanPort)
  if L1_2 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_1, L1_2
end
function wanPortGetNext(A0_3)
  local L1_4, L2_5
  L1_4 = _UPVALUE0_
  L1_4 = L1_4.NIL
  if A0_3 == L1_4 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = tonumber
  L2_5 = A0_3
  L1_4 = L1_4(L2_5)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.INVALID_ARGUMENT
    return L1_4
  end
  L1_4 = db
  L1_4 = L1_4.existsRow
  L2_5 = _UPVALUE1_
  L1_4 = L1_4(L2_5, _UPVALUE2_, A0_3)
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.FALSE
  if L1_4 == L2_5 then
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.NOT_EXIST
    return L1_4
  end
  L1_4 = nil
  L2_5 = db
  L2_5 = L2_5.getNextRowId
  L2_5 = L2_5(_UPVALUE1_, A0_3)
  L1_4 = L2_5
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.NIL
  if L1_4 == L2_5 then
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.NOT_EXIST
    return L2_5
  end
  L2_5 = db
  L2_5 = L2_5.getAttribute
  L2_5 = L2_5(_UPVALUE1_, _UPVALUE2_, L1_4, _UPVALUE3_.wanPort)
  if L2_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_4
  end
  return _UPVALUE0_.SUCCESS, L1_4, L2_5
end
function wanPortSet(A0_6, A1_7)
  local L3_8, L4_9
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.NOT_SUPPORTED
  L4_9 = 0
  return L3_8, L4_9, 0
end
function wanPortDelete(A0_10, A1_11)
  local L3_12, L4_13
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  L4_13 = 0
  return L3_12, L4_13, 0
end
function clientTypeGet()
  local L0_14, L1_15
  L0_14 = db
  L0_14 = L0_14.getNextRowId
  L1_15 = _UPVALUE0_
  L0_14 = L0_14(L1_15, _UPVALUE1_)
  L1_15 = _UPVALUE2_
  L1_15 = L1_15.NIL
  if L0_14 == L1_15 then
    L1_15 = _UPVALUE2_
    L1_15 = L1_15.NOT_EXIST
    return L1_15
  end
  L1_15 = db
  L1_15 = L1_15.getAttribute
  L1_15 = L1_15(_UPVALUE0_, _UPVALUE3_, L0_14, _UPVALUE4_.clientType)
  if L1_15 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS, L0_14, L1_15
end
function clientTypeGetNext(A0_16)
  local L1_17, L2_18
  L1_17 = _UPVALUE0_
  L1_17 = L1_17.NIL
  if A0_16 == L1_17 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = tonumber
  L2_18 = A0_16
  L1_17 = L1_17(L2_18)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.INVALID_ARGUMENT
    return L1_17
  end
  L1_17 = db
  L1_17 = L1_17.existsRow
  L2_18 = _UPVALUE1_
  L1_17 = L1_17(L2_18, _UPVALUE2_, A0_16)
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.FALSE
  if L1_17 == L2_18 then
    L1_17 = _UPVALUE0_
    L1_17 = L1_17.NOT_EXIST
    return L1_17
  end
  L1_17 = nil
  L2_18 = db
  L2_18 = L2_18.getNextRowId
  L2_18 = L2_18(_UPVALUE1_, A0_16)
  L1_17 = L2_18
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.NOT_EXIST
    return L2_18
  end
  L2_18 = db
  L2_18 = L2_18.getAttribute
  L2_18 = L2_18(_UPVALUE1_, _UPVALUE2_, L1_17, _UPVALUE3_.clientType)
  if L2_18 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE, L1_17
  end
  return _UPVALUE0_.SUCCESS, L1_17, L2_18
end
function clientTypeSet(A0_19, A1_20)
  local L2_21, L3_22, L4_23
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A0_19 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = tonumber
  L3_22 = A0_19
  L2_21 = L2_21(L3_22)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.NIL
  if L2_21 == L3_22 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = db
  L2_21 = L2_21.existsRow
  L3_22 = _UPVALUE1_
  L4_23 = _UPVALUE2_
  L2_21 = L2_21(L3_22, L4_23, A0_19)
  L3_22 = _UPVALUE0_
  L3_22 = L3_22.FALSE
  if L2_21 == L3_22 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.NOT_EXIST
    return L2_21
  end
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NIL
  if A1_20 == L2_21 then
    L2_21 = _UPVALUE0_
    L2_21 = L2_21.INVALID_ARGUMENT
    return L2_21
  end
  L2_21 = _UPVALUE3_
  if A1_20 ~= L2_21 then
    L2_21 = _UPVALUE4_
    if A1_20 ~= L2_21 then
      L2_21 = _UPVALUE5_
      if A1_20 ~= L2_21 then
        L2_21 = _UPVALUE6_
        if A1_20 ~= L2_21 then
          L2_21 = _UPVALUE7_
          if A1_20 ~= L2_21 then
            L2_21 = _UPVALUE8_
            if A1_20 ~= L2_21 then
              L2_21 = _UPVALUE0_
              L2_21 = L2_21.INVALID_ARGUMENT
              return L2_21
            end
          end
        end
      end
    end
  end
  L2_21 = nil
  L3_22 = _UPVALUE3_
  if A1_20 ~= L3_22 then
    L3_22 = _UPVALUE7_
  else
    if A1_20 == L3_22 then
      L2_21 = _UPVALUE9_
  end
  else
    L2_21 = _UPVALUE10_
  end
  L3_22, L4_23 = nil, nil
  L3_22 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_19, _UPVALUE11_.clientType, A1_20)
  L4_23 = db.setAttribute(_UPVALUE1_, _UPVALUE2_, A0_19, _UPVALUE11_.loginRequired, L2_21)
  if L3_22 == _UPVALUE0_.FALSE or L4_23 == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, A0_19
  end
  return _UPVALUE0_.SUCCESS, A0_19
end
function connectionTypeSet(A0_24, A1_25, A2_26)
  local L3_27, L4_28, L5_29, L6_30
  L3_27 = {}
  L4_28 = _UPVALUE0_
  L4_28 = L4_28.NIL
  if A2_26 == L4_28 then
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.INVALID_ARGUMENT
    return L4_28
  end
  L4_28 = _UPVALUE0_
  L4_28 = L4_28.NIL
  if A0_24 == L4_28 then
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.INVALID_ARGUMENT
    return L4_28
  end
  L4_28 = _UPVALUE0_
  L4_28 = L4_28.NIL
  if A1_25 == L4_28 then
    L4_28 = _UPVALUE0_
    L4_28 = L4_28.INVALID_ARGUMENT
    return L4_28
  end
  L4_28 = _UPVALUE1_
  if A2_26 ~= L4_28 then
    L4_28 = _UPVALUE2_
    if A2_26 ~= L4_28 then
      L4_28 = _UPVALUE3_
      if A2_26 ~= L4_28 then
        L4_28 = _UPVALUE4_
        if A2_26 ~= L4_28 then
          L4_28 = _UPVALUE5_
          if A2_26 ~= L4_28 then
            L4_28 = _UPVALUE6_
            if A2_26 ~= L4_28 then
              L4_28 = _UPVALUE7_
              if A2_26 ~= L4_28 then
                L4_28 = _UPVALUE8_
                if A2_26 ~= L4_28 then
                  L4_28 = _UPVALUE9_
                  if A2_26 ~= L4_28 then
                    L4_28 = _UPVALUE10_
                    if A2_26 ~= L4_28 then
                      L4_28 = _UPVALUE0_
                      L4_28 = L4_28.INVALID_ARGUMENT
                      return L4_28
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L4_28 = _UPVALUE11_
  if A0_24 ~= L4_28 then
    L4_28 = _UPVALUE12_
    if A0_24 ~= L4_28 then
      L4_28 = _UPVALUE13_
      if A0_24 ~= L4_28 then
        L4_28 = _UPVALUE0_
        L4_28 = L4_28.INVALID_ARGUMENT
        return L4_28
      end
    end
  end
  L4_28 = _UPVALUE14_
  if A1_25 ~= L4_28 then
    L4_28 = _UPVALUE15_
    if A1_25 ~= L4_28 then
      L4_28 = _UPVALUE0_
      L4_28 = L4_28.INVALID_ARGUMENT
      return L4_28
    end
  end
  L4_28 = _UPVALUE16_
  L4_28 = L4_28.wanPort
  L5_29 = " = '"
  L6_30 = A0_24
  L4_28 = L4_28 .. L5_29 .. L6_30 .. "' AND " .. _UPVALUE16_.addressFamily .. " = " .. A1_25
  L5_29 = nil
  L6_30 = db
  L6_30 = L6_30.getAttributeWhere
  L6_30 = L6_30(_UPVALUE17_, L4_28, _UPVALUE18_)
  L5_29 = L6_30
  L6_30 = db
  L6_30 = L6_30.getRow
  L6_30 = L6_30(_UPVALUE17_, _UPVALUE18_, L5_29)
  if L6_30 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  if A2_26 == _UPVALUE1_ or A2_26 == _UPVALUE5_ or A2_26 == _UPVALUE7_ or A2_26 == _UPVALUE9_ then
  else
  end
  if A1_25 == _UPVALUE14_ then
    if A2_26 == _UPVALUE7_ or A2_26 == _UPVALUE8_ or A2_26 == _UPVALUE9_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L6_30[_UPVALUE17_ .. "." .. _UPVALUE16_.clientType] = A2_26
    L6_30[_UPVALUE17_ .. "." .. _UPVALUE16_.loginRequired] = _UPVALUE20_
  else
    if A2_26 ~= _UPVALUE7_ and A2_26 ~= _UPVALUE8_ and A2_26 ~= _UPVALUE9_ then
      return _UPVALUE0_.INVALID_ARGUMENT
    end
    L6_30[_UPVALUE17_ .. "." .. _UPVALUE16_.clientType6] = A2_26
    L6_30[_UPVALUE17_ .. "." .. _UPVALUE16_.loginRequired] = _UPVALUE20_
  end
  if nil == _UPVALUE0_.FALSE or nil == _UPVALUE0_.FALSE then
    return _UPVALUE0_.FAILURE, L5_29
  end
  return _UPVALUE0_.SUCCESS, L5_29, L6_30
end
function connectionTypeGet(A0_31, A1_32)
  local L2_33, L3_34, L4_35
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NIL
  if A0_31 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_ARGUMENT
    return L2_33
  end
  L2_33 = _UPVALUE0_
  L2_33 = L2_33.NIL
  if A1_32 == L2_33 then
    L2_33 = _UPVALUE0_
    L2_33 = L2_33.INVALID_ARGUMENT
    return L2_33
  end
  L2_33 = _UPVALUE1_
  if A0_31 ~= L2_33 then
    L2_33 = _UPVALUE2_
    if A0_31 ~= L2_33 then
      L2_33 = _UPVALUE3_
      if A0_31 ~= L2_33 then
        L2_33 = _UPVALUE0_
        L2_33 = L2_33.INVALID_ARGUMENT
        return L2_33
      end
    end
  end
  L2_33 = _UPVALUE4_
  if A1_32 ~= L2_33 then
    L2_33 = _UPVALUE5_
    if A1_32 ~= L2_33 then
      L2_33 = _UPVALUE0_
      L2_33 = L2_33.INVALID_ARGUMENT
      return L2_33
    end
  end
  L2_33 = _UPVALUE6_
  L2_33 = L2_33.wanPort
  L3_34 = " = '"
  L4_35 = A0_31
  L2_33 = L2_33 .. L3_34 .. L4_35 .. "' AND " .. _UPVALUE6_.addressFamily .. " = " .. A1_32
  L3_34 = nil
  L4_35 = db
  L4_35 = L4_35.getAttributeWhere
  L4_35 = L4_35(_UPVALUE7_, L2_33, _UPVALUE8_)
  L3_34 = L4_35
  L4_35 = _UPVALUE0_
  L4_35 = L4_35.NIL
  if L3_34 == L4_35 then
    L4_35 = _UPVALUE0_
    L4_35 = L4_35.NOT_EXIST
    return L4_35
  end
  L4_35 = nil
  if A1_32 == _UPVALUE4_ then
    L4_35 = db.getAttribute(_UPVALUE7_, _UPVALUE8_, L3_34, _UPVALUE6_.clientType)
  else
    L4_35 = db.getAttribute(_UPVALUE7_, _UPVALUE8_, L3_34, _UPVALUE6_.clientType6)
  end
  if L4_35 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, L3_34, L4_35
end
function option2ModeCheck()
  return db.getAttribute("ConfigPort", "_ROWID_", "1", "LogicalIfName") or "WAN2"
end
function wanStatusChange(A0_36, A1_37, A2_38)
  local L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45
  L3_39 = A1_37
  L4_40 = A2_38
  L5_41 = false
  L6_42 = db
  L6_42 = L6_42.getRowWhere
  L7_43 = _UPVALUE0_
  L8_44 = "LogicalIfName = '"
  L9_45 = A1_37
  L8_44 = L8_44 .. L9_45 .. "' and AddressFamily = " .. A2_38
  L6_42 = L6_42(L7_43, L8_44)
  L7_43 = 1
  while L6_42 == nil and L7_43 <= 3 do
    L8_44 = db
    L8_44 = L8_44.getRowWhere
    L9_45 = _UPVALUE0_
    L8_44 = L8_44(L9_45, "LogicalIfName = '" .. A1_37 .. "' and AddressFamily = " .. A2_38)
    L6_42 = L8_44
    L7_43 = L7_43 + 1
  end
  L8_44 = _UPVALUE1_
  L8_44 = L8_44.NIL
  if L6_42 == L8_44 then
    L8_44 = _UPVALUE1_
    L8_44 = L8_44.FAILURE
    return L8_44
  end
  L8_44 = L6_42["NimfConf._ROWID_"]
  if L6_42 ~= nil then
    L9_45 = {}
    if A0_36 == "Enable" then
      L9_45["NimfConf.IfStatus"] = "1"
    elseif A0_36 == "Disable" then
      L9_45["NimfConf.IfStatus"] = "0"
    end
    L5_41 = db.update("NimfConf", L9_45, L8_44)
  end
  if L5_41 then
    L9_45 = _UPVALUE1_
    L9_45 = L9_45.SUCCESS
    return L9_45
  else
    L9_45 = _UPVALUE1_
    L9_45 = L9_45.INTERNET_CONFIG_FAILED
    return L9_45
  end
end
function dhcpStatusChange(A0_46, A1_47, A2_48)
  local L3_49, L4_50, L5_51, L6_52, L7_53, L8_54, L9_55
  L3_49 = A1_47
  L4_50 = A2_48
  L5_51 = false
  L6_52 = db
  L6_52 = L6_52.getRowWhere
  L7_53 = _UPVALUE0_
  L8_54 = "LogicalIfName = '"
  L9_55 = L3_49
  L8_54 = L8_54 .. L9_55 .. "' and AddressFamily = " .. L4_50
  L6_52 = L6_52(L7_53, L8_54)
  L7_53 = 1
  while L6_52 == nil and L7_53 <= 3 do
    L8_54 = db
    L8_54 = L8_54.getRowWhere
    L9_55 = _UPVALUE0_
    L8_54 = L8_54(L9_55, "LogicalIfName = '" .. L3_49 .. "' and AddressFamily = " .. L4_50)
    L6_52 = L8_54
    L7_53 = L7_53 + 1
  end
  L8_54 = _UPVALUE1_
  L8_54 = L8_54.NIL
  if L6_52 == L8_54 then
    L8_54 = _UPVALUE1_
    L8_54 = L8_54.FAILURE
    return L8_54
  end
  L8_54 = L6_52["NimfConf._ROWID_"]
  if L4_50 == "10" then
    L5_51 = true
  else
    L9_55 = db
    L9_55 = L9_55.existsRowWhere
    L9_55 = L9_55("Dhcpc", "LogicalIfName = '" .. L3_49 .. "'")
    if L9_55 then
      L9_55 = {}
      L9_55["Dhcpc.ReleaseLease"] = "1"
      L5_51 = db.update("Dhcpc", L9_55, db.getAttribute("Dhcpc", "LogicalIfName", L3_49, "_ROWID_"))
    end
  end
  if L5_51 then
    L9_55 = _UPVALUE1_
    L9_55 = L9_55.NIL
    if L6_52 ~= L9_55 then
      if A0_46 == "release" then
        L9_55 = {}
        L9_55["NimfConf.IfStatus"] = "0"
        L5_51 = db.update("NimfConf", L9_55, L8_54)
      elseif A0_46 == "renew" then
        L9_55 = {}
        L9_55["NimfConf.IfStatus"] = "1"
        L5_51 = db.update("NimfConf", L9_55, L8_54)
      end
    else
      L5_51 = false
    end
  end
  if L5_51 then
    L9_55 = _UPVALUE1_
    L9_55 = L9_55.SUCCESS
    return L9_55
  else
    L9_55 = _UPVALUE1_
    L9_55 = L9_55.INTERNET_CONFIG_FAILED
    return L9_55
  end
end
function wanDhcpStatusGet(A0_56, A1_57)
  if db.getRowWhere("NimfConf", "LogicalIfName = '" .. A0_56 .. "' and AddressFamily = " .. A1_57)["NimfConf.IfStatus"] == "0" then
  else
  end
  return "Disable"
end
