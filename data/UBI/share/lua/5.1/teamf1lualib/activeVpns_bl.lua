local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipsec.connectionStatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_connectionStatus")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function activeVpnsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15 = _UPVALUE0_.connectionStatusConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L11_12, L3_4, L4_5, L7_8
end
function activeVpnsSectionGetNext(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32
  L1_17 = A0_16["activeVpns.cookie"]
  L2_18 = _UPVALUE0_
  L2_18 = L2_18.NIL
  if L1_17 == L2_18 then
    L2_18 = util
    L2_18 = L2_18.appendDebugOut
    L3_19 = "GetNext : Invalid Cookie"
    L2_18(L3_19)
    L2_18 = _UPVALUE0_
    L2_18 = L2_18.BAD_PARAMETER
    return L2_18
  end
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_18, L3_19, L4_20, L5_21, L6_22, L7_23, L8_24, L9_25, L10_26, L11_27, L12_28, L13_29, L14_30, L15_31, L16_32 = _UPVALUE1_.connectionStatusConfigGetNext(L1_17)
  if L2_18 ~= _UPVALUE0_.SUCCESS then
    return L2_18
  end
  return L2_18, L3_19, L4_20, L13_29, L5_21, L6_22, L9_25
end
function activeVpnsSectionGetAll()
  local L0_33, L1_34, L2_35
  L0_33 = "/pfrm2.0/bin/vipsecureStatus"
  if L0_33 ~= nil then
    L1_34 = util
    L1_34 = L1_34.appendDebugOut
    L2_35 = "Exec = "
    L2_35 = L2_35 .. os.execute(L0_33 .. " " .. DB_FILE_NAME) .. "<br>"
    L1_34(L2_35)
  end
  L1_34 = nil
  L2_35 = {}
  L1_34, L2_35 = _UPVALUE0_.connectionStatusConfigGetAll()
  if L1_34 ~= _UPVALUE1_.SUCCESS then
    return L1_34
  end
  return L1_34, L2_35
end
function activeVpnsSectionGetRow(A0_36)
  local L1_37, L2_38, L3_39
  L1_37 = "/pfrm2.0/bin/vipsecureStatus"
  if L1_37 ~= nil then
    L2_38 = util
    L2_38 = L2_38.appendDebugOut
    L3_39 = "Exec = "
    L3_39 = L3_39 .. os.execute(L1_37 .. " " .. DB_FILE_NAME) .. "<br>"
    L2_38(L3_39)
  end
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NIL
  if A0_36 == L2_38 then
    L2_38 = _UPVALUE0_
    L2_38 = L2_38.FAILURE
    return L2_38
  end
  L2_38 = _UPVALUE1_
  L2_38 = L2_38.connectionStatusConfigGetRow
  L3_39 = A0_36
  L3_39 = L2_38(L3_39)
  if L2_38 ~= _UPVALUE0_.SUCCESS then
    return L2_38
  end
  return L2_38, L3_39
end
function activeVpnsStausSet(A0_40)
  local L1_41, L2_42, L3_43, L4_44
  L1_41 = ACCESS_LEVEL
  if L1_41 ~= 0 then
    L1_41 = util
    L1_41 = L1_41.appendDebugOut
    L2_42 = "Detected Unauthorized access for page activeVpns PAGE"
    L1_41(L2_42)
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.UNAUTHORIZED
    return L1_41
  end
  L1_41 = A0_40["activeVpns.cookie"]
  L2_42 = A0_40["activeVpns.action"]
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NIL
  if L1_41 == L3_43 then
    L3_43 = util
    L3_43 = L3_43.appendDebugOut
    L4_44 = "Set : Invalid Cookie"
    L3_43(L4_44)
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.BAD_PARAMETER
    return L3_43
  end
  L3_43 = _UPVALUE0_
  L3_43 = L3_43.NIL
  if L2_42 == L3_43 then
    L3_43 = util
    L3_43 = L3_43.appendDebugOut
    L4_44 = "Set : Invalid action"
    L3_43(L4_44)
    L3_43 = _UPVALUE0_
    L3_43 = L3_43.BAD_PARAMETER
    return L3_43
  end
  L3_43, L4_44 = nil, nil
  _UPVALUE1_.start()
  L3_43, L4_44 = _UPVALUE2_.ipsecConnectionStatusSet(L1_41, L2_42)
  if L3_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page activeVpns PAGE" .. L3_43)
    _UPVALUE1_.abort()
    return L3_43, L1_41
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L4_44
end
