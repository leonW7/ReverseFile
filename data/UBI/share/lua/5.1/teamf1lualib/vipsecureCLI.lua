local L0_0
L0_0 = require
L0_0("teamf1lualib/vipSecure")
L0_0 = require
L0_0("teamf1lualib/ipSec")
L0_0 = require
L0_0("teamf1lualib/dhcpOverIpSec")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = UNIT_NAME
if L0_0 ~= "DSR-1000" then
  L0_0 = UNIT_NAME
  if L0_0 ~= "DSR-1000N" then
    L0_0 = UNIT_NAME
    if L0_0 ~= "DSR-500" then
      L0_0 = UNIT_NAME
      if L0_0 ~= "DSR-500N" then
        L0_0 = UNIT_NAME
        if L0_0 ~= "DSR-250" then
          L0_0 = UNIT_NAME
          if L0_0 ~= "DSR-250N" then
            L0_0 = UNIT_NAME
            if L0_0 ~= "DSR-150" then
              L0_0 = UNIT_NAME
            end
          end
        end
      end
    end
  end
elseif L0_0 == "DSR-150N" then
  L0_0 = require
  L0_0("teamf1lualib/validations_cli")
end
L0_0 = "0"
MAIN_MODE = L0_0
L0_0 = "1"
AGGRESSIVE_MODE = L0_0
L0_0 = "0"
WAN_IP = L0_0
L0_0 = "1"
FQDN = L0_0
L0_0 = "2"
USER_FQDN = L0_0
L0_0 = "3"
DER_ASN1_DN = L0_0
L0_0 = 70
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
  L0_0 = 70
elseif PRODUCT_ID == "DSR-500AC_Ax" or PRODUCT_ID == "DSR-500_Bx" or PRODUCT_ID == "DSR-500_Ax" or PRODUCT_ID == "DSR-500N_Ax" then
  L0_0 = 35
elseif UNIT_NAME == "DSR-250" or UNIT_NAME == "DSR-250N" then
  L0_0 = 25
elseif UNIT_NAME == "DSR-150" or UNIT_NAME == "DSR-150N" then
  L0_0 = 10
end
function ipsecVpnPolicyCfgInit(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L1_2 = db
  L1_2 = L1_2.getRow
  L2_3 = "IpsecVPNPolicy"
  L3_4 = "VPNPolicyName"
  L4_5 = A0_1[1]
  L1_2 = L1_2(L2_3, L3_4, L4_5)
  L2_3 = {}
  L3_4 = {}
  if L1_2 == nil then
    L4_5 = db
    L4_5 = L4_5.getDefaults
    L5_6 = true
    L6_7 = "IpsecIKEPolicy"
    L7_8 = "IpsecVPNPolicy"
    L4_5 = L4_5(L5_6, L6_7, L7_8)
    L3_4 = L4_5
    L4_5 = A0_1[1]
    L3_4["IpsecVPNPolicy.VPNPolicyName"] = L4_5
    L4_5 = A0_1[1]
    L3_4["IpsecVPNPolicy.IKEPolicyName"] = L4_5
    L4_5 = A0_1[1]
    L3_4["IpsecIKEPolicy.IKEPolicyName"] = L4_5
    L4_5 = "-1"
    RowId = L4_5
  else
    L4_5 = L1_2["IpsecVPNPolicy._ROWID_"]
    RowId = L4_5
    L4_5 = db
    L4_5 = L4_5.getAttribute
    L5_6 = "IpsecVPNPolicy"
    L6_7 = "_ROWID_"
    L7_8 = RowId
    L8_9 = "IKEPolicyName"
    L4_5 = L4_5(L5_6, L6_7, L7_8, L8_9)
    L5_6 = db
    L5_6 = L5_6.getRow
    L6_7 = "IpsecVPNPolicy"
    L7_8 = "_ROWID_"
    L8_9 = RowId
    L5_6 = L5_6(L6_7, L7_8, L8_9)
    L3_4 = L5_6
    L5_6 = L3_4["IpsecVPNPolicy.PolicyType"]
    if L5_6 == "1" then
      L5_6 = db
      L5_6 = L5_6.getAttribute
      L6_7 = "IpsecIKEPolicy"
      L7_8 = "IKEPolicyName"
      L8_9 = L4_5
      L5_6 = L5_6(L6_7, L7_8, L8_9, "_ROWID_")
      L6_7 = db
      L6_7 = L6_7.getRow
      L7_8 = "IpsecIKEPolicy"
      L8_9 = "_ROWID_"
      L6_7 = L6_7(L7_8, L8_9, L5_6)
      L2_3 = L6_7
      L6_7 = util
      L6_7 = L6_7.tableAppend
      L7_8 = L3_4
      L8_9 = L2_3
      L6_7(L7_8, L8_9)
      L6_7 = L3_4["IpsecIKEPolicy.XAUTHType"]
      if L6_7 == "2" then
        L3_4["IpsecIKEPolicy.XAUTHType"] = "2"
        L3_4["IpsecIKEPolicy.XAUTHType1"] = "2"
      end
      L6_7 = tonumber
      L7_8 = L3_4["IpsecIKEPolicy.XAUTHType"]
      L6_7 = L6_7(L7_8)
      if L6_7 >= 3 then
        L6_7 = L3_4["IpsecIKEPolicy.XAUTHType"]
        L3_4["IpsecIKEPolicy.XAUTHType1"] = L6_7
        L3_4["IpsecIKEPolicy.XAUTHType"] = "2"
        L6_7 = tonumber
        L7_8 = L3_4["IpsecIKEPolicy.XAUTHType1"]
        L6_7 = L6_7(L7_8)
        if L6_7 >= 7 then
          L6_7 = tonumber
          L7_8 = L3_4["IpsecIKEPolicy.XAUTHType1"]
          L6_7 = L6_7(L7_8)
          if L6_7 <= 10 then
            L6_7 = setXauthProfile
            L7_8 = L3_4
            L8_9 = L3_4["IpsecIKEPolicy.XAUTHType1"]
            L6_7 = L6_7(L7_8, L8_9)
            valid = L6_7
            L6_7 = valid
            if L6_7 == false then
              L6_7 = false
              return L6_7
            end
          end
        end
      end
      L6_7 = tonumber
      L7_8 = L3_4["IpsecIKEPolicy.EncryptionAlgorithm"]
      L6_7 = L6_7(L7_8)
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = L6_7
      L6_7 = L3_4["IpsecIKEPolicy.KeyLength"]
      L7_8 = {}
      L8_9 = L3_4["IpsecIKEPolicy.KeyLength"]
      if L8_9 ~= nil then
        L8_9 = util
        L8_9 = L8_9.split
        L8_9 = L8_9(L3_4["IpsecIKEPolicy.KeyLength"], ",")
        L7_8 = L8_9
      end
      L8_9 = 1
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.DES"] = "1"
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.3DES"] = "1"
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.AES-128"] = "1"
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.AES-192"] = "1"
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.AES-256"] = "1"
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.BLOWFISH"] = "1"
        L3_4["IpsecIKEPolicy.BLOWFISHKEYLEN"] = L7_8[L8_9]
        L8_9 = L8_9 + 1
      end
      L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.CAST128"] = "1"
        L3_4["IpsecIKEPolicy.CAST128KEYLEN"] = L7_8[L8_9]
        L8_9 = L8_9 + 1
      end
      L3_4["IpsecIKEPolicy.AuthAlgorithm"] = tonumber(L3_4["IpsecIKEPolicy.AuthAlgorithm"])
      if L3_4["IpsecIKEPolicy.AuthAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.MD5"] = "1"
      end
      L3_4["IpsecIKEPolicy.AuthAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.AuthAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.AuthAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.SHA1"] = "1"
      end
      L3_4["IpsecIKEPolicy.AuthAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.AuthAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.AuthAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.SHA2-256"] = "1"
      end
      L3_4["IpsecIKEPolicy.AuthAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.AuthAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.AuthAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.SHA2-384"] = "1"
      end
      L3_4["IpsecIKEPolicy.AuthAlgorithm"] = math.floor(L3_4["IpsecIKEPolicy.AuthAlgorithm"] / 2)
      if L3_4["IpsecIKEPolicy.AuthAlgorithm"] % 2 ~= 0 then
        L3_4["IpsecIKEPolicy.SHA2-512"] = "1"
      end
    else
      L5_6 = db
      L5_6 = L5_6.getDefaults
      L6_7 = true
      L7_8 = "IpsecIKEPolicy"
      L5_6 = L5_6(L6_7, L7_8)
      L2_3 = L5_6
      L5_6 = util
      L5_6 = L5_6.tableAppend
      L6_7 = L3_4
      L7_8 = L2_3
      L5_6(L6_7, L7_8)
      L5_6 = L3_4["IpsecVPNPolicy.VPNPolicyName"]
      L3_4["IpsecVPNPolicy.IKEPolicyName"] = L5_6
      L3_4["IpsecIKEPolicy.AES-128"] = "1"
      L3_4["IpsecIKEPolicy.SHA1"] = "1"
    end
    L5_6 = tonumber
    L6_7 = L3_4["IpsecVPNPolicy.EncryptionAlgorithm"]
    L5_6 = L5_6(L6_7)
    L3_4["IpsecVPNPolicy.EncryptionAlgorithm"] = L5_6
    L5_6 = L3_4["IpsecVPNPolicy.KeyLength"]
    L6_7 = {}
    L7_8 = L3_4["IpsecVPNPolicy.KeyLength"]
    if L7_8 ~= nil then
      L7_8 = util
      L7_8 = L7_8.split
      L8_9 = L3_4["IpsecVPNPolicy.KeyLength"]
      L7_8 = L7_8(L8_9, ",")
      L6_7 = L7_8
    end
    L7_8 = 1
    keyCount = L7_8
    L7_8 = L3_4["IpsecVPNPolicy.EncryptionAlgorithm"]
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.DES"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.3DES"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.AES-128"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.AES-192"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.AES-256"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.TWOFISH-128"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.TWOFISH-192"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.TWOFISH-256"] = "1"
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.BLOWFISH"] = "1"
      L8_9 = keyCount
      L8_9 = L6_7[L8_9]
      L3_4["IpsecVPNPolicy.BLOWFISHKEYLEN"] = L8_9
      L8_9 = keyCount
      L8_9 = L8_9 + 1
      keyCount = L8_9
    end
    L8_9 = math
    L8_9 = L8_9.floor
    L8_9 = L8_9(L7_8 / 2)
    L7_8 = L8_9
    L8_9 = L7_8 % 2
    if L8_9 ~= 0 then
      L3_4["IpsecVPNPolicy.CAST128"] = "1"
      L8_9 = keyCount
      L8_9 = L6_7[L8_9]
      L3_4["IpsecVPNPolicy.CAST128KEYLEN"] = L8_9
      L8_9 = keyCount
      L8_9 = L8_9 + 1
      keyCount = L8_9
    end
    L8_9 = tonumber
    L8_9 = L8_9(L3_4["IpsecVPNPolicy.AuthAlgorithm"])
    L3_4["IpsecVPNPolicy.AuthAlgorithm"] = L8_9
    L8_9 = L3_4["IpsecVPNPolicy.AuthAlgorithm"]
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.MD5"] = "1"
    end
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.SHA1"] = "1"
    end
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.SHA2-256"] = "1"
    end
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.SHA2-384"] = "1"
    end
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.SHA2-512"] = "1"
    end
    L8_9 = math.floor(L8_9 / 2)
    if L8_9 % 2 ~= 0 then
      L3_4["IpsecVPNPolicy.SHA2-224"] = "1"
    end
    if L3_4["IpsecVPNPolicy.PFSKeyGroup"] ~= "0" then
      L3_4["IpsecVPNPolicy.PFSKeyGroup1"] = L3_4["IpsecVPNPolicy.PFSKeyGroup"]
      L3_4["IpsecVPNPolicy.PFSKeyGroup"] = "1"
    else
      L3_4["IpsecVPNPolicy.PFSKeyGroup1"] = "2"
    end
  end
  L4_5 = 1
  L5_6 = L3_4
  return L4_5, L5_6
