local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.channellist", package.seeall)
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/managedchannellist_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function managedApChannelListGet(A0_1)
  local L1_2, L2_3, L3_4, L4_5
  L3_4 = A0_1.apMacAddress
  L4_5 = A0_1.radioIndex
  if L3_4 == _UPVALUE0_.NIL or L4_5 == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  L4_5 = tonumber(L4_5)
  L1_2, L2_3 = _UPVALUE1_.managedchannellistGet(_UPVALUE2_, L3_4, L4_5)
  if L1_2 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in apProfileSSID page" .. L1_2)
    return _UPVALUE0_
  end
  return L1_2, L2_3
end
