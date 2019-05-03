local L0_0
L0_0 = module
L0_0("com.teamf1.bl.routing.rip", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/routing_rip")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function ripSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29
  L13_14 = _UPVALUE0_
  L13_14 = L13_14.ripConfigGet
  L25_26 = L13_14()
  L12_13 = L25_26
  L11_12 = L24_25
  L10_11 = L23_24
  L9_10 = L22_23
  L8_9 = L21_22
  L7_8 = L20_21
  L6_7 = L19_20
  L5_6 = L18_19
  L4_5 = L17_18
  L3_4 = L16_17
  L2_3 = L15_16
  L1_2 = L14_15
  L0_1 = L13_14
  L13_14 = _UPVALUE1_
  L13_14 = L13_14.SUCCESS
  if L0_1 ~= L13_14 then
    return L0_1
  end
  L13_14 = _UPVALUE2_
  L14_15 = tonumber
  L14_15 = L14_15(L15_16)
  L14_15 = L14_15 + 1
  L2_3 = L13_14[L14_15]
  L13_14 = _UPVALUE3_
  L14_15 = tonumber
  L14_15 = L14_15(L15_16)
  L14_15 = L14_15 + 1
  L3_4 = L13_14[L14_15]
  L13_14 = _UPVALUE1_
  L13_14 = L13_14.NIL
  if L7_8 ~= L13_14 then
    L13_14 = _UPVALUE1_
    L13_14 = L13_14.EMPTY
    if L7_8 ~= L13_14 then
      L13_14 = {}
      L14_15 = {
        L15_16,
        L16_17,
        L17_18,
        L18_19
      }
      L18_19 = L12_13
      for L18_19, L19_20 in L15_16(L16_17) do
        L20_21 = {}
        L21_22 = {}
        L22_23 = {}
        L23_24 = util
        L23_24 = L23_24.split
        L24_25 = L19_20
        L25_26 = "@"
        L23_24 = L23_24(L24_25, L25_26)
        L20_21 = L23_24
        L23_24 = util
        L23_24 = L23_24.split
        L24_25 = L20_21[1]
        L25_26 = "/"
        L23_24 = L23_24(L24_25, L25_26)
        L21_22 = L23_24
        L23_24 = util
        L23_24 = L23_24.split
        L24_25 = L20_21[2]
        L25_26 = ":"
        L23_24 = L23_24(L24_25, L25_26)
        L22_23 = L23_24
        L23_24 = L22_23[1]
        L24_25 = nil
        L25_26 = tonumber
        L26_27 = L23_24
        L25_26 = L25_26(L26_27)
        if L25_26 > 11 then
          L24_25 = _UPVALUE4_
          L25_26 = tonumber
          L26_27 = L23_24
          L25_26 = L25_26(L26_27)
          if L25_26 > 12 then
            L25_26 = tonumber
            L26_27 = L23_24
            L25_26 = L25_26(L26_27)
            L23_24 = L25_26 - 12
          end
        else
          L24_25 = _UPVALUE5_
          L25_26 = tonumber
          L26_27 = L23_24
          L25_26 = L25_26(L26_27)
          if L25_26 == 0 then
            L25_26 = tonumber
            L26_27 = L23_24
            L25_26 = L25_26(L26_27)
            L23_24 = L25_26 + 12
          end
        end
        L25_26 = L22_23[2]
        L26_27 = L21_22[1]
        L27_28 = L21_22[2]
        L28_29 = L21_22[3]
        L13_14[L18_19] = L27_28 .. "/" .. L28_29 .. "/" .. L26_27 .. " " .. L23_24 .. ":" .. L25_26 .. " " .. L24_25
      end
      L7_8 = L13_14[1]
      L8_9 = L13_14[2]
      L11_12 = L13_14[3]
      L12_13 = L13_14[4]
    end
  end
  L13_14 = L0_1
  L14_15 = L1_2
  L18_19 = L5_6
  L19_20 = L6_7
  L20_21 = L7_8
  L21_22 = L8_9
  L22_23 = L9_10
  L23_24 = L10_11
  L24_25 = L11_12
  L25_26 = L12_13
  return L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26
end
function ripSectionSet(A0_30)
  local L1_31, L2_32, L3_33, L4_34, L5_35, L6_36, L7_37, L8_38, L9_39, L10_40, L11_41, L12_42, L13_43, L14_44
  L1_31 = ACCESS_LEVEL
  if L1_31 ~= 0 then
    L1_31 = util
    L1_31 = L1_31.appendDebugOut
    L2_32 = "Detected Unauthorized access for page rip"
    L1_31(L2_32)
    L1_31 = _UPVALUE0_
    L1_31 = L1_31.UNAUTHORIZED
    return L1_31
  end
  L1_31 = A0_30["rip.cookie"]
  L2_32 = A0_30["rip.direction"]
  L3_33 = A0_30["rip.version"]
  L4_34 = A0_30["rip.authentication"]
  L5_35 = _UPVALUE1_
  if L2_32 ~= L5_35 then
    L5_35 = _UPVALUE2_
    if L3_33 ~= L5_35 then
      L5_35 = _UPVALUE3_
    elseif L3_33 == L5_35 then
      L5_35 = _UPVALUE4_
      if L4_34 == L5_35 then
        L5_35 = {
          L6_36,
          L7_37,
          L8_38,
          L9_39
        }
        L9_39 = "secondKeyTo"
        for L9_39, L10_40 in L6_36(L7_37) do
          L11_41 = {}
          L12_42 = {}
          L11_41 = L14_44
          L12_42 = L14_44
          if L11_41[3] == _UPVALUE5_ then
            if tonumber(L14_44) ~= 12 then
            end
          elseif tonumber(L14_44) == 12 then
          end
          A0_30["hours." .. L10_40] = L14_44
          A0_30["seconds." .. L10_40] = _UPVALUE6_
          A0_30["minutes." .. L10_40] = L13_43[2]
          A0_30["year." .. L10_40] = L12_42[3]
          A0_30["month." .. L10_40] = L12_42[1]
          A0_30["day." .. L10_40] = L12_42[2]
          if 12 < tonumber(A0_30["month." .. L10_40]) then
            return _UPVALUE0_.BAD_PARAMETER
          end
          if tonumber(A0_30["day." .. L10_40]) > 31 then
            return _UPVALUE0_.BAD_PARAMETER
          end
          if tonumber(A0_30["hours." .. L10_40]) > 23 then
            return _UPVALUE0_.BAD_PARAMETER
          end
          if tonumber(A0_30["minutes." .. L10_40]) > 59 then
            return _UPVALUE0_.BAD_PARAMETER
          end
          dateFormat = A0_30["year." .. L10_40] .. "/" .. A0_30["month." .. L10_40] .. "/" .. A0_30["day." .. L10_40] .. "@" .. A0_30["hours." .. L10_40] .. ":" .. A0_30["minutes." .. L10_40] .. ":" .. A0_30["seconds." .. L10_40]
          A0_30["rip." .. L10_40] = dateFormat
        end
        L7_37.year = L8_38
        L7_37.month = L8_38
        L7_37.day = L8_38
        L7_37.hour = L8_38
        L7_37.min = L8_38
        L9_39 = A0_30["year.firstKeyTo"]
        L8_38.year = L9_39
        L9_39 = A0_30["month.firstKeyTo"]
        L8_38.month = L9_39
        L9_39 = A0_30["day.firstKeyTo"]
        L8_38.day = L9_39
        L9_39 = A0_30["hours.firstKeyTo"]
        L8_38.hour = L9_39
        L9_39 = A0_30["minutes.firstKeyTo"]
        L8_38.min = L9_39
        if L6_36 >= L7_37 then
          return L6_36
        end
        L7_37.year = L8_38
        L7_37.month = L8_38
        L7_37.day = L8_38
        L7_37.hour = L8_38
        L7_37.min = L8_38
        L9_39 = A0_30["year.secondKeyTo"]
        L8_38.year = L9_39
        L9_39 = A0_30["month.secondKeyTo"]
        L8_38.month = L9_39
        L9_39 = A0_30["day.secondKeyTo"]
        L8_38.day = L9_39
        L9_39 = A0_30["hours.secondKeyTo"]
        L8_38.hour = L9_39
        L9_39 = A0_30["minutes.secondKeyTo"]
        L8_38.min = L9_39
        if L6_36 >= L7_37 then
          return L6_36
        end
      end
    end
  end
  L5_35 = A0_30["rip.firstKeyId"]
  L9_39 = A0_30["rip.secondKeyId"]
  L10_40 = A0_30["rip.secondAuthenticationKey"]
  L11_41 = A0_30["rip.secondKeyFrom"]
  L12_42 = A0_30["rip.secondKeyTo"]
  if L1_31 == L13_43 then
    L13_43(L14_44)
    return L13_43
  end
  if L2_32 ~= L13_43 then
    if L3_33 ~= L13_43 then
    elseif L3_33 == L13_43 then
      if L4_34 == L13_43 then
        L13_43(L14_44)
        return L13_43
      end
      if L4_34 == L13_43 then
        if L5_35 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L6_36 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L7_37 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L8_38 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L9_39 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L10_40 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L11_41 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
        if L12_42 == L13_43 then
          L13_43(L14_44)
          return L13_43
        end
      end
    end
  end
  for _FORV_16_, _FORV_17_ in L13_43(L14_44) do
    if _FORV_17_ == L2_32 then
      L2_32 = _FORV_16_ - 1
      break
    end
  end
  for _FORV_16_, _FORV_17_ in L13_43(L14_44) do
    if _FORV_17_ == L3_33 then
      L3_33 = _FORV_16_ - 1
      break
    end
  end
  _UPVALUE9_.start()
  if L13_43 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page rip" .. L13_43)
    _UPVALUE9_.abort()
    return L13_43, L1_31
  end
  _UPVALUE9_.complete()
  _UPVALUE9_.save()
  return _UPVALUE0_.SUCCESS, L14_44
end