end
function ipsecVpnPolicyCfgSave(A0_10)
  errorFlag = "ERROR"
  statusCode = ""
  statusMessage = ""
  if tonumber(RowId) == -1 and #db.getTable("IpsecVPNPolicy") >= _UPVALUE0_ then
    print("max Policies Limit Reached.")
    return "ERROR", ""
  end
  errorFlag, statusCode = ipsec.l2tpIpsecPolicyConfig(A0_10)
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return errorFlag, statusMessage
end
function ipsecVpnPolicyCfgInputVal(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20
  L1_12 = true
  L2_13 = "OK"
  L3_14 = 128
  L4_15 = 0
  L5_16 = 24
  L6_17 = 0
  L7_18 = A0_11["IpsecIKEPolicy.AddressFamily"]
  A0_11["IpsecVPNPolicy.AddressFamily"] = L7_18
  L7_18 = db
  L7_18 = L7_18.getAttribute
  L8_19 = "networkInfo"
  L9_20 = "_ROWID_"
  L7_18 = L7_18(L8_19, L9_20, "1", "netWorkMode")
  if L7_18 ~= "3" then
    L8_19 = A0_11["IpsecVPNPolicy.AddressFamily"]
    if L8_19 == "10" then
      L8_19 = printCLIError
      L9_20 = "Router should be in IPV6 mode to configure IPV6 policy"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
  if L8_19 ~= "1" then
    L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
  else
    if L8_19 == "2" then
      A0_11["IpsecVPNPolicy.TunnelOrTransport"] = "0"
  end
  else
    A0_11["IpsecVPNPolicy.TunnelOrTransport"] = "1"
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "2" then
    L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
    if L8_19 ~= "1" then
      L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
    elseif L8_19 == "2" then
      L8_19 = printCLIError
      L9_20 = "Can't configure l2tp mode when policy type is selected as Manual policy"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "2" then
    L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPointType"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "when manual policy selected remote end point type should be IPAddress"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "2" then
    L8_19 = A0_11["IpsecVPNPolicy.EnableKeepAlive"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "when manual policy selected we can't enable keepalive"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.EnableKeepAlive"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.Direction"]
      if L8_19 == "1" then
        L8_19 = printCLIError
        L9_20 = "when direction type is selected as Responder, we can't enable keepalive and vice-versa"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.AddressFamily"]
  if L8_19 == "10" then
    L8_19 = A0_11["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "can't enable dhcpover ipsec when protocol family ipv6 selected"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.AddressFamily"]
  if L8_19 == "10" then
    L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "can't enable modeconfig when protocol family ipv6 selected"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.AddressFamily"]
  if L8_19 == "10" then
    L8_19 = A0_11["IpsecVPNPolicy.Rollover"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "can't enable rollover when protocol family ipv6 selected"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPointType"]
  if L8_19 == "0" then
    L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
    if L8_19 ~= "1" then
      L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
        if L8_19 ~= "" then
          L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
        end
      elseif L8_19 == "0.0.0.0" then
        L8_19 = printCLIError
        L9_20 = "Invalid IPAddress"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
  else
    L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPointType"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
      if L8_19 ~= "1" then
        L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
        if L8_19 ~= nil then
          L8_19 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
          if L8_19 ~= "" then
            L8_19 = string
            L8_19 = L8_19.len
            L9_20 = A0_11["IpsecVPNPolicy.RemoteEndPoint"]
            L8_19 = L8_19(L9_20)
          end
        elseif L8_19 > 127 then
          L8_19 = printCLIError
          L9_20 = "Invalid FQDN.Please specify a Fully Qualified Domain Name for the remote endpoint with length less than 128 characters"
          L8_19(L9_20)
          L8_19 = false
          return L8_19
        end
      end
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.TunnelOrTransport"]
  if L8_19 == "0" then
    L8_19 = A0_11["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "Cannot use transport mode when dhcp is enabled setting back to Tunnel mode"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.EnableDhcpOverIPSec"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecIKEPolicy.Direction"]
    if L8_19 ~= "1" then
      L8_19 = printCLIError
      L9_20 = "Can not use Direction type Initiator or Both when DHCP over Ipsec is enabled.Please select Responder direction type"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
    if L8_19 == "2" then
      L8_19 = printCLIError
      L9_20 = "Cannot enable Mode Config for manual policy"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.TunnelOrTransport"]
      if L8_19 == "0" then
        L8_19 = printCLIError
        L9_20 = "Please select Tunnel Mode when Mode Config is enabled"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "Cannot enable DHCP over IPsec when Mode Config enabled"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.Netbios"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "Cannot enable NetBIOS when Mode Config enabled"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.modeConfigStatus"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.Rollover"]
    if L8_19 == "1" then
      L8_19 = printCLIError
      L9_20 = "Cannot enable Rollover when Mode Config enabled"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.TunnelOrTransport"]
  if L8_19 == "1" then
    L8_19 = A0_11["IpsecVPNPolicy.Rollover"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
      if L8_19 == "2" then
        L8_19 = printCLIError
        L9_20 = "Rollover cannot be enabled when using manual policy. Disabling it automatically"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecVPNPolicy.EnableDhcpOverIPSec"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.Netbios"]
      if L8_19 == "1" then
        L8_19 = printCLIError
        L9_20 = "Cannot enable NetBIOS when DHCP Over IPsec enabled"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.RVGStatus"]
  if L8_19 == "1" then
    L8_19 = checkBackupValidations
    L9_20 = A0_11
    L8_19 = L8_19(L9_20)
    L1_12 = L8_19
    if L1_12 == false then
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = A0_11["IpsecVPNPolicy.L2tpIpsecPolicy"]
  if L8_19 == "1" then
    A0_11["IpsecIKEPolicy.Direction"] = "1"
    L8_19 = A0_11["IpsecIKEPolicy.RemoteIdentifierType"]
    if L8_19 == "0" then
      L8_19 = printCLIError
      L9_20 = "Please select remote identifier type as different since you selected l2tp mode as client"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
  end
  L8_19 = ipaddressValidate
  L9_20 = A0_11
  L8_19 = L8_19(L9_20)
  if L8_19 then
  else
    L8_19 = false
    return L8_19
  end
  L8_19 = A0_11["IpsecVPNPolicy.PolicyType"]
  if L8_19 == "2" then
    L8_19 = spiValidate
    L9_20 = A0_11
    L8_19 = L8_19(L9_20)
    if L8_19 then
    else
      L8_19 = false
      return L8_19
    end
    L8_19 = encryptAlgorithmValidate
    L9_20 = A0_11
    L8_19 = L8_19(L9_20)
    if L8_19 then
    else
      L8_19 = false
      return L8_19
    end
    L8_19 = authAlgorithmValidate
    L9_20 = A0_11
    L8_19 = L8_19(L9_20)
    if L8_19 then
    else
      L8_19 = false
      return L8_19
    end
    L8_19 = true
    return L8_19
  else
    L8_19 = A0_11["IpsecIKEPolicy.ExchangeMode"]
    if L8_19 ~= nil then
      L8_19 = A0_11["IpsecIKEPolicy.ExchangeMode"]
    elseif L8_19 == "" then
      L8_19 = printCLIError
      L9_20 = "Enter valid exchange_mode"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
    L8_19 = A0_11["IpsecIKEPolicy.NatTraversal"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
        if L8_19 ~= "" then
          L8_19 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
        end
      elseif L8_19 == "0" then
        L8_19 = printCLIError
        L9_20 = "Enter valid nat_keepalive_frequecy"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
    if L8_19 ~= nil then
      L8_19 = tonumber
      L9_20 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
      L8_19 = L8_19(L9_20)
      if not (L8_19 < 5) then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecIKEPolicy.NatKeepAliveTime"]
        L8_19 = L8_19(L9_20)
      elseif L8_19 > 3600 then
        L8_19 = printCLIError
        L9_20 = "Enter valid nat_keepalive_frequecy value between 5-3600 seconds"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.LocalIdentifierType"]
    if L8_19 ~= "0" then
      L8_19 = A0_11["IpsecIKEPolicy.LocalIdentifier"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.LocalIdentifier"]
        if L8_19 ~= "" then
          L8_19 = string
          L8_19 = L8_19.len
          L9_20 = A0_11["IpsecIKEPolicy.LocalIdentifier"]
          L8_19 = L8_19(L9_20)
        end
      elseif L8_19 > 127 then
        L8_19 = printCLIError
        L9_20 = "Enter valid local indentifier with length less than 128 characters"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.RemoteIdentifierType"]
    if L8_19 ~= "0" then
      L8_19 = A0_11["IpsecIKEPolicy.RemoteIdentifier"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.RemoteIdentifier"]
        if L8_19 ~= "" then
          L8_19 = string
          L8_19 = L8_19.len
          L9_20 = A0_11["IpsecIKEPolicy.RemoteIdentifier"]
          L8_19 = L8_19(L9_20)
        end
      elseif L8_19 > 127 then
        L8_19 = printCLIError
        L9_20 = "Enter valid remote indentifier with length less than 128 characters"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.ExchangeMode"]
    L9_20 = MAIN_MODE
    if L8_19 == L9_20 then
      L8_19 = A0_11["IpsecIKEPolicy.LocalIdentifierType"]
      L9_20 = USER_FQDN
      if L8_19 ~= L9_20 then
        L8_19 = A0_11["IpsecIKEPolicy.RemoteIdentifierType"]
        L9_20 = USER_FQDN
      elseif L8_19 == L9_20 then
        L8_19 = printCLIError
        L9_20 = "User-FQDN is used only for Aggressive mode."
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.AuthType"]
    if L8_19 == "0" then
      L8_19 = A0_11["IpsecIKEPolicy.Presharedkey"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.Presharedkey"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Enter valid preshared key"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = string
    L8_19 = L8_19.gsub
    L9_20 = A0_11["IpsecIKEPolicy.Presharedkey"]
    L8_19 = L8_19(L9_20, "'", "''")
    A0_11["IpsecIKEPolicy.Presharedkey"] = L8_19
    L8_19 = A0_11["IpsecIKEPolicy.DPD"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.DPDDetectionPeriod"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.DPDDetectionPeriod"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Enter valid detection period"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = A0_11["IpsecIKEPolicy.DPDFailureCount"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.DPDFailureCount"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Enter valid reconnect failure count"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.UserName"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.UserName"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Enter valid xauth username"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = string
      L8_19 = L8_19.len
      L9_20 = A0_11["IpsecIKEPolicy.UserName"]
      L8_19 = L8_19(L9_20)
      if L5_16 < L8_19 or L6_17 > L8_19 then
        L9_20 = printCLIError
        L9_20("Please enter upto 24 characters for UserName.")
        L9_20 = false
        return L9_20
      end
      L9_20 = A0_11["IpsecIKEPolicy.Password"]
      if L9_20 ~= nil then
        L9_20 = A0_11["IpsecIKEPolicy.Password"]
      elseif L9_20 == "" then
        L9_20 = printCLIError
        L9_20("Enter valid xauth password")
        L9_20 = false
        return L9_20
      end
      L9_20 = string
      L9_20 = L9_20.len
      L9_20 = L9_20(A0_11["IpsecIKEPolicy.Password"])
      if L3_14 < L9_20 or L4_15 > L9_20 then
        printCLIError("Please enter upto 128 characters for Password.")
        return false
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
    if L8_19 == "2" then
      L8_19 = A0_11["IpsecIKEPolicy.XAUTHType1"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.XAUTHType1"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Enter a valid xauth type"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
    if L8_19 == "2" then
      L8_19 = tonumber
      L9_20 = A0_11["IpsecIKEPolicy.XAUTHType1"]
      L8_19 = L8_19(L9_20)
      if L8_19 >= 7 then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecIKEPolicy.XAUTHType1"]
        L8_19 = L8_19(L9_20)
        if L8_19 <= 10 then
          A0_11["IpsecIKEPolicy.XAUTHType"] = "2"
          L8_19 = setXauthProfile
          L9_20 = A0_11
          L8_19 = L8_19(L9_20, A0_11["IpsecIKEPolicy.XAUTHType1"])
          L1_12 = L8_19
          if L1_12 == false then
            L8_19 = false
            return L8_19
          end
        end
      end
    end
    L8_19 = A0_11["IpsecVPNPolicy.SALifeTime"]
    if L8_19 ~= nil then
      L8_19 = A0_11["IpsecVPNPolicy.SALifeTime"]
    elseif L8_19 == "" then
      L8_19 = printCLIError
      L9_20 = "Enter valid phase2 sa lifetime"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
    L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
    if L8_19 ~= "0" then
      L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
      if L8_19 ~= "" then
        L8_19 = A0_11["IpsecIKEPolicy.XAUTHType"]
      end
    elseif L8_19 == nil then
      A0_11["IpsecIKEPolicy.XAUTHType1"] = nil
      A0_11["IpsecIKEPolicy.UserName"] = nil
      A0_11["IpsecIKEPolicy.Password"] = nil
    end
    L8_19 = A0_11["IpsecIKEPolicy.SALifeTime"]
    if L8_19 ~= nil then
      L8_19 = A0_11["IpsecIKEPolicy.SALifeTime"]
    elseif L8_19 == "" then
      L8_19 = printCLIError
      L9_20 = "Enter valid phase1 sa lifetime"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
    L8_19 = tonumber
    L9_20 = A0_11["IpsecIKEPolicy.SALifeTime"]
    L8_19 = L8_19(L9_20)
    if not (L8_19 < 300) then
      L8_19 = tonumber
      L9_20 = A0_11["IpsecIKEPolicy.SALifeTime"]
      L8_19 = L8_19(L9_20)
    elseif L8_19 > 604800 then
      L8_19 = printCLIError
      L9_20 = "Invalid SA-Lifetime. Please enter a value between 300 - 604800 Seconds"
      L8_19(L9_20)
      L8_19 = false
      return L8_19
    end
    L8_19 = A0_11["IpsecIKEPolicy.BLOWFISH"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Please enter a valid Key Length for phase1 blowfish algorithm"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = tonumber
      L9_20 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
      L8_19 = L8_19(L9_20)
      if not (L8_19 < 40) then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
        L8_19 = L8_19(L9_20)
        if not (L8_19 > 448) then
          L8_19 = tonumber
          L9_20 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
          L8_19 = L8_19(L9_20)
          L8_19 = L8_19 % 8
        end
      elseif L8_19 ~= 0 then
        L8_19 = printCLIError
        L9_20 = "Key length for phase1 BLOWFISH algorithm should be in between 40 and 448 and multiples of 8"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecIKEPolicy.CAST128"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Please enter a valid Key Length for phase1 cast128 algorithm"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = tonumber
      L9_20 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
      L8_19 = L8_19(L9_20)
      if not (L8_19 < 40) then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
        L8_19 = L8_19(L9_20)
        if not (L8_19 > 128) then
          L8_19 = tonumber
          L9_20 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
          L8_19 = L8_19(L9_20)
          L8_19 = L8_19 % 8
        end
      elseif L8_19 ~= 0 then
        L8_19 = printCLIError
        L9_20 = "Key length for phase1 CAST128 algorithm should be in between 40 and 128 and multiples of 8"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecVPNPolicy.BLOWFISH"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Please enter a valid Key Length for phase2 blowfish algorithm"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = tonumber
      L9_20 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
      L8_19 = L8_19(L9_20)
      if not (L8_19 < 40) then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
        L8_19 = L8_19(L9_20)
        if not (L8_19 > 448) then
          L8_19 = tonumber
          L9_20 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
          L8_19 = L8_19(L9_20)
          L8_19 = L8_19 % 8
        end
      elseif L8_19 ~= 0 then
        L8_19 = printCLIError
        L9_20 = "Key length for phase2 BLOWFISH algorithm should be in between 40 and 448 and multiples of 8"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecVPNPolicy.CAST128"]
    if L8_19 == "1" then
      L8_19 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
      if L8_19 ~= nil then
        L8_19 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
      elseif L8_19 == "" then
        L8_19 = printCLIError
        L9_20 = "Please enter a valid Key Length for phase2 cast128 algorithm"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
      L8_19 = tonumber
      L9_20 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
      L8_19 = L8_19(L9_20)
      if not (L8_19 < 40) then
        L8_19 = tonumber
        L9_20 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
        L8_19 = L8_19(L9_20)
        if not (L8_19 > 128) then
          L8_19 = tonumber
          L9_20 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
          L8_19 = L8_19(L9_20)
          L8_19 = L8_19 % 8
        end
      elseif L8_19 ~= 0 then
        L8_19 = printCLIError
        L9_20 = "Key length for phase2 CAST128 algorithm should be in between 40 and 128 and multiples of 8"
        L8_19(L9_20)
        L8_19 = false
        return L8_19
      end
    end
    L8_19 = A0_11["IpsecVPNPolicy.PFSKeyGroup1"]
    if L8_19 ~= nil then
      L8_19 = A0_11["IpsecVPNPolicy.PFSKeyGroup1"]
      if L8_19 ~= "" then
        L8_19 = A0_11["IpsecVPNPolicy.PFSKeyGroup1"]
      end
    elseif L8_19 == "0" then
      A0_11["IpsecVPNPolicy.PFSKeyGroup"] = "0"
    end
    A0_11["IpsecVPNPolicy.EncryptionAlgorithm"] = nil
    L8_19 = 0
    L9_20 = nil
    if A0_11["IpsecVPNPolicy.DES"] == "1" then
      L8_19 = L8_19 + 2
    end
    if A0_11["IpsecVPNPolicy.3DES"] == "1" then
      L8_19 = L8_19 + 4
    end
    if A0_11["IpsecVPNPolicy.AES-128"] == "1" then
      L8_19 = L8_19 + 8
    end
    if A0_11["IpsecVPNPolicy.AES-192"] == "1" then
      L8_19 = L8_19 + 16
    end
    if A0_11["IpsecVPNPolicy.AES-256"] == "1" then
      L8_19 = L8_19 + 32
    end
    if A0_11["IpsecVPNPolicy.TWOFISH-128"] == "1" then
      L8_19 = L8_19 + 256
    end
    if A0_11["IpsecVPNPolicy.TWOFISH-192"] == "1" then
      L8_19 = L8_19 + 512
    end
    if A0_11["IpsecVPNPolicy.TWOFISH-256"] == "1" then
      L8_19 = L8_19 + 1024
    end
    if A0_11["IpsecVPNPolicy.BLOWFISH"] == "1" then
      L8_19 = L8_19 + 2048
      L9_20 = A0_11["IpsecVPNPolicy.BLOWFISHKEYLEN"]
    end
    if A0_11["IpsecVPNPolicy.CAST128"] == "1" then
      L8_19 = L8_19 + 4096
      if L9_20 ~= nil then
        L9_20 = L9_20 .. "," .. A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
      else
        L9_20 = A0_11["IpsecVPNPolicy.CAST128KEYLEN"]
      end
    end
    if L8_19 ~= 0 then
      A0_11["IpsecVPNPolicy.EncryptionAlgorithm"] = L8_19
    else
      A0_11["IpsecVPNPolicy.EncryptionAlgorithm"] = 1
    end
    if L9_20 ~= nil then
      A0_11["IpsecVPNPolicy.KeyLength"] = L9_20
    end
    A0_11["IpsecIKEPolicy.EncryptionAlgorithm"] = nil
    ikeEncrAlgo = 0
    L9_20 = nil
    if A0_11["IpsecIKEPolicy.DES"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 1
    end
    if A0_11["IpsecIKEPolicy.3DES"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 2
    end
    if A0_11["IpsecIKEPolicy.AES-128"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 4
    end
    if A0_11["IpsecIKEPolicy.AES-192"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 8
    end
    if A0_11["IpsecIKEPolicy.AES-256"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 16
    end
    if A0_11["IpsecIKEPolicy.BLOWFISH"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 32
      L9_20 = A0_11["IpsecIKEPolicy.BLOWFISHKEYLEN"]
    end
    if A0_11["IpsecIKEPolicy.CAST128"] == "1" then
      ikeEncrAlgo = ikeEncrAlgo + 64
      if L9_20 ~= nil then
        L9_20 = L9_20 .. "," .. A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
      else
        L9_20 = A0_11["IpsecIKEPolicy.CAST128KEYLEN"]
      end
    end
    if ikeEncrAlgo ~= 0 then
      A0_11["IpsecIKEPolicy.EncryptionAlgorithm"] = ikeEncrAlgo
    else
      printCLIError("Enter valid phase1 encryption algorithm")
      return false
    end
    if L9_20 ~= nil then
      A0_11["IpsecIKEPolicy.KeyLength"] = L9_20
    end
    A0_11["IpsecVPNPolicy.AuthAlgorithm"] = nil
    if 0 + 2 + 4 + 8 + 16 + 32 + 64 == 0 then
      printCLIError("Enter valid phase2 auth algorithm")
      return false
    else
      A0_11["IpsecVPNPolicy.AuthAlgorithm"] = 0 + 2 + 4 + 8 + 16 + 32 + 64
    end
    A0_11["IpsecIKEPolicy.AuthAlgorithm"] = nil
    ikeAuthAlgo = 0
    if A0_11["IpsecIKEPolicy.MD5"] == "1" then
      ikeAuthAlgo = ikeAuthAlgo + 1
    end
    if A0_11["IpsecIKEPolicy.SHA1"] == "1" then
      ikeAuthAlgo = ikeAuthAlgo + 2
    end
    if A0_11["IpsecIKEPolicy.SHA2-256"] == "1" then
      ikeAuthAlgo = ikeAuthAlgo + 4
    end
    if A0_11["IpsecIKEPolicy.SHA2-384"] == "1" then
      ikeAuthAlgo = ikeAuthAlgo + 8
    end
    if A0_11["IpsecIKEPolicy.SHA2-512"] == "1" then
      ikeAuthAlgo = ikeAuthAlgo + 16
    end
    if ikeAuthAlgo == 0 then
      printCLIError("Enter valid phase1 auth algorithm")
      return false
    else
      A0_11["IpsecIKEPolicy.AuthAlgorithm"] = ikeAuthAlgo
    end
  end
  L8_19 = true
  return L8_19
end
function ipaddressValidate(A0_21)
  if A0_21["IpsecVPNPolicy.TunnelOrTransport"] == "1" then
    if A0_21["IpsecVPNPolicy.modeConfigStatus"] == "1" then
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] ~= "0" and (A0_21["IpsecVPNPolicy.LocalStartAddress"] == nil or A0_21["IpsecVPNPolicy.LocalStartAddress"] == "" or A0_21["IpsecVPNPolicy.LocalStartAddress"] == "0.0.0.0") then
        printCLIError("Invalid local start ip address")
        return false
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] == "2" and (A0_21["IpsecVPNPolicy.LocalEndAddress"] == nil or A0_21["IpsecVPNPolicy.LocalEndAddress"] == "" or A0_21["IpsecVPNPolicy.LocalEndAddress"] == "0.0.0.0") then
        printCLIError("Invalid local end IPAddress")
        return false
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] == "3" and (A0_21["IpsecVPNPolicy.LocalSubnetMask"] == nil or A0_21["IpsecVPNPolicy.LocalSubnetMask"] == "") then
        printCLIError("Invalid local subnet mask")
        return false
      end
    else
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] ~= "0" and (A0_21["IpsecVPNPolicy.LocalStartAddress"] == nil or A0_21["IpsecVPNPolicy.LocalStartAddress"] == "" or A0_21["IpsecVPNPolicy.LocalStartAddress"] == "0.0.0.0") then
        printCLIError("Invalid local start ip address")
        return false
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] == "2" and (A0_21["IpsecVPNPolicy.LocalEndAddress"] == nil or A0_21["IpsecVPNPolicy.LocalEndAddress"] == "" or A0_21["IpsecVPNPolicy.LocalEndAddress"] == "0.0.0.0") then
        printCLIError("Invalid local end ip address")
        return false
      end
      if A0_21["IpsecVPNPolicy.AddressFamily"] == "2" and A0_21["IpsecVPNPolicy.LocalNetworkType"] == "3" and (A0_21["IpsecVPNPolicy.LocalSubnetMask"] == nil or A0_21["IpsecVPNPolicy.LocalSubnetMask"] == "" or A0_21["IpsecVPNPolicy.LocalSubnetMask"] == "0.0.0.0") then
        printCLIError("Invalid local net mask")
        return false
      end
      if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" and A0_21["IpsecVPNPolicy.LocalNetworkType"] == "3" and (A0_21["IpsecVPNPolicy.LocalPrefixLength"] == nil or A0_21["IpsecVPNPolicy.LocalPrefixLength"] == "") then
        printCLIError("Invalid remote prefix length")
        return false
      end
    end
    if A0_21["IpsecVPNPolicy.RemoteNetworkType"] ~= "0" and (A0_21["IpsecVPNPolicy.RemoteStartAddress"] == nil or A0_21["IpsecVPNPolicy.RemoteStartAddress"] == "" or A0_21["IpsecVPNPolicy.RemoteStartAddress"] == "0.0.0.0") then
      printCLIError("Invalid remote start ip address")
      return false
    end
    if A0_21["IpsecVPNPolicy.RemoteNetworkType"] == "2" and (A0_21["IpsecVPNPolicy.RemoteEndAddress"] == nil or A0_21["IpsecVPNPolicy.RemoteEndAddress"] == "" or A0_21["IpsecVPNPolicy.RemoteEndAddress"] == "0.0.0.0") then
      printCLIError("Invalid remote end ip address")
      return false
    end
    if A0_21["IpsecVPNPolicy.AddressFamily"] == "2" and A0_21["IpsecVPNPolicy.RemoteNetworkType"] == "3" and (A0_21["IpsecVPNPolicy.RemoteSubnetMask"] == nil or A0_21["IpsecVPNPolicy.RemoteSubnetMask"] == "" or A0_21["IpsecVPNPolicy.RemoteSubnetMask"] == "0.0.0.0") then
      printCLIError("Invalid remote net mask")
      return false
    end
    if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" and A0_21["IpsecVPNPolicy.RemoteNetworkType"] == "3" and (A0_21["IpsecVPNPolicy.RemotePrefixLength"] == nil or A0_21["IpsecVPNPolicy.RemotePrefixLength"] == "") then
      printCLIError("Invalid remote prefix length")
      return false
    end
    if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" then
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] ~= "0" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.LocalStartAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid LocalStartAddress")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] == "2" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.LocalEndAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid LocalEndAddress")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.RemoteNetworkType"] == "2" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.RemoteEndAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid RemoteEndAddress")
          return false
        end
      end
    elseif A0_21["IpsecVPNPolicy.AddressFamily"] == "2" then
      if A0_21["IpsecVPNPolicy.RemoteEndPointType"] == "0" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid RemoteEndPoint")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.RemoteNetworkType"] ~= "0" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.RemoteStartAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid RemoteStartAddress")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] ~= "0" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.LocalStartAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid LocalStartAddress")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.LocalNetworkType"] == "2" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.LocalEndAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid LocalEndAddress")
          return false
        end
      end
      if A0_21["IpsecVPNPolicy.RemoteNetworkType"] == "2" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.RemoteEndAddress"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid RemoteEndAddress")
          return false
        end
      end
    end
  end
  if A0_21["IpsecVPNPolicy.Netbios"] == "1" and A0_21["IpsecVPNPolicy.L2tpIpsecPolicy"] ~= "1" and A0_21["IpsecVPNPolicy.L2tpIpsecPolicy"] ~= "2" and A0_21["IpsecVPNPolicy.RemoteNetworkType"] ~= "3" then
    printCLIError("when netbios selected remote networktype should be subnet")
    return false
  end
  if A0_21["IpsecVPNPolicy.L2tpIpsecPolicy"] ~= "1" then
    if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" then
      if A0_21["IpsecVPNPolicy.RemoteEndPointType"] == "0" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
        if errorFlag == "ERROR" or errorFlag == 1 then
          printCLIError("Not a valid RemoteEndPoint")
          return false
        end
      end
    elseif A0_21["IpsecVPNPolicy.AddressFamily"] == "2" and A0_21["IpsecVPNPolicy.RemoteEndPointType"] == "0" then
      errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.RemoteEndPoint"], "", "Remote IP error")
      if errorFlag == "ERROR" or errorFlag == 1 then
        printCLIError("Not a valid RemoteEndPoint")
        return false
      end
    end
  end
  if A0_21["IpsecVPNPolicy.EnableKeepAlive"] == "1" then
    errorFlag = "OK"
    if A0_21["IpsecVPNPolicy.KeepAliveSourceAddress"] == nil or A0_21["IpsecVPNPolicy.KeepAliveSourceAddress"] == "" then
      printCLIError("when keepalive enabled keepalive sourceip should be entered")
      return false
    else
      if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.KeepAliveSourceAddress"], "", "Remote IP error")
      elseif A0_21["IpsecVPNPolicy.AddressFamily"] == "2" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.KeepAliveSourceAddress"], "", "Remote IP error")
      end
      if errorFlag == "ERROR" or errorFlag == 1 then
        printCLIError("Not a valid keepalive sourceip")
        return false
      end
    end
    if A0_21["IpsecVPNPolicy.RemotePingIPAddress"] == nil or A0_21["IpsecVPNPolicy.RemotePingIPAddress"] == "" then
    else
      if A0_21["IpsecVPNPolicy.AddressFamily"] == "10" then
        errorFlag = validations.ipv6AddrValidate(A0_21["IpsecVPNPolicy.RemotePingIPAddress"], "", "Remote IP error")
      elseif A0_21["IpsecVPNPolicy.AddressFamily"] == "2" then
        errorFlag = validations.ipAddressValidate(A0_21["IpsecVPNPolicy.RemotePingIPAddress"], "", "Remote IP error")
      end
      if errorFlag == "ERROR" or errorFlag == 1 then
        printCLIError("Not a valid keepalive destinationip")
        return false
      end
    end
  else
    A0_21["IpsecVPNPolicy.RemotePingIPAddress"] = nil
    A0_21["IpsecVPNPolicy.KeepAliveSourceAddress"] = nil
  end
  return true
end
function encryptAlgorithmValidate(A0_22)
  A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] = tonumber(A0_22["IpsecVPNPolicy.EncryptionAlgorithm"])
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 1 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 2 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 4 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 8 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 16 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 32 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 64 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 128 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 256 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 512 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 1024 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 2048 and A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 4096 then
    printCLIError("Enter valid manual encryption algorithm")
    return false
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] ~= 1 then
    if A0_22["IpsecVPNPolicy.EncryptionKeyIn"] == nil or A0_22["IpsecVPNPolicy.EncryptionKeyIn"] == "" then
      printCLIError("Invalid key in for encryption algorithm")
      return false
    end
    if A0_22["IpsecVPNPolicy.EncryptionKeyOut"] == nil or A0_22["IpsecVPNPolicy.EncryptionKeyOut"] == "" then
      printCLIError("Invalid key out for encryption algorithm")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 4 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 24 then
      printCLIError("Invalid key in length for 3DES encryption algorithm should be of length 24")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 24 then
      printCLIError("Invalid key out length for 3DES encryption algorithm should be of length 24")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 2 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 8 then
      printCLIError("Invalid key in length for DES encryption algorithm should be of length 8")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 8 then
      printCLIError("Invalid key out length for DES encryption algorithm should be of length 8")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 8 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 16 then
      printCLIError("Invalid key in length for AES-128 encryption algorithm should be of length 16")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 16 then
      printCLIError("Invalid key out length for AES-128 encryption algorithm should be of length 16")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 16 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 24 then
      printCLIError("Invalid key in length for AES-192 encryption algorithm should be of length 24")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 24 then
      printCLIError("Invalid key out length for AES-192 encryption algorithm should be of length 24")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 32 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 32 then
      printCLIError("Invalid key in length for AES-256 encryption algorithm should be of length 32")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 32 then
      printCLIError("Invalid key out length for AES-256 encryption algorithm should be of length 32")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 256 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 16 then
      printCLIError("Invalid key in length for TWOFISH (128) encryption algorithm should be of length 16")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 16 then
      printCLIError("Invalid key out length for TWOFISH (128) encryption algorithm should be of length 16")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 512 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 24 then
      printCLIError("Invalid key in length for TWOFISH (192) encryption algorithm should be of length 24")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 24 then
      printCLIError("Invalid key out length for TWOFISH (192) encryption algorithm should be of length 24")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 1024 then
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= 32 then
      printCLIError("Invalid key in length for TWOFISH (256) encryption algorithm should be of length 32")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= 32 then
      printCLIError("Invalid key out length for TWOFISH (256) encryption algorithm should be of length 32")
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 2048 then
    if A0_22["IpsecVPNPolicy.KeyLength"] == nil or A0_22["IpsecVPNPolicy.KeyLength"] == "" then
      printCLIError("Please enter a valid Key Length")
      return false
    end
    if tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) < 40 or tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) > 448 or tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) % 8 ~= 0 then
      printCLIError("Key length for BLOWFISH algorithm should be in between 40 and 448 and multiples of 8")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8 then
      printCLIError("Invalid key in length for BLOWFISH encryption algorithm should be of length " .. tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8)
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8 then
      printCLIError("Invalid key out length for BLOWFISH encryption algorithm should be of length " .. tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8)
      return false
    end
  end
  if A0_22["IpsecVPNPolicy.EncryptionAlgorithm"] == 4096 then
    if A0_22["IpsecVPNPolicy.KeyLength"] == nil or A0_22["IpsecVPNPolicy.KeyLength"] == "" then
      printCLIError("Please enter a valid Key Length")
      return false
    end
    if tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) < 40 or 128 < tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) or tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) % 8 ~= 0 then
      printCLIError("Key length for CAST128 algorithm should be in between 40 and 128 and multiples of 8")
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyIn"]) ~= tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8 then
      printCLIError("Invalid key in length for CAST128 encryption algorithm should be of length " .. tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8)
      return false
    end
    if string.len(A0_22["IpsecVPNPolicy.EncryptionKeyOut"]) ~= tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8 then
      printCLIError("Invalid key out length for CAST128 encryption algorithm should be of length " .. tonumber(A0_22["IpsecVPNPolicy.KeyLength"]) / 8)
      return false
    end
  end
  return true
