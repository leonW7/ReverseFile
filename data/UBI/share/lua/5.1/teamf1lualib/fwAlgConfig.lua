local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/fwValidations")
L0_0 = "1"
fw.core.algConf = {}
algConfTable = "AlgConf"
;({}).pptp = "Pptp"
;({}).ipsec = "Ipsec"
;({}).rtsp = "Rtsp"
;({}).sip = "Sip"
;({}).h323 = "H323"
;({}).smtp = "Smtp"
;({}).dns = "Dns"
;({}).tftp = "Tftp"
function fw.core.algConf.pptpEnable()
  local L0_1, L1_2
  L1_2 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptp, _UPVALUE3_)
  if not L1_2 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.pptpDisable()
  local L0_3, L1_4
  L1_4 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptp, _UPVALUE3_)
  if not L1_4 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.pptpGet()
  local L0_5
  L0_5 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.pptp)
  if L0_5 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_5
end
function fw.core.algConf.pptpGetNext(A0_6)
  local L2_7
  L2_7 = returnCodes
  L2_7 = L2_7.NOT_SUPPORTED
  return L2_7, A0_6
end
function fw.core.algConf.rtspEnable()
  local L0_8, L1_9
  L1_9 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.rtsp, _UPVALUE3_)
  if not L1_9 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.rtspDisable()
  local L0_10, L1_11
  L1_11 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.rtsp, _UPVALUE3_)
  if not L1_11 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.rtspGet()
  local L0_12
  L0_12 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.rtsp)
  if L0_12 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_12
end
function fw.core.algConf.rtspGetNext(A0_13)
  local L2_14
  L2_14 = returnCodes
  L2_14 = L2_14.NOT_SUPPORTED
  return L2_14, A0_13
end
function fw.core.algConf.sipEnable()
  local L0_15, L1_16
  L1_16 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sip, _UPVALUE3_)
  if not L1_16 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.sipDisable()
  local L0_17, L1_18
  L1_18 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sip, _UPVALUE3_)
  if not L1_18 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.sipGet()
  local L0_19
  L0_19 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.sip)
  if L0_19 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_19
end
function fw.core.algConf.sipGetNext(A0_20)
  local L2_21
  L2_21 = returnCodes
  L2_21 = L2_21.NOT_SUPPORTED
  return L2_21, A0_20
end
function fw.core.algConf.h323Enable()
  local L0_22, L1_23
  L1_23 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.h323, _UPVALUE3_)
  if not L1_23 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.h323Disable()
  local L0_24, L1_25
  L1_25 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.h323, _UPVALUE3_)
  if not L1_25 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.h323Get()
  local L0_26
  L0_26 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.h323)
  if L0_26 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_26
end
function fw.core.algConf.h323GetNext(A0_27)
  local L2_28
  L2_28 = returnCodes
  L2_28 = L2_28.NOT_SUPPORTED
  return L2_28, A0_27
end
function fw.core.algConf.dnsEnable()
  local L0_29, L1_30
  L1_30 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dns, _UPVALUE3_)
  if not L1_30 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.dnsDisable()
  local L0_31, L1_32
  L1_32 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dns, _UPVALUE3_)
  if not L1_32 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.dnsGet()
  local L0_33
  L0_33 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.dns)
  if L0_33 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_33
end
function fw.core.algConf.dnsGetNext(A0_34)
  local L2_35
  L2_35 = returnCodes
  L2_35 = L2_35.NOT_SUPPORTED
  return L2_35, A0_34
end
function fw.core.algConf.tftpEnable()
  local L0_36, L1_37
  L1_37 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tftp, _UPVALUE3_)
  if not L1_37 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.tftpDisable()
  local L0_38, L1_39
  L1_39 = db.setAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tftp, _UPVALUE3_)
  if not L1_39 then
    return returnCodes.FAILURE, _UPVALUE1_
  end
  return returnCodes.SUCCESS, _UPVALUE1_
end
function fw.core.algConf.tftpGet()
  local L0_40
  L0_40 = db.getAttribute(algConfTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.tftp)
  if L0_40 == _UPVALUE3_ then
    return returnCodes.FAILURE
  end
  return returnCodes.SUCCESS, _UPVALUE1_, L0_40
end
function fw.core.algConf.tftpGetNext(A0_41)
  local L2_42
  L2_42 = returnCodes
  L2_42 = L2_42.NOT_SUPPORTED
  return L2_42, A0_41
end
function fw.core.algConf.Get()
  local L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51
  L8_51 = {}
  L8_51 = db.getRow(algConfTable, _UPVALUE0_, _UPVALUE1_)
  if L8_51 == _UPVALUE2_ then
    return returnCodes.FAILURE
  else
    L0_43 = L8_51[algConfTable .. "." .. _UPVALUE3_.pptp]
    L1_44 = L8_51[algConfTable .. "." .. _UPVALUE3_.ipsec]
    L2_45 = L8_51[algConfTable .. "." .. _UPVALUE3_.rtsp]
    L3_46 = L8_51[algConfTable .. "." .. _UPVALUE3_.sip]
    L4_47 = L8_51[algConfTable .. "." .. _UPVALUE3_.h323]
    L5_48 = L8_51[algConfTable .. "." .. _UPVALUE3_.smtp]
    L6_49 = L8_51[algConfTable .. "." .. _UPVALUE3_.dns]
    L7_50 = L8_51[algConfTable .. "." .. _UPVALUE3_.tftp]
    return returnCodes.SUCCESS, _UPVALUE1_, L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50
  end
end
function fw.core.algConf.GetNext(A0_52)
  local L2_53
  L2_53 = returnCodes
  L2_53 = L2_53.NOT_SUPPORTED
  return L2_53, A0_52
end
function fw.core.algConf.edit(A0_54, A1_55, A2_56, A3_57, A4_58, A5_59, A6_60, A7_61)
  local L8_62, L9_63, L10_64, L11_65
  L9_63 = {}
  L10_64, L11_65 = nil, nil
  L8_62 = booleanCheck(A0_54)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A1_55)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A2_56)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A3_57)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A4_58)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A5_59)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A6_60)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L8_62 = booleanCheck(A7_61)
  if L8_62 ~= returnCodes.SUCCESS then
    return returnCodes.INVALID_ARGUMENT, _UPVALUE0_
  end
  L9_63[algConfTable .. "." .. _UPVALUE1_.pptp] = A0_54
  L9_63[algConfTable .. "." .. _UPVALUE1_.ipsec] = A1_55
  L9_63[algConfTable .. "." .. _UPVALUE1_.rtsp] = A2_56
  L9_63[algConfTable .. "." .. _UPVALUE1_.sip] = A3_57
  L9_63[algConfTable .. "." .. _UPVALUE1_.h323] = A4_58
  L9_63[algConfTable .. "." .. _UPVALUE1_.smtp] = A5_59
  L9_63[algConfTable .. "." .. _UPVALUE1_.dns] = A6_60
  L9_63[algConfTable .. "." .. _UPVALUE1_.tftp] = A7_61
  L11_65 = db.update(algConfTable, L9_63, _UPVALUE0_)
  if not L11_65 then
    return returnCodes.FAILURE, _UPVALUE0_
  end
  return returnCodes.SUCCESS, _UPVALUE0_
end
