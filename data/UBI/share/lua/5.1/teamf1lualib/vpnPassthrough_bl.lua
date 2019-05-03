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
L0_0("teamf1lualib/fwVpnPassThrough")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
function vpnPassthroughGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1, L4_5, L1_2, L2_3, L3_4 = fw.core.vpnPassThrough.Get()
  if L0_1 ~= _UPVALUE0_.SUCCESS then
    return L0_1
  end
  return L0_1, L4_5, L1_2, L2_3, L3_4
end
function vpnPassthroughGetNext(A0_6)
  local L2_7
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NOT_SUPPORTED
  return L2_7, cookie
end
function vpnPassthroughSet(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13
  L1_9 = ACCESS_LEVEL
  if L1_9 ~= 0 then
    L1_9 = util
    L1_9 = L1_9.appendDebugOut
    L2_10 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_9(L2_10)
    L1_9 = _UPVALUE0_
    L1_9 = L1_9.UNAUTHORIZED
    return L1_9
  end
  L1_9 = A0_8["vpnPassthrough.ipsecPassThroughStatus"]
  L2_10 = A0_8["vpnPassthrough.pptpPassThroughStatus"]
  L3_11 = A0_8["vpnPassthrough.l2tpPassThroughStatus"]
  if L1_9 == nil or L2_10 == nil or L3_11 == nil then
    L4_12 = util
    L4_12 = L4_12.appendDebugOut
    L5_13 = "GetNext : Invalid Cookie"
    L4_12(L5_13)
    L4_12 = _UPVALUE0_
    L4_12 = L4_12.BAD_PARAMETER
    return L4_12
  end
  L4_12, L5_13 = nil, nil
  _UPVALUE1_.start()
  L4_12, L5_13 = fw.core.vpnPassThrough.Set(L1_9, L2_10, L3_11)
  if L4_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L4_12)
    _UPVALUE1_.abort()
    return L4_12, curCookie
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_13
end
function vpnPassthroughDelete(A0_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, cookie
end
function vpnPassthroughDefaultsGet()
  local L0_16, L1_17, L2_18, L4_19, L5_20, L6_21, L7_22
  L0_16 = "1"
  L1_17 = "1"
  L2_18 = "1"
  L4_19 = _UPVALUE0_
  L4_19 = L4_19.SUCCESS
  L5_20 = 0
  L6_21 = L0_16
  L7_22 = L1_17
  return L4_19, L5_20, L6_21, L7_22, L2_18
end
function vpnPassthroughCreate(A0_23)
  local L2_24
  L2_24 = _UPVALUE0_
  L2_24 = L2_24.NOT_SUPPORTED
  return L2_24, cookie
end
