dot11Tr = {}
require("teamf1lualib/dot11")
require("dot11Lib")
function dot11.interfaceNameFromVapNameGet(A0_0)
  local L1_1, L2_2
  L1_1 = {}
  L2_2 = "vapName='"
  L2_2 = L2_2 .. A0_0 .. "'"
  L1_1 = db.getRowWhere("dot11Interface", L2_2, false)
  if L1_1 == nil then
    return nil
  end
  return L1_1.interfaceName
end
function dot11.firstVapNameGet(A0_3, A1_4)
  local L2_5, L3_6, L4_7
  L2_5 = {}
  L3_6 = {}
  L4_7 = nil
  if A1_4 == nil then
    L4_7 = "interfaceName='" .. A0_3 .. "'"
    L3_6 = db.getRowWhere("dot11Radio", L4_7, false)
    if L3_6 == nil then
      return nil
    end
    A1_4 = L3_6.radioNo
  end
  L4_7 = "radioNo=" .. A1_4
  L2_5 = db.getRowWhere("dot11Interface", L4_7, false)
  if L2_5 == nil then
    return nil
  end
  return L2_5.interfaceName
end
function dot11.ChannelCheck(A0_8, A1_9)
  local L2_10, L3_11
  L3_11 = dot11
  L3_11 = L3_11.firstVapNameGet
  L3_11 = L3_11(A0_8)
  if L3_11 == nil then
    return nil
  end
  L2_10 = dot11.GetChanList(L3_11, 0)
  for _FORV_7_, _FORV_8_ in pairs(L2_10) do
    if A1_9 == tostring(_FORV_8_.channel) then
      return A1_9
    end
  end
  return nil
end
function dot11.TxPowerCheck(A0_12, A1_13)
  startIdx, endIdx = string.find(A1_13, "dbm")
  if startIdx ~= nil then
    A1_13 = string.sub(A1_13, 1, startIdx - 1)
  end
  if dot11Tr.getRadioTxPowerRange(A0_12) >= tonumber(A1_13) then
    return A1_13
  end
  return nil
end
function dot11.OpModeCheck(A0_14, A1_15)
  local L2_16, L3_17
  L2_16 = dot11
  L2_16 = L2_16.firstVapNameGet
  L3_17 = A0_14
  L2_16 = L2_16(L3_17)
  if L2_16 == nil then
    L3_17 = nil
    return L3_17
  end
  L3_17 = dot11
  L3_17 = L3_17.GetModesList
  L3_17 = L3_17(L2_16)
  if L3_17 == nil then
    return nil
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_17) do
    if _FORV_8_ == A1_15 then
      return A1_15
    end
  end
  return nil
end
function dot11.ssidNameSyntaxCheck(A0_18, A1_19)
  return A1_19
end
function dot11.wepKeyIdxValCheck(A0_20)
  if tonumber(A0_20) - 1 < 0 and tonumber(A0_20) - 1 > 3 then
    return nil
  end
  return A0_20
end
function dot11.wepKeyPassPhraseCheck(A0_21)
  if string.len(A0_21) == 5 or not 13 then
  end
  do return A0_21 end
  return nil
end
function dot11.wepEncrAlgoFromKeyLengthGet(A0_22)
  local L1_23
  if string.len(A0_22) ~= 5 then
  end
  L1_23 = "40-bit"
  do break end
  if string.len(A0_22) ~= 13 then
  end
  L1_23 = "104-bit"
  do break end
  if string.len(A0_22) ~= 16 then
  end
  L1_23 = "128-bit"
  return L1_23
end
function dot11Tr.basicEncrModeGet(A0_24)
  local L1_25
  if A0_24 == "Open" then
    L1_25 = "None"
  elseif A0_24 == "WEP" then
    L1_25 = "WEPEncryption"
  end
  return L1_25
end
function dot11Tr.basicAuthModeGet(A0_26)
  local L1_27
  if A0_26 == "Shared" then
    L1_27 = "SharedAuthentication"
  else
    L1_27 = "None"
  end
  return L1_27
end
function dot11Tr.wpaAuthModeGet(A0_28)
  local L1_29
  if string.find(A0_28, "PSK") ~= nil and string.find(A0_28, "RADIUS") ~= nil then
    L1_29 = "EAPandPSKAuthentication"
  elseif string.find(A0_28, "PSK") ~= nil then
    L1_29 = "PSKAuthentication"
  elseif string.find(A0_28, "RADIUS") ~= nil then
    L1_29 = "EAPAuthentication"
  end
  return L1_29
end
function dot11Tr.wpaEncrModeGet(A0_30)
  local L1_31
  if string.find(A0_30, "CCMP") ~= nil and string.find(A0_30, "TKIP") ~= nil then
    L1_31 = "TKIPandAESEncryption"
  elseif string.find(A0_30, "CCMP") ~= nil then
    L1_31 = "AESEncryption"
  elseif string.find(A0_30, "TKIP") ~= nil then
    L1_31 = "TKIPEncryption"
  end
  return L1_31
end
function dot11Tr.securityModeGet(A0_32)
  local L1_33
  if A0_32 == "None" then
    L1_33 = "Open"
  elseif A0_32 == "Basic" then
    L1_33 = "WEP"
  elseif A0_32 == "WPA" then
    L1_33 = "WPA"
  elseif A0_32 == "11i" then
    L1_33 = "WPA2"
  elseif A0_32 == "WPAand11i" then
    L1_33 = "WPA+WPA2"
  end
  return L1_33
end
function dot11Tr.beaconTypeGet(A0_34)
  local L1_35
  if A0_34 == "Open" then
    L1_35 = "None"
  elseif A0_34 == "WPA" then
    L1_35 = "WPA"
  elseif A0_34 == "WPA2" then
    L1_35 = "11i"
  elseif A0_34 == "WPA+WPA2" then
    L1_35 = "WPAand11i"
  elseif A0_34 == "WEP" then
    L1_35 = "Basic"
  end
  return L1_35
end
function dot11Tr.encrModeGet(A0_36)
  local L1_37
  if A0_36 == "None" then
    L1_37 = ""
  elseif A0_36 == "WEPEncryption" then
    L1_37 = ""
  elseif A0_36 == "TKIPEncryption" then
    L1_37 = "TKIP"
  elseif A0_36 == "AESEncryption" then
    L1_37 = "CCMP"
  elseif A0_36 == "TKIPandAESEncryption" then
    L1_37 = "TKIP+CCMP"
  end
  return L1_37