end
function authAlgorithmValidate(A0_23)
  A0_23["IpsecVPNPolicy.AuthAlgorithm"] = tonumber(A0_23["IpsecVPNPolicy.AuthAlgorithm"])
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 2 and A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 4 and A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 8 and A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 16 and A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 32 and A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 64 then
    printCLIError("Enter valid manual authentication algorithm")
    return false
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] ~= 1 then
    if A0_23["IpsecVPNPolicy.AuthKeyIn"] == nil or A0_23["IpsecVPNPolicy.AuthKeyIn"] == "" then
      printCLIError("Invalid key in for authentication algorithm")
      return false
    end
    if A0_23["IpsecVPNPolicy.AuthKeyOut"] == nil or A0_23["IpsecVPNPolicy.AuthKeyOut"] == "" then
      printCLIError("Invalid key out for authentication algorithm")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 4 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 20 then
      printCLIError("Invalid key in length for SHA-1 authentication should be of length 20")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 20 then
      printCLIError("Invalid key out length for SHA-1 authentication should be of length 20")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 64 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 28 then
      printCLIError("Invalid key in length for SHA2-224 authentication should be of length 28")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 28 then
      printCLIError("Invalid key out length for SHA2-224 authentication should be of length 28")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 8 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 32 then
      printCLIError("Invalid key in length for SHA2-256 authentication should be of length 32")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 32 then
      printCLIError("Invalid key out length for SHA2-256 authentication should be of length 32")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 16 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 48 then
      printCLIError("Invalid key in length for SHA2-384 authentication should be of length 48")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 48 then
      printCLIError("Invalid key out length for SHA2-384 authentication should be of length 48")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 32 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 64 then
      printCLIError("Invalid key in length for SHA2-512 authentication should be of length 64")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 64 then
      printCLIError("Invalid key out length for SHA2-512 authentication should be of length 64")
      return false
    end
  end
  if A0_23["IpsecVPNPolicy.AuthAlgorithm"] == 2 then
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyIn"]) ~= 16 then
      printCLIError("Invalid key in length for MD5 authentication should be of length 16")
      return false
    end
    if string.len(A0_23["IpsecVPNPolicy.AuthKeyOut"]) ~= 16 then
      printCLIError("Invalid key out length for MD5 authentication should be of length 16")
      return false
    end
  end
  return true
