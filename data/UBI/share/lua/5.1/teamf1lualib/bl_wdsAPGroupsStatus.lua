local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.wdsgroupapstatus", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/wdsgroupapstatus_web")
L0_0 = require
L0_0("teamf1lualib/wlan_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
DEVICE_TYPE = "wdsgroupapstatusROOTDEVICETYPE"
PASSWD_STATUS = "wdsgroupapstatusWDSPASSWORDPROPOGATION"
function wdsAPGroupStatusGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = L4_5
  L1_2 = L3_4
  if L1_2 ~= L3_4 then
    return L1_2
  end
  for L6_7, L7_8 in L3_4(L4_5) do
    for _FORV_11_, _FORV_12_ in pairs(L7_8) do
      if DEVICE_TYPE == _FORV_11_ then
        L7_8[DEVICE_TYPE] = _UPVALUE2_[_FORV_12_ + _UPVALUE3_]
      elseif PASSWD_STATUS == _FORV_11_ then
        L7_8[PASSWD_STATUS] = _UPVALUE4_[_FORV_12_ + _UPVALUE3_]
      end
    end
  end
  return L3_4, L4_5
end
function wdsGroupPasswordSet(A0_9)
  local L1_10
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for wdsAPGroupsStatus page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_9.password == _UPVALUE0_.NIL or A0_9.groupId == _UPVALUE0_.NIL then
    util.appendDebugOut("Set : Invalid Data")
    return _UPVALUE0_.BAD_PARAMETER
  end
  if string.len(A0_9.password) < _UPVALUE1_ or string.len(A0_9.password) > _UPVALUE2_ then
    return _UPVALUE3_.WDS_PASSWORD_LENGTH
  end
  A0_9.groupId = tonumber(A0_9.groupId)
  L1_10 = _UPVALUE4_.wdsgroupapstatusPasswordSet(A0_9)
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Getting values for the wdsAPGroupsStatus page" .. L1_10)
    return _UPVALUE0_.FAILURE
  end
  return L1_10
end
