local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/dhcp_leasedClientsLAN")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function dhcpClientInfoLanGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.clientLANGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function dhcpClientInfoLanGet(A0_3)
  local L1_4, L2_5, L3_6, L4_7
  L1_4, A0_3, L2_5, L3_6, L4_7 = _UPVALUE0_.clientLANGetCur(A0_3)
  if L1_4 ~= _UPVALUE1_.SUCCESS then
    return L1_4
  end
  return L1_4, A0_3, L2_5, L3_6, L4_7
end
function dhcpClientInfoLanGetNext(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14
  L1_9 = A0_8["leasedClientLan.cookie"]
  if L1_9 == nil then
    L2_10 = util
    L2_10 = L2_10.appendDebugOut
    L3_11 = "GetNext : Invalid Cookie"
    L2_10(L3_11)
    L2_10 = _UPVALUE0_
    L2_10 = L2_10.BAD_PARAMETER
    return L2_10
  end
  L2_10, L3_11, L4_12, L5_13, L6_14 = nil, nil, nil, nil, nil
  L2_10, L6_14, L3_11, L4_12, L5_13 = _UPVALUE1_.clientLANGetNext(L1_9)
  if L2_10 ~= _UPVALUE0_.SUCCESS then
    return L2_10
  end
  return L2_10, L6_14, L3_11, L4_12, L5_13
end
function dhcpClientInfoLanSet(A0_15)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dhcpClientInfoLanDelete(A0_16)
  return _UPVALUE0_.NOT_SUPPORTED
end
function dhcpClientInfoLanDefaultsGet()
  local L0_17, L1_18, L3_19, L4_20, L5_21
  L0_17 = 1
  L1_18 = "PAP"
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.SUCCESS
  L4_20 = 0
  L5_21 = L0_17
  return L3_19, L4_20, L5_21, L1_18
end
function dhcpClientInfoLanCreate(A0_22)
  return _UPVALUE0_.NOT_SUPPORTED
end
