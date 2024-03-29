local L0_0
L0_0 = require
L0_0("validationsLuaLib")
L0_0 = require
L0_0("teamf1lualib/fwReturnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.fwReturnCodes")
fwReturnCodes = L0_0
L0_0 = {}
L0_0.ROW_ID = "_ROWID_"
L0_0.SourceNetworkStart = "SourceNetworkStart"
L0_0.DestinationNetworkStart = "DestinationNetworkStart"
function protocolBindingRuleConflictCheck(A0_1, A1_2, A2_3)
  local L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L22_23, L23_24, L24_25, L25_26, L26_27, L27_28, L28_29, L29_30, L30_31, L31_32, L32_33, L33_34, L34_35, L35_36, L36_37, L37_38, L38_39, L39_40, L40_41
  L25_26 = true
  L26_27 = 0
  L8_9 = A0_1["ProtocolBinding.SourceNetworkType"]
  L9_10 = "ProtocolBinding.SourceNetworkType"
  L10_11 = A0_1["ProtocolBinding.SourceNetworkStart"]
  L11_12 = "ProtocolBinding.SourceNetworkStart"
  L12_13 = A0_1["ProtocolBinding.SourceNetworkEnd"]
  L13_14 = "ProtocolBinding.SourceNetworkEnd"
  L19_20 = A0_1["ProtocolBinding.DestinationNetworkType"]
  L20_21 = "ProtocolBinding.DestinationNetworkType"
  L21_22 = A0_1["ProtocolBinding.DestinationNetworkStart"]
  L22_23 = "ProtocolBinding.DestinationNetworkStart"
  L23_24 = A0_1["ProtocolBinding.DestinationNetworkEnd"]
  L24_25 = "ProtocolBinding.DestinationNetworkEnd"
  for L30_31, L31_32 in L27_28(L28_29) do
    for L35_36, L36_37 in L32_33(L33_34) do
      if L8_9 == "0" and L19_20 == "0" then
        if A2_3 == "source" then
          L37_38 = false
          L38_39 = fwReturnCodes
          L38_39 = L38_39.COMP_FIREWALL_PBRETURNONE
          return L37_38, L38_39
        else
          L37_38 = false
          L38_39 = fwReturnCodes
          L38_39 = L38_39.COMP_FIREWALL_PBRETURNSEVEN
          return L37_38, L38_39
        end
      end
      L37_38 = L31_32[L9_10]
      if L37_38 == "0" then
        L37_38 = L31_32[L20_21]
        if L37_38 == "0" then
          L37_38 = L31_32[L9_10]
          if L37_38 ~= L36_37 then
            L37_38 = L31_32[L20_21]
          elseif L37_38 == L36_37 then
            if A2_3 == "source" then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTWO
              return L37_38, L38_39
            else
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNEIGHT
              return L37_38, L38_39
            end
          end
        end
      end
      if (L8_9 == "0" and L19_20 == "1" or L8_9 == "1" and L19_20 == "0") and (L10_11 == L36_37 or L21_22 == L36_37) then
        if A2_3 == "source" then
          L37_38 = false
          L38_39 = fwReturnCodes
          L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHREE
          return L37_38, L38_39
        else
          L37_38 = false
          L38_39 = fwReturnCodes
          L38_39 = L38_39.COMP_FIREWALL_PBRETURNNINE
          return L37_38, L38_39
        end
      end
      if L8_9 == "1" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38, L38_39, L39_40 = nil, nil, nil
            L40_41 = db
            L40_41 = L40_41.getTable
            L40_41 = L40_41("ProtocolBinding", false)
            for _FORV_45_, _FORV_46_ in pairs(L40_41) do
              L39_40 = db.getAttribute("ProtocolBinding", _UPVALUE0_.ROW_ID, L40_41[0 + 1][_UPVALUE0_.ROW_ID], "SourceNetworkStart")
              L38_39 = db.getAttribute("ProtocolBinding", _UPVALUE0_.ROW_ID, L40_41[0 + 1][_UPVALUE0_.ROW_ID], "DestinationNetworkStart")
              if A2_3 == "source" then
                if L10_11 == L36_37 and L21_22 == L38_39 then
                  return false, fwReturnCodes.COMP_FIREWALL_PBRETURNFOURTEEN
                end
              elseif L21_22 == L36_37 and L10_11 == L39_40 then
                return false, fwReturnCodes.COMP_FIREWALL_PBRETURNFOURTEEN
              end
            end
          end
        end
      end
      if L8_9 == "1" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "2" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "2" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L23_24
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L16_17 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L24_25]
            L38_39 = L37_38(L38_39)
            L17_18 = L38_39
            L25_26 = L37_38
            if L10_11 == L36_37 and (L14_15 <= L16_17 and L15_16 >= L16_17 or L14_15 <= L17_18 and L15_16 >= L17_18 or L14_15 >= L16_17 and L14_15 <= L17_18 or L15_16 >= L16_17 and L15_16 <= L17_18) and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "1" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "2" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "2" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L13_14]
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L24_25]
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L18_19 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L14_15 <= L18_19 and L15_16 >= L18_19 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "2" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L24_25]
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L18_19 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L14_15 <= L18_19 and L15_16 >= L18_19 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "1" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "2" and L19_20 == "2" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L13_14]
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L23_24
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L18_19 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L14_15 <= L18_19 and L15_16 >= L18_19 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "2" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L23_24
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L18_19 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L14_15 <= L18_19 and L15_16 >= L18_19 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "2" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L5_6 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L13_14]
            L38_39 = L37_38(L38_39)
            L6_7 = L38_39
            L25_26 = L37_38
            if L21_22 == L36_37 and (L3_4 <= L5_6 and L4_5 >= L5_6 or L3_4 <= L6_7 and L4_5 >= L6_7 or L3_4 >= L5_6 and L3_4 <= L6_7 or L4_5 >= L5_6 and L4_5 <= L6_7) and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "1" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "2" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L13_14]
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L21_22 == L36_37 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "1" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "1" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and L21_22 == L36_37 and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "1" and L19_20 == "2" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "2" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L7_8 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L23_24
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L16_17 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L24_25]
            L38_39 = L37_38(L38_39)
            L17_18 = L38_39
            L25_26 = L37_38
            if L3_4 <= L7_8 and L4_5 >= L7_8 and (L14_15 <= L16_17 and L15_16 >= L16_17 or L14_15 <= L17_18 and L15_16 >= L17_18 or L14_15 >= L16_17 and L14_15 <= L17_18 or L15_16 >= L16_17 and L15_16 <= L17_18) and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
      if L8_9 == "2" then
        L37_38 = L31_32[L9_10]
        if L37_38 == "2" and L19_20 == "2" then
          L37_38 = L31_32[L20_21]
          if L37_38 == "2" then
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L10_11
            L38_39 = L37_38(L38_39)
            L3_4 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L12_13
            L38_39 = L37_38(L38_39)
            L4_5 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L11_12]
            L38_39 = L37_38(L38_39)
            L5_6 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L13_14]
            L38_39 = L37_38(L38_39)
            L6_7 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L21_22
            L38_39 = L37_38(L38_39)
            L14_15 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L23_24
            L38_39 = L37_38(L38_39)
            L15_16 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L22_23]
            L38_39 = L37_38(L38_39)
            L16_17 = L38_39
            L25_26 = L37_38
            L37_38 = validationsLuaLib
            L37_38 = L37_38.ipv4AddrAsciiToNum
            L38_39 = L31_32[L24_25]
            L38_39 = L37_38(L38_39)
            L17_18 = L38_39
            L25_26 = L37_38
            if (L3_4 <= L5_6 and L4_5 >= L5_6 or L3_4 <= L6_7 and L4_5 >= L6_7 or L3_4 >= L5_6 and L3_4 <= L6_7 or L4_5 >= L5_6 and L4_5 <= L6_7) and (L14_15 <= L16_17 and L15_16 >= L16_17 or L14_15 <= L17_18 and L15_16 >= L17_18 or L14_15 >= L16_17 and L14_15 <= L17_18 or L15_16 >= L16_17 and L15_16 <= L17_18) and (A2_3 == "source" or A2_3 == "destination") then
              L37_38 = false
              L38_39 = fwReturnCodes
              L38_39 = L38_39.COMP_FIREWALL_PBRETURNTHIRTEEN
              return L37_38, L38_39
            end
          end
        end
      end
    end
  end
  return L27_28, L28_29