end
function dot11Tr.authMethodsGet(A0_38)
  local L1_39
  if A0_38 == "PSKAuthentication" then
    L1_39 = "PSK"
  elseif A0_38 == "EAPAuthentication" then
    L1_39 = "RADIUS"
  elseif A0_38 == "EAPandPSKAuthentication" then
    L1_39 = "RADIUS+PSK"
  end
  return L1_39
end
function dot11Tr.wepAuthMethodGet(A0_40)
  local L1_41
  if A0_40 == "None" then
    L1_41 = ""
  elseif A0_40 == "EAPAuthentication" then
    L1_41 = ""
  elseif A0_40 == "SharedAuthentication" then
    L1_41 = "Shared"
  end
  return L1_41
end
function dot11Tr.deviceOpModeGet(A0_42)
  local L1_43
  if A0_42 == "AP" then
    L1_43 = "InfrastructureAccessPoint"
  elseif A0_42 == "WDS Repeater" then
    L1_43 = "Wireless Repeater"
  elseif A0_42 == "Client" then
    L1_43 = "WirelessStation"
  elseif A0_42 == "WDS Root" then
    L1_43 = "WirelessBridge"
  end
  return L1_43
end
function dot11Tr.maxOperationalRateGet(A0_44)
  local L1_45, L2_46, L3_47, L4_48
  L3_47 = "0"
  L4_48 = dot11
  L4_48 = L4_48.firstVapNameGet
  L4_48 = L4_48(A0_44)
  L1_45 = L4_48
  if L1_45 == nil then
    L4_48 = nil
    return L4_48
  end
  L4_48 = dot11
  L4_48 = L4_48.GetRateset
  L4_48 = L4_48(L1_45)
  if L4_48 == nil then
    return nil
  end
  for _FORV_8_, _FORV_9_ in pairs(L4_48) do
    if tonumber(_FORV_9_.rate) > tonumber(L3_47) then
      L3_47 = _FORV_9_.rate
    end
  end
  return L3_47
end
function dot11Tr.vapRowGet(A0_49, A1_50)
  local L2_51, L3_52, L4_53, L5_54, L6_55, L7_56
  L6_55 = string
  L6_55 = L6_55.find
  L7_56 = A0_49
  L7_56 = L6_55(L7_56, A1_50)
  L3_52 = L7_56
  L2_51 = L6_55
  L6_55 = string
  L6_55 = L6_55.sub
  L7_56 = A0_49
  L6_55 = L6_55(L7_56, 1, L2_51 - 1)
  L4_53 = L6_55
  L6_55 = tr69Glue
  L6_55 = L6_55.instanceMapLoad
  L6_55 = L6_55()
  if L6_55 == nil then
    L7_56 = nil
    return L7_56
  end
  L5_54 = L6_55[L4_53]
  if L5_54 == nil then
    L7_56 = nil
    return L7_56
  end
  L7_56 = "_ROWID_="
  L7_56 = L7_56 .. L5_54
  if db.getRowWhere("dot11VAP", L7_56, false) == nil then
    return nil
  end
  return (db.getRowWhere("dot11VAP", L7_56, false))
end
function dot11Tr.RegDomainSet(A0_57, A1_58)
  local L2_59, L3_60, L4_61, L5_62, L6_63
  L4_61 = {}
  L5_62, L6_63 = nil, nil
  for _FORV_10_, _FORV_11_ in pairs(A0_57) do
    if _FORV_10_ == "dot11Radio" then
      L5_62 = _FORV_11_["dot11Radio.radioNo"]
      L6_63 = "_ROWID_=" .. A1_58[_FORV_10_]
      L4_61 = db.getRowWhere("dot11Radio", L6_63, false)
      if L4_61 == nil then
        return "1"
      end
      L2_59 = dot11.firstVapNameGet(nil, L4_61.radioNo)
      if L2_59 == nil then
        return "1"
      end
      L3_60 = dot11.GetCountry(L2_59)
      status = dot11.SetCountryCode(L2_59, L5_62)
      if status ~= 0 then
        dot11.SetCountryCode(L2_59, L3_60)
        return "1"
      end
    end
  end
  return "0"