end
function spiValidate(A0_24)
  local L1_25
  L1_25 = A0_24["IpsecVPNPolicy.SPIIn"]
  if L1_25 ~= nil then
    L1_25 = A0_24["IpsecVPNPolicy.SPIIn"]
    if L1_25 ~= "" then
      L1_25 = A0_24["IpsecVPNPolicy.SPIIn"]
    end
  elseif L1_25 == "0x" then
    L1_25 = printCLIError
    L1_25("Invalid spi_in value")
    L1_25 = false
    return L1_25
  end
  L1_25 = string
  L1_25 = L1_25.len
  L1_25 = L1_25(A0_24["IpsecVPNPolicy.SPIIn"])
  if L1_25 > 15 then
    L1_25 = printCLIError
    L1_25("Invalid spi_in value length cannot be more than 13")
    L1_25 = false
    return L1_25
  end
  L1_25 = A0_24["IpsecVPNPolicy.SPIOut"]
  if L1_25 ~= nil then
    L1_25 = A0_24["IpsecVPNPolicy.SPIOut"]
    if L1_25 ~= "" then
      L1_25 = A0_24["IpsecVPNPolicy.SPIOut"]
    end
  elseif L1_25 == "0x" then
    L1_25 = printCLIError
    L1_25("Invalid spi_out value")
    L1_25 = false
    return L1_25
  end
  L1_25 = string
  L1_25 = L1_25.len
  L1_25 = L1_25(A0_24["IpsecVPNPolicy.SPIOut"])
  if L1_25 > 15 then
    L1_25 = printCLIError
    L1_25("Invalid spi_out value length cannot be more than 13")
    L1_25 = false
    return L1_25
  end
  L1_25 = db
  L1_25 = L1_25.getRowsWhere
  L1_25 = L1_25("IpsecVPNPolicy", "PolicyType = 2")
  for _FORV_5_, _FORV_6_ in pairs(L1_25) do
    if A0_24["IpsecVPNPolicy.VPNPolicyName"] ~= _FORV_6_["IpsecVPNPolicy.VPNPolicyName"] and A0_24["IpsecVPNPolicy.SPIIn"] == _FORV_6_["IpsecVPNPolicy.SPIIn"] then
      printCLIError("SPI is Already in Use")
      return false
    end
  end
  return true
