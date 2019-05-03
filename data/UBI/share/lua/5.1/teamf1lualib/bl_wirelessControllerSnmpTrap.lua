local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.snmptrap", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/snmpconfig_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).APFailureTraps = 1
;({}).APStateChangeTraps = 2
;({}).ClientFailureTraps = 3
;({}).ClientStateChangeTraps = 4
;({}).PeerControllerTraps = 5
;({}).RFScanTraps = 6
;({}).RogueAPTraps = 7
;({}).WIDSStatusTraps = 8
;({}).WirelessStatusTraps = 9
function wlanSnmpTrapGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.snmpconfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the wirelessControllerSnmpTrap page" .. L0_1)
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE2_) do
    L2_3[_FORV_6_] = L1_2[_FORV_7_]
  end
  return L0_1, L2_3
end
function wlanSnmpTrapSet(A0_4)
  local L1_5, L2_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for wirelessControllerSnmpTrap page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  for _FORV_6_, _FORV_7_ in pairs(_UPVALUE1_) do
    if A0_4[_FORV_6_] == _UPVALUE0_.NIL then
      util.appendDebugOut("Set : Invalid Data")
      return _UPVALUE0_.BAD_PARAMETER
    else
      A0_4[_FORV_6_] = tonumber(A0_4[_FORV_6_])
    end
  end
  L1_5, L2_6 = _UPVALUE2_.snmpconfigSet(A0_4)
  if L1_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in wirelessControllerSnmpTrap page" .. L1_5)
    return _UPVALUE0_.FAILURE
  end
  return L1_5, L2_6
end
