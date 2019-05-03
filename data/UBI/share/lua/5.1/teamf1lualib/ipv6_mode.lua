local L0_0
L0_0 = module
L0_0("com.teamf1.core.ipv6.mode", package.seeall)
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
modeTable = "networkInfo"
vlanTable = "vlan"
pppoe6Table = "pppoe6"
;({}).ipv6Mode = "netWorkMode"
;({}).linklocal = "linklocal"
;({}).vlanIPv6 = "vlanIPv6"
;({}).pppoeSessions = "PppoeSessions"
IPv4 = 1
IPv6 = 3
ENABLE = "1"
DISABLE = "0"
function ipv6ModeGet()
  local L0_1, L1_2, L2_3
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L1_2 = modeTable
  L2_3 = "_ROWID_"
  L0_1 = L0_1(L1_2, L2_3, 1, _UPVALUE0_.ipv6Mode)
  L1_2 = db
  L1_2 = L1_2.getRow
  L2_3 = "WanMode"
  L1_2 = L1_2(L2_3, "_ROWID_", "1")
  L2_3 = "-1"
  if L1_2 ~= nil and L1_2["WanMode.Wanmode"] ~= nil and (L1_2["WanMode.Wanmode"] == "1" or L1_2["WanMode.Wanmode"] == "3" or L1_2["WanMode.Wanmode"] == "2") then
    L2_3 = "1"
  end
  if L0_1 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, 1, L0_1, L2_3
end
function ipv6ModeGetNext(A0_4)
  return _UPVALUE0_.NOT_SUPPORTED
end
function ipv6ModeSet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.NIL
  if A0_5 == L1_6 then
    L1_6 = _UPVALUE0_
    L1_6 = L1_6.INVALID_ARGUMENT
    return L1_6
  end
  L1_6 = tonumber
  L2_7 = A0_5
  L1_6 = L1_6(L2_7)
  L2_7 = IPv4
  if L1_6 ~= L2_7 then
    L1_6 = tonumber
    L2_7 = A0_5
    L1_6 = L1_6(L2_7)
    L2_7 = IPv6
    if L1_6 ~= L2_7 then
      L1_6 = _UPVALUE0_
      L1_6 = L1_6.INVALID_ARGUMENT
      return L1_6
    end
  end
  L1_6 = db
  L1_6 = L1_6.setAttribute
  L2_7 = modeTable
  L3_8 = "_ROWID_"
  L4_9 = "1"
  L5_10 = _UPVALUE1_
  L5_10 = L5_10.ipv6Mode
  L2_7 = L1_6(L2_7, L3_8, L4_9, L5_10, A0_5)
  L3_8 = tonumber
  L4_9 = A0_5
  L3_8 = L3_8(L4_9)
  L4_9 = IPv6
  if L3_8 == L4_9 then
    L3_8 = db
    L3_8 = L3_8.setAttribute
    L4_9 = vlanTable
    L5_10 = "_ROWID_"
    L4_9 = L3_8(L4_9, L5_10, "1", _UPVALUE1_.vlanIPv6, ENABLE)
  else
    L3_8 = db
    L3_8 = L3_8.setAttribute
    L4_9 = vlanTable
    L5_10 = "_ROWID_"
    L4_9 = L3_8(L4_9, L5_10, "1", _UPVALUE1_.vlanIPv6, DISABLE)
    L5_10 = "PppoeSessions = "
    L5_10 = L5_10 .. _UPVALUE2_ .. ""
    L3_8, L4_9 = db.setAttributeWhere(pppoe6Table, L5_10, _UPVALUE1_.pppoeSessions, _UPVALUE3_)
  end
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.FALSE
  if L1_6 == L3_8 then
    L3_8 = _UPVALUE0_
    L3_8 = L3_8.FAILURE
    L4_9 = 1
    return L3_8, L4_9
  end
  L3_8 = _UPVALUE0_
  L3_8 = L3_8.SUCCESS
  L4_9 = 1
  return L3_8, L4_9
end
function islinklocalEnabled()
  local L1_11
  L1_11 = _UPVALUE0_
  L1_11 = L1_11.NOT_SUPPORTED
  return L1_11
end
function islinklocalEnabledNext(A0_12)
  return _UPVALUE0_.NOT_SUPPORTED
end
function linklocalEnable(A0_13)
  return _UPVALUE0_.NOT_SUPPORTED
end
function linklocalDisable(A0_14)
  return _UPVALUE0_.NOT_SUPPORTED
end
function routerv6ModeGet()
  local L1_15
  L1_15 = _UPVALUE0_
  L1_15 = L1_15.NOT_SUPPORTED
  return L1_15
end
function routerv6ModeGetNext(A0_16)
  return _UPVALUE0_.NOT_SUPPORTED
end
function routerv6ModeSet(A0_17, A1_18, A2_19)
  return _UPVALUE0_.NOT_SUPPORTED
end
function routerv6ModeCreate(A0_20, A1_21)
  return _UPVALUE0_.NOT_SUPPORTED
end
function routerv6ModeDelete(A0_22)
  return _UPVALUE0_.NOT_SUPPORTED
end
