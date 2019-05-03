local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_maintenance")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function backupConfigurationGet()
  local L0_1, L1_2, L2_3, L3_4
  L0_1, L3_4, L1_2, L2_3 = _UPVALUE0_.backupConfigGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L3_4, L1_2, L2_3
end
function backupConfigurationGetNext(A0_5)
  return _UPVALUE0_.NOT_SUPPORTED
end
function backupConfigurationSet(A0_6)
  local L1_7, L2_8, L3_9, L4_10, L5_11
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = util
    L1_7 = L1_7.appendDebugOut
    L2_8 = "Detected Unauthorized access for page backupConfigurations PAGE"
    L1_7(L2_8)
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.UNAUTHORIZED
    return L1_7
  end
  L1_7 = A0_6["backupConfigurations.cookie"]
  L2_8 = A0_6["backupConfigurations.autoBackup"]
  L3_9 = A0_6["backupConfigurations.encryption"]
  if L1_7 == nil then
    L4_10 = util
    L4_10 = L4_10.appendDebugOut
    L5_11 = "Set : Invalid Cookie"
    L4_10(L5_11)
    L4_10 = _UPVALUE0_
    L4_10 = L4_10.BAD_PARAMETER
    return L4_10
  end
  L4_10, L5_11 = nil, nil
  _UPVALUE1_.start()
  L4_10, L5_11 = _UPVALUE2_.backupConfigSet(L1_7, L2_8, L3_9)
  if L4_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page backupConfigurations PAGE" .. L4_10)
    _UPVALUE1_.abort()
    return L4_10, L1_7
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L5_11
end
function backupConfigurationDelete(A0_12)
  return _UPVALUE0_.NOT_SUPPORTED
end
