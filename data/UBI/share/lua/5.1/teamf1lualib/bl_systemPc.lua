local L0_0
L0_0 = module
L0_0("com.teamf1.bl.system.maintenance", package.seeall)
L0_0 = require
L0_0("upgradeFileCheck")
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/system_maintenance")
L0_0 = require
L0_0("teamf1lualib/usb_returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
function currentFirmwareInformationGet()
  local L0_1, L1_2
  returnCode, L0_1, firmVersion, firmDate = _UPVALUE0_.currentFirmwareGetAll()
  if returnCode ~= _UPVALUE1_.SUCCESS then
    return returnCode
  end
  return returnCode, L0_1, firmVersion, firmDate
end
function firmwareSet(A0_3)
  local L1_4, L2_5
  L1_4 = A0_3.filename
  L2_5 = "1"
  if L1_4 == _UPVALUE0_.NIL then
    util.appenDebugOut("GetNext : Invalid firmware to Upgrade ")
    return _UPVALUE0_.BAD_PARAMETER
  end
  returnCode, cookie = _UPVALUE1_.firmwareUpgradeSet(L2_5, L1_4)
  if returnCode ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in systemPc page" .. returnCode)
    return returnCode
  end
  return returnCode, cookie
end
function firmwareCheck(A0_6)
  local L1_7, L2_8
  L1_7 = A0_6.filename
  L2_8 = _UPVALUE0_
  L2_8 = L2_8.NIL
  if L1_7 == L2_8 then
    L2_8 = util
    L2_8 = L2_8.appenDebugOut
    L2_8("GetNext : Invalid firmware to Upgrade ")
    L2_8 = _UPVALUE0_
    L2_8 = L2_8.BAD_PARAMETER
    return L2_8
  end
  L2_8 = _UPVALUE1_
  L2_8 = L2_8.upgradeFile
  L2_8 = L2_8(L1_7)
  if L2_8 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Configuring values in systemPc page" .. L2_8)
    if L2_8 == -1 then
      return _UPVALUE2_.INVALID_FIRMWARE
    elseif L2_8 == 2 then
      return _UPVALUE2_.FIRMWARE_MISMATCH
    elseif L2_8 == 3 then
      return _UPVALUE2_.UPGRADE_DENIED
    else
      return L2_8
    end
  end
  return _UPVALUE2_.FIRMWARE_SUCCESS, cookie
end