end
function dot11Tr.wlanParamSet(A0_64, A1_65)
  local L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73
  for L7_71, L8_72 in L4_68(L5_69) do
    L9_73 = {}
    query = "ROWID=" .. A1_65[L7_71]
    L9_73 = db.getRowWhere(L7_71, query, true)
    if L9_73 == nil then
      return 1
    end
    if L7_71 == "dot11VAP" then
      tmpVal = L8_72["dot11VAP.vapEnabled"]
      if tmpVal ~= nil then
        L9_73["dot11VAP.vapEnabled"] = tmpVal
      end
      tmpVal = L8_72["dot11VAP.defACLPolicy"]
      if tmpVal ~= nil then
        if tmpVal == "1" then
          L9_73["dot11VAP.defACLPolicy"] = "Allow"
        else
          L9_73["dot11VAP.defACLPolicy"] = "Open"
        end
      end
      tmpVal = L8_72["dot11VAP.uapsd"]
      if tmpVal ~= nil then
        L9_73["dot11VAP.uapsd"] = tmpVal
      end
      L2_66, L3_67 = dot11.VAP_config(L9_73, L9_73["dot11VAP._ROWID_"], "edit")
      if L2_66 ~= "OK" then
        return "1"
      end
    elseif L7_71 == "dot11Radio" then
      tmpVal = L8_72["dot11Radio.configuredChannel"]
      if tmpVal ~= nil then
        tmpVal = dot11.ChannelCheck(L9_73["dot11Radio.interfaceName"], tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Radio.configuredChannel"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Radio.currentChannel"]
      if tmpVal ~= nil and tmpVal == "1" then
        L9_73["dot11Radio.configuredChannel"] = "0"
      else
      end
      tmpVal = L8_72["dot11Radio.opMode"]
      if tmpVal ~= nil then
        tmpVal = dot11.OpModeCheck(L9_73["dot11Radio.interfaceName"], tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Radio.opMode"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Radio.txPower"]
      if tmpVal ~= nil then
        tmpVal = dot11.TxPowerCheck(L9_73, tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Radio.txPower"] = tmpVal
        end
      end
      L2_66, L3_67 = dot11.radio_config(L9_73, L9_73["dot11Radio._ROWID_"], "edit")
      if L2_66 ~= "OK" then
        return "1"
      end
    elseif L7_71 == "dot11Profile" then
      tmpVal = L8_72["dot11Profile.ssid"]
      if tmpVal ~= nil then
        tmpVal = dot11.ssidNameSyntaxCheck(L9_73["dot11Profile.profileName"], tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.ssid"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.security"]
      if tmpVal ~= nil then
        tmpVal = dot11Tr.securityModeGet(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.security"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.defWepkeyIdx"]
      if tmpVal ~= nil then
        tmpVal = dot11.wepKeyIdxValCheck(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.defWepkeyIdx"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.wepkeyPassphrase"]
      if tmpVal ~= nil then
        tmpVal = dot11.wepKeyPassPhraseCheck(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.wepkeyPassphrase"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.pairwiseCiphers"]
      if tmpVal ~= nil then
        tmpVal = dot11Tr.encrModeGet(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.pairwiseCiphers"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.authMethods"]
      if tmpVal ~= nil then
        tmpVal = dot11Tr.authMethodsGet(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.authMethods"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.wepAuth"]
      if tmpVal ~= nil then
        tmpVal = dot11Tr.wepAuthMethodGet(tmpVal)
        if tmpVal ~= nil then
          L9_73["dot11Profile.wepAuth"] = tmpVal
        end
      end
      tmpVal = L8_72["dot11Profile.broadcastSSID"]
      if tmpVal ~= nil then
        L9_73["dot11Profile.broadcastSSID"] = tmpVal
      end
      tmpVal = L8_72["dot11Profile.qosEnable"]
      if tmpVal ~= nil then
        L9_73["dot11Profile.qosEnable"] = tmpVal
      end
      L2_66, L3_67 = dot11.profile_config(L9_73, L9_73["dot11Profile._ROWID_"], "edit")
      if L2_66 ~= "OK" then
        return "1"
      end
    end
  end
  return L4_68
end
function dot11Tr.wlanParamGet(A0_74)
  local L1_75, L2_76, L3_77, L4_78, L5_79, L6_80, L7_81, L8_82, L9_83, L10_84
  L1_75 = "0"
  L2_76 = " "
  L3_77 = {}
  L4_78 = nil
  L5_79 = A0_74.param
  L6_80 = A0_74.field
  L7_81 = nil
  L8_82 = tr69Glue
  L8_82 = L8_82.instanceMapLoad
  L8_82 = L8_82()
  if L8_82 == nil then
    L9_83 = L1_75
    L10_84 = L2_76
    return L9_83, L10_84
  end
  L4_78 = L8_82[L5_79]
  if L4_78 == nil then
    L9_83 = L1_75
    L10_84 = L2_76
    return L9_83, L10_84
  end
  L9_83 = "_ROWID_="
  L10_84 = L4_78
  L7_81 = L9_83 .. L10_84
  L9_83 = db
  L9_83 = L9_83.getRowWhere
  L10_84 = A0_74.table
  L9_83 = L9_83(L10_84, L7_81, false)
  L3_77 = L9_83
  if L3_77 == nil then
    L9_83 = "1"
    L10_84 = "DB_ERROR_TRY_AGAIN"
    return L9_83, L10_84
  end
  L9_83 = string
  L9_83 = L9_83.find
  L10_84 = L5_79
  L9_83 = L9_83(L10_84, "Status")
  if L9_83 ~= nil then
    L9_83 = L3_77.vapEnabled
    if L9_83 == "1" then
      L2_76 = "Up"
    else
      L2_76 = "Disabled"
    end
  else
    L9_83 = string
    L9_83 = L9_83.find
    L10_84 = L5_79
    L9_83 = L9_83(L10_84, "MaxBitRate")
    if L9_83 ~= nil then
      L9_83 = dot11Tr
      L9_83 = L9_83.maxOperationalRateGet
      L10_84 = L3_77.interfaceName
      L9_83 = L9_83(L10_84)
      L2_76 = L9_83
      L9_83 = L2_76
      L10_84 = " mbps"
      L2_76 = L9_83 .. L10_84
    else
      L9_83 = string
      L9_83 = L9_83.find
      L10_84 = L5_79
      L9_83 = L9_83(L10_84, "AutoChannelEnable")
      if L9_83 ~= nil then
        L9_83 = L3_77.configuredChannel
        if L9_83 == "0" then
          L2_76 = "1"
        else
          L2_76 = "0"
        end
      else
        L9_83 = string
        L9_83 = L9_83.find
        L10_84 = L5_79
        L9_83 = L9_83(L10_84, "BeaconType")
        if L9_83 ~= nil then
          L9_83 = dot11Tr
          L9_83 = L9_83.beaconTypeGet
          L10_84 = L3_77.security
          L9_83 = L9_83(L10_84)
          if L9_83 ~= nil then
            L2_76 = L9_83
          end
        elseif L6_80 == "defACLPolicy" then
          L9_83 = L3_77.defACLPolicy
          if L9_83 == "Open" then
            L2_76 = "0"
          else
            L2_76 = "1"
          end
        elseif L6_80 == "opMode" then
          L2_76 = L3_77.opMode
        elseif L6_80 == "defWepKeyIdx" then
          L2_76 = L3_77.defWepKeyIdx
        else
          L9_83 = string
          L9_83 = L9_83.find
          L10_84 = L5_79
          L9_83 = L9_83(L10_84, "WEPEncryptionLevel")
          if L9_83 ~= nil then
            L9_83 = L3_77.security
            if L9_83 ~= "WEP" then
              L2_76 = "Disabled"
            else
              L9_83 = "wepkey"
              L10_84 = L3_77.defWepkeyIdx
              L9_83 = L9_83 .. L10_84
              L10_84 = L3_77[L9_83]
              if dot11.wepEncrAlgoFromKeyLengthGet(wepkey) ~= nil then
                L2_76 = dot11.wepEncrAlgoFromKeyLengthGet(wepkey)
              end
            end
          else
            L9_83 = string
            L9_83 = L9_83.find
            L10_84 = L5_79
            L9_83 = L9_83(L10_84, "BasicEncryptionModes")
            if L9_83 ~= nil then
              L9_83 = dot11Tr
              L9_83 = L9_83.basicEncrModeGet
              L10_84 = L3_77.security
              L9_83 = L9_83(L10_84)
              basicEncr = L9_83
              L9_83 = basicEncr
              if L9_83 ~= nil then
                L2_76 = basicEncr
              else
                L2_76 = "Disabled"
              end
            else
              L9_83 = string
              L9_83 = L9_83.find
              L10_84 = L5_79
              L9_83 = L9_83(L10_84, "BasicAuthenticationMode")
              if L9_83 ~= nil then
                L2_76 = "Disabled"
                L9_83 = L3_77.security
                if L9_83 ~= "WEP" then
                end
                L9_83 = dot11Tr
                L9_83 = L9_83.basicAuthModeGet
                L10_84 = L3_77.wepAuth
                L9_83 = L9_83(L10_84)
                basicAuth = L9_83
                L9_83 = basicAuth
                if L9_83 ~= nil then
                  L2_76 = basicAuth
                end
              else
                L9_83 = string
                L9_83 = L9_83.find
                L10_84 = L5_79
                L9_83 = L9_83(L10_84, "WPAEncryptionModes")
                if L9_83 ~= nil then
                  L2_76 = "Disabled"
                  L9_83 = L3_77.security
                  if L9_83 == "WPA" then
                    L9_83 = dot11Tr
                    L9_83 = L9_83.wpaEncrModeGet
                    L10_84 = L3_77.pairwiseCiphers
                    L9_83 = L9_83(L10_84)
                    if L9_83 ~= nil then
                      L2_76 = L9_83
                    end
                  end
                else
                  L9_83 = string
                  L9_83 = L9_83.find
                  L10_84 = L5_79
                  L9_83 = L9_83(L10_84, "WPAAuthenticationMode")
                  if L9_83 ~= nil then
                    L2_76 = "Disabled"
                    L9_83 = L3_77.security
                    if L9_83 == "WPA" then
                      L9_83 = dot11Tr
                      L9_83 = L9_83.wpaAuthModeGet
                      L10_84 = L3_77.authMethods
                      L9_83 = L9_83(L10_84)
                      if L9_83 ~= nil then
                        L2_76 = L9_83
                      end
                    end
                  else
                    L9_83 = string
                    L9_83 = L9_83.find
                    L10_84 = L5_79
                    L9_83 = L9_83(L10_84, "IEEE11iEncryptionModes")
                    if L9_83 ~= nil then
                      L2_76 = "Disabled"
                      L9_83 = L3_77.security
                      if L9_83 == "WPA2" then
                        L9_83 = dot11Tr
                        L9_83 = L9_83.wpaEncrModeGet
                        L10_84 = L3_77.pairwiseCiphers
                        L9_83 = L9_83(L10_84)
                        if L9_83 ~= nil then
                          L2_76 = L9_83
                        end
                      end
                    else
                      L9_83 = string
                      L9_83 = L9_83.find
                      L10_84 = L5_79
                      L9_83 = L9_83(L10_84, "IEEE11iAuthenticationMode")
                      if L9_83 ~= nil then
                        L2_76 = "Disabled"
                        L9_83 = L3_77.security
                        if L9_83 == "WPA2" then
                          L9_83 = dot11Tr
                          L9_83 = L9_83.wpaAuthModeGet
                          L10_84 = L3_77.authMethods
                          L9_83 = L9_83(L10_84)
                          if L9_83 ~= nil then
                            L2_76 = L9_83
                          end
                        end
                      else
                        L9_83 = string
                        L9_83 = L9_83.find
                        L10_84 = L5_79
                        L9_83 = L9_83(L10_84, "PossibleChannels")
                        if L9_83 ~= nil then
                          L9_83 = {}
                          L10_84 = ""
                          L9_83 = dot11.GetChanList(L3_77.interfaceName, 0)
                          for _FORV_14_, _FORV_15_ in pairs(L9_83) do
                            if L10_84 ~= "" then
                              L10_84 = L10_84 .. ", "
                            end
                            L10_84 = L10_84 .. tostring(_FORV_15_.channel)
                          end
                          L2_76 = L10_84
                        else
                          L9_83 = string
                          L9_83 = L9_83.find
                          L10_84 = L5_79
                          L9_83 = L9_83(L10_84, "BasicDataTransmitRates")
                          if L9_83 ~= nil then
                          else
                            L9_83 = string
                            L9_83 = L9_83.find
                            L10_84 = L5_79
                            L9_83 = L9_83(L10_84, "OperationalDataTransmitRates")
                            if L9_83 ~= nil then
                              L9_83 = nil
                              L10_84 = ""
                              L9_83 = dot11.interfaceNameFromVapNameGet(L3_77.vapName)
                              if L9_83 == nil then
                                return "1", "DB_ERROR_TRY_AGAIN"
                              end
                              rates = dot11.GetRateset(L9_83)
                              if rates == nil then
                                return "1", "DB_ERROR_TRY_AGAIN"
                              end
                              for _FORV_14_, _FORV_15_ in pairs(rates) do
                                if L10_84 ~= "" then
                                  L10_84 = L10_84 .. ", "
                                end
                                L10_84 = L10_84 .. tostring(_FORV_15_.rate)
                              end
                              L2_76 = L10_84
                            else
                              L9_83 = string
                              L9_83 = L9_83.find
                              L10_84 = L5_79
                              L9_83 = L9_83(L10_84, "PossibleDataTransmitRates")
                              if L9_83 ~= nil then
                              else
                                L9_83 = string
                                L9_83 = L9_83.find
                                L10_84 = L5_79
                                L9_83 = L9_83(L10_84, "SSIDAdvertisementEnabled")
                                if L9_83 ~= nil then
                                  L2_76 = L3_77.broadcastSSID
                                else
                                  L9_83 = string
                                  L9_83 = L9_83.find
                                  L10_84 = L5_79
                                  L9_83 = L9_83(L10_84, "TotalAssociations")
                                  if L9_83 ~= nil then
                                    L9_83 = dot11Tr
                                    L9_83 = L9_83.numAssocDevicesGet
                                    L10_84 = L3_77.vapName
                                    L9_83 = L9_83(L10_84)
                                    L2_76 = L9_83
                                  else
                                    L9_83 = string
                                    L9_83 = L9_83.find
                                    L10_84 = L5_79
                                    L9_83 = L9_83(L10_84, "TransmitPowerSupported")
                                    if L9_83 ~= nil then
                                      L9_83 = dot11Tr
                                      L9_83 = L9_83.getRadioTxPowerRange
                                      L10_84 = L3_77
                                      L9_83 = L9_83(L10_84)
                                      L2_76 = L9_83
                                      L9_83 = ""
                                      L10_84 = L2_76
                                      L2_76 = L9_83 .. L10_84 .. " dbm"
                                    else
                                      L9_83 = string
                                      L9_83 = L9_83.find
                                      L10_84 = L5_79
                                      L9_83 = L9_83(L10_84, "TransmitPower")
                                      if L9_83 ~= nil then
                                        L9_83 = dot11
                                        L9_83 = L9_83.firstVapNameGet
                                        L10_84 = nil
                                        L9_83 = L9_83(L10_84, L3_77.radioNo)
                                        vapName = L9_83
                                        L9_83 = vapName
                                        if L9_83 ~= nil then
                                          L9_83 = dot11
                                          L9_83 = L9_83.GetTxPower
                                          L10_84 = vapName
                                          L9_83 = L9_83(L10_84)
                                          L2_76 = L9_83
                                          L9_83 = ""
                                          L10_84 = L2_76
                                          L2_76 = L9_83 .. L10_84 .. " dbm"
                                        end
                                      else
                                        L9_83 = string
                                        L9_83 = L9_83.find
                                        L10_84 = L5_79
                                        L9_83 = L9_83(L10_84, "RegulatoryDomain")
                                        if L9_83 ~= nil then
                                          L9_83 = dot11
                                          L9_83 = L9_83.firstVapNameGet
                                          L10_84 = nil
                                          L9_83 = L9_83(L10_84, L3_77.radioNo)
                                          vapName = L9_83
                                          L9_83 = vapName
                                          if L9_83 ~= nil then
                                            L9_83 = dot11
                                            L9_83 = L9_83.GetCountry
                                            L10_84 = vapName
                                            L9_83 = L9_83(L10_84)
                                            L2_76 = L9_83
                                          end
                                        else
                                          L9_83 = string
                                          L9_83 = L9_83.find
                                          L10_84 = L5_79
                                          L9_83 = L9_83(L10_84, "TotalPSKFailures")
                                          if L9_83 ~= nil then
                                            L9_83 = dot11
                                            L9_83 = L9_83.interfaceNameFromVapNameGet
                                            L10_84 = L3_77.vapName
                                            L9_83 = L9_83(L10_84)
                                            if L9_83 == nil then
                                              L10_84 = "1"
                                              return L10_84, "DB_ERROR_TRY_AGAIN"
                                            end
                                            L10_84 = tostring
                                            L10_84 = L10_84(dot11.GetHshakeFailCount(L9_83))
                                            L2_76 = L10_84
                                          else
                                            L9_83 = string
                                            L9_83 = L9_83.find
                                            L10_84 = L5_79
                                            L9_83 = L9_83(L10_84, "TotalIntegrityFailures")
                                            if L9_83 ~= nil then
                                              L9_83 = dot11
                                              L9_83 = L9_83.interfaceNameFromVapNameGet
                                              L10_84 = L3_77.vapName
                                              L9_83 = L9_83(L10_84)
                                              if L9_83 == nil then
                                                L10_84 = "1"
                                                return L10_84, "DB_ERROR_TRY_AGAIN"
                                              end
                                              L10_84 = tostring
                                              L10_84 = L10_84(dot11.GetMicFailCount(L9_83))
                                              L2_76 = L10_84
                                            else
                                              L9_83 = string
                                              L9_83 = L9_83.find
                                              L10_84 = L5_79
                                              L9_83 = L9_83(L10_84, "DeviceOperationMode")
                                              if L9_83 ~= nil then
                                                L9_83 = dot11Tr
                                                L9_83 = L9_83.deviceOpModeGet
                                                L10_84 = L3_77.dot11Mode
                                                L9_83 = L9_83(L10_84)
                                                if L9_83 ~= nil then
                                                  L2_76 = L9_83
                                                end
                                              else
                                                L9_83 = string
                                                L9_83 = L9_83.find
                                                L10_84 = L5_79
                                                L9_83 = L9_83(L10_84, "AuthenticationServiceMode")
                                                if L9_83 ~= nil then
                                                  L9_83 = string
                                                  L9_83 = L9_83.find
                                                  L10_84 = L3_77.authMethods
                                                  L9_83 = L9_83(L10_84, "RADIUS")
                                                  if L9_83 ~= nil then
                                                    L2_76 = "RadiusClient"
                                                  else
                                                    L2_76 = "None"
                                                  end
                                                else
                                                  L9_83 = string
                                                  L9_83 = L9_83.find
                                                  L10_84 = L5_79
                                                  L9_83 = L9_83(L10_84, "WMMEnable")
                                                  if L9_83 ~= nil then
                                                    L2_76 = L3_77.qosEnable
                                                  else
                                                    L9_83 = string
                                                    L9_83 = L9_83.find
                                                    L10_84 = L5_79
                                                    L9_83 = L9_83(L10_84, "UAPSDEnable")
                                                    if L9_83 ~= nil then
                                                      L2_76 = L3_77.uapsd
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L9_83 = L1_75
  L10_84 = L2_76
  return L9_83, L10_84
end
function dot11Tr.numAssocDevicesGet(A0_85)
  local L1_86, L2_87, L3_88
  L1_86 = 0
  L2_87 = "vapName='"
  L3_88 = A0_85
  L2_87 = L2_87 .. L3_88 .. "'"
  L3_88 = {}
  L3_88 = db.getRowWhere("dot11Interface", L2_87, false)
  if L3_88 == nil then
    return "0"
  end
  interfaceName = L3_88.interfaceName
  L2_87 = "interfaceName='" .. interfaceName .. "'"
  L3_88 = db.getRowsWhere("dot11STA", L2_87, false)
  if L3_88 == nil then
    return "0"
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_88) do
    L1_86 = L1_86 + 1
  end
  value = tostring(L1_86)
  return value
