local L0_0
L0_0 = module
L0_0("com.teamf1.core.wireless.status", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
;({}).opmode = "opMode"
;({}).band = "band"
;({}).interface = "interfaceName"
;({}).rowid = "_ROWID_"
;({}).puren = "puren"
;({}).pureac = "pure11ac"
;({}).dot11Channelget = "/pfrm2.0/bin/dot11ChannelGet "
;({}).profileName = "profileName"
;({}).pairwiseCiphers = "pairwiseCiphers"
;({}).authMethods = "authMethods"
;({}).security = "security"
;({}).groupCipher = "groupCipher"
;({}).wepAuth = "wepAuth"
;({}).vapEnabled = "vapEnabled"
;({}).ssid = "ssid"
;({}).cardNo = "cardNo"
;({}).country = "country"
;({}).radioNo = "radioNo"
;({}).countrycode = "countrycode"
;({}).vapName = "vapName"
;({}).opMode = "opMode"
function radioGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L0_1 = UNIT_NAME
  if L0_1 ~= "DSR-1000AC" then
    L0_1 = {}
    L1_2 = db
    L1_2 = L1_2.getRow
    L2_3 = _UPVALUE0_
    L3_4 = _UPVALUE1_
    L3_4 = L3_4.rowid
    L1_2 = L1_2(L2_3, L3_4, L4_5)
    if L1_2 ~= nil then
      L2_3 = db
      L2_3 = L2_3.getRow
      L3_4 = _UPVALUE2_
      L7_8 = _UPVALUE1_
      L7_8 = L7_8.cardNo
      L2_3 = L2_3(L3_4, L4_5, L5_6)
      L0_1 = L2_3
      L2_3 = _UPVALUE3_
      L3_4 = "."
      L2_3 = L2_3 .. L3_4 .. L4_5
      L3_4 = db
      L3_4 = L3_4.getAttribute
      L7_8 = _UPVALUE1_
      L7_8 = L7_8.country
      L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8)
      L3_4 = L3_4 or ""
      L0_1[L2_3] = L3_4
      L2_3 = _UPVALUE3_
      L3_4 = "."
      L2_3 = L2_3 .. L3_4 .. L4_5
      L3_4 = db
      L3_4 = L3_4.getAttribute
      L7_8 = "."
      L8_9 = _UPVALUE1_
      L8_9 = L8_9.country
      L7_8 = _UPVALUE1_
      L7_8 = L7_8.country
      L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8)
      if not L3_4 then
        L3_4 = _UPVALUE3_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L3_4 = L0_1[L3_4]
      end
      L0_1[L2_3] = L3_4
      L2_3 = _UPVALUE5_
      L3_4 = "."
      L2_3 = L2_3 .. L3_4 .. L4_5
      L3_4 = db
      L3_4 = L3_4.getAttribute
      L7_8 = "."
      L8_9 = _UPVALUE1_
      L8_9 = L8_9.radioNo
      L7_8 = _UPVALUE1_
      L7_8 = L7_8.puren
      L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8)
      L3_4 = L3_4 or ""
      L0_1[L2_3] = L3_4
      L2_3 = _UPVALUE5_
      L3_4 = "."
      L2_3 = L2_3 .. L3_4 .. L4_5
      L3_4 = db
      L3_4 = L3_4.getAttribute
      L7_8 = "."
      L8_9 = _UPVALUE1_
      L8_9 = L8_9.radioNo
      L7_8 = _UPVALUE1_
      L7_8 = L7_8.pureac
      L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8)
      L3_4 = L3_4 or ""
      L0_1[L2_3] = L3_4
    end
    if L1_2 == nil then
      L2_3 = {}
      L1_2 = L2_3
    end
    if L0_1 == nil then
      L2_3 = {}
      L0_1 = L2_3
    end
    L2_3 = ""
    L3_4 = _UPVALUE2_
    L3_4 = L3_4 .. L4_5 .. L5_6
    L3_4 = L0_1[L3_4]
    if L3_4 == "b" then
      L2_3 = "2.4GHz"
    else
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L3_4 = L0_1[L3_4]
      if L3_4 == "a" then
        L2_3 = "5GHz"
      end
    end
    L3_4 = _UPVALUE2_
    L3_4 = L3_4 .. L4_5 .. L5_6
    L3_4 = L0_1[L3_4]
    if L3_4 ~= "ng40-" then
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L3_4 = L0_1[L3_4]
    else
      if L3_4 == "ng" then
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L0_1[L3_4] = "N/G-Mixed"
    end
    else
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L3_4 = L0_1[L3_4]
      if L3_4 == "b and g" then
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L0_1[L3_4] = "G/B-Mixed"
      else
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L3_4 = L0_1[L3_4]
        if L3_4 == "g only" then
          L3_4 = _UPVALUE2_
          L3_4 = L3_4 .. L4_5 .. L5_6
          L0_1[L3_4] = "G Only"
        else
          L3_4 = _UPVALUE2_
          L3_4 = L3_4 .. L4_5 .. L5_6
          L3_4 = L0_1[L3_4]
          if L3_4 == "b only" then
            L3_4 = _UPVALUE2_
            L3_4 = L3_4 .. L4_5 .. L5_6
            L0_1[L3_4] = "B Only"
          end
        end
      end
    end
    L3_4 = _UPVALUE2_
    L3_4 = L3_4 .. L4_5 .. L5_6
    L3_4 = L0_1[L3_4]
    if L3_4 ~= "na40-" then
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L3_4 = L0_1[L3_4]
    else
      if L3_4 == "na" then
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L0_1[L3_4] = "N/A-Mixed"
    end
    else
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L3_4 = L0_1[L3_4]
      if L3_4 == "a only" then
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L0_1[L3_4] = "A Only"
      else
        L3_4 = _UPVALUE2_
        L3_4 = L3_4 .. L4_5 .. L5_6
        L3_4 = L0_1[L3_4]
        if L3_4 ~= "ac40-" then
          L3_4 = _UPVALUE2_
          L3_4 = L3_4 .. L4_5 .. L5_6
          L3_4 = L0_1[L3_4]
          if L3_4 ~= "ac40+" then
            L3_4 = _UPVALUE2_
            L3_4 = L3_4 .. L4_5 .. L5_6
            L3_4 = L0_1[L3_4]
            if L3_4 ~= "ac80" then
              L3_4 = _UPVALUE2_
              L3_4 = L3_4 .. L4_5 .. L5_6
              L3_4 = L0_1[L3_4]
            end
          end
        elseif L3_4 == "ac" then
          L3_4 = _UPVALUE2_
          L3_4 = L3_4 .. L4_5 .. L5_6
          L0_1[L3_4] = "A/N/AC-Mixed"
        end
      end
    end
    L3_4 = _UPVALUE5_
    L3_4 = L3_4 .. L4_5 .. L5_6
    L3_4 = L0_1[L3_4]
    if L3_4 == "1" then
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L0_1[L3_4] = "N Only"
    end
    L3_4 = _UPVALUE5_
    L3_4 = L3_4 .. L4_5 .. L5_6
    L3_4 = L0_1[L3_4]
    if L3_4 == "1" then
      L3_4 = _UPVALUE2_
      L3_4 = L3_4 .. L4_5 .. L5_6
      L0_1[L3_4] = "AC Only"
    end
    L3_4 = db
    L3_4 = L3_4.getAttribute
    L7_8 = _UPVALUE1_
    L7_8 = L7_8.vapName
    L3_4 = L3_4(L4_5, L5_6, L6_7, L7_8)
    if L3_4 then
      L7_8 = _UPVALUE7_
      L8_9 = _UPVALUE1_
      L8_9 = L8_9.vapName
      L9_10 = L3_4
      L10_11 = "interfaceName"
      if L6_7 ~= nil and L6_7 ~= "" and L6_7 ~= " " then
        L7_8 = io
        L7_8 = L7_8.popen
        L8_9 = _UPVALUE1_
        L8_9 = L8_9.dot11Channelget
        L9_10 = L6_7
        L8_9 = L8_9 .. L9_10
        L7_8 = L7_8(L8_9)
        L9_10 = L7_8
        L8_9 = L7_8.read
        L10_11 = "*number"
        L8_9 = L8_9(L9_10, L10_11)
        if L4_5 ~= nil and L4_5 ~= "" and L4_5 ~= " " then
          L8_9 = getChannelNum
          L9_10 = L4_5
          L8_9 = L8_9(L9_10)
        end
        L9_10 = L7_8
        L8_9 = L7_8.close
        L8_9(L9_10)
      end
    end
    L7_8 = L2_3
    L8_9 = L0_1["dot11Radio.opMode"]
    L9_10 = L4_5
    return L6_7, L7_8, L8_9, L9_10
  else
    L0_1 = 0
    L1_2 = db
    L1_2 = L1_2.getTable
    L2_3 = "dot11Card"
    L1_2 = L1_2(L2_3)
    L2_3 = {}
    L3_4 = {}
    for L7_8, L8_9 in L4_5(L5_6) do
      L0_1 = L0_1 + 1
      L9_10 = {}
      L3_4[L0_1] = L9_10
      L9_10 = db
      L9_10 = L9_10.getRow
      L10_11 = "dot11Card"
      L11_12 = "_ROWID_"
      L12_13 = L8_9["dot11Card.cardNo"]
      L9_10 = L9_10(L10_11, L11_12, L12_13)
      if L9_10 ~= nil then
        L10_11 = db
        L10_11 = L10_11.getRow
        L11_12 = _UPVALUE2_
        L12_13 = _UPVALUE1_
        L12_13 = L12_13.cardNo
        L13_14 = _UPVALUE0_
        L14_15 = "."
        L15_16 = _UPVALUE1_
        L15_16 = L15_16.cardNo
        L13_14 = L13_14 .. L14_15 .. L15_16
        L13_14 = L9_10[L13_14]
        L10_11 = L10_11(L11_12, L12_13, L13_14)
        L2_3 = L10_11
        L10_11 = _UPVALUE3_
        L11_12 = "."
        L12_13 = _UPVALUE1_
        L12_13 = L12_13.country
        L10_11 = L10_11 .. L11_12 .. L12_13
        L11_12 = db
        L11_12 = L11_12.getAttribute
        L12_13 = _UPVALUE3_
        L13_14 = _UPVALUE1_
        L13_14 = L13_14.rowid
        L14_15 = "1"
        L15_16 = _UPVALUE1_
        L15_16 = L15_16.country
        L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16)
        L11_12 = L11_12 or ""
        L2_3[L10_11] = L11_12
        L10_11 = _UPVALUE3_
        L11_12 = "."
        L12_13 = _UPVALUE1_
        L12_13 = L12_13.country
        L10_11 = L10_11 .. L11_12 .. L12_13
        L11_12 = db
        L11_12 = L11_12.getAttribute
        L12_13 = _UPVALUE4_
        L13_14 = _UPVALUE1_
        L13_14 = L13_14.countrycode
        L14_15 = _UPVALUE3_
        L15_16 = "."
        L16_17 = _UPVALUE1_
        L16_17 = L16_17.country
        L14_15 = L14_15 .. L15_16 .. L16_17
        L14_15 = L2_3[L14_15]
        L15_16 = _UPVALUE1_
        L15_16 = L15_16.country
        L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16)
        if not L11_12 then
          L11_12 = _UPVALUE3_
          L12_13 = "."
          L13_14 = _UPVALUE1_
          L13_14 = L13_14.country
          L11_12 = L11_12 .. L12_13 .. L13_14
          L11_12 = L2_3[L11_12]
        end
        L2_3[L10_11] = L11_12
        L10_11 = _UPVALUE5_
        L11_12 = "."
        L12_13 = _UPVALUE1_
        L12_13 = L12_13.puren
        L10_11 = L10_11 .. L11_12 .. L12_13
        L11_12 = db
        L11_12 = L11_12.getAttribute
        L12_13 = _UPVALUE5_
        L13_14 = _UPVALUE1_
        L13_14 = L13_14.radioNo
        L14_15 = _UPVALUE2_
        L15_16 = "."
        L16_17 = _UPVALUE1_
        L16_17 = L16_17.radioNo
        L14_15 = L14_15 .. L15_16 .. L16_17
        L14_15 = L2_3[L14_15]
        L15_16 = _UPVALUE1_
        L15_16 = L15_16.puren
        L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16)
        L11_12 = L11_12 or ""
        L2_3[L10_11] = L11_12
        L10_11 = _UPVALUE5_
        L11_12 = "."
        L12_13 = _UPVALUE1_
        L12_13 = L12_13.pureac
        L10_11 = L10_11 .. L11_12 .. L12_13
        L11_12 = db
        L11_12 = L11_12.getAttribute
        L12_13 = _UPVALUE5_
        L13_14 = _UPVALUE1_
        L13_14 = L13_14.radioNo
        L14_15 = _UPVALUE2_
        L15_16 = "."
        L16_17 = _UPVALUE1_
        L16_17 = L16_17.radioNo
        L14_15 = L14_15 .. L15_16 .. L16_17
        L14_15 = L2_3[L14_15]
        L15_16 = _UPVALUE1_
        L15_16 = L15_16.pureac
        L11_12 = L11_12(L12_13, L13_14, L14_15, L15_16)
        L11_12 = L11_12 or ""
        L2_3[L10_11] = L11_12
      end
      if L9_10 == nil then
        L10_11 = {}
        L9_10 = L10_11
      end
      L10_11 = ""
      L11_12 = _UPVALUE2_
      L12_13 = "."
      L13_14 = _UPVALUE1_
      L13_14 = L13_14.band
      L11_12 = L11_12 .. L12_13 .. L13_14
      L11_12 = L2_3[L11_12]
      if L11_12 == "b" then
        L10_11 = "2.4GHz"
      else
        L11_12 = _UPVALUE2_
        L12_13 = "."
        L13_14 = _UPVALUE1_
        L13_14 = L13_14.band
        L11_12 = L11_12 .. L12_13 .. L13_14
        L11_12 = L2_3[L11_12]
        if L11_12 == "a" then
          L10_11 = "5GHz"
        end
      end
      L11_12 = ""
      L12_13 = _UPVALUE2_
      L13_14 = "."
      L14_15 = _UPVALUE1_
      L14_15 = L14_15.opMode
      L12_13 = L12_13 .. L13_14 .. L14_15
      L12_13 = L2_3[L12_13]
      if L12_13 ~= "ng40-" then
        L12_13 = _UPVALUE2_
        L13_14 = "."
        L14_15 = _UPVALUE1_
        L14_15 = L14_15.opMode
        L12_13 = L12_13 .. L13_14 .. L14_15
        L12_13 = L2_3[L12_13]
      else
        if L12_13 == "ng" then
          L11_12 = "N/G-Mixed"
      end
      else
        L12_13 = _UPVALUE2_
        L13_14 = "."
        L14_15 = _UPVALUE1_
        L14_15 = L14_15.opMode
        L12_13 = L12_13 .. L13_14 .. L14_15
        L12_13 = L2_3[L12_13]
        if L12_13 == "b and g" then
          L11_12 = "G/B-Mixed"
        else
          L12_13 = _UPVALUE2_
          L13_14 = "."
          L14_15 = _UPVALUE1_
          L14_15 = L14_15.opMode
          L12_13 = L12_13 .. L13_14 .. L14_15
          L12_13 = L2_3[L12_13]
          if L12_13 == "g only" then
            L11_12 = "G Only"
          else
            L12_13 = _UPVALUE2_
            L13_14 = "."
            L14_15 = _UPVALUE1_
            L14_15 = L14_15.opMode
            L12_13 = L12_13 .. L13_14 .. L14_15
            L12_13 = L2_3[L12_13]
            if L12_13 == "b only" then
              L11_12 = "B Only"
            end
          end
        end
      end
      L12_13 = _UPVALUE2_
      L13_14 = "."
      L14_15 = _UPVALUE1_
      L14_15 = L14_15.opMode
      L12_13 = L12_13 .. L13_14 .. L14_15
      L12_13 = L2_3[L12_13]
      if L12_13 ~= "na40-" then
        L12_13 = _UPVALUE2_
        L13_14 = "."
        L14_15 = _UPVALUE1_
        L14_15 = L14_15.opMode
        L12_13 = L12_13 .. L13_14 .. L14_15
        L12_13 = L2_3[L12_13]
      else
        if L12_13 == "na" then
          L11_12 = "N/A-Mixed"
      end
      else
        L12_13 = _UPVALUE2_
        L13_14 = "."
        L14_15 = _UPVALUE1_
        L14_15 = L14_15.opMode
        L12_13 = L12_13 .. L13_14 .. L14_15
        L12_13 = L2_3[L12_13]
        if L12_13 == "a only" then
          L11_12 = "A Only"
        else
          L12_13 = _UPVALUE2_
          L13_14 = "."
          L14_15 = _UPVALUE1_
          L14_15 = L14_15.opMode
          L12_13 = L12_13 .. L13_14 .. L14_15
          L12_13 = L2_3[L12_13]
          if L12_13 ~= "ac40-" then
            L12_13 = _UPVALUE2_
            L13_14 = "."
            L14_15 = _UPVALUE1_
            L14_15 = L14_15.opMode
            L12_13 = L12_13 .. L13_14 .. L14_15
            L12_13 = L2_3[L12_13]
            if L12_13 ~= "ac40+" then
              L12_13 = _UPVALUE2_
              L13_14 = "."
              L14_15 = _UPVALUE1_
              L14_15 = L14_15.opMode
              L12_13 = L12_13 .. L13_14 .. L14_15
              L12_13 = L2_3[L12_13]
              if L12_13 ~= "ac80" then
                L12_13 = _UPVALUE2_
                L13_14 = "."
                L14_15 = _UPVALUE1_
                L14_15 = L14_15.opMode
                L12_13 = L12_13 .. L13_14 .. L14_15
                L12_13 = L2_3[L12_13]
              end
            end
          elseif L12_13 == "ac" then
            L11_12 = "A/N/AC-Mixed"
          end
        end
      end
      L12_13 = _UPVALUE5_
      L13_14 = "."
      L14_15 = _UPVALUE1_
      L14_15 = L14_15.puren
      L12_13 = L12_13 .. L13_14 .. L14_15
      L12_13 = L2_3[L12_13]
      if L12_13 == "1" then
        L11_12 = "N Only"
      end
      L12_13 = _UPVALUE5_
      L13_14 = "."
      L14_15 = _UPVALUE1_
      L14_15 = L14_15.pureac
      L12_13 = L12_13 .. L13_14 .. L14_15
      L12_13 = L2_3[L12_13]
      if L12_13 == "1" then
        L11_12 = "AC Only"
      end
      L12_13 = _UPVALUE1_
      L12_13 = L12_13.vapEnabled
      L13_14 = "='1' and radioList='"
      L14_15 = _UPVALUE2_
      L15_16 = "."
      L16_17 = _UPVALUE1_
      L16_17 = L16_17.radioNo
      L14_15 = L14_15 .. L15_16 .. L16_17
      L14_15 = L2_3[L14_15]
      L15_16 = "'"
      L12_13 = L12_13 .. L13_14 .. L14_15 .. L15_16
      L13_14 = db
      L13_14 = L13_14.getAttributeWhere
      L14_15 = _UPVALUE6_
      L15_16 = L12_13
      L16_17 = _UPVALUE1_
      L16_17 = L16_17.vapName
      L13_14 = L13_14(L14_15, L15_16, L16_17)
      L14_15 = UNIT_NAME
      if L14_15 == "DSR-1000AC" and L13_14 == nil then
        L14_15 = _UPVALUE1_
        L14_15 = L14_15.vapEnabled
        L15_16 = "='1' and radioList='1,2'"
        L12_13 = L14_15 .. L15_16
        L14_15 = db
        L14_15 = L14_15.getAttributeWhere
        L15_16 = _UPVALUE6_
        L16_17 = L12_13
        L14_15 = L14_15(L15_16, L16_17, _UPVALUE1_.vapName)
        L13_14 = L14_15
      end
      L14_15 = "N/A"
      L15_16 = ""
      if L13_14 ~= nil and L13_14 ~= "" and L13_14 ~= " " then
        L16_17 = "radioNo = '"
        L12_13 = L16_17 .. L2_3[_UPVALUE2_ .. "." .. _UPVALUE1_.radioNo] .. "' and vapName == '" .. L13_14 .. "'"
        L16_17 = db
        L16_17 = L16_17.getAttributeWhere
        L16_17 = L16_17(_UPVALUE7_, L12_13, "interfaceName")
        if L16_17 ~= nil and L16_17 ~= "" and L16_17 ~= " " then
          L14_15 = io.popen(_UPVALUE1_.dot11Channelget .. L16_17):read("*number")
          if L14_15 ~= nil and L14_15 ~= "" and L14_15 ~= " " then
            L14_15 = getChannelNum(L14_15)
          end
          io.popen(_UPVALUE1_.dot11Channelget .. L16_17):close()
        end
      end
      L16_17 = L3_4[L0_1]
      L16_17.mode = L11_12
      L16_17 = L3_4[L0_1]
      L16_17.channel = L14_15
      L16_17 = L3_4[L0_1]
      L16_17.opFreq = L10_11
    end
    return L4_5, L5_6
  end
