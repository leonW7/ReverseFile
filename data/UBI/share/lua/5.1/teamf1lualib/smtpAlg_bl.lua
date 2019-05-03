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
L0_0("teamf1lualib/fwSmtpAlg")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
function smtpAlgSectionGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L1_2, L2_3, L3_4 = fw.core.smtpAlg.Get()
  if L0_1 ~= returnCodes.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2, L2_3, L3_4
end
function smtpAlgSectionSet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11
  L1_6 = ACCESS_LEVEL
  if L1_6 ~= 0 then
    L1_6 = util
    L1_6 = L1_6.appendDebugOut
    L2_7 = "Detected Unauthorized access for page smtpAlg"
    L1_6(L2_7)
    L1_6 = returnCodes
    L1_6 = L1_6.UNAUTHORIZED
    return L1_6
  end
  L1_6 = A0_5["smtpAlg.cookie"]
  L2_7 = A0_5["smtpAlg.smtpAlgStatus"]
  L3_8 = A0_5["smtpAlg.port"]
  if L1_6 == nil then
    L4_9 = util
    L4_9 = L4_9.appendDebugOut
    L5_10 = "Set : Invalid Cookie"
    L4_9(L5_10)
    L4_9 = returnCodes
    L4_9 = L4_9.BAD_PARAMETER
    return L4_9
  end
  if L2_7 == nil then
    L4_9 = util
    L4_9 = L4_9.appendDebugOut
    L5_10 = "GetNext : Invalid Cookie"
    L4_9(L5_10)
    L4_9 = returnCodes
    L4_9 = L4_9.BAD_PARAMETER
    return L4_9
  end
  L4_9, L5_10 = nil, nil
  L6_11 = _UPVALUE0_
  L6_11 = L6_11.start
  L6_11()
  L6_11 = fw
  L6_11 = L6_11.core
  L6_11 = L6_11.smtpAlg
  L6_11 = L6_11.edit
  L5_10, L6_11 = L2_7, L6_11(L2_7, L3_8)
  L4_9 = L6_11
  L6_11 = returnCodes
  L6_11 = L6_11.SUCCESS
  if L4_9 ~= L6_11 then
    L6_11 = util
    L6_11 = L6_11.appendDebugOut
    L6_11("Error in configuring values in page smtpAlg" .. L4_9)
    L6_11 = _UPVALUE0_
    L6_11 = L6_11.abort
    L6_11()
    L6_11 = L4_9
    return L6_11, L1_6
  end
  L6_11 = _UPVALUE0_
  L6_11 = L6_11.complete
  L6_11()
  L6_11 = _UPVALUE0_
  L6_11 = L6_11.save
  L6_11()
  L6_11 = PFRM_BIN_PATH
  L6_11 = L6_11 .. " " .. HW_OFFLOAD_SCRIPT .. " " .. SYSTEM_DB_FILE_NAME
  util.appendDebugOut("Exec: " .. os.execute(L6_11))
  return L4_9, L5_10
end