end
function dot11Tr.getRadioTxPowerRange(A0_89)
  local L1_90, L2_91, L3_92
  L1_90 = A0_89.configuredChannel
  if L1_90 == "0" then
    L1_90 = A0_89.currentChannel
  end
  L2_91 = dot11
  L2_91 = L2_91.firstVapNameGet
  L3_92 = nil
  L2_91 = L2_91(L3_92, A0_89.radioNo)
  if L2_91 == nil then
    L3_92 = "0"
    return L3_92
  end
  L3_92 = dot11
  L3_92 = L3_92.GetChanList
  L3_92 = L3_92(L2_91)
  if L3_92 == nil then
    return "0"
  end
  for _FORV_7_, _FORV_8_ in pairs(L3_92) do
    if L1_90 == tostring(_FORV_8_.channel) then
      return _FORV_8_.maxregpower
    end
  end
  return "0"
end
function dot11Tr.wlanStatsGet(A0_93)
  local L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100, L8_101, L9_102
  L1_94 = "0"
  L2_95 = " "
  L3_96 = {}
  L4_97 = nil
  L5_98 = A0_93.param
  L6_99 = A0_93.field
  L7_100 = nil
  L8_101 = tr69Glue
  L8_101 = L8_101.instanceMapLoad
  L8_101 = L8_101()
  if L8_101 == nil then
    L9_102 = L1_94
    return L9_102, L2_95
  end
  L4_97 = L8_101[L5_98]
  if L4_97 == nil then
    L9_102 = L1_94
    return L9_102, L2_95
  end
  L9_102 = "_ROWID_="
  L7_100 = L9_102 .. L4_97
  L9_102 = db
  L9_102 = L9_102.getRowWhere
  L9_102 = L9_102(A0_93.table, L7_100, false)
  L3_96 = L9_102
  if L3_96 == nil then
    L9_102 = "1"
    return L9_102, "DB_ERROR_TRY_AGAIN"
  end
  L9_102 = "vapName='"
  L9_102 = L9_102 .. L3_96.vapName .. "'"
  L3_96 = db.getRowWhere("dot11Interface", L9_102, false)
  if L3_96 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  staStats = dot11.GetStaStats(L3_96.interfaceName, L3_96.macAddress)
  if L3_96 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  stats = dot11.GetVapStats(L3_96.interfaceName)
  if L3_96 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  if string.find(L5_98, "ErrorsSent") ~= nil then
    L2_95 = tostring(stats.is_tx_nonode + stats.is_tx_badcipher + stats.is_tx_nodefkey + stats.is_tx_fferrcnt)
  elseif string.find(L5_98, "ErrorsReceived") ~= nil then
    L2_95 = tostring(stats.is_rx_badversion + stats.is_rx_tooshort + stats.is_rx_wrongbss + stats.is_rx_dup + stats.is_rx_wrongdir + stats.is_rx_mcastecho + stats.is_rx_notassoc + stats.is_rx_noprivacy + stats.is_rx_unencrypted + stats.is_rx_wepfail + stats.is_rx_decap + stats.is_rx_mgtdiscard + stats.is_rx_ctl + stats.is_rx_nodealloc + stats.is_rx_elem_missing + stats.is_rx_elem_toobig + stats.is_rx_elem_toosmall + stats.is_rx_badchan + stats.is_rx_auth_fail + stats.is_rx_auth_countermeasures + stats.is_rx_assoc_bss + stats.is_rx_assoc_norate + stats.is_rx_assoc_notauth + stats.is_rx_assoc_capmismatch + stats.is_rx_assoc_badwpaie + stats.is_rx_decryptcrc + stats.is_rx_ahdemo_mgt + stats.is_rx_bad_auth + stats.is_rx_unauth + stats.is_rx_badkeyid + stats.is_rx_ccmpreplay + stats.is_rx_ccmpformat + stats.is_rx_ccmpmic + stats.is_rx_tkipreplay + stats.is_rx_tkipformat + stats.is_rx_tkipmic + stats.is_rx_tkipicv + stats.is_rx_badcipher + stats.is_rx_nocipherctx + stats.is_rx_acl + stats.is_rx_badathtnl)
  elseif string.find(L5_98, "UnicastPacketsSent") ~= nil then
    L2_95 = tostring(staStats.ns_tx_ucast)
  elseif string.find(L5_98, "UnicastPacketsReceived") ~= nil then
    L2_95 = tostring(staStats.ns_rx_ucast)
  elseif string.find(L5_98, "DiscardPacketsSent") ~= nil then
    L2_95 = tostring(stats.is_tx_nobuf + stats.is_tx_noheadroom)
  elseif string.find(L5_98, "DiscardPacketsReceived") ~= nil then
    L2_95 = tostring(stats.is_rx_nobuf)
  elseif string.find(L5_98, "MulticastPacketsSent") ~= nil then
    L2_95 = tostring(stats.is_tx_mcast)
  elseif string.find(L5_98, "MulticastPacketsReceived") ~= nil then
    L2_95 = tostring(stats.is_rx_mcast)
  elseif string.find(L5_98, "BroadcastPacketsSent") ~= nil then
    L2_95 = tostring(stats.is_tx_mcast)
  elseif string.find(L5_98, "BroadcastPacketsReceived") ~= nil then
    L2_95 = tostring(stats.is_rx_mcast)
  end
  return L1_94, L2_95
