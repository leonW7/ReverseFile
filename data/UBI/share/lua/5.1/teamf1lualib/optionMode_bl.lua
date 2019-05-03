local L0_0, L1_1, L2_2, L3_3, L4_4
L0_0 = module
L1_1 = "com.teamf1.bl.wan.multiwan"
L2_2 = package
L2_2 = L2_2.seeall
L0_0(L1_1, L2_2)
L0_0 = require
L1_1 = "teamf1lualib/db"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/util"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/validations"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/returnCodes"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/wan_multiwan"
L0_0(L1_1)
L0_0 = require
L1_1 = "teamf1lualib/management_config"
L0_0(L1_1)
L0_0 = require
L1_1 = "com.teamf1.core.config"
L0_0 = L0_0(L1_1)
L1_1 = require
L2_2 = "com.teamf1.core.wan.multiwan"
L1_1 = L1_1(L2_2)
L2_2 = require
L3_3 = "com.teamf1.core.returnCodes"
L2_2 = L2_2(L3_3)
L3_3, L4_4 = nil, nil
HW_OFFLOAD_SCRIPT = "/pfrm2.0/etc/hardwareOffload.lua"
SYSTEM_DB_FILE_NAME = "/tmp/system.db"
PFRM_BIN_PATH = "/pfrm2.0/bin/lua"
if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
  require("teamf1lualib/wan_threeg")
  L3_3 = require("com.teamf1.core.wan.threeg")
else
  require("teamf1lualib/wan_ipAliasing")
  L4_4 = require("com.teamf1.core.wan.ipaliasing")
end
function optionModeSectionGet()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21
  L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L14_19 = _UPVALUE0_.autoRollOverGroupGet()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    return L0_5
  end
  L0_5, L1_6, L7_12, L3_8, L8_13, L9_14, L5_10, L6_11, L12_17, L13_18, L15_20, L16_21 = _UPVALUE0_.loadbalanceGroupGet()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    return L0_5
  end
  L0_5, L1_6, L10_15 = _UPVALUE0_.defaultWanPortGet()
  if L0_5 ~= _UPVALUE1_.SUCCESS then
    return L0_5
  end
  if L7_12 == _UPVALUE2_ then
    L7_12 = _UPVALUE3_[1]
  elseif L7_12 == _UPVALUE4_ or L7_12 == _UPVALUE5_ then
    if L7_12 == _UPVALUE4_ then
      L11_16 = _UPVALUE6_[1]
    elseif L7_12 == _UPVALUE5_ then
      L11_16 = _UPVALUE6_[2]
    end
    L7_12 = _UPVALUE3_[2]
  elseif L7_12 == _UPVALUE7_ then
    L7_12 = _UPVALUE3_[3]
  end
  if L10_15 == _UPVALUE8_ then
    L10_15 = _UPVALUE9_[1]
  elseif L10_15 == _UPVALUE10_ then
    L10_15 = _UPVALUE9_[2]
  elseif L10_15 == _UPVALUE11_ then
    L10_15 = _UPVALUE9_[3]
  end
  if L2_7 == _UPVALUE8_ then
    L2_7 = _UPVALUE9_[1]
  elseif L2_7 == _UPVALUE10_ then
    L2_7 = _UPVALUE9_[2]
  elseif L2_7 == _UPVALUE11_ then
    L2_7 = _UPVALUE9_[3]
  end
  if L3_8 == _UPVALUE12_ then
    L3_8 = _UPVALUE13_[1]
  elseif L3_8 == _UPVALUE14_ then
    L3_8 = _UPVALUE13_[2]
  elseif L3_8 == _UPVALUE15_ then
    L3_8 = _UPVALUE13_[3]
  elseif L3_8 == _UPVALUE16_ then
    L3_8 = _UPVALUE13_[4]
  end
  return L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21
