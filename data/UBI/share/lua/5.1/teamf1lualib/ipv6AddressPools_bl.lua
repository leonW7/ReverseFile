require("teamf1lualib/module")
module(com.teamf1.bl.ipv6.ipv6Addresspools, seeall)
require("teamf1lualib/db")
require("teamf1lualib/util")
require("teamf1lualib/validations")
require("teamf1lualib/returnCodes")
require("teamf1lualib/ipv6_lanAddressPools")
require("teamf1lualib/config")
function ipv6AddresspoolsGet()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0, L4_4, L1_1, L2_2, L3_3 = ipv6_lanAddressPools.addressPoolGet()
  if L0_0 ~= SUCCESS then
    return L0_0.ERROR
  end
  return L0_0, L4_4, L1_1, L2_2, L3_3
end
function ipv6AddresspoolsGetNext(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11
  L1_6 = A0_5["ipv6Addresspools.cookie"]
  if L1_6 == nil then
    L2_7 = util
    L2_7 = L2_7.appendDebugOut
    L3_8 = "GetNext : Invalid Cookie"
    L2_7(L3_8)
    L2_7 = returnCodes
    L2_7 = L2_7.BAD_PARAMETER
    return L2_7
  end
  L2_7, L3_8, L4_9, L5_10, L6_11 = nil, nil, nil, nil, nil
  L2_7, L6_11, L3_8, L4_9, L5_10 = ipv6_lanAddressPools.addressPoolGetNext(L1_6)
  if L2_7 ~= SUCCESS then
    return L2_7.ERROR
  end
  return L2_7, L6_11, L3_8, L4_9, L5_10
end
function ipv6AddresspoolsSet(A0_12)
  local L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L1_13 = ACCESS_LEVEL
  if L1_13 ~= 0 then
    L1_13 = util
    L1_13 = L1_13.appendDebugOut
    L2_14 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_13(L2_14)
    L1_13 = returnCodes
    L1_13 = L1_13.UNAUTHORIZED
    return L1_13
  end
  L1_13 = A0_12["ipv6Addresspools.cookie"]
  L2_14 = A0_12["ipv6Addresspools.startIpAddress"]
  L3_15 = A0_12["ipv6Addresspools.endIpAddress"]
  L4_16 = A0_12["ipv6Addresspools.prefixLength"]
  if L1_13 == nil then
    L5_17 = util
    L5_17 = L5_17.appendDebugOut
    L6_18 = "Set : Invalid Cookie"
    L5_17(L6_18)
    L5_17 = returnCodes
    L5_17 = L5_17.BAD_PARAMETER
    return L5_17
  end
  if L2_14 == nil or L3_15 == nil or L4_16 == nil then
    L5_17 = util
    L5_17 = L5_17.appendDebugOut
    L6_18 = "GetNext : Invalid Cookie"
    L5_17(L6_18)
    L5_17 = returnCodes
    L5_17 = L5_17.BAD_PARAMETER
    return L5_17
  end
  L5_17, L6_18 = nil, nil
  config.start()
  L5_17, L6_18 = ipv6_lanAddressPools.addressPoolSet(L1_13, L2_14, L3_15, L4_16)
  if L5_17 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L5_17)
    config.abort()
    return L5_17.ERROR, L1_13
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, L6_18
end
function ipv6AddresspoolsDelete(A0_19)
  local L1_20, L2_21
  L1_20 = ACCESS_LEVEL
  if L1_20 ~= 0 then
    L1_20 = util
    L1_20 = L1_20.appendDebugOut
    L2_21 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_20(L2_21)
    L1_20 = returnCodes
    L1_20 = L1_20.UNAUTHORIZED
    return L1_20
  end
  L1_20 = A0_19["ipv6Addresspools.cookie"]
  if L1_20 == nil then
    L2_21 = util
    L2_21 = L2_21.appendDebugOut
    L2_21("Delete : Invalid Cookie")
    L2_21 = returnCodes
    L2_21 = L2_21.BAD_PARAMETER
    return L2_21
  end
  L2_21 = nil
  config.start()
  L2_21, cookie = ipv6_lanAddressPools.addressPoolDelete(L1_20)
  if L2_21 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in page DUMMY PAGE" .. L2_21)
    config.abort()
    return L2_21.ERROR, L1_20
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, cookie
end
function ipv6AddresspoolsDefaultsGet()
  local L0_22, L1_23, L2_24, L4_25, L5_26, L6_27, L7_28
  L0_22, L1_23, L2_24 = nil, nil, nil
  L4_25 = returnCodes
  L4_25 = L4_25.SUCCESS
  L5_26 = 0
  L6_27 = L0_22
  L7_28 = L1_23
  return L4_25, L5_26, L6_27, L7_28, L2_24
end
function ipv6AddresspoolsCreate(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34
  L1_30 = ACCESS_LEVEL
  if L1_30 ~= 0 then
    L1_30 = util
    L1_30 = L1_30.appendDebugOut
    L2_31 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_30(L2_31)
    L1_30 = returnCodes
    L1_30 = L1_30.UNAUTHORIZED
    return L1_30
  end
  L1_30 = A0_29["ipv6Addresspools.startIpAddress"]
  L2_31 = A0_29["ipv6Addresspools.endIpAddress"]
  L3_32 = A0_29["ipv6Addresspools.prefixLength"]
  if L1_30 == nil or L2_31 == nil or L3_32 == nil then
    L4_33 = util
    L4_33 = L4_33.appendDebugOut
    L5_34 = "GetNext : Invalid Cookie"
    L4_33(L5_34)
    L4_33 = returnCodes
    L4_33 = L4_33.BAD_PARAMETER
    return L4_33
  end
  L4_33, L5_34 = nil, nil
  config.start()
  L4_33, L5_34 = ipv6_lanAddressPools.addressPoolCreate(L1_30, L2_31, L3_32)
  if L4_33 ~= returnCodes.SUCCESS then
    util.appendDebugOut("Error in configuring values in page DUMMY PAGE" .. L4_33)
    config.abort()
    return L4_33.ERROR, curCookie
  end
  config.complete()
  config.save()
  return returnCodes.SUCCESS, L5_34
end