end
function getChannelNum(A0_18)
  local L1_19, L2_20
  L1_19 = tonumber
  L2_20 = A0_18
  L1_19 = L1_19(L2_20)
  if L1_19 >= 2412 then
    L1_19 = tonumber
    L2_20 = A0_18
    L1_19 = L1_19(L2_20)
    if L1_19 == 2484 then
      L1_19 = "14 - 2.484GHz"
      return L1_19
    else
      L1_19 = tonumber
      L2_20 = A0_18
      L1_19 = L1_19(L2_20)
      if L1_19 < 2484 then
        L1_19 = tonumber
        L2_20 = A0_18
        L1_19 = L1_19(L2_20)
        L1_19 = L1_19 - 2407
        L1_19 = L1_19 / 5
        L2_20 = tonumber
        L2_20 = L2_20(A0_18)
        L2_20 = L2_20 / 1000
        return L1_19 .. " - " .. L2_20 .. "GHz"
      else
        L1_19 = tonumber
        L2_20 = A0_18
        L1_19 = L1_19(L2_20)
        if L1_19 < 5000 then
          L1_19 = tonumber
          L2_20 = A0_18
          L1_19 = L1_19(L2_20)
          L1_19 = L1_19 - 2512
          L1_19 = L1_19 / 20
          L1_19 = 15 + L1_19
          L2_20 = tonumber
          L2_20 = L2_20(A0_18)
          L2_20 = L2_20 / 1000
          return L1_19 .. " - " .. L2_20 .. "GHz"
        else
          L1_19 = tonumber
          L2_20 = A0_18
          L1_19 = L1_19(L2_20)
          L1_19 = L1_19 - 5000
          L1_19 = L1_19 / 5
          L2_20 = tonumber
          L2_20 = L2_20(A0_18)
          L2_20 = L2_20 / 1000
          return L1_19 .. " - " .. L2_20 .. "GHz"
        end
      end
    end
  else
    return A0_18
  end
end
function profileGetAll()
  local L0_21, L1_22
  L0_21 = {}
  L1_22 = {}
  L0_21 = db.getTable(_UPVALUE0_)
  i = 0
  for _FORV_5_, _FORV_6_ in pairs(L0_21) do
    i = i + 1
    L1_22[i] = {}
    row = L0_21[i]
    if db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == "OPEN" then
    elseif db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.security] == "WEP" then
    end
    L1_22[i].encryption = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.groupCipher] or ""
    L1_22[i].authentication = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.wepAuth] or ""
    L1_22[i].security = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.security]
    L1_22[i].encryption = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.groupCipher] or ""
    L1_22[i].ssid = db.getRow(_UPVALUE1_, _UPVALUE2_.profileName, row[_UPVALUE0_ .. "." .. _UPVALUE2_.profileName])[_UPVALUE1_ .. "." .. _UPVALUE2_.ssid]
    L1_22[i].vapEnabled = row[_UPVALUE0_ .. "." .. _UPVALUE2_.vapEnabled]
  end
  return _UPVALUE3_.SUCCESS, L1_22
end