end
function dot11Tr.WMMParamGet(A0_103)
  local L1_104, L2_105, L3_106, L4_107, L5_108, L6_109
  L1_104 = "0"
  L2_105 = "0"
  L3_106 = A0_103.param
  L4_107 = 0
  L5_108 = dot11Tr
  L5_108 = L5_108.vapRowGet
  L6_109 = L3_106
  L5_108 = L5_108(L6_109, "APWMMParameter")
  if L5_108 == nil then
    L6_109 = "1"
    return L6_109, "DB_ERROR_TRY_AGAIN"
  end
  L6_109 = dot11
  L6_109 = L6_109.interfaceNameFromVapNameGet
  L6_109 = L6_109(L5_108.vapName)
  if L6_109 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  instance = tr69Glue.instanceNumberGet(L3_106, 3)
  accessCategory = tonumber(instance) - 1
  if string.find(A0_103.param, "AIFSN") ~= nil then
    L4_107 = dot11.WMMParamGet(L6_109, accessCategory, 1)
  elseif string.find(A0_103.param, "ECWMin") ~= nil then
    L4_107 = dot11.WMMParamGet(L6_109, accessCategory, 2)
  elseif string.find(A0_103.param, "ECWMax") ~= nil then
    L4_107 = dot11.WMMParamGet(L6_109, accessCategory, 3)
  elseif string.find(A0_103.param, "TXOP") ~= nil then
    L4_107 = dot11.WMMParamGet(L6_109, accessCategory, 4)
  elseif string.find(A0_103.param, "AckPolicy") ~= nil then
    L4_107 = dot11.WMMParamGet(L6_109, accessCategory, 5)
  end
  L2_105 = tostring(L4_107)
  return L1_104, L2_105
