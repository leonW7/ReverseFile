local L0_0
L0_0 = module
L0_0("com.teamf1.bl.security.ips", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/security_ips")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function ipsSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1, cookie, L2_3, L1_2, L4_5, L3_4, L5_6, L6_7, L7_8 = _UPVALUE0_.ipsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return _UPVALUE1_.SUCCESS, cookie, L2_3, L1_2, L4_5, L3_4, L5_6, L6_7, L7_8
end
function ipsSectionSet(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L2_11 = "Detected Unauthorized access for page ips"
    L1_10(L2_11)
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17 = nil, nil, nil, nil, nil, nil, nil, nil
  L9_18 = "1"
  curCookie = L9_18
  L2_11 = A0_9["ips.ipsEnable"]
  L3_12 = A0_9["ips.idsEnable"]
  L4_13 = A0_9["ips.ipsEnableDmz"]
  L5_14 = A0_9["ips.ipsEnableLan"]
  L9_18 = _UPVALUE1_
  L9_18 = L9_18.start
  L9_18()
  L9_18 = _UPVALUE2_
  L9_18 = L9_18.ipsSet
  L10_19 = curCookie
  L10_19 = L9_18(L10_19, L3_12, L2_11, L5_14, L4_13)
  L1_10 = L10_19
  returnCode = L9_18
  L9_18 = returnCode
  L10_19 = _UPVALUE0_
  L10_19 = L10_19.SUCCESS
  if L9_18 ~= L10_19 then
    L9_18 = util
    L9_18 = L9_18.appendDebugOut
    L10_19 = "Error in configuring values in page ips"
    L10_19 = L10_19 .. returnCode
    L9_18(L10_19)
    L9_18 = _UPVALUE1_
    L9_18 = L9_18.abort
    L9_18()
    L9_18 = returnCode
    return L9_18
  end
  L9_18 = _UPVALUE1_
  L9_18 = L9_18.complete
  L9_18()
  L9_18 = _UPVALUE1_
  L9_18 = L9_18.save
  L9_18()
  L9_18 = db
  L9_18 = L9_18.getAttribute
  L10_19 = "environment"
  L9_18 = L9_18(L10_19, "name", "HW_OFFLOAD_SCRIPT", "value")
  L10_19 = "/pfrm2.0/bin/lua "
  L10_19 = L10_19 .. L9_18 .. " " .. "/tmp/system.db"
  util.appendDebugOut("Exec: " .. os.execute(L10_19))
  return _UPVALUE0_.SUCCESS, L1_10
end
