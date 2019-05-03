local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.vpnPassThrough = {}
attackChecksTable = "AttackChecks"
;({}).ipsecPassThrough = "IpsecPassthrough"
;({}).pptpPassThrough = "PptpPassthrough"
;({}).l2tpPassThrough = "L2tpPassthrough"
function fw.core.vpnPassThrough.ipsecPassThroughStatusGet()
  local L0_1
  L0_1 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipsecPassThrough)
  if L0_1 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_1
end
function fw.core.vpnPassThrough.ipsecPassThroughStatusGetNext(A0_2)
  local L2_3
  L2_3 = returnCodes
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function fw.core.vpnPassThrough.ipsecPassThroughStatusEnable()
  local L0_4, L1_5
  L1_5 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipsecPassThrough, _UPVALUE3_)
  if not L1_5 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.ipsecPassThroughStatusDisable()
  local L0_6, L1_7
  L1_7 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.ipsecPassThrough, _UPVALUE3_)
  if not L1_7 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.pptpPassThroughStatusGet()
  local L0_8
  L0_8 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptpPassThrough)
  if L0_8 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_8
end
function fw.core.vpnPassThrough.pptpPassThroughStatusGetNext(A0_9)
  local L2_10
  L2_10 = returnCodes
  L2_10 = L2_10.NOT_SUPPORTED
  return L2_10, A0_9
end
function fw.core.vpnPassThrough.pptpPassThroughStatusEnable()
  local L0_11, L1_12
  L1_12 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptpPassThrough, _UPVALUE3_)
  if not L1_12 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.pptpPassThroughStatusDisable()
  local L0_13, L1_14
  L1_14 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptpPassThrough, _UPVALUE3_)
  if not L1_14 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.l2tpPassThroughStatusGet()
  local L0_15
  L0_15 = db.getAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.l2tpPassThrough)
  if L0_15 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_15
end
function fw.core.vpnPassThrough.l2tpPassThroughStatusGetNext(A0_16)
  local L2_17
  L2_17 = returnCodes
  L2_17 = L2_17.NOT_SUPPORTED
  return L2_17, A0_16
end
function fw.core.vpnPassThrough.l2tpPassThroughStatusEnable()
  local L0_18, L1_19
  L1_19 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.l2tpPassThrough, _UPVALUE3_)
  if not L1_19 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.l2tpPassThroughStatusDisable()
  local L0_20, L1_21
  L1_21 = db.setAttribute(attackChecksTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.l2tpPassThrough, _UPVALUE3_)
  if not L1_21 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.vpnPassThrough.Get()
  local L0_22, L1_23, L2_24, L3_25
  L3_25 = {}
  L3_25 = db.getRow(attackChecksTable, _UPVALUE0_, _UPVALUE1_)
  if L3_25 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_22 = L3_25[attackChecksTable .. "." .. _UPVALUE3_.ipsecPassThrough]
    L1_23 = L3_25[attackChecksTable .. "." .. _UPVALUE3_.pptpPassThrough]
    L2_24 = L3_25[attackChecksTable .. "." .. _UPVALUE3_.l2tpPassThrough]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_22, L1_23, L2_24
  end
end
function fw.core.vpnPassThrough.GetNext(A0_26)
  local L2_27
  L2_27 = returnCodes
  L2_27 = L2_27.NOT_SUPPORTED
  return L2_27, A0_26
end
function fw.core.vpnPassThrough.Set(A0_28, A1_29, A2_30)
  local L3_31, L4_32, L5_33, L6_34
  L4_32 = {}
  L5_33, L6_34 = nil, nil
  L3_31 = booleanCheck(A0_28)
  if L3_31 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L3_31 = booleanCheck(A1_29)
  if L3_31 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L3_31 = booleanCheck(A2_30)
  if L3_31 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, cookie
  end
  L4_32[attackChecksTable .. "." .. _UPVALUE1_.ipsecPassThrough] = A0_28
  L4_32[attackChecksTable .. "." .. _UPVALUE1_.pptpPassThrough] = A1_29
  L4_32[attackChecksTable .. "." .. _UPVALUE1_.l2tpPassThrough] = A2_30
  L6_34 = db.update(attackChecksTable, L4_32, _UPVALUE0_)
  if not L6_34 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
