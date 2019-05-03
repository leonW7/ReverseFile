local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.l2tp_server", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_l2tpServer")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.vpn.l2tpserver")
function l2tpServerSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17 = _UPVALUE0_.l2tpServerConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L3_4 = _UPVALUE2_[tonumber(L3_4) + 1]
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
end
function l2tpServerSectionSet(A0_18)
  local L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33, L16_34, L17_35
  L1_19 = ACCESS_LEVEL
  if L1_19 ~= 0 then
    L1_19 = util
    L1_19 = L1_19.appendDebugOut
    L2_20 = "Detected Unauthorized access for page l2tpServer"
    L1_19(L2_20)
    L1_19 = _UPVALUE0_
    L1_19 = L1_19.UNAUTHORIZED
    return L1_19
  end
  L1_19 = A0_18["l2tpServer.cookie"]
  L2_20 = A0_18["l2tpServer.feature"]
  L3_21 = A0_18["l2tpServer.routingMode"]
  L4_22 = A0_18["l2tpServer.startIPAddress"]
  L5_23 = A0_18["l2tpServer.endIPAddress"]
  L6_24 = A0_18["l2tpServer.papEnable"]
  L7_25 = A0_18["l2tpServer.chapEnable"]
  L8_26 = A0_18["l2tpServer.msChapEnable"]
  L9_27 = A0_18["l2tpServer.msChapv2Enable"]
  L10_28 = A0_18["l2tpServer.secretKeyEnable"]
  L11_29 = A0_18["l2tpServer.secret"]
  L12_30 = A0_18["l2tpServer.userTimeOut"]
  L13_31 = A0_18["l2tpServer.ipv6Prefix"]
  L14_32 = A0_18["l2tpServer.ipv6PrefixLength"]
  L15_33 = A0_18["l2tpServer.authenticationType"]
  L16_34 = _UPVALUE0_
  L16_34 = L16_34.NIL
  if L1_19 == L16_34 then
    L16_34 = util
    L16_34 = L16_34.appendDebugOut
    L17_35 = "Set : Invalid Cookie"
    L16_34(L17_35)
    L16_34 = _UPVALUE0_
    L16_34 = L16_34.BAD_PARAMETER
    return L16_34
  end
  L16_34 = _UPVALUE1_
  if L2_20 == L16_34 then
    L16_34 = _UPVALUE0_
    L16_34 = L16_34.NIL
    if L4_22 == L16_34 then
      L16_34 = util
      L16_34 = L16_34.appendDebugOut
      L17_35 = "Set : Invalid startIPAddress"
      L16_34(L17_35)
      L16_34 = _UPVALUE0_
      L16_34 = L16_34.BAD_PARAMETER
      return L16_34
    end
    L16_34 = _UPVALUE0_
    L16_34 = L16_34.NIL
    if L5_23 == L16_34 then
      L16_34 = util
      L16_34 = L16_34.appendDebugOut
      L17_35 = "Set : Invalid endIPAddress"
      L16_34(L17_35)
      L16_34 = _UPVALUE0_
      L16_34 = L16_34.BAD_PARAMETER
      return L16_34
    end
    L16_34 = _UPVALUE0_
    L16_34 = L16_34.NIL
    if L12_30 == L16_34 then
      L16_34 = util
      L16_34 = L16_34.appendDebugOut
      L17_35 = "Set : Invalid userTimeOut"
      L16_34(L17_35)
      L16_34 = _UPVALUE0_
      L16_34 = L16_34.BAD_PARAMETER
      return L16_34
    end
  end
  L16_34, L17_35 = nil, nil
  for _FORV_21_, _FORV_22_ in pairs(_UPVALUE2_) do
    if _FORV_22_ == L3_21 then
      L3_21 = _FORV_21_ - 1
      break
    end
  end
  _UPVALUE3_.start()
  L16_34, L17_35 = _UPVALUE4_.l2tpServerConfigSet(L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31, L14_32, L15_33)
  if L16_34 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page l2tpServer" .. L16_34)
    _UPVALUE3_.abort()
    return L16_34, L1_19
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L17_35
end