end
function dot11Tr.WEPKeySet(A0_110)
  local L1_111, L2_112, L3_113, L4_114
  L1_111 = print
  L2_112 = "Tbl: "
  L3_113 = util
  L3_113 = L3_113.tableToStringRec
  L4_114 = A0_110
  L3_113 = L3_113(L4_114)
  L2_112 = L2_112 .. L3_113
  L1_111(L2_112)
  L1_111 = dot11Tr
  L1_111 = L1_111.vapRowGet
  L2_112 = A0_110.param
  L3_113 = "WEPKey"
  L1_111 = L1_111(L2_112, L3_113)
  if L1_111 == nil then
    L2_112 = print
    L3_113 = "no vap"
    L2_112(L3_113)
    L2_112 = "1"
    L3_113 = "DB_ERROR_TRY_AGAIN"
    return L2_112, L3_113
  end
  L2_112 = L1_111.profileName
  L3_113 = "profileName='"
  L4_114 = L2_112
  L3_113 = L3_113 .. L4_114 .. "'"
  L4_114 = db
  L4_114 = L4_114.getRowWhere
  L4_114 = L4_114("dot11Profile", L3_113, true)
  L1_111 = L4_114
  if L1_111 == nil then
    L4_114 = print
    L4_114("no profile")
    L4_114 = "1"
    return L4_114, "DB_ERROR_TRY_AGAIN"
  end
  L4_114 = tr69Glue
  L4_114 = L4_114.instanceNumberGet
  L4_114 = L4_114(A0_110.param, 3)
  instance = L4_114
  L4_114 = tostring
  L4_114 = L4_114(instance)
  L4_114 = L4_114 - 1
  L1_111["dot11Profile.wepkey" .. L4_114] = A0_110.value
  result, errCode = dot11.profile_config(L1_111, L1_111["dot11Profile._ROWID_"], "edit")
  if result ~= "OK" then
    print("config error")
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  return "0"
end
function dot11Tr.WMMParamSet(A0_115)
  local L1_116, L2_117, L3_118, L4_119, L5_120, L6_121, L7_122
  L1_116 = "0"
  L2_117 = "0"
  L3_118 = A0_115.param
  L4_119 = 0
  L5_120 = dot11Tr
  L5_120 = L5_120.vapRowGet
  L6_121 = L3_118
  L7_122 = "APWMMParameter"
  L5_120 = L5_120(L6_121, L7_122)
  if L5_120 == nil then
    L6_121 = "1"
    L7_122 = "DB_ERROR_TRY_AGAIN"
    return L6_121, L7_122
  end
  L6_121 = L5_120.profileName
  L7_122 = dot11
  L7_122 = L7_122.interfaceNameFromVapNameGet
  L7_122 = L7_122(L5_120.vapName)
  if L7_122 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  instance = tr69Glue.instanceNumberGet(L3_118, 3)
  accessCategory = tonumber(instance)
  L2_117 = tonumber(A0_115.value)
  if string.find(A0_115.param, "AIFSN") ~= nil then
    L1_116 = dot11.SetAIFS(L6_121, accessCategory, L2_117)
  elseif string.find(A0_115.param, "ECWMin") ~= nil then
    L1_116 = dot11.SetCWmin(L6_121, accessCategory, L2_117)
  elseif string.find(A0_115.param, "ECWMax") ~= nil then
    L1_116 = dot11.SetCWmax(L6_121, accessCategory, L2_117)
  elseif string.find(A0_115.param, "TXOP") ~= nil then
    L1_116 = dot11.SetTXOPLimit(L6_121, accessCategory, L2_117)
  elseif string.find(A0_115.param, "AckPolicy") ~= nil then
  end
  L1_116 = dot11.SetProfile(L6_121, L7_122)
  return L1_116