end
function ipsecVpnPolicyEnable(A0_26)
  local L1_27
  L1_27 = "ERROR"
  errorFlag = L1_27
  L1_27 = ""
  statusCode = L1_27
  L1_27 = ""
  statusMessage = L1_27
  L1_27 = db
  L1_27 = L1_27.getRow
  L1_27 = L1_27("IpsecVPNPolicy", "VPNPolicyName", A0_26[1])
  configRow = L1_27
  L1_27 = configRow
  if L1_27 == nil then
    L1_27 = printCLIError
    L1_27("Row doesnt exist")
    L1_27 = "ERROR"
    return L1_27, "Row doesnt exist"
  else
    L1_27 = {}
    L1_27.rowid = configRow["IpsecVPNPolicy._ROWID_"]
    errorFlag, statusCode = vipSecure.ipsecVPNPolicyEnable(L1_27, true)
  end
  L1_27 = errorFlag
  if L1_27 == "OK" then
    L1_27 = db
    L1_27 = L1_27.save
    L1_27()
  end
  L1_27 = db
  L1_27 = L1_27.getAttribute
  L1_27 = L1_27("stringsMap", "stringId", statusCode, LANGUAGE)
  L1_27 = L1_27 or statusCode
  statusMessage = L1_27
  L1_27 = errorFlag
  return L1_27, statusMessage