end
function optionModeSectionSet(A0_22)
  local L1_23, L2_24, L3_25, L4_26, L5_27, L6_28, L7_29, L8_30, L9_31, L10_32, L11_33, L12_34, L13_35, L14_36, L15_37, L16_38, L17_39
  L1_23 = ACCESS_LEVEL
  if L1_23 ~= 0 then
    L1_23 = util
    L1_23 = L1_23.appendDebugOut
    L2_24 = "Detected Unauthorized access for page optionMode"
    L1_23(L2_24)
    L1_23 = _UPVALUE0_
    L1_23 = L1_23.UNAUTHORIZED
    return L1_23
  end
  L1_23 = A0_22["optionMode.cookie"]
  L2_24 = _UPVALUE1_
  L3_25 = A0_22["optionMode.multiWanMode"]
  L4_26 = A0_22["optionMode.loadbalanceMode"]
  L5_27 = nil
  L6_28 = _UPVALUE0_
  L6_28 = L6_28.NIL
  if L1_23 == L6_28 then
    L6_28 = util
    L6_28 = L6_28.appendDebugOut
    L7_29 = "Set : Invalid Cookie"
    L6_28(L7_29)
    L6_28 = _UPVALUE0_
    L6_28 = L6_28.BAD_PARAMETER
    return L6_28
  end
  L6_28 = _UPVALUE0_
  L6_28 = L6_28.NIL
  if L3_25 == L6_28 then
    L6_28 = util
    L6_28 = L6_28.appendDebugOut
    L7_29 = "Set : Invalid multiWanMode"
    L6_28(L7_29)
    L6_28 = _UPVALUE0_
    L6_28 = L6_28.BAD_PARAMETER
    return L6_28
  end
  L6_28 = PRODUCT_ID
  if L6_28 ~= "DSR-1000AC_Ax" then
    L6_28 = PRODUCT_ID
    if L6_28 ~= "DSR-500AC_Ax" then
      L6_28 = PRODUCT_ID
      if L6_28 ~= "DSR-1000_Bx" then
        L6_28 = PRODUCT_ID
      end
    end
  elseif L6_28 == "DSR-500_Bx" then
    L6_28 = _UPVALUE2_
    L6_28 = L6_28[3]
    if L3_25 ~= L6_28 then
      L6_28 = _UPVALUE3_
      L6_28 = L6_28.multiWanModePPPSubnetCheck
      L7_29 = L3_25
      L6_28 = L6_28(L7_29)
      returnCode = L6_28
      L6_28 = returnCode
      L7_29 = _UPVALUE0_
      L7_29 = L7_29.SUCCESS
      if L6_28 ~= L7_29 then
        L6_28 = returnCode
        return L6_28
      end
    end
  end
  L6_28 = _UPVALUE2_
  L6_28 = L6_28[1]
  if L3_25 == L6_28 then
    L3_25 = _UPVALUE4_
  else
    L6_28 = _UPVALUE2_
    L6_28 = L6_28[2]
    if L3_25 == L6_28 then
      L6_28 = _UPVALUE5_
      L6_28 = L6_28[1]
      if L4_26 == L6_28 then
        L3_25 = _UPVALUE6_
      else
        L6_28 = _UPVALUE5_
        L6_28 = L6_28[2]
        if L4_26 == L6_28 then
          L3_25 = _UPVALUE7_
        end
      end
    else
      L6_28 = _UPVALUE2_
      L6_28 = L6_28[3]
      if L3_25 == L6_28 then
        L3_25 = _UPVALUE8_
      end
    end
  end
  L6_28 = UNIT_NAME
  if L6_28 ~= "DSR-250N" then
    L6_28 = UNIT_NAME
    if L6_28 ~= "DSR-250" then
      L6_28 = UNIT_NAME
      if L6_28 ~= "DSR-150N" then
        L6_28 = UNIT_NAME
      end
    end
  elseif L6_28 == "DSR-150N" then
    L6_28 = _UPVALUE9_
    L6_28 = L6_28.configPortGet
    L7_29 = L6_28()
    L5_27 = L7_29
    returnCode = L6_28
    L6_28 = returnCode
    L7_29 = _UPVALUE0_
    L7_29 = L7_29.SUCCESS
    if L6_28 ~= L7_29 then
      L6_28 = returnCode
      return L6_28
    end
    if L5_27 ~= "WAN2" then
      L6_28 = _UPVALUE4_
      if L3_25 ~= L6_28 then
        L6_28 = _UPVALUE6_
        if L3_25 ~= L6_28 then
          L6_28 = _UPVALUE7_
          if L3_25 ~= L6_28 then
            L6_28 = _UPVALUE8_
            if L3_25 == L6_28 then
              L6_28 = A0_22["optionMode.defaultWanPort"]
            end
          end
        end
      elseif L6_28 == "2" then
        L6_28 = _UPVALUE0_
        L6_28 = L6_28.WAN_MODE_CANNOT_BE_CHANGED
        return L6_28
      end
    end
  end
  L6_28 = _UPVALUE4_
  if L3_25 == L6_28 then
    L6_28 = A0_22["optionMode.autoRollover_primaryWanPort"]
    L7_29 = A0_22["optionMode.autoRollover_secondaryWanPort"]
    L8_30 = A0_22["optionMode.autoRollover_failureDetectionMethod"]
    L9_31 = nil
    L10_32 = _UPVALUE10_
    L10_32 = L10_32[1]
    if L6_28 == L10_32 then
      L10_32 = _UPVALUE11_
      L10_32 = L10_32[3]
      if L8_30 == L10_32 then
        L9_31 = A0_22["optionMode.autoRollover_dns_ipAddress1"]
      end
    else
      L10_32 = _UPVALUE10_
      L10_32 = L10_32[1]
      if L6_28 == L10_32 then
        L10_32 = _UPVALUE11_
        L10_32 = L10_32[4]
        if L8_30 == L10_32 then
          L9_31 = A0_22["optionMode.autoRollover_ping_ipAddress1"]
        end
      else
        L10_32 = _UPVALUE10_
        L10_32 = L10_32[2]
        if L6_28 == L10_32 then
          L10_32 = _UPVALUE11_
          L10_32 = L10_32[3]
          if L8_30 == L10_32 then
            L9_31 = A0_22["optionMode.autoRollover_dns_ipAddress2"]
          end
        else
          L10_32 = _UPVALUE10_
          L10_32 = L10_32[2]
          if L6_28 == L10_32 then
            L10_32 = _UPVALUE11_
            L10_32 = L10_32[4]
            if L8_30 == L10_32 then
              L9_31 = A0_22["optionMode.autoRollover_ping_ipAddress2"]
            end
          else
            L10_32 = _UPVALUE10_
            L10_32 = L10_32[3]
            if L6_28 == L10_32 then
              L10_32 = _UPVALUE11_
              L10_32 = L10_32[3]
              if L8_30 == L10_32 then
                L9_31 = A0_22["optionMode.autoRollover_dns_ipAddress3"]
              end
            else
              L10_32 = _UPVALUE10_
              L10_32 = L10_32[3]
              if L6_28 == L10_32 then
                L10_32 = _UPVALUE11_
                L10_32 = L10_32[4]
                if L8_30 == L10_32 then
                  L9_31 = A0_22["optionMode.autoRollover_ping_ipAddress3"]
                end
              end
            end
          end
        end
      end
    end
    L10_32 = A0_22["optionMode.autoRollover_retryInterval"]
    L11_33 = A0_22["optionMode.autoRollover_maxFailures"]
    L12_34 = _UPVALUE0_
    L12_34 = L12_34.NIL
    if L6_28 == L12_34 then
      L12_34 = util
      L12_34 = L12_34.appendDebugOut
      L13_35 = "Set : Invalid primaryWanPort"
      L12_34(L13_35)
      L12_34 = _UPVALUE0_
      L12_34 = L12_34.BAD_PARAMETER
      return L12_34
    end
    L12_34 = _UPVALUE0_
    L12_34 = L12_34.NIL
    if L8_30 == L12_34 then
      L12_34 = util
      L12_34 = L12_34.appendDebugOut
      L13_35 = "Set : Invalid failureDetectionMethod"
      L12_34(L13_35)
      L12_34 = _UPVALUE0_
      L12_34 = L12_34.BAD_PARAMETER
      return L12_34
    end
    L12_34 = _UPVALUE11_
    L12_34 = L12_34[3]
    if L8_30 ~= L12_34 then
      L12_34 = _UPVALUE11_
      L12_34 = L12_34[4]
    elseif L8_30 == L12_34 then
      L12_34 = _UPVALUE0_
      L12_34 = L12_34.NIL
      if L9_31 == L12_34 then
        L12_34 = util
        L12_34 = L12_34.appendDebugOut
        L13_35 = "Set : Invalid ipAddress"
        L12_34(L13_35)
        L12_34 = _UPVALUE0_
        L12_34 = L12_34.BAD_PARAMETER
        return L12_34
      end
    end
    L12_34 = _UPVALUE0_
    L12_34 = L12_34.NIL
    if L10_32 == L12_34 then
      L12_34 = util
      L12_34 = L12_34.appendDebugOut
      L13_35 = "Set : Invalid retryInterval"
      L12_34(L13_35)
      L12_34 = _UPVALUE0_
      L12_34 = L12_34.BAD_PARAMETER
      return L12_34
    end
    L12_34 = _UPVALUE0_
    L12_34 = L12_34.NIL
    if L11_33 == L12_34 then
      L12_34 = util
      L12_34 = L12_34.appendDebugOut
      L13_35 = "Set : Invalid maxFailures"
      L12_34(L13_35)
      L12_34 = _UPVALUE0_
      L12_34 = L12_34.BAD_PARAMETER
      return L12_34
    end
    L12_34 = _UPVALUE11_
    L12_34 = L12_34[1]
    if L8_30 == L12_34 then
      L8_30 = _UPVALUE12_
    else
      L12_34 = _UPVALUE11_
      L12_34 = L12_34[2]
      if L8_30 == L12_34 then
        L8_30 = _UPVALUE13_
      else
        L12_34 = _UPVALUE11_
        L12_34 = L12_34[3]
        if L8_30 == L12_34 then
          L8_30 = _UPVALUE14_
        else
          L12_34 = _UPVALUE11_
          L12_34 = L12_34[4]
          if L8_30 == L12_34 then
            L8_30 = _UPVALUE15_
          end
        end
      end
    end
    L12_34 = _UPVALUE10_
    L12_34 = L12_34[1]
    if L6_28 == L12_34 then
      L6_28 = _UPVALUE16_
    else
      L12_34 = _UPVALUE10_
      L12_34 = L12_34[2]
      if L6_28 == L12_34 then
        L6_28 = _UPVALUE17_
      else
        L12_34 = _UPVALUE10_
        L12_34 = L12_34[3]
        if L6_28 == L12_34 then
          L6_28 = _UPVALUE18_
        end
      end
    end
    L12_34, L13_35 = nil, nil
    L14_36 = _UPVALUE19_
    L14_36 = L14_36.start
    L14_36()
    L14_36 = _UPVALUE9_
    L14_36 = L14_36.multiWanModeSet
    L15_37 = L1_23
    L16_38 = L3_25
    L15_37 = L14_36(L15_37, L16_38)
    L13_35 = L15_37
    L12_34 = L14_36
    L14_36 = _UPVALUE0_
    L14_36 = L14_36.SUCCESS
    if L12_34 ~= L14_36 then
      L14_36 = util
      L14_36 = L14_36.appendDebugOut
      L15_37 = "Error in configuring values in page OptionMode"
      L16_38 = L12_34
      L15_37 = L15_37 .. L16_38
      L14_36(L15_37)
      L14_36 = _UPVALUE19_
      L14_36 = L14_36.abort
      L14_36()
      L14_36 = L12_34
      L15_37 = L1_23
      return L14_36, L15_37
    end
    L14_36 = _UPVALUE9_
    L14_36 = L14_36.multiWanModeSet
    L15_37 = L2_24
    L16_38 = L3_25
    L15_37 = L14_36(L15_37, L16_38)
    L13_35 = L15_37
    L12_34 = L14_36
    L14_36 = _UPVALUE0_
    L14_36 = L14_36.SUCCESS
    if L12_34 ~= L14_36 then
      L14_36 = util
      L14_36 = L14_36.appendDebugOut
      L15_37 = "Error in configuring values in page OptionMode"
      L16_38 = L12_34
      L15_37 = L15_37 .. L16_38
      L14_36(L15_37)
      L14_36 = _UPVALUE19_
      L14_36 = L14_36.abort
      L14_36()
      L14_36 = L12_34
      L15_37 = L1_23
      return L14_36, L15_37
    end
    L14_36 = _UPVALUE9_
    L14_36 = L14_36.autoRollOverGroupSet
    L15_37 = L1_23
    L16_38 = L6_28
    L17_39 = L8_30
    L15_37 = L14_36(L15_37, L16_38, L17_39, L9_31, L10_32, L11_33, L7_29)
    L13_35 = L15_37
    L12_34 = L14_36
    L14_36 = _UPVALUE0_
    L14_36 = L14_36.SUCCESS
    if L12_34 ~= L14_36 then
      L14_36 = util
      L14_36 = L14_36.appendDebugOut
      L15_37 = "Error in configuring values in page OptionMode"
      L16_38 = L12_34
      L15_37 = L15_37 .. L16_38
      L14_36(L15_37)
      L14_36 = _UPVALUE19_
      L14_36 = L14_36.abort
      L14_36()
      L14_36 = L12_34
      L15_37 = L1_23
      return L14_36, L15_37
    end
    L14_36 = _UPVALUE9_
    L14_36 = L14_36.autoRollOverGroupSet
    L15_37 = L2_24
    L16_38 = L6_28
    L17_39 = L8_30
    L15_37 = L14_36(L15_37, L16_38, L17_39, L9_31, L10_32, L11_33, L7_29)
    L13_35 = L15_37
    L12_34 = L14_36
    L14_36 = _UPVALUE0_
    L14_36 = L14_36.SUCCESS
    if L12_34 ~= L14_36 then
      L14_36 = util
      L14_36 = L14_36.appendDebugOut
      L15_37 = "Error in configuring values in page OptionMode"
      L16_38 = L12_34
      L15_37 = L15_37 .. L16_38
      L14_36(L15_37)
      L14_36 = _UPVALUE19_
      L14_36 = L14_36.abort
      L14_36()
      L14_36 = L12_34
      L15_37 = L1_23
      return L14_36, L15_37
    end
  else
    L6_28 = _UPVALUE6_
    if L3_25 ~= L6_28 then
      L6_28 = _UPVALUE7_
    else
      if L3_25 == L6_28 then
        L6_28 = A0_22["optionMode.loadBalance_failureDetectionMethod"]
        L7_29, L8_30, L9_31 = nil, nil, nil
        L10_32 = _UPVALUE11_
        L10_32 = L10_32[3]
        if L6_28 == L10_32 then
          L7_29 = A0_22["optionMode.loadBalance_dns_wan1IpAddress"]
          L8_30 = A0_22["optionMode.loadBalance_dns_wan2IpAddress"]
          L9_31 = A0_22["optionMode.loadBalance_dns_wan3IpAddress"]
        else
          L10_32 = _UPVALUE11_
          L10_32 = L10_32[4]
          if L6_28 == L10_32 then
            L7_29 = A0_22["optionMode.loadBalance_ping_wan1IpAddress"]
            L8_30 = A0_22["optionMode.loadBalance_ping_wan2IpAddress"]
            L9_31 = A0_22["optionMode.loadBalance_ping_wan3IpAddress"]
          end
        end
        L10_32 = A0_22["optionMode.loadBalance_retryInterval"]
        L11_33 = A0_22["optionMode.loadBalance_maxFailures"]
        L12_34 = A0_22["optionMode.loadBalance_loadTolerance"]
        L13_35 = A0_22["optionMode.loadBalance_maxBanwidth"]
        L14_36 = A0_22["optionMode.Unit"]
        L15_37 = _UPVALUE11_
        L15_37 = L15_37[1]
        if L6_28 == L15_37 then
          L10_32 = _UPVALUE20_
          L11_33 = _UPVALUE21_
        end
        L15_37 = _UPVALUE0_
        L15_37 = L15_37.NIL
        if L6_28 == L15_37 then
          L15_37 = util
          L15_37 = L15_37.appendDebugOut
          L16_38 = "Set : Invalid failureDetectionMethod"
          L15_37(L16_38)
          L15_37 = _UPVALUE0_
          L15_37 = L15_37.BAD_PARAMETER
          return L15_37
        end
        L15_37 = _UPVALUE11_
        L15_37 = L15_37[3]
        if L6_28 ~= L15_37 then
          L15_37 = _UPVALUE11_
          L15_37 = L15_37[4]
        elseif L6_28 == L15_37 then
          L15_37 = _UPVALUE0_
          L15_37 = L15_37.NIL
          if L7_29 == L15_37 then
            L15_37 = util
            L15_37 = L15_37.appendDebugOut
            L16_38 = "Set : Invalid wan1IpAddress"
            L15_37(L16_38)
            L15_37 = _UPVALUE0_
            L15_37 = L15_37.BAD_PARAMETER
            return L15_37
          end
          L15_37 = _UPVALUE0_
          L15_37 = L15_37.NIL
          if L8_30 == L15_37 then
            L15_37 = util
            L15_37 = L15_37.appendDebugOut
            L16_38 = "Set : Invalid wan2IpAddress"
            L15_37(L16_38)
            L15_37 = _UPVALUE0_
            L15_37 = L15_37.BAD_PARAMETER
            return L15_37
          end
        end
        L15_37 = _UPVALUE11_
        L15_37 = L15_37[1]
        if L6_28 ~= L15_37 then
          L15_37 = _UPVALUE0_
          L15_37 = L15_37.NIL
          if L10_32 == L15_37 then
            L15_37 = util
            L15_37 = L15_37.appendDebugOut
            L16_38 = "Set : Invalid retryInterval"
            L15_37(L16_38)
            L15_37 = _UPVALUE0_
            L15_37 = L15_37.BAD_PARAMETER
            return L15_37
          end
          L15_37 = _UPVALUE0_
          L15_37 = L15_37.NIL
          if L11_33 == L15_37 then
            L15_37 = util
            L15_37 = L15_37.appendDebugOut
            L16_38 = "Set : Invalid maxFailures"
            L15_37(L16_38)
            L15_37 = _UPVALUE0_
            L15_37 = L15_37.BAD_PARAMETER
            return L15_37
          end
        end
        L15_37 = _UPVALUE11_
        L15_37 = L15_37[1]
        if L6_28 == L15_37 then
          L6_28 = _UPVALUE12_
        else
          L15_37 = _UPVALUE11_
          L15_37 = L15_37[2]
          if L6_28 == L15_37 then
            L6_28 = _UPVALUE13_
          else
            L15_37 = _UPVALUE11_
            L15_37 = L15_37[3]
            if L6_28 == L15_37 then
              L6_28 = _UPVALUE14_
            else
              L15_37 = _UPVALUE11_
              L15_37 = L15_37[4]
              if L6_28 == L15_37 then
                L6_28 = _UPVALUE15_
              end
            end
          end
        end
        L15_37, L16_38, L17_39 = nil, nil, nil
        if PRODUCT_ID ~= "DSR-1000AC_Ax" and PRODUCT_ID ~= "DSR-500AC_Ax" and PRODUCT_ID ~= "DSR-1000_Bx" and PRODUCT_ID ~= "DSR-500_Bx" then
          L15_37, L16_38 = _UPVALUE22_.threegReconnectModeget()
          if L15_37 ~= _UPVALUE0_.SUCCESS then
            return L15_37, L17_39
          end
        else
          L16_38 = db.getAttribute("ThreeG", "_ROWID_", "1", "IdleTimeOutFlag")
        end
        _UPVALUE19_.start()
        L15_37, L17_39 = _UPVALUE9_.loadbalanceGroupSet(L1_23, L3_25, L6_28, L7_29, L8_30, L10_32, L11_33, L12_34, L13_35, L9_31, L14_36, L16_38)
        if L15_37 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut("Error in configuring values in page OptionMode" .. L15_37)
          _UPVALUE19_.abort()
          return L15_37, L1_23
        end
        L15_37, L17_39 = _UPVALUE9_.loadbalanceGroupSet(L2_24, L3_25, L6_28, L7_29, L8_30, L10_32, L11_33, L12_34, L13_35, L9_31, L14_36, L16_38)
        if L15_37 ~= _UPVALUE0_.SUCCESS then
          util.appendDebugOut("Error in configuring values in page OptionMode" .. L15_37)
          _UPVALUE19_.abort()
          return L15_37, L1_23
        end
    end
    else
      L6_28 = _UPVALUE8_
      if L3_25 == L6_28 then
        L6_28 = A0_22["optionMode.defaultWanPort"]
        L7_29 = _UPVALUE0_
        L7_29 = L7_29.NIL
        if L6_28 == L7_29 then
          L7_29 = util
          L7_29 = L7_29.appendDebugOut
          L8_30 = "Set : Invalid defaultWanPort"
          L7_29(L8_30)
          L7_29 = _UPVALUE0_
          L7_29 = L7_29.BAD_PARAMETER
          return L7_29
        end
        L7_29 = _UPVALUE10_
        L7_29 = L7_29[1]
        if L6_28 == L7_29 then
          L6_28 = _UPVALUE16_
        else
          L7_29 = _UPVALUE10_
          L7_29 = L7_29[2]
          if L6_28 == L7_29 then
            L6_28 = _UPVALUE17_
          else
            L7_29 = _UPVALUE10_
            L7_29 = L7_29[3]
            if L6_28 == L7_29 then
              L6_28 = _UPVALUE18_
            end
          end
        end
        L7_29, L8_30 = nil, nil
        L9_31 = PRODUCT_ID
        if L9_31 ~= "DSR-1000AC_Ax" then
          L9_31 = PRODUCT_ID
          if L9_31 ~= "DSR-500AC_Ax" then
            L9_31 = PRODUCT_ID
            if L9_31 ~= "DSR-1000_Bx" then
              L9_31 = PRODUCT_ID
            end
          end
        elseif L9_31 == "DSR-500_Bx" then
          L9_31 = _UPVALUE3_
          L9_31 = L9_31.multiWanModePPPSubnetCheck
          L10_32 = L3_25
          L11_33 = L6_28
          L9_31 = L9_31(L10_32, L11_33)
          L7_29 = L9_31
          L9_31 = _UPVALUE0_
          L9_31 = L9_31.SUCCESS
          if L7_29 ~= L9_31 then
            return L7_29
          end
        end
        L9_31 = _UPVALUE19_
        L9_31 = L9_31.start
        L9_31()
        L9_31 = _UPVALUE9_
        L9_31 = L9_31.multiWanModeSet
        L10_32 = L1_23
        L11_33 = L3_25
        L10_32 = L9_31(L10_32, L11_33)
        L8_30 = L10_32
        L7_29 = L9_31
        L9_31 = _UPVALUE0_
        L9_31 = L9_31.SUCCESS
        if L7_29 ~= L9_31 then
          L9_31 = util
          L9_31 = L9_31.appendDebugOut
          L10_32 = "Error in configuring values in page OptionMode"
          L11_33 = L7_29
          L10_32 = L10_32 .. L11_33
          L9_31(L10_32)
          L9_31 = _UPVALUE19_
          L9_31 = L9_31.abort
          L9_31()
          L9_31 = L7_29
          L10_32 = L1_23
          return L9_31, L10_32
        end
        L9_31 = _UPVALUE9_
        L9_31 = L9_31.multiWanModeSet
        L10_32 = L2_24
        L11_33 = L3_25
        L10_32 = L9_31(L10_32, L11_33)
        L8_30 = L10_32
        L7_29 = L9_31
        L9_31 = _UPVALUE0_
        L9_31 = L9_31.SUCCESS
        if L7_29 ~= L9_31 then
          L9_31 = util
          L9_31 = L9_31.appendDebugOut
          L10_32 = "Error in configuring values in page OptionMode"
          L11_33 = L7_29
          L10_32 = L10_32 .. L11_33
          L9_31(L10_32)
          L9_31 = _UPVALUE19_
          L9_31 = L9_31.abort
          L9_31()
          L9_31 = L7_29
          L10_32 = L1_23
          return L9_31, L10_32
        end
        L9_31 = _UPVALUE9_
        L9_31 = L9_31.defaultWanPortSet
        L10_32 = L1_23
        L11_33 = L6_28
        L10_32 = L9_31(L10_32, L11_33)
        L8_30 = L10_32
        L7_29 = L9_31
        L9_31 = _UPVALUE0_
        L9_31 = L9_31.SUCCESS
        if L7_29 ~= L9_31 then
          L9_31 = util
          L9_31 = L9_31.appendDebugOut
          L10_32 = "Error in configuring values in page OptionMode"
          L11_33 = L7_29
          L10_32 = L10_32 .. L11_33
          L9_31(L10_32)
          L9_31 = _UPVALUE19_
          L9_31 = L9_31.abort
          L9_31()
          L9_31 = L7_29
          L10_32 = L1_23
          return L9_31, L10_32
        end
        L9_31 = _UPVALUE9_
        L9_31 = L9_31.defaultWanPortSet
        L10_32 = L2_24
        L11_33 = L6_28
        L10_32 = L9_31(L10_32, L11_33)
        L8_30 = L10_32
        L7_29 = L9_31
        L9_31 = _UPVALUE0_
        L9_31 = L9_31.SUCCESS
        if L7_29 ~= L9_31 then
          L9_31 = util
          L9_31 = L9_31.appendDebugOut
          L10_32 = "Error in configuring values in page OptionMode"
          L11_33 = L7_29
          L10_32 = L10_32 .. L11_33
          L9_31(L10_32)
          L9_31 = _UPVALUE19_
          L9_31 = L9_31.abort
          L9_31()
          L9_31 = L7_29
          L10_32 = L1_23
          return L9_31, L10_32
        end
      end
    end
  end
  L6_28 = _UPVALUE19_
  L6_28 = L6_28.complete
  L6_28()
  L6_28 = _UPVALUE19_
  L6_28 = L6_28.save
  L6_28()
  L6_28 = PFRM_BIN_PATH
  L7_29 = " "
  L8_30 = HW_OFFLOAD_SCRIPT
  L9_31 = " "
  L10_32 = SYSTEM_DB_FILE_NAME
  L6_28 = L6_28 .. L7_29 .. L8_30 .. L9_31 .. L10_32
  L7_29 = util
  L7_29 = L7_29.appendDebugOut
  L8_30 = "Exec: "
  L9_31 = os
  L9_31 = L9_31.execute
  L10_32 = L6_28
  L9_31 = L9_31(L10_32)
  L8_30 = L8_30 .. L9_31
  L7_29(L8_30)
  L7_29 = _UPVALUE0_
  L7_29 = L7_29.SUCCESS
  L8_30 = cookie
  return L7_29, L8_30
end
function optionModeSectionPortCheck()
  return _UPVALUE0_.configurablePortCheck()
end
function optionIpModeGet()
  return _UPVALUE0_.optionIpModeGet()
end