end
function dot11Tr.ACLConfigSet(A0_123)
  local L1_124, L2_125, L3_126, L4_127, L5_128, L6_129, L7_130, L8_131, L9_132, L10_133, L11_134, L12_135, L13_136
  L1_124 = require
  L2_125 = "ifDevLib"
  L1_124(L2_125)
  L1_124 = 1
  L2_125 = 0
  L3_126 = 0
  L4_127 = nil
  L5_128 = A0_123.param
  L6_129 = A0_123.value
  L7_130 = dot11Tr
  L7_130 = L7_130.wirelessIfTblGet
  L8_131 = L5_128
  L7_130 = L7_130(L8_131, L9_132)
  if L7_130 == nil then
    L8_131 = "1"
    return L8_131
  end
  L8_131 = db
  L8_131 = L8_131.getTable
  L8_131 = L8_131(L9_132, L10_133)
  if L8_131 == nil then
    return L9_132
  end
  for L12_135, L13_136 in L9_132(L10_133) do
    if dot11Tr.ifnameLookup(L7_130, L13_136.vapName) == true then
      dot11Tr.ACLDelete(L13_136)
    end
  end
  while L1_124 ~= nil do
    L3_126 = L2_125 + 1
    L12_135 = L3_126
    L2_125 = L10_133
    L1_124 = L9_132
    if L1_124 ~= nil then
      L12_135 = L1_124 - 1
      L4_127 = L9_132
    else
      L4_127 = L9_132
    end
    if L9_132 ~= nil then
      L9_132(L10_133, L11_134)
    end
  end
  return L9_132
