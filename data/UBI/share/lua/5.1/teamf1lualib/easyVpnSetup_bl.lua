local L0_0
L0_0 = module
L0_0("com.teamf1.bl.ipsec.easyVpn", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/ipsec_vpn")
L0_0 = require
L0_0("teamf1lualib/ipsec_ike")
L0_0 = require
L0_0("teamf1lualib/ipsec_import")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/vipsecure_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.ipsec.import")
function importPolicy(A0_1)
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page policies PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if db.getAttribute("NatTable", "_ROWID_", "1", "Enable") == _UPVALUE1_ then
    return _UPVALUE2_.IPSEC_POLICIES_NOT_ALLOWED_IN_TRANSPARENT_MODE
  end
  returnCode = _UPVALUE3_.importPolicy(A0_1)
  return returnCode
end