end
function ipsecVpnPolicyDisable(A0_28)
  local L1_29
  L1_29 = "ERROR"
  errorFlag = L1_29
  L1_29 = ""
  statusCode = L1_29
  L1_29 = ""
  statusMessage = L1_29
  L1_29 = db
  L1_29 = L1_29.getRow
  L1_29 = L1_29("IpsecVPNPolicy", "VPNPolicyName", A0_28[1])
  configRow = L1_29
  L1_29 = configRow
  if L1_29 == nil then
    L1_29 = printCLIError
    L1_29("Row doesnt exist")
    L1_29 = "ERROR"
    return L1_29, "Row doesnt exist"
  else
    L1_29 = {}
    L1_29.rowid = configRow["IpsecVPNPolicy._ROWID_"]
    errorFlag, statusCode = vipSecure.ipsecVPNPolicyEnable(L1_29, false)
  end
  L1_29 = errorFlag
  if L1_29 == "OK" then
    L1_29 = db
    L1_29 = L1_29.save
    L1_29()
  end
  L1_29 = db
  L1_29 = L1_29.getAttribute
  L1_29 = L1_29("stringsMap", "stringId", statusCode, LANGUAGE)
  L1_29 = L1_29 or statusCode
  statusMessage = L1_29
  L1_29 = errorFlag
  return L1_29, statusMessage
end
function ipsecVpnPolicyDelete(A0_30)
  local L1_31
  L1_31 = "ERROR"
  errorFlag = L1_31
  L1_31 = ""
  statusCode = L1_31
  L1_31 = ""
  statusMessage = L1_31
  L1_31 = db
  L1_31 = L1_31.getRow
  L1_31 = L1_31("IpsecVPNPolicy", "VPNPolicyName", A0_30[1])
  configRow = L1_31
  L1_31 = configRow
  if L1_31 == nil then
    L1_31 = printCLIError
    L1_31("Row doesnt exist")
    L1_31 = "ERROR"
    return L1_31, "Row doesnt exist"
  else
    L1_31 = {}
    L1_31.rowid = configRow["IpsecVPNPolicy._ROWID_"]
    errorFlag, statusCode = vipSecure.ipsecVPNPolicyDelete(L1_31)
    if errorFlag == "OK" then
      db.commitTransaction(true)
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
  end
  L1_31 = errorFlag
  return L1_31, statusMessage
end
function ipsecBackupPoliciesGet()
  local L0_32, L1_33, L2_34, L3_35, L4_36, L5_37, L6_38, L7_39, L8_40, L9_41, L10_42
  L0_32 = {}
  L1_33 = 0
  L2_34 = db
  L2_34 = L2_34.getTable
  L2_34 = L2_34(L3_35)
  for L6_38, L7_39 in L3_35(L4_36) do
    L1_33 = L1_33 + 1
    L8_40 = L2_34[L1_33]
    L9_41 = true
    L10_42 = nil
    if L8_40["IpsecVPNPolicy.PolicyType"] == "1" and L8_40["IpsecVPNPolicy.IKEPolicyName"] ~= nil then
      L10_42 = db.getRow("IpsecIKEPolicy", "IKEPolicyName", L8_40["IpsecVPNPolicy.IKEPolicyName"])
    end
    if L8_40["IpsecVPNPolicy.PolicyType"] == "2" or L8_40["IpsecVPNPolicy.RVGStatus"] == "1" then
      L9_41 = false
    elseif L8_40["IpsecVPNPolicy.TypeofPolicy"] ~= nil and L8_40["IpsecVPNPolicy.TypeofPolicy"] == "2" then
      L9_41 = false
    elseif L10_42 ~= nil and (L10_42["IpsecIKEPolicy.Direction"] == "1" or L10_42["IpsecIKEPolicy.DPD"] == "0" or L10_42["IpsecIKEPolicy.XAUTHType"] == "2") then
      L9_41 = false
    end
    if L9_41 then
      resTab.insertField(L0_32, "PolicyName", L8_40["IpsecVPNPolicy.VPNPolicyName"])
    end
  end
  L3_35(L4_36)
end
function backupPoliciesValidate()
  local L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52
  L0_43 = {}
  L1_44 = 0
  L2_45 = db
  L2_45 = L2_45.getTable
  L2_45 = L2_45(L3_46)
  for L6_49, L7_50 in L3_46(L4_47) do
    L1_44 = L1_44 + 1
    L8_51 = {}
    L0_43 = L8_51
    L8_51 = L2_45[L1_44]
    L9_52 = {}
    if L8_51["IpsecVPNPolicy.IKEPolicyName"] ~= nil and L8_51["IpsecVPNPolicy.IKEPolicyName"] ~= "" then
      L9_52 = db.getRow("IpsecIKEPolicy", "IKEPolicyName", L8_51["IpsecVPNPolicy.IKEPolicyName"])
    end
    if L8_51["IpsecVPNPolicy.Status"] == "0" then
    else
    end
  end
