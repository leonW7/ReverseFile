local L0_0
L0_0 = module
L0_0("com.teamf1.bl.billingDesk", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/frontDesk_core")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function gentempUser(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L1_2 = ACCESS_LEVEL
  if L1_2 ~= 2 then
    L1_2 = ACCESS_LEVEL
    if L1_2 == 0 then
      L1_2 = ADMIN_AND_FRONTDESK
      if L1_2 == 0 then
        L1_2 = util
        L1_2 = L1_2.appendDebugOut
        L2_3 = "Detected Unauthorized access for page billingDesk PAGE"
        L1_2(L2_3)
        L1_2 = _UPVALUE0_
        L1_2 = L1_2.UNAUTHORIZED
        return L1_2
      end
    end
  end
  L1_2 = A0_1["billingDesk.cookie"]
  if L1_2 == nil then
    L2_3 = util
    L2_3 = L2_3.appendDebugOut
    L3_4 = "Set : Invalid Cookie"
    L2_3(L3_4)
    L2_3 = _UPVALUE0_
    L2_3 = L2_3.BAD_PARAMETER
    return L2_3
  end
  L2_3, L3_4 = nil, nil
  L4_5 = A0_1["tempUsers.ExpirationDate"]
  if L4_5 ~= nil then
    L4_5 = A0_1["tempUsers.ExpirationDate"]
    if L4_5 ~= "" then
      L4_5 = {}
      L5_6 = {}
      L6_7 = {}
      L7_8 = util
      L7_8 = L7_8.split
      L8_9 = A0_1["tempUsers.ExpirationDate"]
      L9_10 = " "
      L7_8 = L7_8(L8_9, L9_10)
      L4_5 = L7_8
      L7_8 = util
      L7_8 = L7_8.split
      L8_9 = L4_5[1]
      L9_10 = "/"
      L7_8 = L7_8(L8_9, L9_10)
      L5_6 = L7_8
      L7_8 = util
      L7_8 = L7_8.split
      L8_9 = L4_5[2]
      L9_10 = ":"
      L7_8 = L7_8(L8_9, L9_10)
      L6_7 = L7_8
      L7_8 = L6_7[1]
      L8_9 = L4_5[3]
      if L8_9 == "PM" then
        L8_9 = tonumber
        L9_10 = L7_8
        L8_9 = L8_9(L9_10)
        if L8_9 ~= 12 then
          L8_9 = tonumber
          L9_10 = L7_8
          L8_9 = L8_9(L9_10)
          L7_8 = L8_9 + 12
        end
      else
        L8_9 = tonumber
        L9_10 = L7_8
        L8_9 = L8_9(L9_10)
        if L8_9 == 12 then
          L8_9 = tonumber
          L9_10 = L7_8
          L8_9 = L8_9(L9_10)
          L7_8 = L8_9 - 12
        end
      end
      L8_9 = L6_7[2]
      L9_10 = L5_6[3]
      L10_11 = L5_6[1]
      L11_12 = L5_6[2]
      A0_1["tempUsers.ExpirationDate"] = L10_11 .. "/" .. L11_12 .. "/" .. L9_10 .. " " .. L7_8 .. ":" .. L8_9
    end
  end
  L4_5 = _UPVALUE1_
  L4_5 = L4_5.genTmpUser
  L5_6 = A0_1
  L6_7 = L1_2
  L5_6 = L4_5(L5_6, L6_7)
  L3_4 = L5_6
  L2_3 = L4_5
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.SUCCESS
  if L2_3 ~= L4_5 then
    L4_5 = util
    L4_5 = L4_5.appendDebugOut
    L5_6 = "Error in configuring values in page billingDesk PAGE"
    L6_7 = L2_3
    L5_6 = L5_6 .. L6_7
    L4_5(L5_6)
    L4_5 = L2_3
    L5_6 = L1_2
    return L4_5, L5_6
  end
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.SUCCESS
  L5_6 = L3_4
  return L4_5, L5_6
end
function billingProfilesGetAll()
  local L0_13, L1_14
  L0_13 = {}
  L1_14 = nil
  L1_14, L0_13 = _UPVALUE0_.tmpUserProfilesGetAll()
  if L1_14 ~= _UPVALUE1_.SUCCESS then
    return L1_14
  end
  return _UPVALUE1_.SUCCESS, L0_13
end
function covertDateInGUi(A0_15)
  return (_UPVALUE0_.dateToGUI(A0_15))
end
function billingProfileGetCur(A0_16)
  local L1_17, L2_18
  L2_18 = {}
  L1_17, L2_18 = _UPVALUE0_.tmpUserProfilesGetCur(A0_16)
  if L1_17 ~= _UPVALUE1_.SUCCESS then
    return L1_17
  end
  return _UPVALUE1_.SUCCESS, L2_18
end
function billingDeskPreviewGet(A0_19)
  local L1_20, L2_21
  L1_20 = _UPVALUE0_
  L1_20 = L1_20.getPreviewDetails
  L2_21 = A0_19
  L2_21 = L1_20(L2_21)
  return L1_20, L2_21
end
function convertTime(A0_22)
  local L1_23, L2_24
  L1_23 = _UPVALUE0_
  L1_23 = L1_23.timeConv
  L2_24 = A0_22
  L2_24 = L1_23(L2_24)
  return L1_23, L2_24
end
function convertTraffic(A0_25)
  local L1_26, L2_27
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.trafficConv
  L2_27 = A0_25
  L2_27 = L1_26(L2_27)
  return L1_26, L2_27
end
