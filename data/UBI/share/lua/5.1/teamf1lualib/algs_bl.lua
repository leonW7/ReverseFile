local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/fwAlgConfig")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
function algGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  L10_11 = fw
  L10_11 = L10_11.core
  L10_11 = L10_11.algConf
  L10_11 = L10_11.Get
  L9_10, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L10_11 = nil, nil, nil, nil, nil, nil, nil, nil, nil, L10_11()
  L0_1 = L10_11
  L10_11 = _UPVALUE0_
  L10_11 = L10_11.SUCCESS
  if L0_1 ~= L10_11 then
    return L0_1
  end
  L10_11 = {}
  L10_11["algs.pptpStatus"] = L1_2
  L10_11["algs.ipsecStatus"] = L2_3
  L10_11["algs.rtspStatus"] = L3_4
  L10_11["algs.sipStatus"] = L4_5
  L10_11["algs.h323Status"] = L5_6
  L10_11["algs.smtpStatus"] = L6_7
  L10_11["algs.dnsStatus"] = L7_8
  L10_11["algs.tftpStatus"] = L8_9
  return L0_1, L9_10, L10_11
end
function algGetNext(A0_12)
  return _UPVALUE0_.NOT_SUPPORTED
end
function algSet(A0_13)
  local L1_14, L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22, L10_23, L11_24, L12_25
  L1_14 = ACCESS_LEVEL
  if L1_14 ~= 0 then
    L1_14 = util
    L1_14 = L1_14.appendDebugOut
    L2_15 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_14(L2_15)
    L1_14 = _UPVALUE0_
    L1_14 = L1_14.UNAUTHORIZED
    return L1_14
  end
  L1_14 = A0_13["algs.cookie"]
  L2_15 = A0_13["algs.pptpStatus"]
  L3_16 = A0_13["algs.ipsecStatus"]
  L4_17 = A0_13["algs.rtspStatus"]
  L5_18 = A0_13["algs.sipStatus"]
  L6_19 = A0_13["algs.h323Status"]
  L7_20 = A0_13["algs.smtpStatus"]
  L8_21 = A0_13["algs.dnsStatus"]
  L9_22 = A0_13["algs.tftpStatus"]
  if L1_14 == nil then
    L10_23 = util
    L10_23 = L10_23.appendDebugOut
    L11_24 = "Set : Invalid Cookie"
    L10_23(L11_24)
    L10_23 = _UPVALUE0_
    L10_23 = L10_23.BAD_PARAMETER
    return L10_23
  end
  L10_23, L11_24 = nil, nil
  L12_25 = _UPVALUE1_
  L12_25 = L12_25.start
  L12_25()
  L12_25 = fw
  L12_25 = L12_25.core
  L12_25 = L12_25.algConf
  L12_25 = L12_25.edit
  L11_24, L12_25 = L2_15, L12_25(L2_15, L3_16, L4_17, L5_18, L6_19, L7_20, L8_21, L9_22)
  L10_23 = L12_25
  L12_25 = _UPVALUE0_
  L12_25 = L12_25.SUCCESS
  if L10_23 ~= L12_25 then
    L12_25 = util
    L12_25 = L12_25.appendDebugOut
    L12_25("Error in configuring values in page DUMMY PAGE" .. L10_23)
    L12_25 = _UPVALUE1_
    L12_25 = L12_25.abort
    L12_25()
    L12_25 = L10_23
    return L12_25, L1_14
  end
  L12_25 = _UPVALUE1_
  L12_25 = L12_25.complete
  L12_25()
  L12_25 = _UPVALUE1_
  L12_25 = L12_25.save
  L12_25()
  L12_25 = PFRM_BIN_PATH
  L12_25 = L12_25 .. " " .. HW_OFFLOAD_SCRIPT .. " " .. SYSTEM_DB_FILE_NAME
  util.appendDebugOut("Exec: " .. os.execute(L12_25))
  return _UPVALUE0_.SUCCESS, L11_24
end
function algDelete(A0_26)
  return _UPVALUE0_.NOT_SUPPORTED
end
function algDefaultsGet()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43
  L0_27 = "0"
  L1_28 = "0"
  L2_29 = "0"
  L3_30 = "0"
  L4_31 = "0"
  L5_32 = "0"
  L6_33 = "0"
  L7_34 = "0"
  L9_35 = _UPVALUE0_
  L9_35 = L9_35.SUCCESS
  L10_36 = 0
  L11_37 = L0_27
  L12_38 = L1_28
  L13_39 = L2_29
  L14_40 = L3_30
  L15_41 = L4_31
  L16_42 = L5_32
  L17_43 = L6_33
  return L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L7_34
end
function algCreate(A0_44)
  return _UPVALUE0_.NOT_SUPPORTED
end