end
function ipsecVpnPolicyGet()
  local L0_53, L1_54, L2_55, L3_56, L4_57, L5_58, L6_59, L7_60, L8_61, L9_62, L10_63, L11_64, L12_65, L13_66, L14_67, L15_68, L16_69, L17_70, L18_71, L19_72, L20_73, L21_74
  L0_53 = {}
  L1_54 = 0
  L2_55 = db
  L2_55 = L2_55.getTable
  L2_55 = L2_55(L3_56)
  for L6_59, L7_60 in L3_56(L4_57) do
    L1_54 = L1_54 + 1
    L8_61 = {}
    L0_53 = L8_61
    L8_61 = L2_55[L1_54]
    L9_62 = {}
    L10_63 = L8_61["IpsecVPNPolicy.IKEPolicyName"]
    if L10_63 ~= nil then
      L10_63 = L8_61["IpsecVPNPolicy.IKEPolicyName"]
      if L10_63 ~= "" then
        L10_63 = db
        L10_63 = L10_63.getRow
        L11_64 = "IpsecIKEPolicy"
        L12_65 = "IKEPolicyName"
        L13_66 = L8_61["IpsecVPNPolicy.IKEPolicyName"]
        L10_63 = L10_63(L11_64, L12_65, L13_66)
        L9_62 = L10_63
      end
    end
    L10_63 = nil
    L11_64 = L8_61["IpsecVPNPolicy.Status"]
    if L11_64 == "0" then
      L10_63 = "Disabled"
    else
      L10_63 = "Enabled"
    end
    L11_64 = resTab
    L11_64 = L11_64.insertField
    L12_65 = L0_53
    L13_66 = "Status"
    L14_67 = L10_63
    L11_64(L12_65, L13_66, L14_67)
    L11_64 = resTab
    L11_64 = L11_64.insertField
    L12_65 = L0_53
    L13_66 = "Name"
    L14_67 = L8_61["IpsecVPNPolicy.VPNPolicyName"]
    L11_64(L12_65, L13_66, L14_67)
    L11_64 = ""
    L12_65 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L12_65 == "1" then
      L11_64 = "Auto Policy"
    else
      L12_65 = L8_61["IpsecVPNPolicy.PolicyType"]
      if L12_65 == "2" then
        L11_64 = "Manual Policy"
      end
    end
    L12_65 = resTab
    L12_65 = L12_65.insertField
    L13_66 = L0_53
    L14_67 = "Type"
    L15_68 = L11_64
    L12_65(L13_66, L14_67, L15_68)
    L12_65 = ""
    L13_66 = L8_61["IpsecVPNPolicy.AddressFamily"]
    if L13_66 == "2" then
      L12_65 = "IPV4"
    else
      L13_66 = L8_61["IpsecVPNPolicy.AddressFamily"]
      if L13_66 == "10" then
        L12_65 = "IPV6"
      end
    end
    L13_66 = resTab
    L13_66 = L13_66.insertField
    L14_67 = L0_53
    L15_68 = "IP Protocol Version"
    L16_69 = L12_65
    L13_66(L14_67, L15_68, L16_69)
    L13_66 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L13_66 == "1" then
      L13_66 = ""
      if L9_62 ~= nil then
        L13_66 = L9_62["IpsecIKEPolicy.IKEVersion"]
      end
      if L13_66 == "1" then
        L13_66 = "IKEV1"
      else
        L13_66 = "IKEV2"
      end
      L14_67 = resTab
      L14_67 = L14_67.insertField
      L15_68 = L0_53
      L16_69 = "IKE version"
      L17_70 = L13_66
      L14_67(L15_68, L16_69, L17_70)
    end
    L13_66 = ""
    L14_67 = L8_61["IpsecVPNPolicy.TunnelOrTransport"]
    if L14_67 == "0" then
      L13_66 = "Transport Mode"
    else
      L14_67 = L8_61["IpsecVPNPolicy.TunnelOrTransport"]
      if L14_67 == "1" then
        L13_66 = "Tunnel Mode"
      end
    end
    L14_67 = resTab
    L14_67 = L14_67.insertField
    L15_68 = L0_53
    L16_69 = "IPSec Mode"
    L17_70 = L13_66
    L14_67(L15_68, L16_69, L17_70)
    L14_67 = ""
    L15_68 = L8_61["IpsecVPNPolicy.RemoteEndPointType"]
    if L15_68 == "0" then
      L14_67 = "IP Address"
    else
      L15_68 = L8_61["IpsecVPNPolicy.RemoteEndPointType"]
      if L15_68 == "1" then
        L14_67 = "FQDN"
      end
    end
    L15_68 = resTab
    L15_68 = L15_68.insertField
    L16_69 = L0_53
    L17_70 = "Remote EndpointType"
    L18_71 = L14_67
    L15_68(L16_69, L17_70, L18_71)
    L15_68 = resTab
    L15_68 = L15_68.insertField
    L16_69 = L0_53
    L17_70 = "Remote Endpoint"
    L18_71 = L8_61["IpsecVPNPolicy.RemoteEndPoint"]
    L15_68(L16_69, L17_70, L18_71)
    L15_68 = ""
    L16_69 = L8_61["IpsecVPNPolicy.IpsecProtocol"]
    if L16_69 == "0" then
      L15_68 = "AH"
    else
      L16_69 = L8_61["IpsecVPNPolicy.IpsecProtocol"]
      if L16_69 == "1" then
        L15_68 = "ESP"
      end
    end
    L16_69 = resTab
    L16_69 = L16_69.insertField
    L17_70 = L0_53
    L18_71 = "Protocol"
    L19_72 = L15_68
    L16_69(L17_70, L18_71, L19_72)
    L16_69 = ""
    L17_70 = ""
    L18_71 = L8_61["IpsecVPNPolicy.LocalNetworkType"]
    if L18_71 == "0" then
      L16_69 = "Any"
      L17_70 = "Any"
    else
      L18_71 = L8_61["IpsecVPNPolicy.LocalNetworkType"]
      if L18_71 == "1" then
        L16_69 = "Single"
        L17_70 = L8_61["IpsecVPNPolicy.LocalStartAddress"]
      else
        L18_71 = L8_61["IpsecVPNPolicy.LocalNetworkType"]
        if L18_71 == "2" then
          L16_69 = "Range"
          L18_71 = L8_61["IpsecVPNPolicy.LocalStartAddress"]
          L19_72 = " - "
          L20_73 = L8_61["IpsecVPNPolicy.LocalEndAddress"]
          L17_70 = L18_71 .. L19_72 .. L20_73
        else
          L18_71 = L8_61["IpsecVPNPolicy.LocalNetworkType"]
          if L18_71 == "3" then
            L16_69 = "Subnet"
            L18_71 = L8_61["IpsecVPNPolicy.AddressFamily"]
            if L18_71 == "2" then
              L18_71 = L8_61["IpsecVPNPolicy.LocalStartAddress"]
              L19_72 = " / "
              L20_73 = L8_61["IpsecVPNPolicy.LocalSubnetMask"]
              L17_70 = L18_71 .. L19_72 .. L20_73
            else
              L18_71 = L8_61["IpsecVPNPolicy.LocalStartAddress"]
              L19_72 = " / "
              L20_73 = L8_61["IpsecVPNPolicy.LocalPrefixLength"]
              L17_70 = L18_71 .. L19_72 .. L20_73
            end
          end
        end
      end
    end
    L18_71 = resTab
    L18_71 = L18_71.insertField
    L19_72 = L0_53
    L20_73 = "Local Network Type"
    L21_74 = L16_69
    L18_71(L19_72, L20_73, L21_74)
    L18_71 = resTab
    L18_71 = L18_71.insertField
    L19_72 = L0_53
    L20_73 = "Local"
    L21_74 = L17_70
    L18_71(L19_72, L20_73, L21_74)
    L18_71 = ""
    L19_72 = ""
    L20_73 = L8_61["IpsecVPNPolicy.RemoteNetworkType"]
    if L20_73 == "0" then
      L18_71 = "Any"
      L19_72 = "Any"
    else
      L20_73 = L8_61["IpsecVPNPolicy.RemoteNetworkType"]
      if L20_73 == "1" then
        L18_71 = "Single"
        L19_72 = L8_61["IpsecVPNPolicy.RemoteStartAddress"]
      else
        L20_73 = L8_61["IpsecVPNPolicy.RemoteNetworkType"]
        if L20_73 == "2" then
          L18_71 = "Range"
          L20_73 = L8_61["IpsecVPNPolicy.RemoteStartAddress"]
          L21_74 = " - "
          L19_72 = L20_73 .. L21_74 .. L8_61["IpsecVPNPolicy.RemoteEndAddress"]
        else
          L20_73 = L8_61["IpsecVPNPolicy.RemoteNetworkType"]
          if L20_73 == "3" then
            L18_71 = "Subnet"
            L20_73 = L8_61["IpsecVPNPolicy.AddressFamily"]
            if L20_73 == "2" then
              L20_73 = L8_61["IpsecVPNPolicy.RemoteStartAddress"]
              L21_74 = " / "
              L19_72 = L20_73 .. L21_74 .. L8_61["IpsecVPNPolicy.RemoteSubnetMask"]
            else
              L20_73 = L8_61["IpsecVPNPolicy.RemoteStartAddress"]
              L21_74 = " / "
              L19_72 = L20_73 .. L21_74 .. L8_61["IpsecVPNPolicy.RemotePrefixLength"]
            end
          end
        end
      end
    end
    L20_73 = resTab
    L20_73 = L20_73.insertField
    L21_74 = L0_53
    L20_73(L21_74, "Remote Network Type", L18_71)
    L20_73 = resTab
    L20_73 = L20_73.insertField
    L21_74 = L0_53
    L20_73(L21_74, "Remote", L19_72)
    L20_73 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L20_73 == "1" then
      L20_73 = ""
      if L9_62 ~= nil then
        L20_73 = L9_62["IpsecIKEPolicy.AuthType"]
      end
      if L20_73 == "0" then
        L20_73 = "Pre-Shared Key"
      else
        L20_73 = "RSA-Signature"
      end
      L21_74 = resTab
      L21_74 = L21_74.insertField
      L21_74(L0_53, "Authentication-Method", L20_73)
    end
    L20_73 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L20_73 == "1" then
      L20_73 = ""
      if L9_62 ~= nil then
        L21_74 = L9_62["IpsecIKEPolicy.AuthType"]
        if L21_74 == "0" then
          L20_73 = L9_62["IpsecIKEPolicy.Presharedkey"]
          L21_74 = resTab
          L21_74 = L21_74.insertField
          L21_74(L0_53, "Pre-Shared Key", L20_73)
        end
      end
    end
    L20_73 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L20_73 == "1" then
      L20_73 = ""
      if L9_62 ~= nil then
        L20_73 = L9_62["IpsecIKEPolicy.DHGroup"]
      end
      if L20_73 == "1" then
        L20_73 = "Group 1 (768 bit)"
      elseif L20_73 == "2" then
        L20_73 = "Group 2 (1024 bit)"
      elseif L20_73 == "5" then
        L20_73 = "Group 5 (1536 bit)"
      elseif L20_73 == "14" then
        L20_73 = "DH Group 14 (2048 bit)"
      elseif L20_73 == "15" then
        L20_73 = "DH Group 15 (3072 bit)"
      elseif L20_73 == "16" then
        L20_73 = "DH Group 16 (4096 bit)"
      elseif L20_73 == "17" then
        L20_73 = "DH Group 17 (6144 bit)"
      elseif L20_73 == "18" then
        L20_73 = "DH Group 18 (8192 bit)"
      end
      L21_74 = resTab
      L21_74 = L21_74.insertField
      L21_74(L0_53, "DH Group", L20_73)
    end
    L20_73 = L8_61["IpsecVPNPolicy.PolicyType"]
    if L20_73 == "1" then
      L20_73 = ""
      if L9_62 ~= nil then
        L20_73 = L9_62["IpsecIKEPolicy.SALifeTime"]
      end
      L21_74 = resTab
      L21_74 = L21_74.insertField
      L21_74(L0_53, "SA-Lifetime", L20_73)
    end
    L20_73 = ""
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " MD5"
    end
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " SHA1"
    end
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " SHA2-256"
    end
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " SHA2-384"
    end
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " SHA2-512"
    end
    L21_74 = math
    L21_74 = L21_74.floor
    L21_74 = L21_74(L8_61["IpsecVPNPolicy.AuthAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.AuthAlgorithm"] = L21_74
    L21_74 = L8_61["IpsecVPNPolicy.AuthAlgorithm"]
    L21_74 = L21_74 % 2
    if L21_74 ~= 0 then
      L21_74 = L20_73
      L20_73 = L21_74 .. " SHA2-224"
    end
    L21_74 = resTab
    L21_74 = L21_74.insertField
    L21_74(L0_53, "Auth", L20_73)
    L21_74 = ""
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " DES"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " 3DES"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " AES-128"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " AES-192"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " AES-256"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " TWOFISH-128"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " TWOFISH-192"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " TWOFISH-256"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " BLOWFISH"
    end
    L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] = math.floor(L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] / 2)
    if L8_61["IpsecVPNPolicy.EncryptionAlgorithm"] % 2 ~= 0 then
      L21_74 = L21_74 .. " CAST128"
    end
    if L21_74 == "" then
      L21_74 = L21_74 .. "None"
    end
    resTab.insertField(L0_53, "Encr", L21_74)
    resTab.print(L0_53)
  end
end
function ipsecVpnDhcpCfgInit(A0_75)
  configRow = db.getRow("IPsecDhcpClientIPRange", "IPsecDhcpClientIPRange._ROWID_", "1")
  return 1, configRow
end
function ipsecVpnDhcpCfgSave(A0_76)
  errorFlag = "ERROR"
  statusCode = ""
  statusMessage = ""
  DBTable = "IPsecDhcpClientIPRange"
  errorFlag, statusCode = dhcpOverIpsec.config(A0_76, "1", "edit")
  if errorFlag == "OK" then
    db.save()
  end
  statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE) or statusCode
  return errorFlag, statusMessage
