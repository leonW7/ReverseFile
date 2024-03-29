local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wireless.radio", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0("teamf1lualib/wireless_radio")
L0_0 = require
L0_0("teamf1lualib/wireless_accessPoints")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).badParam = "BAD PARAMETER : "
;({}).dbError = "Not able to get values from the database."
;({}).opSuccess = "Operation Succeeded."
;({}).opFailed = "Operation Failed."
;({}).errCountry = "Invalid Country Code."
;({}).errchanWidth = "Invalid Channel Spacing."
;({}).errctlSideBand = "Invalid Control Side Band."
;({}).errband = "Invalid Band."
;({}).erropMode = "Invalid operational Mode."
;({}).errconfiguredChannel = "Invalid channel configured."
;({}).errtxRate = "Invalid Transmission Rate."
;({}).errtxPower = "Invalid Transmission Power."
function wirelessRadioConfigGet(A0_1)
  local L1_2, L2_3, L3_4
  L1_2 = _UPVALUE0_
  L1_2 = L1_2.FAILURE
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NIL
  L3_4 = {}
  L1_2, L2_3, L3_4 = _UPVALUE1_.radioConfigGet(A0_1)
  if L1_2 ~= _UPVALUE0_.SUCCESS then
    return L1_2, L2_3, L3_4
  end
  return L1_2, L2_3, L3_4
end
function wirelessRadioConfigSet(A0_5)
  local L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17
  L1_6 = _UPVALUE0_
  L1_6 = L1_6.FAILURE
  L2_7 = _UPVALUE0_
  L2_7 = L2_7.NIL
  L3_8 = A0_5["dot11Radio.band"]
  L4_9 = A0_5["dot11Radio.opMode"]
  L5_10 = A0_5["dot11Radio11n.chanWidth"]
  L6_11 = A0_5["dot11Radio11n.ctlSideBand"]
  L7_12 = A0_5["dot11Radio.configuredChannel"]
  L8_13 = A0_5["dot11Radio.txRate"]
  L9_14 = A0_5["dot11GlobalConfig.country"]
  L10_15 = A0_5["dot11Radio.txPower"]
  L11_16 = A0_5["dot11Radio.dothEnabled"]
  L12_17 = A0_5["dot11Radio.radioNumber"]
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_6 = _UPVALUE1_.is_WDS_Enabled(L12_17)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    return L1_6
  end
  if A0_5["dot11Radio.band"] == _UPVALUE0_.NIL or A0_5["dot11Radio.band"] == "" or A0_5["dot11Radio.band"] == " " then
    return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.errband
  end
  L3_8 = A0_5["dot11Radio.band"]
  if A0_5["dot11Radio.opMode"] == _UPVALUE0_.NIL or A0_5["dot11Radio.opMode"] == "" or A0_5["dot11Radio.opMode"] == " " then
    return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.erropMode
  end
  L4_9 = A0_5["dot11Radio.opMode"]
  if A0_5["dot11Radio11n.chanWidth"] == _UPVALUE0_.NIL or A0_5["dot11Radio11n.chanWidth"] == "" or A0_5["dot11Radio11n.chanWidth"] == " " or A0_5["dot11Radio11n.chanWidth"] ~= "20" and A0_5["dot11Radio11n.chanWidth"] ~= "40" and A0_5["dot11Radio11n.chanWidth"] ~= "2040" and A0_5["dot11Radio11n.chanWidth"] ~= "80" then
    return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.errchanWidth
  end
  L5_10 = A0_5["dot11Radio11n.chanWidth"]
  if A0_5["dot11Radio11n.ctlSideBand"] == _UPVALUE0_.NIL or A0_5["dot11Radio11n.ctlSideBand"] == "" or A0_5["dot11Radio11n.ctlSideBand"] == " " or A0_5["dot11Radio11n.ctlSideBand"] == "Lower" and A0_5["dot11Radio11n.ctlSideBand"] == "Upper" then
    A0_5["dot11Radio11n.ctlSideBand"] = ""
  end
  L6_11 = A0_5["dot11Radio11n.ctlSideBand"]
  if A0_5["dot11Radio.configuredChannel"] == _UPVALUE0_.NIL or A0_5["dot11Radio.configuredChannel"] == "" or A0_5["dot11Radio.configuredChannel"] == " " then
    return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.errconfiguredChannel
  end
  L7_12 = A0_5["dot11Radio.configuredChannel"]
  if A0_5["dot11Radio.txRate"] == _UPVALUE0_.NIL or A0_5["dot11Radio.txRate"] == "" or A0_5["dot11Radio.txRate"] == " " then
    return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.errtxRate
  end
  L8_13 = A0_5["dot11Radio.txRate"]
  if UNIT_NAME ~= "DSR-250N" then
    if A0_5["dot11Radio.txPower"] == _UPVALUE0_.NIL or A0_5["dot11Radio.txPower"] == "" or A0_5["dot11Radio.txPower"] == " " then
      return L1_6, _UPVALUE2_.badParam .. _UPVALUE2_.errtxPower
    end
    L10_15 = A0_5["dot11Radio.txPower"]
  end
  if A0_5["dot11Radio.dothEnabled"] ~= _UPVALUE0_.NIL then
    L11_16 = A0_5["dot11Radio.dothEnabled"]
  end
  _UPVALUE3_.start()
  L1_6, L2_7 = _UPVALUE4_.radioConfigSet(L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in deleting the profiles.")
    _UPVALUE3_.abort()
    return L1_6
  end
  L1_6 = _UPVALUE0_.SUCCESS
  _UPVALUE3_.complete()
  _UPVALUE3_.save()
  return L1_6, L2_7
end
function wirelessTXPowerGet(A0_18)
  local L1_19, L2_20, L3_21
  L1_19 = _UPVALUE0_
  L1_19 = L1_19.FAILURE
  L2_20 = _UPVALUE0_
  L2_20 = L2_20.NIL
  L3_21 = _UPVALUE0_
  L3_21 = L3_21.NIL
  L1_19, L2_20, L3_21 = _UPVALUE1_.radioTXPowerGet(A0_18)
  if L1_19 ~= _UPVALUE0_.SUCCESS then
    L3_21 = _UPVALUE0_.NIL
    return L3_21
  end
  return L3_21
end
