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
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/lanqos_flowControl")
L0_0 = require
L0_0("teamf1lualib/fwCustomServices")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
flowcontrolTable = "FlowBasedPolicyTable"
flowControlPageName = "flowControl"
;({}).flowName = "policyName"
;({}).service = "ServiceName"
;({}).sourceIpAddress = "srcIP"
;({}).destinationIpAddress = "dstIP"
;({}).rate = "ratePercentage"
;({}).serviceId = "serviceId"
;({}).dstPort = "dstPort"
;({}).dstPortEnd = "dstPortEnd"
;({}).protocol = "protocol"
;({}).description = "description"
serviceName = {
  "",
  "AIM",
  "BGP",
  "BOOTP_CLIENT",
  "BOOTP_SERVER",
  "CU-SEEME:UDP",
  "CU-SEEME:TCP",
  "DNS:UDP",
  "DNS:TCP",
  "FINGER",
  "FTP",
  "HTTP",
  "HTTPS",
  "ICMP-TYPE-3",
  "ICMP-TYPE-4",
  "ICMP-TYPE-5",
  "ICMP-TYPE-6",
  "ICMP-TYPE-7",
  "ICMP-TYPE-8",
  "ICMP-TYPE-9",
  "ICMP-TYPE-10",
  "ICMP-TYPE-11",
  "ICMP-TYPE-13",
  "ICQ",
  "IMAP2",
  "IMAP3",
  "IRC",
  "NEWS",
  "NFS",
  "NNTP",
  "PING",
  "POP3",
  "PPTP",
  "RCMD",
  "REAL-AUDIO",
  "REXEC",
  "RLOGIN",
  "RTELNET",
  "RTSP:TCP",
  "RTSP:UDP",
  "SFTP",
  "SMTP",
  "SNMP:TCP",
  "SNMP:UDP",
  "SNMP-TRAPS:TCP",
  "SNMP-TRAPS:UDP",
  "SQL-NET",
  "SSH:TCP",
  "SSH:UDP",
  "STRMWORKS",
  "TACACS",
  "TELNET",
  "TFTP",
  "RIP",
  "IKE",
  "SHTTPD",
  "IPSEC-UDP-ENCAP",
  "IDENT",
  "VDOLIVE",
  "SSH",
  "SIP-TCP",
  "SIP-UDP"
}
function serviceNameGetAll()
  local L0_1, L1_2
  L0_1 = fw
  L0_1 = L0_1.core
  L0_1 = L0_1.services
  L0_1 = L0_1.GetAll
  L1_2 = L0_1()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE0_.ERROR
  end
  return L0_1, L1_2
end
function flowControlGetAll()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15
  L2_5 = _UPVALUE0_
  L2_5 = L2_5.flowcontrolGetAll
  L3_6 = L2_5()
  L1_4 = L3_6
  L0_3 = L2_5
  L2_5 = _UPVALUE1_
  L2_5 = L2_5.SUCCESS
  if L0_3 ~= L2_5 then
    L2_5 = _UPVALUE1_
    L2_5 = L2_5.ERROR
    return L2_5
  end
  L2_5 = serviceNameGetAll
  L3_6 = L2_5()
  for L7_10, L8_11 in L4_7(L5_8) do
    for L12_15, _FORV_13_ in L9_12(L10_13) do
      L1_4[L7_10][L12_15] = _FORV_13_
    end
    for _FORV_13_, _FORV_14_ in L10_13(L11_14) do
      if tonumber(_FORV_14_._ROWID_) == L9_12 then
        L1_4[L7_10][flowControlPageName .. "." .. _UPVALUE2_.service] = _FORV_14_[_UPVALUE2_.service]
      end
    end
  end
  return L4_7, L5_8
