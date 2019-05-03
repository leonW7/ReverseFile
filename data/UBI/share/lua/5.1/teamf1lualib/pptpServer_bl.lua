local L0_0
L0_0 = module
L0_0("com.teamf1.bl.vpn.pptp_server", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/vpn_pptpServer")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function pptpServerSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
  L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21 = _UPVALUE0_.pptpServerConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  L3_4 = _UPVALUE2_[tonumber(L3_4) + 1]
  return L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21
end
function pptpServerSectionSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, L18_40, L19_41, L20_42, L21_43
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for page pptpServer"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["pptpServer.cookie"]
  L2_24 = A0_22["pptpServer.feature"]
  L3_25 = A0_22["pptpServer.routingMode"]
  L4_26 = A0_22["pptpServer.startIPAddress"]
  L5_27 = A0_22["pptpServer.endIPAddress"]
  L6_28 = A0_22["pptpServer.papEnable"]
  L7_29 = A0_22["pptpServer.chapEnable"]
  L8_30 = A0_22["pptpServer.msChapEnable"]
  L9_31 = A0_22["pptpServer.msChapv2Enable"]
  L10_32 = A0_22["pptpServer.mppe40Enable"]
  L11_33 = A0_22["pptpServer.mppe128Enable"]
  L12_34 = A0_22["pptpServer.mppeStatefullEnable"]
  L13_35 = A0_22["pptpServer.userTimeOut"]
  L14_36 = A0_22["pptpServer.netbiosEnable"]
  L15_37 = A0_22["pptpServer.primaryWINSServerIP"]
  L16_38 = A0_22["pptpServer.secondaryWINSServerIP"]
  L17_39 = A0_22["pptpServer.ipv6Prefix"]
  L18_40 = A0_22["pptpServer.ipv6PrefixLength"]
  L19_41 = A0_22["pptpServer.authenticationType"]
  L20_42 = _UPVALUE0_
  L20_42 = L20_42.NIL
  if L1_23 == L20_42 then
    L20_42 = util
    L20_42 = L20_42.appendDebugOut
    L21_43 = "Set : Invalid Cookie"
    L20_42(L21_43)
    L20_42 = _UPVALUE0_
    L20_42 = L20_42.BAD_PARAMETER
    return L20_42
  end
  L20_42 = _UPVALUE1_
  if L2_24 == L20_42 then
    L20_42 = _UPVALUE0_
    L20_42 = L20_42.NIL
    if L4_26 == L20_42 then
      L20_42 = util
      L20_42 = L20_42.appendDebugOut
      L21_43 = "Set : Invalid startIPAddress"
      L20_42(L21_43)
      L20_42 = _UPVALUE0_
      L20_42 = L20_42.BAD_PARAMETER
      return L20_42
    end
    L20_42 = _UPVALUE0_
    L20_42 = L20_42.NIL
    if L5_27 == L20_42 then
      L20_42 = util
      L20_42 = L20_42.appendDebugOut
      L21_43 = "Set : Invalid endIPAddress"
      L20_42(L21_43)
      L20_42 = _UPVALUE0_
      L20_42 = L20_42.BAD_PARAMETER
      return L20_42
    end
    L20_42 = _UPVALUE0_
    L20_42 = L20_42.NIL
    if L13_35 == L20_42 then
      L20_42 = util
      L20_42 = L20_42.appendDebugOut
      L21_43 = "Set : Invalid userTimeOut"
      L20_42(L21_43)
      L20_42 = _UPVALUE0_
      L20_42 = L20_42.BAD_PARAMETER
      return L20_42
    end
    L20_42 = _UPVALUE1_
    if L14_36 == L20_42 then
      L20_42 = _UPVALUE0_
      L20_42 = L20_42.NIL
      if L15_37 == L20_42 then
        L20_42 = util
        L20_42 = L20_42.appendDebugOut
        L21_43 = "Set : Invalid primaryWINSServerIP"
        L20_42(L21_43)
        L20_42 = _UPVALUE0_
        L20_42 = L20_42.BAD_PARAMETER
        return L20_42
      end
      L20_42 = _UPVALUE0_
      L20_42 = L20_42.NIL
      if L16_38 == L20_42 then
        L20_42 = util
        L20_42 = L20_42.appendDebugOut
        L21_43 = "Set : Invalid secondaryWINSServerIP"
        L20_42(L21_43)
        L20_42 = _UPVALUE0_
        L20_42 = L20_42.BAD_PARAMETER
        return L20_42
      end
    end
  end
  L20_42, L21_43 = nil, nil
  for _FORV_25_, _FORV_26_ in pairs(_UPVALUE2_) do
    if _FORV_26_ == L3_25 then
      L3_25 = _FORV_25_ - 1
      break
    end
  end
  _UPVALUE3_.start()
  L20_42, L21_43 = _UPVALUE4_.pptpServerConfigSet(L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39, L18_40, L19_41)
  if L20_42 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page pptpServer" .. L20_42)
    _UPVALUE3_.abort()
    return L20_42, L1_23
  end
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return _UPVALUE0_.SUCCESS, L21_43
end
