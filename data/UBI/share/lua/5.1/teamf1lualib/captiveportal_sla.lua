local L0_0
L0_0 = module
L0_0("com.teamf1.core.captiveportal.sla", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/captivePortal_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
ENABLE = "1"
DISABLE = "0"
ROWID = "_ROWID_"
FALSE = false
NIL = nil
OK = "OK"
function slaGet()
  local L0_1, L1_2, L2_3
  L0_1 = ""
  L1_2 = io
  L1_2 = L1_2.open
  L2_3 = "/flash/tmp/capPort/sla.txt"
  L1_2 = L1_2(L2_3, "r")
  while true do
    L2_3 = L1_2.read
    L2_3 = L2_3(L1_2, "*l")
    L2_3 = L2_3 and L2_3:match("^%s*(.*)")
    if L2_3 == null then
      break
    end
    if L0_1 ~= "" then
      L0_1 = L0_1 .. "\n" .. L2_3
    else
      L0_1 = L2_3
    end
  end
  L2_3 = L1_2.close
  L2_3(L1_2)
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.SUCCESS
  return L2_3, L0_1
end
function slaGetNext(A0_4)
  return _UPVALUE0_.NOT_SUPPORTED
end
function slaSet(A0_5)
  if A0_5 == NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if io.open("/flash/tmp/capPort/sla.txt", "w") == nil then
    return _UPVALUE1_.SLA_SET_ERROR
  end
  valid = io.open("/flash/tmp/capPort/sla.txt", "w"):write(A0_5)
  io.open("/flash/tmp/capPort/sla.txt", "w"):close()
  if valid then
    return _UPVALUE0_.SUCCESS
  else
    return _UPVALUE1_.SLA_TERMS_SERVICE_CHANGE_ERROR
  end
end
function setslaRules(A0_6)
  valid = io.open("/flash/tmp/capPort/sla.txt", "w"):write(A0_6)
  io.open("/flash/tmp/capPort/sla.txt", "w"):close()
  if valid then
    return "OK", "Operation Succeeded"
  else
    return "ERROR", "Operation Failed"
  end
end