end
function ipsecVpnDhcpCfgInputVal(A0_77)
  local L1_78, L2_79, L3_80
  L1_78 = A0_77["IPsecDhcpClientIPRange.StartIPAddress"]
  if L1_78 ~= nil then
    L1_78 = A0_77["IPsecDhcpClientIPRange.StartIPAddress"]
    if L1_78 ~= "" then
      L1_78 = A0_77["IPsecDhcpClientIPRange.StartIPAddress"]
    end
  elseif L1_78 == "0.0.0.0" then
    L1_78 = printCLIError
    L2_79 = "Enter valid start address"
    L1_78(L2_79)
    L1_78 = false
    return L1_78
  end
  L1_78 = A0_77["IPsecDhcpClientIPRange.SubnetMask"]
  if L1_78 ~= nil then
    L1_78 = A0_77["IPsecDhcpClientIPRange.SubnetMask"]
    if L1_78 ~= "" then
      L1_78 = A0_77["IPsecDhcpClientIPRange.SubnetMask"]
    end
  elseif L1_78 == "0.0.0.0" then
    L1_78 = printCLIError
    L2_79 = "Enter valid subnet mask"
    L1_78(L2_79)
    L1_78 = false
    return L1_78
  end
  L1_78 = A0_77["IPsecDhcpClientIPRange.StartIPAddress"]
  L2_79 = A0_77["IPsecDhcpClientIPRange.SubnetMask"]
  L3_80 = nil
  L3_80 = _UPVALUE0_.checkWanSubnetRange(L1_78, L2_79)
  if L3_80 == returnCodes.SUCCESS then
    printCLIError("OPTION1/OPTION2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  if HIGH_SEC == "HIGH" then
    L3_80 = _UPVALUE0_.checkSslClientRange(L1_78, L2_79)
    if L3_80 == returnCodes.SUCCESS then
      printCLIError("SSL-VPN client ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
  end
  L3_80 = _UPVALUE0_.checkLanVlanSubnetRange(L1_78, L2_79)
  if L3_80 == returnCodes.SUCCESS then
    printCLIError("Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  L3_80 = _UPVALUE0_.checkDmzSubnetRange(L1_78, L2_79)
  if L3_80 == returnCodes.SUCCESS then
    printCLIError("DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
    return false
  end
  if A0_77["IPsecDhcpClientIPRange.EndIPAddress"] == nil or A0_77["IPsecDhcpClientIPRange.EndIPAddress"] == "" or A0_77["IPsecDhcpClientIPRange.EndIPAddress"] == "0.0.0.0" then
    printCLIError("Enter valid end address")
    return false
  end
end
function ipsecVpnDhcpGet()
  configRow = db.getRow("IPsecDhcpClientIPRange", "IPsecDhcpClientIPRange._ROWID_", "1")
  printLabel("IP Range For DHCP Over IPsec")
  print("Starting IP Address:", configRow["IPsecDhcpClientIPRange.StartIPAddress"])
  print("Ending IP Address:", configRow["IPsecDhcpClientIPRange.EndIPAddress"])
  print("Subnet Mask:", configRow["IPsecDhcpClientIPRange.SubnetMask"])
end
function ipsecVpnPolicyConnect(A0_81)
  local L1_82
  L1_82 = "ERROR"
  errorFlag = L1_82
  L1_82 = ""
  statusCode = L1_82
  L1_82 = ""
  statusMessage = L1_82
  L1_82 = db
  L1_82 = L1_82.getAttribute
  L1_82 = L1_82("environment", "name", "VIPSECURE_STATUS", "value")
  if L1_82 ~= nil then
    os.execute(L1_82 .. " " .. DB_FILE_NAME)
  end
  configRow = db.getRow("ConnectionStatus", "PolicyName", A0_81[1])
  if configRow == nil then
    printCLIError("Policy doesnt exist")
    return "ERROR", "Policy doesnt exist"
  else
    errorFlag, statusCode = vipSecure.ConnStatusConfig("ConnectionStatus", "_ROWID_", configRow["ConnectionStatus._ROWID_"], "Action", "1", "Connect")
    if errorFlag == "OK" then
      db.commitTransaction(true)
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
    return errorFlag, statusMessage
  end
end
function ipsecVpnPolicyDrop(A0_83)
  local L1_84
  L1_84 = "ERROR"
  errorFlag = L1_84
  L1_84 = ""
  statusCode = L1_84
  L1_84 = ""
  statusMessage = L1_84
  L1_84 = db
  L1_84 = L1_84.getAttribute
  L1_84 = L1_84("environment", "name", "VIPSECURE_STATUS", "value")
  if L1_84 ~= nil then
    os.execute(L1_84 .. " " .. DB_FILE_NAME)
  end
  configRow = db.getRow("ConnectionStatus", "PolicyName", A0_83[1])
  if configRow == nil then
    printCLIError("Policy doesnt exist")
    return "ERROR", "Policy doesnt exist"
  else
    errorFlag, statusCode = vipSecure.ConnStatusConfig("ConnectionStatus", "_ROWID_", configRow["ConnectionStatus._ROWID_"], "Action", "0", "Drop")
    if errorFlag == "OK" then
      db.commitTransaction(true)
      db.save()
    end
    statusMessage = db.getAttribute("stringsMap", "stringId", statusCode, LANGUAGE)
    return errorFlag, statusMessage
  end
end
function ipsecVpnPolicyStatusGet()
  local L0_85, L1_86, L2_87, L3_88
  L0_85 = db
  L0_85 = L0_85.getAttribute
  L1_86 = "environment"
  L2_87 = "name"
  L3_88 = "VIPSECURE_STATUS"
  L0_85 = L0_85(L1_86, L2_87, L3_88, "value")
  if L0_85 ~= nil then
    L1_86 = os
    L1_86 = L1_86.execute
    L2_87 = L0_85
    L3_88 = " "
    L2_87 = L2_87 .. L3_88 .. DB_FILE_NAME
    L1_86(L2_87)
  end
  L1_86 = {}
  L2_87 = 0
  L3_88 = db
  L3_88 = L3_88.getTable
  L3_88 = L3_88("ConnectionStatus")
  for _FORV_7_, _FORV_8_ in pairs(L3_88) do
    L2_87 = L2_87 + 1
    resTab.insertField(L1_86, "Row Id", L3_88[L2_87]["ConnectionStatus._ROWID_"])
    resTab.insertField(L1_86, "Policy Name", L3_88[L2_87]["ConnectionStatus.PolicyName"])
    resTab.insertField(L1_86, "Endpoint", L3_88[L2_87]["ConnectionStatus.RemoteEndpoint"])
    resTab.insertField(L1_86, "tx ( KB )", L3_88[L2_87]["ConnectionStatus.TxData"])
    resTab.insertField(L1_86, "tx ( Packets )", L3_88[L2_87]["ConnectionStatus.TxPackets"])
    resTab.insertField(L1_86, "State", L3_88[L2_87]["ConnectionStatus.ConnectionStatus"])
  end
  resTab.print(L1_86, 0)
end
function checkBackupValidations(A0_89)
  if A0_89["IpsecVPNPolicy.BackupPolicyName"] == nil or A0_89["IpsecVPNPolicy.BackupPolicyName"] == "" then
    printCLIError("backup policy name can't be blank")
    return false
  elseif A0_89["IpsecIKEPolicy.Direction"] == "1" then
    printCLIError("IKE policy direction can't be responder")
    return false
  elseif A0_89["IpsecIKEPolicy.XAUTHType"] == "1" then
    printCLIError("Extendead authentication can't be IPSEC HOST")
    return false
  elseif A0_89["IpsecVPNPolicy.AutoPolicyType"] ~= "0" then
    printCLIError("Redundant vpn Gateway is not for Client policies")
    return false
  end
  return true
end
function setXauthProfile(A0_90, A1_91)
  if tonumber(A1_91) == 7 then
    if vipSecure.xauthServerProfile(A1_91)[1] == nil or vipSecure.xauthServerProfile(A1_91)[1]["ActiveDirectorySettings.ProfileName"] == nil or vipSecure.xauthServerProfile(A1_91)[1]["ActiveDirectorySettings.ProfileName"] == "" then
      printCLIError("Please configure Active Directory Settings")
      return false
    else
      A0_90["IpsecIKEPolicy.XAUTHProfile"] = vipSecure.xauthServerProfile(A1_91)[1]["ActiveDirectorySettings.ProfileName"]
      return true
    end
  elseif tonumber(A1_91) == 8 then
    if vipSecure.xauthServerProfile(A1_91)[1] == nil or vipSecure.xauthServerProfile(A1_91)[1]["POPProfiles.ProfileName"] == nil or vipSecure.xauthServerProfile(A1_91)[1]["POPProfiles.ProfileName"] == "" then
      printCLIError("Please configure POP3 Settings")
      return false
    else
      A0_90["IpsecIKEPolicy.XAUTHProfile"] = vipSecure.xauthServerProfile(A1_91)[1]["POPProfiles.ProfileName"]
      return true
    end
  elseif tonumber(A1_91) == 9 then
    if vipSecure.xauthServerProfile(A1_91)[1] == nil or vipSecure.xauthServerProfile(A1_91)[1]["LDAPSettings.ProfileName"] == nil or vipSecure.xauthServerProfile(A1_91)[1]["LDAPSettings.ProfileName"] == "" then
      printCLIError("Please configure LDAP Settings")
      return false
    else
      A0_90["IpsecIKEPolicy.XAUTHProfile"] = vipSecure.xauthServerProfile(A1_91)[1]["LDAPSettings.ProfileName"]
      return true
    end
  elseif tonumber(A1_91) == 10 then
    if vipSecure.xauthServerProfile(A1_91)[1] == nil or vipSecure.xauthServerProfile(A1_91)[1]["NTDomainSettings.ProfileName"] == nil or vipSecure.xauthServerProfile(A1_91)[1]["NTDomainSettings.ProfileName"] == "" then
      printCLIError("Please configure NTDOMAIN Settings")
      return false
    else
      A0_90["IpsecIKEPolicy.XAUTHProfile"] = vipSecure.xauthServerProfile(A1_91)[1]["NTDomainSettings.ProfileName"]
      return true
    end
  end
  return true
end
