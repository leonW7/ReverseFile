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
L0_0("teamf1lualib/jumboFrame")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function jumboFrameGet()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.jumboGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L1_2
end
function jumboFrameGetNext(A0_3)
  return _UPVALUE0_.NOT_SUPPORTED
end
function jumboFrameSet(A0_4)
  local L1_5, L2_6, L3_7, L4_8, L5_9, L6_10
  L1_5 = ACCESS_LEVEL
  if L1_5 ~= 0 then
    L1_5 = util
    L1_5 = L1_5.appendDebugOut
    L2_6 = "Detected Unauthorized access for page DUMMY PAGE"
    L1_5(L2_6)
    L1_5 = _UPVALUE0_
    L1_5 = L1_5.UNAUTHORIZED
    return L1_5
  end
  L1_5 = A0_4["jumboFrame.jumboFrame"]
  if L1_5 == nil then
    L2_6 = util
    L2_6 = L2_6.appendDebugOut
    L3_7 = "GetNext : Invalid Cookie"
    L2_6(L3_7)
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.BAD_PARAMETER
    return L2_6
  end
  L2_6, L3_7 = nil, nil
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.start
  L4_8()
  L4_8 = _UPVALUE2_
  L4_8 = L4_8.jumboSet
  L5_9 = L1_5
  L5_9 = L4_8(L5_9)
  L3_7 = L5_9
  L2_6 = L4_8
  L4_8 = _UPVALUE0_
  L4_8 = L4_8.SUCCESS
  if L2_6 ~= L4_8 then
    L4_8 = util
    L4_8 = L4_8.appendDebugOut
    L5_9 = "Error in configuring values in page DUMMY PAGE"
    L6_10 = L2_6
    L5_9 = L5_9 .. L6_10
    L4_8(L5_9)
    L4_8 = _UPVALUE1_
    L4_8 = L4_8.abort
    L4_8()
    L4_8 = L2_6
    L5_9 = curCookie
    return L4_8, L5_9
  end
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.complete
  L4_8()
  L4_8 = _UPVALUE1_
  L4_8 = L4_8.save
  L4_8()
  L4_8 = UNIT_NAME
  if L4_8 ~= "DSR-150N" then
    L4_8 = UNIT_NAME
    if L4_8 ~= "DSR-150" then
      L4_8 = UNIT_NAME
      if L4_8 ~= "DSR-250N" then
        L4_8 = UNIT_NAME
        if L4_8 ~= "DSR-250" then
          L4_8 = "/pfrm2.0/etc/hardwareOffload.lua"
          L5_9 = "/tmp/system.db"
          L6_10 = "/pfrm2.0/bin/lua "
          L6_10 = L6_10 .. L4_8 .. " " .. L5_9
          util.appendDebugOut("Exec: " .. os.execute(L6_10))
        end
      end
    end
  end
  L4_8 = _UPVALUE0_
  L4_8 = L4_8.SUCCESS
  L5_9 = L3_7
  return L4_8, L5_9
end
function jumboFrameDelete(A0_11)
  return _UPVALUE0_.NOT_SUPPORTED
end
function jumboFrameDefaultsGet()
  local L0_12, L1_13, L2_14, L3_15
  L1_13 = "0"
  _UPVALUE0_ = L1_13
  L1_13 = _UPVALUE1_
  L1_13 = L1_13.SUCCESS
  L2_14 = 0
  L3_15 = L0_12
  return L1_13, L2_14, L3_15
end
function jumboFrameCreate(A0_16)
  return _UPVALUE0_.NOT_SUPPORTED
end