end
function dot11Tr.wirelessIfTblGet(A0_137, A1_138)
  local L2_139, L3_140, L4_141, L5_142, L6_143, L7_144, L8_145, L9_146, L10_147
  L6_143 = string
  L6_143 = L6_143.find
  L7_144 = A0_137
  L8_145 = A1_138
  L7_144 = L6_143(L7_144, L8_145)
  L5_142 = L7_144
  L4_141 = L6_143
  L6_143 = string
  L6_143 = L6_143.sub
  L7_144 = A0_137
  L8_145 = 1
  L9_146 = L4_141 - 1
  L6_143 = L6_143(L7_144, L8_145, L9_146)
  L3_140 = L6_143
  L6_143 = tr69Glue
  L6_143 = L6_143.instanceMapLoad
  L6_143 = L6_143()
  if L6_143 == nil then
    L7_144 = nil
    return L7_144
  end
  L2_139 = L6_143[L3_140]
  if L2_139 == nil then
    L7_144 = nil
    return L7_144
  end
  L7_144 = "_ROWID_="
  L8_145 = L2_139
  L7_144 = L7_144 .. L8_145
  L8_145 = db
  L8_145 = L8_145.getRowWhere
  L9_146 = "bridgeTable"
  L10_147 = L7_144
  L8_145 = L8_145(L9_146, L10_147, false)
  if L8_145 == nil then
    L9_146 = nil
    return L9_146
  end
  L9_146 = L8_145.interfaceName
  L10_147 = "bridgeInterface='"
  L7_144 = L10_147 .. L9_146 .. "'"
  L10_147 = db
  L10_147 = L10_147.getRowsWhere
  L10_147 = L10_147("bridgePorts", L7_144, false)
  if L10_147 == nil then
    return nil
  end
  for _FORV_16_, _FORV_17_ in pairs(L10_147) do
    if string.find(_FORV_17_.interfaceName, "vap") ~= nil then
      ({})[1] = {}
      ;({})[1].ifname = _FORV_17_.interfaceName
      ;({})[1].vapName = db.getAttribute("dot11Interface", "interfaceName", _FORV_17_.interfaceName, "vapName")
    end
  end
  return {}
end
function dot11Tr.ifnameLookup(A0_148, A1_149)
  for _FORV_6_, _FORV_7_ in pairs(A0_148) do
    if _FORV_7_.ifname == dot11.interfaceNameFromVapNameGet(A1_149) then
      return true
    end
  end
  return false
end
function dot11Tr.ACLConfigGet(A0_150)
  local L1_151, L2_152, L3_153, L4_154, L5_155
  L1_151 = "0"
  L2_152 = ""
  L3_153 = A0_150.param
  L4_154 = dot11Tr
  L4_154 = L4_154.wirelessIfTblGet
  L5_155 = L3_153
  L4_154 = L4_154(L5_155, "LANHostConfigManagement")
  if L4_154 == nil then
    L5_155 = "1"
    return L5_155
  end
  L5_155 = db
  L5_155 = L5_155.getTable
  L5_155 = L5_155("dot11ACL", false)
  rows = L5_155
  L5_155 = rows
  if L5_155 == nil then
    L5_155 = "1"
    return L5_155
  end
  L5_155 = ""
  for _FORV_10_, _FORV_11_ in pairs(rows) do
    if _FORV_11_.vapName == _FORV_11_.vapName and dot11Tr.ifnameLookup(L4_154, _FORV_11_.vapName) == true then
      if L5_155 ~= nil then
        L5_155 = L5_155 .. "," .. _FORV_11_.macAddress
      else
        L5_155 = _FORV_11_.macAddress
      end
    end
  end
  L2_152 = L5_155
  return L1_151, L2_152
end
function dot11Tr.ACLAdd(A0_156, A1_157)
  local L2_158
  L2_158 = {}
  for _FORV_6_, _FORV_7_ in pairs(A0_156) do
    L2_158["dot11ACL.hostName"] = "tr69_" .. _FORV_7_.vapName .. "_" .. A1_157
    L2_158["dot11ACL.macAddress"] = A1_157
    L2_158["dot11ACL.vapName"] = _FORV_7_.vapName
    status, errMsg = dot11.ACL_config(L2_158, "-1", "add")
  end
  return status, errMsg
end
function dot11Tr.ACLDelete(A0_159)
  local L1_160
  L1_160 = {}
  L1_160[1] = A0_159._ROWID_
  status, errMsg = dot11.ACL_config(L1_160, "-1", "delete")
  return status, errMsg
end
function dot11Tr.PreSharedKeySet(A0_161)
  local L1_162, L2_163, L3_164
  L1_162 = dot11Tr
  L1_162 = L1_162.vapRowGet
  L2_163 = A0_161.param
  L3_164 = "PreSharedKey"
  L1_162 = L1_162(L2_163, L3_164)
  if L1_162 == nil then
    L2_163 = "1"
    L3_164 = "DB_ERROR_TRY_AGAIN"
    return L2_163, L3_164
  end
  L2_163 = L1_162.profileName
  L3_164 = "profileName='"
  L3_164 = L3_164 .. L2_163 .. "'"
  L1_162 = db.getRowWhere("dot11Profile", L3_164, true)
  if L1_162 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  L1_162["dot11Profile.pskPassHex"] = A0_161.value
  L1_162["dot11Profile.pskPassAscii"] = nil
  status = dot11.SetPSKHex(L2_163, A0_161.value)
  if status ~= 0 then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  result, errCode = dot11.profile_config(L1_162, L1_162["dot11Profile._ROWID_"], "edit")
  if result ~= "OK" then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  return "0"
end
function dot11Tr.KeyPassphraseSet(A0_165)
  local L1_166, L2_167, L3_168
  L1_166 = dot11Tr
  L1_166 = L1_166.vapRowGet
  L2_167 = A0_165.param
  L3_168 = "PreSharedKey"
  L1_166 = L1_166(L2_167, L3_168)
  if L1_166 == nil then
    L2_167 = "1"
    L3_168 = "DB_ERROR_TRY_AGAIN"
    return L2_167, L3_168
  end
  L2_167 = L1_166.profileName
  L3_168 = "profileName='"
  L3_168 = L3_168 .. L2_167 .. "'"
  L1_166 = db.getRowWhere("dot11Profile", L3_168, true)
  if L1_166 == nil then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  L1_166["dot11Profile.pskPassAscii"] = A0_165.value
  result, errCode = dot11.profile_config(L1_166, L1_166["dot11Profile._ROWID_"], "edit")
  if result ~= "OK" then
    return "1", "DB_ERROR_TRY_AGAIN"
  end
  return "0"
end