end
function flowControlGet(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21, L6_22
  L1_17, cookie1, L2_18, L3_19, L4_20, L5_21, L6_22 = _UPVALUE0_.flowGetCur(A0_16)
  if L1_17 ~= _UPVALUE1_.SUCCESS then
    return _UPVALUE1_.ERROR
  end
  return L1_17, cookie1, L2_18, L3_19, L4_20, L5_21, L6_22
end
function flowControlGetNext(A0_23)
  local L1_24, L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31
  L1_24 = A0_23["flowControl.cookie"]
  L2_25 = NIL
  if L1_24 == L2_25 then
    L2_25 = util
    L2_25 = L2_25.appendDebugOut
    L3_26 = "GetNext : Invalid Cookie"
    L2_25(L3_26)
    L2_25 = _UPVALUE0_
    L2_25 = L2_25.BAD_PARAMETER
    return L2_25
  end
  L2_25, L3_26, L4_27, L5_28, L6_29, L7_30, L8_31 = nil, nil, nil, nil, nil, nil, nil
  L2_25, L8_31, L3_26, L4_27, L5_28, L6_29, L7_30 = _UPVALUE1_.flowGetNext(L1_24)
  if L2_25 ~= SUCCESS then
    return _UPVALUE0_.ERROR
  end
  return L2_25, L8_31, L3_26, L4_27, L5_28, L6_29, L7_30
end
function flowControlSet(A0_32)
  local L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39
  L1_33 = ACCESS_LEVEL
  if L1_33 ~= 0 then
    L1_33 = util
    L1_33 = L1_33.appendDebugOut
    L2_34 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_33(L2_34)
    L1_33 = _UPVALUE0_
    L1_33 = L1_33.UNAUTHORIZED
    return L1_33
  end
  L1_33 = A0_32["flowControl.cookie"]
  L2_34 = A0_32["flowControl.flowName"]
  L3_35 = A0_32["flowControl.service"]
  L4_36 = A0_32["flowControl.sourceIpAddress"]
  L5_37 = A0_32["flowControl.destinationIpAddress"]
  L6_38 = A0_32["flowControl.rate"]
  L7_39 = NIL
  if L1_33 == L7_39 then
    L7_39 = util
    L7_39 = L7_39.appendDebugOut
    L7_39("Delete : Invalid Cookie")
    L7_39 = _UPVALUE0_
    L7_39 = L7_39.BAD_PARAMETER
    return L7_39
  end
  L7_39 = nil
  _UPVALUE1_.start()
  L7_39, cookie = _UPVALUE2_.flowDelete(L1_33)
  if L7_39 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L7_39, L1_33
  end
  L7_39, cookie = _UPVALUE2_.flowCreate(L2_34, L3_35, L4_36, L5_37, L6_38)
  if L7_39 ~= _UPVALUE0_.SUCCESS then
    _UPVALUE1_.abort()
    return L7_39, L1_33
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function flowControlDelete(A0_40)
  local L1_41, L2_42
  L1_41 = ACCESS_LEVEL
  if L1_41 ~= 0 then
    L1_41 = util
    L1_41 = L1_41.appendDebugOut
    L2_42 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_41(L2_42)
    L1_41 = _UPVALUE0_
    L1_41 = L1_41.UNAUTHORIZED
    return L1_41
  end
  L1_41 = A0_40["flowControl.cookie"]
  if L1_41 == nil then
    L2_42 = util
    L2_42 = L2_42.appendDebugOut
    L2_42("Delete : Invalid Cookie")
    L2_42 = _UPVALUE0_
    L2_42 = L2_42.BAD_PARAMETER
    return L2_42
  end
  L2_42 = nil
  _UPVALUE1_.start()
  L2_42, cookie = _UPVALUE2_.flowDelete(L1_41)
  if L2_42 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_42)
    _UPVALUE1_.abort()
    return L2_42, L1_41
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function dummyPageSectionDefaultsGet()
  local L0_43, L1_44, L2_45, L3_46, L4_47, L6_48, L7_49, L8_50, L9_51, L10_52, L11_53
  L1_44 = "AIM"
  L6_48 = _UPVALUE0_
  L6_48 = L6_48.SUCCESS
  L7_49 = 0
  L8_50 = L0_43
  L9_51 = L1_44
  L10_52 = L2_45
  L11_53 = L3_46
  return L6_48, L7_49, L8_50, L9_51, L10_52, L11_53, L4_47
end
function flowControlCreate(A0_54)
  local L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  L1_55 = ACCESS_LEVEL
  if L1_55 ~= 0 then
    L1_55 = util
    L1_55 = L1_55.appendDebugOut
    L2_56 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_55(L2_56)
    L1_55 = _UPVALUE0_
    L1_55 = L1_55.UNAUTHORIZED
    return L1_55
  end
  L1_55 = A0_54["flowControl.flowName"]
  L2_56 = A0_54["flowControl.service"]
  L3_57 = A0_54["flowControl.sourceIpAddress"]
  L4_58 = A0_54["flowControl.destinationIpAddress"]
  L5_59 = A0_54["flowControl.rate"]
  L6_60 = NIL
  if L1_55 ~= L6_60 then
    L6_60 = NIL
    if L2_56 ~= L6_60 then
      L6_60 = NIL
      if L3_57 ~= L6_60 then
        L6_60 = NIL
        if L4_58 ~= L6_60 then
          L6_60 = NIL
        end
      end
    end
  elseif L5_59 == L6_60 then
    L6_60 = util
    L6_60 = L6_60.appendDebugOut
    L7_61 = "GetNext : Invalid Cookie"
    L6_60(L7_61)
    L6_60 = _UPVALUE0_
    L6_60 = L6_60.BAD_PARAMETER
    return L6_60
  end
  L6_60, L7_61 = nil, nil
  _UPVALUE1_.start()
  L6_60, L7_61 = _UPVALUE2_.flowCreate(L1_55, L2_56, L3_57, L4_58, L5_59)
  if L6_60 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L6_60)
    _UPVALUE1_.abort()
    return L6_60, 0
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L7_61
end
function flowControlDeleteAll(A0_62)
  local L1_63, L2_64, L3_65, L4_66, L5_67, L6_68
  L1_63 = ACCESS_LEVEL
  if L1_63 ~= 0 then
    L1_63 = util
    L1_63 = L1_63.appendDebugOut
    L1_63(L2_64)
    L1_63 = _UPVALUE0_
    L1_63 = L1_63.UNAUTHORIZED
    return L1_63
  end
  L1_63 = nil
  L2_64()
  for L5_67, L6_68 in L2_64(L3_65) do
    L1_63, cookie = _UPVALUE2_.flowDelete(L6_68)
    if L1_63 ~= _UPVALUE0_.SUCCESS then
      util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L1_63)
      _UPVALUE1_.abort()
      return L1_63, curCookie
    end
  end
  L2_64()
  L2_64()
  return L2_64, L3_65
end
