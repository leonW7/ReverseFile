local L0_0
L0_0 = module
L0_0("com.teamf1.core.threeg.threeg_smsEvent", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/threeg_createSms")
L0_0 = require
L0_0("teamf1lualib/threeg_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).receiverInfo = "ReceiverInfo"
function smsEventInfoGet()
  local L0_1, L1_2, L2_3
  L2_3 = {}
  L0_1, L1_2 = _UPVALUE0_.createSmsGet()
  L2_3 = db.getRow(_UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
  if L1_2 == _UPVALUE4_ then
    return _UPVALUE5_.THREEG_NOT_AVAILABLE, L1_2, L2_3
  else
    return _UPVALUE6_.SUCCESS, L1_2, L2_3
  end
end
function smsEventSet(A0_4)
  local L1_5
  L1_5 = db.update(_UPVALUE0_, A0_4, _UPVALUE1_)
  if L1_5 == _UPVALUE2_.FALSE then
    return _UPVALUE2_.FAILURE
  end
  return _UPVALUE2_.SUCCESS
end