end
function protocolBindingRuleValidation(A0_42, A1_43, A2_44)
  local L3_45, L4_46, L5_47, L6_48, L7_49, L8_50, L9_51
  L3_45 = A0_42["ProtocolBinding.ServiceName"]
  L4_46 = A0_42["ProtocolBinding.LocalGatewayType"]
  L5_47 = nil
  L6_48 = true
  L7_49 = 0
  if L3_45 == "ANY" then
    if A1_43 == "add" then
      L8_50 = "SELECT * FROM ProtocolBinding"
      L9_51 = " "
      L5_47 = L8_50 .. L9_51 .. "WHERE LocalGatewayType = " .. L4_46 .. ""
    end
    if A1_43 == "edit" then
      L8_50 = "SELECT * FROM ProtocolBinding"
      L9_51 = " "
      L5_47 = L8_50 .. L9_51 .. "WHERE LocalGatewayType = " .. L4_46 .. " " .. "and rowid != " .. A2_44 .. ""
    end
    L8_50 = db
    L8_50 = L8_50.getTable
    L9_51 = "ProtocolBinding"
    L8_50 = L8_50(L9_51, true, L5_47)
    L9_51 = protocolBindingRuleConflictCheck
    L7_49, L9_51 = A0_42, L9_51(A0_42, L8_50, "source")
    L6_48 = L9_51
    if L6_48 == false then
      L9_51 = L6_48
      return L9_51, L7_49
    end
    L9_51 = protocolBindingRuleConflictCheck
    L7_49, L9_51 = A0_42, L9_51(A0_42, L8_50, "destination")
    L6_48 = L9_51
    if L6_48 == false then
      L9_51 = L6_48
      return L9_51, L7_49
    end
    if A1_43 == "add" then
      L9_51 = "SELECT * FROM ProtocolBinding"
      L5_47 = L9_51 .. " " .. "WHERE ServiceName = '" .. L3_45 .. "' and LocalGatewayType = " .. L4_46 .. ""
    end
    if A1_43 == "edit" then
      L9_51 = "SELECT * FROM ProtocolBinding"
      L5_47 = L9_51 .. " " .. "WHERE ServiceName = '" .. L3_45 .. "' and LocalGatewayType = " .. L4_46 .. " and rowid != " .. A2_44 .. ""
    end
    L9_51 = db
    L9_51 = L9_51.getTable
    L9_51 = L9_51("ProtocolBinding", true, L5_47)
    L6_48, L7_49 = protocolBindingRuleConflictCheck(A0_42, L9_51, "source")
    if L6_48 == false then
      return L6_48, L7_49
    end
    L6_48, L7_49 = protocolBindingRuleConflictCheck(A0_42, L9_51, "destination")
    if L6_48 == false then
      return L6_48, L7_49
    end
  else
    if A1_43 == "add" then
      L8_50 = "SELECT * FROM ProtocolBinding"
      L9_51 = " WHERE ServiceName = 'ANY'"
      L5_47 = L8_50 .. L9_51 .. " and LocalGatewayType = '" .. L4_46 .. "'"
    end
    if A1_43 == "edit" then
      L8_50 = "SELECT * FROM ProtocolBinding"
      L9_51 = " WHERE ServiceName = 'ANY'"
      L5_47 = L8_50 .. L9_51 .. " and LocalGatewayType = " .. L4_46 .. " and rowid != " .. A2_44 .. ""
    end
    L8_50 = db
    L8_50 = L8_50.getTable
    L9_51 = "ProtocolBinding"
    L8_50 = L8_50(L9_51, true, L5_47)
    L9_51 = protocolBindingRuleConflictCheck
    L7_49, L9_51 = A0_42, L9_51(A0_42, L8_50, "source")
    L6_48 = L9_51
    if L6_48 == false then
      L9_51 = L6_48
      return L9_51, L7_49
    end
    L9_51 = protocolBindingRuleConflictCheck
    L7_49, L9_51 = A0_42, L9_51(A0_42, L8_50, "destination")
    L6_48 = L9_51
    if L6_48 == false then
      L9_51 = L6_48
      return L9_51, L7_49
    end
    if A1_43 == "add" then
      L9_51 = "SELECT * FROM ProtocolBinding"
      L5_47 = L9_51 .. " " .. "WHERE ServiceName = '" .. L3_45 .. "' and LocalGatewayType = " .. L4_46 .. ""
    end
    if A1_43 == "edit" then
      L9_51 = "SELECT * FROM ProtocolBinding"
      L5_47 = L9_51 .. " " .. "WHERE ServiceName = '" .. L3_45 .. "' and LocalGatewayType = " .. L4_46 .. " and rowid != " .. A2_44 .. ""
    end
    L9_51 = db
    L9_51 = L9_51.getTable
    L9_51 = L9_51("ProtocolBinding", true, L5_47)
    L6_48, L7_49 = protocolBindingRuleConflictCheck(A0_42, L9_51, "source")
    if L6_48 == false then
      return L6_48, L7_49
    end
    L6_48, L7_49 = protocolBindingRuleConflictCheck(A0_42, L9_51, "destination")
    if L6_48 == false then
      return L6_48, L7_49
    end
  end
  L8_50 = L6_48
  L9_51 = L7_49
  return L8_50, L9_51
end
