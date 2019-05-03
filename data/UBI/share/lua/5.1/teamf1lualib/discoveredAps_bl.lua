local L0_0
L0_0 = module
L0_0("com.teamf1.bl.wlan.discovredAps", package.seeall)
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/discoveredaps_web")
L0_0 = require
L0_0("teamf1lualib/managedchannellist_web")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.wlan.discoveredAps")
;({}).discoveredapsMACADDRESS = 1
;({}).discoveredapsIPADDRESS = 2
;({}).discoveredapsAGE = 3
;({}).discoveredapsTYPE = 4
;({}).discoveredapsHARDWARETYPE = 5
;({}).discoveredapsSTATUS = 6
;({}).discoveredapsPROFILEID = 7
;({}).discoveredapsPROFILENAME = 8
;({}).discoveredapsRADIO5GHZ = 9
;({}).discoveredapsRADIO2_4GHZ = 10
;({}).discoveredapsCHANNEL5GHZ = 11
;({}).discoveredapsCHANNEL2_4GHZ = 12
;({}).profilechannellistPROFILEID = 1
;({}).profilechannellistNAME = 2
;({}).profilechannellistRADIO2_4CHANNELSCOUNT = 3
;({}).profilechannellistRADIO5CHANNELSCOUNT = 4
;({}).profilechannellistRADIO2_4CHANNELS = 5
;({}).profilechannellistRADIO5CHANNELS = 6
function discoveredAPsGet()
  local L0_1, L1_2, L2_3, L3_4
  L2_3 = {}
  L3_4 = 1
  L0_1, L1_2 = _UPVALUE0_.discoveredapsGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_2) do
    L2_3[L3_4] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE2_) do
      L2_3[L3_4][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_4 = L3_4 + 1
  end
  return L0_1, L2_3
end
function discoveredAPsAcknowledge(A0_5)
  local L1_6
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for discoveredAPs page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  if A0_5 == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L1_6 = _UPVALUE1_.discoveredapsAcknowledge(A0_5)
  if L1_6 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in discoveredAPs page" .. L1_6)
  end
  return L1_6
end
function discoveredAPsDelete()
  local L0_7
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for managedAps page")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L0_7 = _UPVALUE1_.discoveredapsDelete()
  if L0_7 ~= _UPVALUE0_.SUCCESS then
    return L0_7
  end
  return L0_7
end
function discoveredAPsDetailsGet(A0_8)
  local L1_9
end
function profilesChannelsGet()
  local L0_10, L1_11, L2_12, L3_13
  L2_12 = {}
  L3_13 = 1
  L0_10, L1_11, standAloneChannels = _UPVALUE0_.profilechannellistGet(_UPVALUE1_)
  if L0_10 ~= _UPVALUE2_.SUCCESS then
    return L0_10
  end
  for _FORV_7_, _FORV_8_ in pairs(L1_11) do
    L2_12[L3_13] = {}
    for _FORV_12_, _FORV_13_ in pairs(_UPVALUE3_) do
      L2_12[L3_13][_FORV_12_] = _FORV_8_[_FORV_13_]
    end
    L3_13 = L3_13 + 1
  end
  return L0_10, L2_12, standAloneChannels
end
