local L0_0
L0_0 = require
L0_0("teamf1lualib/openvpn")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/validations_cli")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/omniSslClientConfig_bl")
L0_0 = require
L0_0("teamf1lualib/openVpnServerPolicy_bl")
L0_0 = require
L0_0("teamf1lualib/openVpnCertificates_bl")
L0_0 = require
L0_0("teamf1lualib/openVpnAuthentication_bl")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0 = L0_0("com.teamf1.bl.vpn.openVpnServerPolicy")
openvpnLanRoutesTable = "OpenVpnLanRoutes"
openvpnGwRoutesTable = "OpenVpnGwRoutes"
authMode = {}
authMode.localUser = "0"
authMode.radiusServer = "1"
authMode.ldap = "2"
authMode.pop3 = "3"
authMode.activeDirectory = "4"
authMode.ntDomain = "5"
authType = {}
authType.PAP = "1"
authType.CHAP = "2"
authType.MSCHAP = "3"
authType.MSCHAPv2 = "4"
ldapTable = "LDAPSettings"
ntdomainTable = "NTDomainSettings"
radiusTable = "radiusClient"
adServerTable = "ActiveDirectorySettings"
popTable = "POPProfiles"
if PRODUCT_ID == "DSR-1000AC_Ax" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-1000_Ax" or PRODUCT_ID == "DSR-1000N_Ax" then
else
end
function octectCheck(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.split
  L3_4 = A0_1
  L2_3 = L2_3(L3_4, L4_5)
  L1_2 = L2_3
  L2_3 = 0
  L3_4 = _UPVALUE1_
  L3_4 = L3_4.ERROR
  if L4_5 == 4 then
    for L7_8, L8_9 in L4_5(L5_6) do
      if L8_9:match("%a") or L8_9:match("%W") then
        return _UPVALUE1_.ERROR
      elseif tonumber(L8_9) == 255 then
        L2_3 = L2_3 + 1
      end
    end
  else
    return L3_4
  end
  if L2_3 == 4 then
    L3_4 = L4_5.SUCCESS
    return L3_4
  end
  return L3_4
end
function openVpnCfgInit(A0_10)
  local L1_11
  L1_11 = {}
  L1_11 = db.getRow("OpenVpn", "_ROWID_", "1")
  return 1, L1_11
end
function openVpnCfgSave(A0_12)
  local L1_13, L2_14, L3_15
  L1_13 = "ERROR"
  L2_14 = ""
  L3_15 = ""
  if A0_12["OpenVpn.authType"] then
    A0_12["OpenVpn.authServerId"] = A0_12["OpenVpn.authMode"] * 10 + A0_12["OpenVpn.authType"]
  elseif A0_12["OpenVpn.authMode"] then
    A0_12["OpenVpn.authServerId"] = A0_12["OpenVpn.authMode"] * 10
  end
  L1_13, L3_15 = openvpn.editSet(A0_12)
  if L1_13 == "OK" then
    db.save()
  end
  L2_14 = db.getAttribute("stringsMap", "stringId", L3_15, LANGUAGE) or L3_15
  return L1_13, L2_14
end
function openVpnCfgInputVal(A0_16)
  local L1_17, L2_18, L3_19, L4_20, L5_21
  L1_17 = {}
  L2_18 = A0_16["OpenVpn.OpenVpnMode"]
  if L2_18 ~= nil then
    L2_18 = A0_16["OpenVpn.OpenVpnMode"]
  elseif L2_18 == "" then
    L2_18 = printCLIError
    L3_19 = "please select mode"
    L2_18(L3_19)
    L2_18 = false
    return L2_18
  end
  L2_18 = A0_16["OpenVpn.Port"]
  if L2_18 ~= nil then
    L2_18 = A0_16["OpenVpn.Port"]
  elseif L2_18 == "" then
    L2_18 = printCLIError
    L3_19 = "Please enter a valid port"
    L2_18(L3_19)
    L2_18 = false
    return L2_18
  end
  L2_18 = A0_16["OpenVpn.OpenVpnMode"]
  if L2_18 == "0" then
    L2_18 = A0_16["OpenVpn.OpenVpnNetwork"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.OpenVpnNetwork"]
    elseif L2_18 == "0.0.0.0" then
      L2_18 = printCLIError
      L3_19 = "Enter valid Vpn Network"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.OpenVpnNetmask"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.OpenVpnNetmask"]
    elseif L2_18 == "0.0.0.0" then
      L2_18 = printCLIError
      L3_19 = "Enter valid Netmask"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.OpenVpnNetwork"]
    L3_19 = A0_16["OpenVpn.OpenVpnNetmask"]
    L4_20 = nil
    L5_21 = _UPVALUE0_
    L5_21 = L5_21.checkWanSubnetRange
    L5_21 = L5_21(L2_18, L3_19)
    L4_20 = L5_21
    L5_21 = _UPVALUE1_
    L5_21 = L5_21.SUCCESS
    if L4_20 == L5_21 then
      L5_21 = UNIT_NAME
      if L5_21 ~= "DSR-1000N" then
        L5_21 = UNIT_NAME
        if L5_21 ~= "DSR-1000" then
          L5_21 = UNIT_NAME
          if L5_21 ~= "DSR-500N" then
            L5_21 = UNIT_NAME
            if L5_21 ~= "DSR-500" then
              L5_21 = UNIT_NAME
              if L5_21 ~= "DSR-1000AC" then
                L5_21 = UNIT_NAME
                if L5_21 ~= "DSR-500AC" then
                  L5_21 = PRODUCT_ID
                  if L5_21 ~= "DSR-1000_Bx" then
                    L5_21 = PRODUCT_ID
                  end
                end
              end
            end
          end
        end
      else
        if L5_21 == "DSR-500_Bx" then
          L5_21 = printCLIError
          L5_21("WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      end
      else
        L5_21 = printCLIError
        L5_21("WAN ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      end
      L5_21 = false
      return L5_21
    end
    L5_21 = octectCheck
    L5_21 = L5_21(L3_19)
    if L5_21 == _UPVALUE1_.SUCCESS then
      L5_21 = printCLIError
      L5_21("Invalid NetworMask, Please enter a valid NetworkMask.")
      L5_21 = false
      return L5_21
    end
    L5_21 = HIGH_SEC
    if L5_21 == "HIGH" then
      L5_21 = _UPVALUE0_
      L5_21 = L5_21.checkSslClientRange
      L5_21 = L5_21(L2_18, L3_19)
      L4_20 = L5_21
      L5_21 = _UPVALUE1_
      L5_21 = L5_21.SUCCESS
      if L4_20 == L5_21 then
        L5_21 = printCLIError
        L5_21("SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet.")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = _UPVALUE0_
    L5_21 = L5_21.checkDmzSubnetRange
    L5_21 = L5_21(L2_18, L3_19)
    L4_20 = L5_21
    L5_21 = _UPVALUE1_
    L5_21 = L5_21.SUCCESS
    if L4_20 == L5_21 then
      L5_21 = printCLIError
      L5_21("DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      L5_21 = false
      return L5_21
    end
    L5_21 = _UPVALUE0_
    L5_21 = L5_21.checkLanVlanSubnetRange
    L5_21 = L5_21(L2_18, L3_19)
    L4_20 = L5_21
    L5_21 = _UPVALUE1_
    L5_21 = L5_21.SUCCESS
    if L4_20 == L5_21 then
      L5_21 = printCLIError
      L5_21("Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      L5_21 = false
      return L5_21
    end
    L5_21 = UNIT_NAME
    if L5_21 ~= "DSR-1000N" then
      L5_21 = UNIT_NAME
      if L5_21 ~= "DSR-1000" then
        L5_21 = UNIT_NAME
        if L5_21 ~= "DSR-500N" then
          L5_21 = UNIT_NAME
          if L5_21 ~= "DSR-500" then
            L5_21 = UNIT_NAME
            if L5_21 ~= "DSR-1000AC" then
              L5_21 = UNIT_NAME
              if L5_21 ~= "DSR-500AC" then
                L5_21 = UNIT_NAME
                if L5_21 ~= "DSR-250N" then
                  L5_21 = UNIT_NAME
                  if L5_21 ~= "DSR-250" then
                    L5_21 = UNIT_NAME
                    if L5_21 ~= "DSR-150N" then
                      L5_21 = UNIT_NAME
                    end
                  end
                end
              end
            end
          end
        end
      end
    elseif L5_21 == "DSR-150" then
      L5_21 = _UPVALUE0_
      L5_21 = L5_21.checkPptpSeverSubnetRange
      L5_21 = L5_21(L2_18, L3_19)
      L4_20 = L5_21
      L5_21 = _UPVALUE1_
      L5_21 = L5_21.SUCCESS
      if L4_20 == L5_21 then
        L5_21 = printCLIError
        L5_21("PPTP Server ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
        L5_21 = false
        return L5_21
      end
      L5_21 = _UPVALUE0_
      L5_21 = L5_21.checkL2tpSeverSubnetRange
      L5_21 = L5_21(L2_18, L3_19)
      L4_20 = L5_21
      L5_21 = _UPVALUE1_
      L5_21 = L5_21.SUCCESS
      if L4_20 == L5_21 then
        L5_21 = printCLIError
        L5_21("L2TP Server ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.TunnelType"]
    if L5_21 ~= nil then
      L5_21 = A0_16["OpenVpn.TunnelType"]
    elseif L5_21 == "" then
      L5_21 = pritnCLiError
      L5_21("Please enter TunnelType")
      L5_21 = false
      return L5_21
    end
    L5_21 = A0_16["OpenVpn.TunnelType"]
    if L5_21 == "1" then
      L5_21 = A0_16["OpenVpn.AllowClientToClient"]
      if L5_21 == nil then
        L5_21 = printCLIError
        L5_21("Enable or Disable Client to Client communication")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.duplicateCN"]
    if L5_21 == "1" then
      L5_21 = A0_16["OpenVpn.userAuthSupportEnable"]
      if L5_21 == "0" then
        L5_21 = printCLIError
        L5_21("User Based Auth should be enabled when Duplicate CN option is enabled")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.duplicateCN"]
    if L5_21 == "1" then
      L5_21 = A0_16["OpenVpn.certificateVerification"]
      if L5_21 == "0" then
        L5_21 = printCLIError
        L5_21("Certificate Verification should be enabled when Duplicate CN option is enabled")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.authType"]
    if L5_21 ~= nil then
      L5_21 = A0_16["OpenVpn.authMode"]
      if L5_21 ~= authMode.radiusServer then
        L5_21 = printCLIError
        L5_21("Incorrect settings,authentication type is supported in Radius mode only")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.authType"]
    if L5_21 == nil then
      L5_21 = A0_16["OpenVpn.authMode"]
      if L5_21 == authMode.radiusServer then
        L5_21 = printCLIError
        L5_21("Please select authentication sub types (pap/chap/ms-chapv2/ms-chap")
        L5_21 = false
        return L5_21
      end
    end
    L5_21 = A0_16["OpenVpn.authMode"]
    if L5_21 == authMode.radiusServer then
      L5_21 = db
      L5_21 = L5_21.getTable
      L5_21 = L5_21(radiusTable)
      if next(L5_21) == NIL then
        printCLIError("Radius server not configured")
        return false
      end
    else
      L5_21 = A0_16["OpenVpn.authMode"]
      if L5_21 == authMode.ldap then
        L5_21 = db
        L5_21 = L5_21.getTable
        L5_21 = L5_21(ldapTable)
        if next(L5_21) == NIL then
          printCLIError("LDAP server not configured")
          return false
        end
      else
        L5_21 = A0_16["OpenVpn.authMode"]
        if L5_21 == authMode.ntDomain then
          L5_21 = db
          L5_21 = L5_21.getTable
          L5_21 = L5_21(ntdomainTable)
          if next(L5_21) == NIL then
            printCLIError("NT-Domain server not configured")
            return false
          end
        else
          L5_21 = A0_16["OpenVpn.authMode"]
          if L5_21 == authMode.activeDirectory then
            L5_21 = db
            L5_21 = L5_21.getTable
            L5_21 = L5_21(adServerTable)
            if next(L5_21) == NIL then
              printCLIError("Active Directory server not configured")
              return false
            end
          else
            L5_21 = A0_16["OpenVpn.authMode"]
            if L5_21 == authMode.pop3 then
              L5_21 = db
              L5_21 = L5_21.getTable
              L5_21 = L5_21(popTable)
              if next(L5_21) == NIL then
                printCLIError("POP3 server not configured")
                return false
              end
            end
          end
        end
      end
    end
  else
    L2_18 = A0_16["OpenVpn.OpenVpnMode"]
    if L2_18 == "1" then
      L2_18 = A0_16["OpenVpn.RemoteIpType"]
      if L2_18 == "0" then
        L2_18 = A0_16["OpenVpn.RemoteIp"]
        if L2_18 ~= nil then
          L2_18 = A0_16["OpenVpn.RemoteIp"]
        elseif L2_18 == "" then
          L2_18 = printCLIError
          L3_19 = "Enter valid server Ip"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
      else
        L2_18 = A0_16["OpenVpn.RemoteIpType"]
        if L2_18 == "1" then
          L2_18 = A0_16["OpenVpn.RemoteIp"]
          if L2_18 ~= nil then
            L2_18 = A0_16["OpenVpn.RemoteIp"]
            if L2_18 ~= "" then
              L2_18 = string
              L2_18 = L2_18.len
              L3_19 = A0_16["OpenVpn.RemoteIp"]
              L2_18 = L2_18(L3_19)
            end
          elseif L2_18 > 127 then
            L2_18 = printCLIError
            L3_19 = "Enter valid FQDN name with length less than 128 characters"
            L2_18(L3_19)
            L2_18 = false
            return L2_18
          end
        else
          L2_18 = A0_16["OpenVpn.RemoteIpType"]
          if L2_18 ~= nil then
            L2_18 = A0_16["OpenVpn.RemoteIpType"]
          elseif L2_18 == "" then
            L2_18 = printCLIError
            L3_19 = "select server identifier type"
            L2_18(L3_19)
            L2_18 = false
            return L2_18
          end
        end
      end
      L2_18 = A0_16["OpenVpn.FailoverRemoteIpType"]
      if L2_18 == "0" then
        L2_18 = A0_16["OpenVpn.FailoverRemoteIp"]
        if L2_18 ~= nil then
          L2_18 = A0_16["OpenVpn.FailoverRemoteIp"]
        elseif L2_18 == "" then
          L2_18 = printCLIError
          L3_19 = "Enter valid failover server Ip"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
      else
        L2_18 = A0_16["OpenVpn.FailoverRemoteIpType"]
        if L2_18 == "1" then
          L2_18 = A0_16["OpenVpn.FailoverRemoteIp"]
          if L2_18 ~= nil then
            L2_18 = A0_16["OpenVpn.FailoverRemoteIp"]
            if L2_18 ~= "" then
              L2_18 = string
              L2_18 = L2_18.len
              L3_19 = A0_16["OpenVpn.FailoverRemoteIp"]
              L2_18 = L2_18(L3_19)
            end
          elseif L2_18 > 127 then
            L2_18 = printCLIError
            L3_19 = "Enter valid failover FQDN name with length less than 128 characters"
            L2_18(L3_19)
            L2_18 = false
            return L2_18
          end
        end
      end
      L2_18 = A0_16["OpenVpn.userAuthSupportEnable"]
      if L2_18 == "1" then
        L2_18 = A0_16["OpenVpn.UserName"]
        if L2_18 ~= nil then
          L2_18 = A0_16["OpenVpn.UserName"]
        elseif L2_18 == "" then
          L2_18 = printCLIError
          L3_19 = "Please enter username"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
      else
        L2_18 = A0_16["OpenVpn.userAuthSupportEnable"]
        if L2_18 == "1" then
          L2_18 = A0_16["OpenVpn.Password"]
          if L2_18 ~= nil then
            L2_18 = A0_16["OpenVpn.Password"]
          elseif L2_18 == "" then
            L2_18 = printCLIError
            L3_19 = "Please enter password"
            L2_18(L3_19)
            L2_18 = false
            return L2_18
          end
        end
      end
    else
      L2_18 = A0_16["OpenVpn.OpenVpnMode"]
      if L2_18 == "2" then
        L2_18 = openvpnCerts
        L2_18 = L2_18.uploadStatusGet
        L3_19 = "config"
        L2_18 = L2_18(L3_19)
        if L2_18 == false then
          L2_18 = printCLIError
          L3_19 = "Please upload the client configuration and enable OpenVPN Access Server Client"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
      end
    end
  end
  L2_18 = A0_16["OpenVpn.OpenVpnMode"]
  if L2_18 ~= "0" then
    L2_18 = A0_16["OpenVpn.OpenVpnMode"]
  elseif L2_18 == "1" then
    L2_18 = A0_16["OpenVpn.TunnelProtocol"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.TunnelProtocol"]
    elseif L2_18 == "" then
      L2_18 = printCLIError
      L3_19 = "Please enter tunnel protocol type"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.EncryptionAlgorithm"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.EncryptionAlgorithm"]
    elseif L2_18 == "" then
      L2_18 = printCLIError
      L3_19 = "Please enter Encryption Algorithm type"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.HashAlgorithm"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.HashAlgorithm"]
    elseif L2_18 == "" then
      L2_18 = printCLIError
      L3_19 = "Please enter Hash Algorithm type"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.serverClientCertsName"]
    if L2_18 ~= nil then
      L2_18 = A0_16["OpenVpn.serverClientCertsName"]
    elseif L2_18 == "" then
      L2_18 = printCLIError
      L3_19 = "Please Select valid Certificates"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = db
    L2_18 = L2_18.getRowWhere
    L3_19 = "OpenvpnAuthCertificates"
    L4_20 = "name = '"
    L5_21 = A0_16["OpenVpn.serverClientCertsName"]
    L4_20 = L4_20 .. L5_21 .. "'"
    L2_18 = L2_18(L3_19, L4_20)
    L1_17 = L2_18
    L2_18 = _UPVALUE1_
    L2_18 = L2_18.NIL
    if L1_17 == L2_18 then
      L2_18 = printCLIError
      L3_19 = "Please Select valid Certificates, use <show vpn openvpn server_client_certificates> to see the list of available certificates"
      L2_18(L3_19)
      L2_18 = false
      return L2_18
    end
    L2_18 = A0_16["OpenVpn.OpenVpnMode"]
    if L2_18 == "0" then
      L2_18 = L1_17["OpenvpnAuthCertificates.caCertData"]
      if L2_18 ~= nil then
        L2_18 = L1_17["OpenvpnAuthCertificates.crtCertData"]
        if L2_18 ~= nil then
          L2_18 = L1_17["OpenvpnAuthCertificates.keyCertData"]
          if L2_18 ~= nil then
            L2_18 = L1_17["OpenvpnAuthCertificates.dhCertData"]
          end
        end
      elseif L2_18 == nil then
        L2_18 = printCLIError
        L3_19 = "Please Select valid Certificates"
        L2_18(L3_19)
        L2_18 = false
        return L2_18
      end
    else
      L2_18 = certVer
      if L2_18 == "1" then
        L2_18 = L1_17["OpenvpnAuthCertificates.caCertData"]
        if L2_18 ~= nil then
          L2_18 = L1_17["OpenvpnAuthCertificates.crtCertData"]
          if L2_18 ~= nil then
            L2_18 = L1_17["OpenvpnAuthCertificates.keyCertData"]
          end
        elseif L2_18 == nil then
          L2_18 = printCLIError
          L3_19 = "Please Select valid Certificates"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
      else
        L2_18 = L1_17["OpenvpnAuthCertificates.caCertData"]
        L3_19 = NULL
        if L2_18 == L3_19 then
          L2_18 = openvpnReturnCodes
          L2_18 = L2_18.CERTS_NOT_FOUND
          return L2_18
        end
      end
    end
    L2_18 = A0_16["OpenVpn.certificateVerification"]
    if L2_18 == "0" then
      L2_18 = A0_16["OpenVpn.userAuthSupportEnable"]
      if L2_18 == "0" then
        L2_18 = printCLIError
        L3_19 = "Please Enable User Based Auth or Certificate Verification"
        L2_18(L3_19)
        L2_18 = false
        return L2_18
      end
    end
    L2_18 = A0_16["OpenVpn.TlsEnabled"]
    if L2_18 == "1" then
      L2_18 = A0_16["OpenVpn.TlsCertsName"]
      L3_19 = _UPVALUE1_
      L3_19 = L3_19.NIL
      if L2_18 == L3_19 then
        L2_18 = printCLIError
        L3_19 = "Please Select valid tls Certificate or upload tls certificate"
        L2_18(L3_19)
        L2_18 = false
        return L2_18
      end
      L2_18 = db
      L2_18 = L2_18.getRow
      L3_19 = "OpenvpnTlsCertificates"
      L4_20 = "name"
      L5_21 = A0_16["OpenVpn.TlsCertsName"]
      L2_18 = L2_18(L3_19, L4_20, L5_21)
      if L2_18 == nil then
        L3_19 = printCLIError
        L4_20 = "Please Select valid Certificates, use <show vpn openvpn tls_certificates> to see the list of available certificates"
        L3_19(L4_20)
        L3_19 = false
        return L3_19
      end
    end
    L2_18 = A0_16["OpenVpn.BlockCertWithCRL"]
    if L2_18 == "1" then
      L2_18 = A0_16["OpenVpn.OpenVpnMode"]
      if L2_18 == "0" then
        L2_18 = A0_16["OpenVpn.CrlCertsName"]
        L3_19 = _UPVALUE1_
        L3_19 = L3_19.NIL
        if L2_18 == L3_19 then
          L2_18 = printCLIError
          L3_19 = "Please Select valid crl Certificate or upload crl certificate"
          L2_18(L3_19)
          L2_18 = false
          return L2_18
        end
        L2_18 = db
        L2_18 = L2_18.getRow
        L3_19 = "OpenvpnCrlCertificates"
        L4_20 = "name"
        L5_21 = A0_16["OpenVpn.CrlCertsName"]
        L2_18 = L2_18(L3_19, L4_20, L5_21)
        if L2_18 == nil then
          L3_19 = printCLIError
          L4_20 = "Please Select valid Certificates, use <show vpn openvpn crl_certificates> to see the list of available crl certificates"
          L3_19(L4_20)
          L3_19 = false
          return L3_19
        end
      end
    end
  end
  L2_18 = true
  return L2_18
end
function openVpnConfigGet()
  local L0_22, L1_23
  L0_22 = db
  L0_22 = L0_22.getRow
  L1_23 = "OpenVpn"
  L0_22 = L0_22(L1_23, "_ROWID_", "1")
  L1_23 = {}
  if L0_22["OpenVpn.ServerEnable"] == "0" then
    resTab.insertField(L1_23, "State", "disabled" or "")
  else
    resTab.insertField(L1_23, "State", "enabled" or "")
  end
  if L0_22["OpenVpn.OpenVpnMode"] == "0" then
    resTab.insertField(L1_23, "Mode", "server" or "")
    resTab.insertField(L1_23, "Vpn Network", L0_22["OpenVpn.OpenVpnNetwork"] or "")
    resTab.insertField(L1_23, "Vpn Netmask", L0_22["OpenVpn.OpenVpnNetmask"] or "")
    if L0_22["OpenVpn.duplicateCN"] == "1" then
      resTab.insertField(L1_23, "Duplicate CN", "enabled" or "")
      resTab.insertField(L1_23, "User Based Auth", "enabled" or "")
    else
      resTab.insertField(L1_23, "Duplicate CN", "disabled" or "")
    end
    if L0_22["OpenVpn.userAuthSupportEnable"] == "0" then
      resTab.insertField(L1_23, "User Based Auth", "disabled" or "")
    else
      resTab.insertField(L1_23, "User Based Auth", "enabled" or "")
    end
    if L0_22["OpenVpn.certificateVerification"] == "1" then
      resTab.insertField(L1_23, "Certificate Verification", "enabled" or "")
    else
      resTab.insertField(L1_23, "Certificate Verification", "disabled" or "")
      resTab.insertField(L1_23, "User Based Auth", "enabled" or "")
    end
    resTab.insertField(L1_23, "Server Certificate", L0_22["OpenVpn.serverClientCertsName"] or "")
    if openvpnCerts.uploadCrlSectionGet() then
      if L0_22["OpenVpn.BlockCertWithCRL"] == "0" then
        resTab.insertField(L1_23, "Invalid Client Certificates", "disabled")
      elseif L0_22["OpenVpn.BlockCertWithCRL"] == "1" then
        resTab.insertField(L1_23, "Invalid Client Certificates", "Enabled")
        resTab.insertField(L1_23, "CRL Certificate", L0_22["OpenVpn.CrlCertsName"] or "")
      end
    end
  elseif L0_22["OpenVpn.OpenVpnMode"] == "1" then
    resTab.insertField(L1_23, "Mode", "client" or "")
    if L0_22["OpenVpn.RemoteIpType"] == "0" then
      resTab.insertField(L1_23, "Server Identifier Type", "IP address" or "")
    elseif L0_22["OpenVpn.RemoteIpType"] == "1" then
      resTab.insertField(L1_23, "Server Identifier Type", "FQDN" or "")
    end
    resTab.insertField(L1_23, "Server Ip", L0_22["OpenVpn.RemoteIp"] or "")
    if L0_22["OpenVpn.FailoverRemoteIpType"] == "0" then
      resTab.insertField(L1_23, "Failover Server Identifier Type", "IP address" or "")
    elseif L0_22["OpenVpn.FailoverRemoteIp"] == "1" then
      resTab.insertField(L1_23, "Failover Server Identifier Type", "FQDN" or "")
    end
    resTab.insertField(L1_23, "Failover Server Ip", L0_22["OpenVpn.FailoverRemoteIp"] or "")
    if L0_22["OpenVpn.userAuthSupportEnable"] == "1" then
      resTab.insertField(L1_23, "User Based Auth", "enabled" or "")
      resTab.insertField(L1_23, "Username", L0_22["OpenVpn.UserName"] or "")
      resTab.insertField(L1_23, "Password", util.mask(L0_22["OpenVpn.Password"]) or "")
    else
      resTab.insertField(L1_23, "User Based Auth", "disabled" or "")
    end
    if L0_22["OpenVpn.certificateVerification"] == "1" then
      resTab.insertField(L1_23, "Certificate Verification", "enabled" or "")
    else
      resTab.insertField(L1_23, "Certificate Verification", "disabled" or "")
    end
    resTab.insertField(L1_23, "Client Certificate", L0_22["OpenVpn.serverClientCertsName"] or "")
  elseif L0_22["OpenVpn.OpenVpnMode"] == "2" then
    resTab.insertField(L1_23, "Mode", "Access Server client" or "")
  end
  resTab.insertField(L1_23, "Port", L0_22["OpenVpn.Port"] or "")
  if L0_22["OpenVpn.OpenVpnMode"] == "1" or L0_22["OpenVpn.OpenVpnMode"] == "0" then
    if L0_22["OpenVpn.TunnelProtocol"] == "0" then
      resTab.insertField(L1_23, "Tunnel Protocol", "UDP")
    elseif L0_22["OpenVpn.TunnelProtocol"] == "1" then
      resTab.insertField(L1_23, "Tunnel Protocol", "TCP")
    end
    if L0_22["OpenVpn.EncryptionAlgorithm"] == "0" then
      resTab.insertField(L1_23, "Encryption Algorithm", "BF-CBC")
    elseif L0_22["OpenVpn.EncryptionAlgorithm"] == "1" then
      resTab.insertField(L1_23, "Encryption Algorithm", "AES-128")
    elseif L0_22["OpenVpn.EncryptionAlgorithm"] == "2" then
      resTab.insertField(L1_23, "Encryption Algorithm", "AES-192")
    elseif L0_22["OpenVpn.EncryptionAlgorithm"] == "3" then
      resTab.insertField(L1_23, "Encryption Algorithm", "AES-256")
    end
    if L0_22["OpenVpn.HashAlgorithm"] == "0" then
      resTab.insertField(L1_23, "Hash Algorithm", "SHA-1")
    elseif L0_22["OpenVpn.HashAlgorithm"] == "1" then
      resTab.insertField(L1_23, "Hash Algorithm", "SHA256")
    elseif L0_22["OpenVpn.EncryptionAlgorithm"] == "2" then
      resTab.insertField(L1_23, "Hash Algorithm", "SHA512")
    end
    if L0_22["OpenVpn.TunnelType"] == "0" then
      resTab.insertField(L1_23, "Tunnel Type", "Full Tunnel")
    elseif L0_22["OpenVpn.TunnelType"] == "1" then
      resTab.insertField(L1_23, "Tunnel Type", "Split Tunnel")
      if L0_22["OpenVpn.AllowClientToClient"] == "0" then
        resTab.insertField(L1_23, "Client to Client Communication", "disabled")
      elseif L0_22["OpenVpn.AllowClientToClient"] == "1" then
        resTab.insertField(L1_23, "Client to Client Communication", "enabled")
      end
    end
    if openvpnCerts.uploadTlsSectionGet() then
      if L0_22["OpenVpn.TlsEnabled"] == "0" then
        resTab.insertField(L1_23, "Tls Authentication Key", "disabled")
      elseif L0_22["OpenVpn.TlsEnabled"] == "1" then
        resTab.insertField(L1_23, "Tls Authentication Key", "Enabled")
        resTab.insertField(L1_23, "Tls Key", L0_22["OpenVpn.TlsCertsName"] or "")
      end
    end
  end
  resTab.print(L1_23, 0)
end
function openVpnRemoteCfgInit(A0_24)
  if A0_24[1] == nil then
    configRow = {}
    configRow["OpenVpnGwRoutes._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenVpnGwRoutes", "_ROWID_", A0_24[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenVpnGwRoutes._ROWID_"], configRow
end
function openVpnRemoteCfgSave(A0_25)
  local L1_26, L2_27, L3_28
  L1_26 = ""
  L2_27 = ""
  L3_28 = ""
  if db.getTable(openvpnGwRoutesTable) ~= nil and #db.getTable(openvpnGwRoutesTable) >= _UPVALUE0_ then
    statusMessage = "Maximum limit for OpenVPN remote networks is reached."
    return "ERROR", statusMessage
  end
  if A0_25["OpenVpnGwRoutes._ROWID_"] == "-1" then
    L1_26, L3_28 = openvpnGwRoutes.addSet(A0_25)
  else
    L1_26, L3_28 = openvpnGwRoutes.editSet(A0_25, A0_25["OpenVpnGwRoutes._ROWID_"])
  end
  if L1_26 == "OK" then
    db.save()
  end
  L2_27 = db.getAttribute("stringsMap", "stringId", L3_28, LANGUAGE) or L3_28
  return L1_26, L2_27
end
function openVpnRemoteCfgInputVal(A0_29)
  local L1_30, L2_31, L3_32, L4_33
  L1_30 = A0_29["OpenVpnGwRoutes.CommonName"]
  if L1_30 ~= nil then
    L1_30 = A0_29["OpenVpnGwRoutes.CommonName"]
  elseif L1_30 == "" then
    L1_30 = printCLIError
    L2_31 = "Please enter common  name"
    L1_30(L2_31)
    L1_30 = false
    return L1_30
  end
  L1_30 = A0_29["OpenVpnGwRoutes.Network"]
  if L1_30 ~= nil then
    L1_30 = A0_29["OpenVpnGwRoutes.Network"]
  elseif L1_30 == "0.0.0.0" then
    L1_30 = printCLIError
    L2_31 = "Please enter valid Ip address"
    L1_30(L2_31)
    L1_30 = false
    return L1_30
  end
  L1_30 = A0_29["OpenVpnGwRoutes.Netmask"]
  if L1_30 ~= nil then
    L1_30 = A0_29["OpenVpnGwRoutes.Netmask"]
  elseif L1_30 == "" then
    L1_30 = printCLIError
    L2_31 = "Please enter valid netmask"
    L1_30(L2_31)
    L1_30 = false
    return L1_30
  end
  L1_30 = _UPVALUE0_
  L1_30 = L1_30.checkLanVlanSubnetRange
  L2_31 = A0_29["OpenVpnGwRoutes.Network"]
  L3_32 = A0_29["OpenVpnGwRoutes.Netmask"]
  L1_30 = L1_30(L2_31, L3_32)
  L2_31 = _UPVALUE1_
  L2_31 = L2_31.SUCCESS
  if L1_30 == L2_31 then
    L2_31 = printCLIError
    L3_32 = "Lan/Vlan ip/subnet already configured in same subnet.Please specify IP address in a different subnet."
    L2_31(L3_32)
    L2_31 = false
    return L2_31
  end
  L2_31 = UNIT_NAME
  if L2_31 ~= "DSR-1000N" then
    L2_31 = UNIT_NAME
    if L2_31 ~= "DSR-1000" then
      L2_31 = UNIT_NAME
      if L2_31 ~= "DSR-500N" then
        L2_31 = UNIT_NAME
        if L2_31 ~= "DSR-500" then
          L2_31 = UNIT_NAME
          if L2_31 ~= "DSR-1000AC" then
            L2_31 = UNIT_NAME
            if L2_31 ~= "DSR-500AC" then
              L2_31 = UNIT_NAME
              if L2_31 ~= "DSR-250N" then
                L2_31 = UNIT_NAME
                if L2_31 ~= "DSR-250" then
                  L2_31 = UNIT_NAME
                  if L2_31 ~= "DSR-150N" then
                    L2_31 = UNIT_NAME
                  end
                end
              end
            end
          end
        end
      end
    end
  elseif L2_31 == "DSR-150" then
    L2_31 = A0_29["OpenVpnGwRoutes.Network"]
    L3_32 = A0_29["OpenVpnGwRoutes.Netmask"]
    L4_33 = nil
    L4_33 = _UPVALUE0_.checkWanSubnetRange(L2_31, L3_32)
    if L4_33 == _UPVALUE1_.SUCCESS then
      if UNIT_NAME == "DSR-1000N" or UNIT_NAME == "DSR-1000" or UNIT_NAME == "DSR-500N" or UNIT_NAME == "DSR-500" or PRODUCT_ID == "DSR-1000_Bx" or PRODUCT_ID == "DSR-500_Bx" or UNIT_NAME == "DSR-1000AC" or UNIT_NAME == "DSR-500AC" then
        printCLIError("WAN1/WAN2 ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
        return false
      else
        printCLIError("WAN ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
        return false
      end
    end
    if octectCheck(L3_32) == _UPVALUE1_.SUCCESS then
      printCLIError("Invalid NetworMask, Please enter a valid NetworkMask.")
      return false
    end
    if HIGH_SEC == "HIGH" then
      L4_33 = _UPVALUE0_.checkSslClientRange(L2_31, L3_32)
      if L4_33 == _UPVALUE1_.SUCCESS then
        printCLIError("SSL-VPN client range is in the same subnet.Please specify IP address in a different subnet.")
        return false
      end
    end
    L4_33 = _UPVALUE0_.checkDmzSubnetRange(L2_31, L3_32)
    if L4_33 == _UPVALUE1_.SUCCESS then
      printCLIError("DMZ ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
    L4_33 = _UPVALUE0_.checkPptpSeverSubnetRange(L2_31, L3_32)
    if L4_33 == _UPVALUE1_.SUCCESS then
      printCLIError("PPTP Server ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
    L4_33 = _UPVALUE0_.checkL2tpSeverSubnetRange(L2_31, L3_32)
    if L4_33 == _UPVALUE1_.SUCCESS then
      printCLIError("L2TP Server ip/subnet already configured in same subnet.Please specify IP address in a different subnet.")
      return false
    end
  end
  L2_31 = true
  return L2_31
end
function openVpnGwRoutesCfgDel(A0_34)
  local L1_35, L2_36, L3_37, L4_38, L5_39, L6_40
  L1_35 = {}
  L2_36 = ""
  L3_37 = ""
  L4_38 = ""
  L5_39 = ""
  L6_40 = {}
  L6_40 = db.getRow("OpenVpnGwRoutes", "_ROWID_", A0_34[1])
  if L6_40 == nil then
    print("Entered rowid does not exist\n")
    return
  end
  L1_35[1] = A0_34[1]
  L3_37, L5_39 = openvpnGwRoutes.deleteSet(L6_40)
  if L3_37 == "OK" then
    db.save()
  end
  L2_36 = db.getAttribute("stringsMap", "stringId", L5_39, LANGUAGE) or L5_39
  return L3_37, L2_36
end
function openVpnGwRoutesGetAll()
  local L0_41, L1_42
  L0_41 = db
  L0_41 = L0_41.getTable
  L1_42 = "OpenVpnGwRoutes"
  L0_41 = L0_41(L1_42)
  L1_42 = {}
  printLabel("OpenVPN Remote Networks (Site To Site)\n")
  if L0_41 == nil then
    print("There are no entries of Routes on system")
  else
    for _FORV_7_, _FORV_8_ in pairs(L0_41) do
      if L0_41[0 + 1] ~= nil then
        resTab.insertField(L1_42, "ROWID", L0_41[0 + 1]["OpenVpnGwRoutes._ROWID_"] or "")
        resTab.insertField(L1_42, "common name", L0_41[0 + 1]["OpenVpnGwRoutes.CommonName"] or "")
        resTab.insertField(L1_42, "Remote Network", L0_41[0 + 1]["OpenVpnGwRoutes.Network"] or "")
        resTab.insertField(L1_42, "netmask", L0_41[0 + 1]["OpenVpnGwRoutes.Netmask"] or "")
      end
    end
    resTab.print(L1_42, 0)
  end
end
function openVpnLanRoutesCfgInit(A0_43)
  if A0_43[1] == nil then
    configRow = {}
    configRow["OpenVpnLanRoutes._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenVpnLanRoutes", "_ROWID_", A0_43[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenVpnLanRoutes._ROWID_"], configRow
end
function openVpnLanRoutesCfgSave(A0_44)
  local L1_45, L2_46, L3_47
  L1_45 = "ERROR"
  L2_46 = ""
  L3_47 = ""
  if db.getTable(openvpnLanRoutesTable) ~= nil and #db.getTable(openvpnLanRoutesTable) >= _UPVALUE0_ then
    statusMessage = "Maximum limit for OpenVPN local networks is reached."
    return "ERROR", statusMessage
  end
  if A0_44["OpenVpnLanRoutes._ROWID_"] == "-1" then
    L1_45, L3_47 = openvpnRoutes.addSet(A0_44, nil)
  else
    L1_45, L3_47 = openvpnRoutes.editSet(A0_44, A0_44["OpenVpnLanRoutes._ROWID_"], nil)
  end
  if L1_45 == "OK" then
    db.save()
  end
  L2_46 = db.getAttribute("stringsMap", "stringId", L3_47, LANGUAGE) or L3_47
  return L1_45, L2_46
end
function openVpnLanRoutesCfgInputVal(A0_48)
  if db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.TunnelType"] == "0" or db.getRow("OpenVpn", "_ROWID_", "1")["OpenVpn.OpenVpnMode"] ~= "0" then
    printCLIError("Please Select split tunnel to Configure")
    return false
  end
  if A0_48["OpenVpnLanRoutes.Network"] == nil or A0_48["OpenVpnLanRoutes.Network"] == "0.0.0.0" then
    printCLIError("Please enter valid IP address")
    return false
  end
  if A0_48["OpenVpnLanRoutes.Netmask"] == nil or A0_48["OpenVpnLanRoutes.Netmask"] == "" then
    printCLIError("Please enter valid netmask")
    return false
  end
  return true
end
function openVpnLanRoutesCfgDel(A0_49)
  local L1_50, L2_51, L3_52, L4_53, L5_54
  L1_50 = {}
  L2_51 = ""
  L3_52 = "ERROR"
  L4_53 = {}
  L5_54 = ""
  L4_53 = db.getRow("OpenVpnLanRoutes", "_ROWID_", A0_49[1])
  if L4_53 == nil then
    print("Entered rowid does not exist\n")
    return
  end
  L1_50[1] = A0_49[1]
  L3_52, L5_54 = openvpnRoutes.deleteSet(L1_50)
  if L3_52 == "OK" then
    db.save()
  end
  L2_51 = db.getAttribute("stringsMap", "stringId", L5_54, LANGUAGE) or L5_54
  return L3_52, L2_51
end
function openVpnLanRoutesGetAll()
  local L0_55, L1_56
  L0_55 = db
  L0_55 = L0_55.getTable
  L1_56 = "OpenVpnLanRoutes"
  L0_55 = L0_55(L1_56)
  L1_56 = {}
  printLabel("OpenVPN Local Networks \n")
  if L0_55 == nil then
    print("There are no entries of Routes on system")
  else
    for _FORV_7_, _FORV_8_ in pairs(L0_55) do
      if L0_55[0 + 1] ~= nil then
        resTab.insertField(L1_56, "ROWID", L0_55[0 + 1]["OpenVpnLanRoutes._ROWID_"] or "")
        resTab.insertField(L1_56, "Remote Network", L0_55[0 + 1]["OpenVpnLanRoutes.Network"] or "")
        resTab.insertField(L1_56, "netmask", L0_55[0 + 1]["OpenVpnLanRoutes.Netmask"] or "")
      end
    end
    resTab.print(L1_56, 0)
  end
end
function openvpnCertsUploadSet(A0_57, A1_58)
  local L2_59, L3_60, L4_61, L5_62, L6_63, L7_64, L8_65, L9_66
  L2_59 = false
  L3_60 = "12738"
  L4_61 = ""
  L5_62 = os
  L5_62 = L5_62.execute
  L6_63 = "tftp -gr "
  L7_64 = A0_57
  L8_65 = " -l /var/certs/ca.crt "
  L9_66 = A1_58
  L6_63 = L6_63 .. L7_64 .. L8_65 .. L9_66
  L5_62 = L5_62(L6_63)
  if L5_62 == 256 then
    L6_63 = printCLIError
    L7_64 = "TFTP failed "
    L6_63(L7_64)
  else
    L6_63 = nil
    L7_64 = util
    L7_64 = L7_64.fileToString
    L8_65 = "/var/certs/ca.crt"
    L7_64 = L7_64(L8_65)
    L6_63 = L7_64
    L7_64 = x509Lib
    L7_64 = L7_64.certLoad
    L8_65 = L6_63
    L9_66 = "ca"
    L9_66 = L7_64(L8_65, L9_66)
    if string.find(L9_66, "CN=") == nil then
      os.execute("rm" .. " /var/certs/ca.crt")
      return "ERROR", "Upload failed. Common Name information missing in certificate."
    end
    if L7_64 == -1 or string.find(L6_63, "-----BEGIN CERTIFICATE-----") == nil or string.find(L6_63, "-----END CERTIFICATE-----") == nil then
      os.execute("rm" .. " /var/certs/ca.crt")
      L4_61 = db.getAttribute("stringsMap", "stringId", L3_60, LANGUAGE) or L3_60
      return "ERROR", L4_61
    else
      L3_60 = "12265"
      L4_61 = db.getAttribute("stringsMap", "stringId", L3_60, LANGUAGE) or L3_60
      return "OK", L4_61
    end
  end
end
function openvpnSerCliCertsUploadSet(A0_67, A1_68)
  local L2_69, L3_70, L4_71, L5_72, L6_73
  L2_69 = false
  L3_70 = "12738"
  L4_71 = ""
  L5_72 = os
  L5_72 = L5_72.execute
  L6_73 = "tftp -gr "
  L6_73 = L6_73 .. A0_67 .. " -l /var/certs/server.crt " .. A1_68
  L5_72 = L5_72(L6_73)
  if L5_72 == 256 then
    L6_73 = printCLIError
    L6_73("TFTP failed ")
  else
    L6_73 = nil
    L6_73 = util.fileToString("/var/certs/server.crt")
    if x509Lib.certLoad(L6_73, "crt") == -1 or string.find(L6_73, "-----BEGIN CERTIFICATE-----") == nil or string.find(L6_73, "-----END CERTIFICATE-----") == nil then
      os.execute("rm" .. " /var/certs/server.crt")
      statusMsg = db.getAttribute("stringsMap", "stringId", L3_70, LANGUAGE) or L3_70
      return "ERROR", statusMsg
    else
      L3_70 = "12265"
      statusMsg = db.getAttribute("stringsMap", "stringId", L3_70, LANGUAGE) or L3_70
      return "OK", statusMsg
    end
  end
end
function openvpnSerCliKeyUploadSet(A0_74, A1_75)
  local L2_76, L3_77, L4_78, L5_79, L6_80
  L2_76 = false
  L3_77 = "12738"
  L4_78 = ""
  L5_79 = os
  L5_79 = L5_79.execute
  L6_80 = "tftp -gr "
  L6_80 = L6_80 .. A0_74 .. " -l /var/certs/server.key " .. A1_75
  L5_79 = L5_79(L6_80)
  if L5_79 == 256 then
    L6_80 = printCLIError
    L6_80("TFTP failed ")
  else
    L6_80 = nil
    L6_80 = util.fileToString("/var/certs/server.key")
    if (string.find(L6_80, "-----BEGIN PRIVATE KEY-----") == nil or string.find(L6_80, "-----END PRIVATE KEY-----") == nil) and (string.find(L6_80, "-----BEGIN RSA PRIVATE KEY-----") == nil or string.find(L6_80, "-----END RSA PRIVATE KEY-----") == nil) then
      os.execute("rm" .. " /var/certs/server.key")
      L4_78 = db.getAttribute("stringsMap", "stringId", L3_77, LANGUAGE) or L3_77
      return "ERROR", L4_78
    else
      L3_77 = "12265"
      L4_78 = db.getAttribute("stringsMap", "stringId", L3_77, LANGUAGE) or L3_77
      return "OK", L4_78
    end
  end
end
function openvpnDHkeyUploadSet(A0_81, A1_82)
  local L2_83, L3_84, L4_85, L5_86, L6_87
  L2_83 = false
  L3_84 = "12738"
  L4_85 = ""
  L5_86 = os
  L5_86 = L5_86.execute
  L6_87 = "tftp -gr "
  L6_87 = L6_87 .. A0_81 .. " -l /var/certs/dh.pem " .. A1_82
  L5_86 = L5_86(L6_87)
  if L5_86 == 256 then
    L6_87 = printCLIError
    L6_87("TFTP failed ")
  else
    L6_87 = nil
    L6_87 = util.fileToString("/var/certs/dh.pem")
    if string.find(L6_87, "-----BEGIN DH PARAMETERS-----") == nil or string.find(L6_87, "-----END DH PARAMETERS-----") == nil then
      os.execute("rm" .. " /var/certs/dh.pem")
      L4_85 = db.getAttribute("stringsMap", "stringId", L3_84, LANGUAGE) or L3_84
      return "ERROR", L4_85
    else
      L3_84 = "12265"
      L4_85 = db.getAttribute("stringsMap", "stringId", L3_84, LANGUAGE) or L3_84
      return "OK", L4_85
    end
  end
end
function openvpnTlskeyUploadSet(A0_88, A1_89)
  local L2_90, L3_91, L4_92, L5_93, L6_94
  L2_90 = false
  L3_91 = "12738"
  L4_92 = ""
  L5_93 = os
  L5_93 = L5_93.execute
  L6_94 = "tftp -gr "
  L6_94 = L6_94 .. A0_88 .. " -l /var/certs/ta.key " .. A1_89
  L5_93 = L5_93(L6_94)
  if L5_93 == 256 then
    L6_94 = printCLIError
    L6_94("TFTP failed ")
  else
    L6_94 = nil
    L6_94 = util.fileToString("/var/certs/ta.key")
    if string.find(L6_94, "-----BEGIN OpenVPN Static key V1-----") == nil or string.find(L6_94, "-----END OpenVPN Static key V1-----") == nil then
      os.execute("rm" .. " /var/certs/ta.key")
      L4_92 = db.getAttribute("stringsMap", "stringId", L3_91, LANGUAGE) or L3_91
      return "ERROR", L4_92
    else
      L3_91 = "12265"
      L4_92 = db.getAttribute("stringsMap", "stringId", L3_91, LANGUAGE) or L3_91
      return "OK", L4_92, L6_94
    end
  end
end
function openvpnCrlCertUploadSet(A0_95, A1_96)
  local L2_97, L3_98, L4_99, L5_100, L6_101
  L2_97 = false
  L3_98 = "12738"
  L4_99 = ""
  L5_100 = os
  L5_100 = L5_100.execute
  L6_101 = "tftp -gr "
  L6_101 = L6_101 .. A0_95 .. " -l /var/certs/openvpn/crl.pem " .. A1_96
  L5_100 = L5_100(L6_101)
  if L5_100 == 256 then
    L6_101 = printCLIError
    L6_101("TFTP failed ")
  else
    L6_101 = nil
    L6_101 = util.fileToString("/var/certs/openvpn/crl.pem")
    if string.find(L6_101, "-----BEGIN X509 CRL-----") == nil or string.find(L6_101, "-----END X509 CRL-----") == nil then
      os.execute("rm" .. " /var/certs/openvpn/crl.pem")
      L4_99 = db.getAttribute("stringsMap", "stringId", L3_98, LANGUAGE) or L3_98
      return "ERROR", L4_99
    else
      L3_98 = "12265"
      L4_99 = db.getAttribute("stringsMap", "stringId", L3_98, LANGUAGE) or L3_98
      return "OK", L4_99, L6_101
    end
  end
end
function openvpnConfigCertUpload(A0_102, A1_103)
  local L2_104, L3_105, L4_106, L5_107, L6_108
  L2_104 = false
  L3_105 = "12738"
  L4_106 = ""
  L5_107 = os
  L5_107 = L5_107.execute
  L6_108 = "tftp -gr "
  L6_108 = L6_108 .. A0_102 .. " -l /var/certs/client.ovpn " .. A1_103
  L5_107 = L5_107(L6_108)
  if L5_107 == 256 then
    L6_108 = printCLIError
    L6_108("TFTP failed ")
  else
    L6_108 = nil
    L6_108 = util.fileToString("/var/certs/client.ovpn")
    L2_104 = string.find(L6_108, "client") ~= nil and string.find(L6_108, "dev") ~= nil and string.find(L6_108, "CERTIFICATE") ~= nil
    if L2_104 then
      L3_105 = 12265
      L4_106 = db.getAttribute("stringsMap", "stringId", L3_105, LANGUAGE) or L3_105
      return "OK", L4_106
    else
      os.execute("rm" .. " /var/certs/client.ovpn")
      L4_106 = db.getAttribute("stringsMap", "stringId", L3_105, LANGUAGE) or L3_105
      printCLIError("Upload Failed")
      return "ERROR", L4_106
    end
  end
end
function certStatusGet()
  local L0_109
  L0_109 = {}
  if openvpnCerts.uploadStatusGet("ca") then
  end
  if openvpnCerts.uploadStatusGet("crt") then
  end
  if openvpnCerts.uploadStatusGet("key") then
  end
  if openvpnCerts.uploadStatusGet("dh") then
  end
  if openvpnCerts.uploadStatusGet("ta") then
  end
  if openvpnCerts.uploadStatusGet("crl") then
  end
  if openvpnCerts.uploadStatusGet("config") then
  end
  resTab.insertField(L0_109, "CA Certificate", "Yes" or "")
  resTab.insertField(L0_109, "Server/Client Certificate", "Yes" or "")
  resTab.insertField(L0_109, "Server/Client key", "Yes" or "")
  resTab.insertField(L0_109, "DH key", "Yes" or "")
  resTab.insertField(L0_109, "Tls Authentication Key", "Yes" or "")
  resTab.insertField(L0_109, "CRL Certificate", "Yes" or "")
  resTab.insertField(L0_109, "config certificate", "Yes" or "")
  resTab.print(L0_109, 0)
end
function OpenvpnClientConfigCfgInit(A0_110)
  if A0_110[1] == nil then
    configRow = {}
    configRow["OpenvpnClientConfig._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenvpnClientConfig", "_ROWID_", A0_110[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenvpnClientConfig._ROWID_"], configRow
end
function OpenvpnClientConfigCfgSave(A0_111)
  local L1_112, L2_113, L3_114, L4_115
  L1_112 = ""
  L2_113 = ""
  L3_114 = ""
  L4_115 = nil
  L1_112, statusMessage = openvpnCaKeyUploadSet(A0_111["OpenvpnClientConfig.fileName"], A0_111["OpenvpnClientConfig.ipAddr"])
  if L1_112 == "OK" then
    L1_112 = _UPVALUE0_.omniSSLClientConfigSet(A0_111)
    statusMessage = _UPVALUE1_.errorStringGet(L1_112)
    if L1_112 == 0 then
      L1_112 = "OK"
      db.save()
    else
      L1_112 = "ERROR"
    end
  end
  return L1_112, statusMessage
end
function OpenvpnClientConfigCfgInputVal(A0_116)
  if A0_116["OpenvpnClientConfig.clientName"] == nil then
    printCLIError("Please enter valid client name")
    return false
  end
  if A0_116["OpenvpnClientConfig.fileName"] == nil then
    printCLIError("Please enter valid client key(CA Key)")
    return false
  end
  if A0_116["OpenvpnClientConfig.ipAddr"] == nil then
    printCLIError("Please enter valid Ip Address corresponding client key(CA Key)")
    return false
  end
end
function openvpnCaKeyUploadSet(A0_117, A1_118)
  local L2_119, L3_120, L4_121, L5_122, L6_123, L7_124
  L2_119 = false
  L3_120 = "12738"
  L4_121 = ""
  L5_122 = os
  L5_122 = L5_122.execute
  L6_123 = "tftp -gr "
  L7_124 = A0_117
  L6_123 = L6_123 .. L7_124 .. " -l /var/certs/openvpn/ca.key " .. A1_118
  L5_122 = L5_122(L6_123)
  if L5_122 == 256 then
    L6_123 = printCLIError
    L7_124 = "TFTP failed "
    L6_123(L7_124)
  else
    L6_123 = "/var/certs/openvpn/ca.key"
    L7_124 = util
    L7_124 = L7_124.fileToString
    L7_124 = L7_124("/var/certs/openvpn/ca.key")
    if (string.find(L7_124, "-----BEGIN PRIVATE KEY-----") == nil or string.find(L7_124, "-----END PRIVATE KEY-----") == nil) and (string.find(L7_124, "-----BEGIN RSA PRIVATE KEY-----") == nil or string.find(L7_124, "-----END RSA PRIVATE KEY-----") == nil) then
      os.execute("rm" .. "/var/certs/openvpn/ca.key")
      return "ERROR", "Invalid CA Key."
    else
      os.execute("cp /var/certs/openvpn/ca.key /var/openvpn/easy-rsa/keys/ca.key")
      L3_120 = "12265"
      L4_121 = db.getAttribute("stringsMap", "stringId", L3_120, LANGUAGE) or L3_120
      return "OK", L4_121
    end
  end
end
function OpenvpnClientConfigCfgDel(A0_125)
  local L1_126, L2_127, L3_128, L4_129, L5_130, L6_131
  L1_126 = {}
  L2_127 = ""
  L3_128 = ""
  L4_129 = {}
  L5_130 = ""
  L6_131 = nil
  L4_129 = db.getRow("OpenvpnClientConfig", "_ROWID_", A0_125[1])
  if L4_129 == nil then
    L3_128 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L3_128, statusMessage
  else
    L4_129["omniSslConfiguration.cookie"] = L4_129["OpenvpnClientConfig._ROWID_"]
    L3_128, L6_131 = _UPVALUE0_.omniSslConfigurationDelete(L4_129)
    statusMessage = _UPVALUE1_.errorStringGet(L3_128)
  end
  if L3_128 == 0 then
    L3_128 = "OK"
    db.save()
  else
    L3_128 = "ERROR"
    printCLIError(statusMessage)
  end
  return L3_128, statusMessage
end
function openVpnClientConfigGetAll()
  local L0_132, L1_133
  L0_132 = db
  L0_132 = L0_132.getTable
  L1_133 = "OpenvpnClientConfig"
  L0_132 = L0_132(L1_133)
  L1_133 = {}
  printLabel("OmniSSL Configuration List\n")
  if L0_132 == nil then
    print("There are no entries of Routes on system")
  else
    for _FORV_7_, _FORV_8_ in pairs(L0_132) do
      if L0_132[0 + 1] ~= nil then
        resTab.insertField(L1_133, "ROWID", L0_132[0 + 1]["OpenvpnClientConfig._ROWID_"] or "")
        resTab.insertField(L1_133, "Name", L0_132[0 + 1]["OpenvpnClientConfig.clientName"] or "")
      end
    end
    resTab.print(L1_133, 0)
  end
end
function openvpnPolicyCfgInit(A0_134)
  local L1_135
  L1_135 = {}
  if A0_134[1] ~= nil then
    L1_135 = db.getRow("OpenVpnConfigPolicy", "OpenVpnConfigPolicy._ROWID_", A0_134[1])
    if L1_135 == nil then
      printCLIError("Row does not exist")
      return -1, {}
    else
      return 1, L1_135
    end
  else
    L1_135["OpenVpnConfigPolicy.Permission"] = "Permit"
    L1_135["OpenVpnConfigPolicy.IcmpBlock"] = "no"
    return 1, L1_135
  end
end
function openvpnPolicyCfgSave(A0_136)
  local L1_137, L2_138, L3_139, L4_140
  L1_137 = "ERROR"
  L2_138 = ""
  L3_139 = ""
  L4_140 = nil
  DBTable = "OpenVpnConfigPolicy"
  RowId = A0_136["OpenVpnConfigPolicy._ROWID_"]
  if RowId == nil or RowId == "" then
    L1_137, L2_138 = openvpn.policyConfig(A0_136, RowId, "add")
  else
    if db.getRow("OpenVpnConfigPolicy", "OpenVpnConfigPolicy._ROWID_", RowId) == nil then
      printCLIError("Row does not exist")
      return L1_137, "Row does not exist"
    end
    L1_137, L2_138 = openvpn.policyConfig(A0_136, RowId, "edit")
  end
  L3_139 = getStatusMsgFromCode(L2_138)
  if L1_137 == "OK" then
    printCLIError(L3_139 or L2_138)
  end
  return L1_137, L3_139
end
function openvpnPolicyCfgInputVal(A0_141)
  local L1_142
  L1_142 = A0_141["OpenVpnConfigPolicy.PolicyType"]
  if L1_142 ~= nil then
    L1_142 = A0_141["OpenVpnConfigPolicy.PolicyType"]
  elseif L1_142 == "" then
    L1_142 = printCLIError
    L1_142("Invalid policy_type value")
    L1_142 = false
    return L1_142
  end
  L1_142 = A0_141["OpenVpnConfigPolicy.PolicyType"]
  if L1_142 == "user" then
    L1_142 = A0_141["OpenVpnConfigPolicy.PolicyOwnerName"]
    if L1_142 ~= nil then
      L1_142 = A0_141["OpenVpnConfigPolicy.PolicyOwnerName"]
    elseif L1_142 == "" then
      L1_142 = printCLIError
      L1_142("Invalid policy_owner value")
      L1_142 = false
      return L1_142
    end
  end
  L1_142 = A0_141["OpenVpnConfigPolicy.PolicyOwnerName"]
  if A0_141["OpenVpnConfigPolicy.PolicyType"] == "user" then
    row = db.getRow("Users", "UserName", L1_142)
    if row == nil then
      printCLIError("Invalid policy_owner value. No such user found")
      return false
    elseif users.verifyUserType(row["Users.UserName"], "13") == false then
      printCLIError("Invalid policy_owner value. Select openvpn user")
      return false
    end
  end
  if A0_141["OpenVpnConfigPolicy.DestinationObjectType"] == nil or A0_141["OpenVpnConfigPolicy.DestinationObjectType"] == "" then
    printCLIError("Invalid destination_objecttype value")
    return false
  end
  if A0_141["OpenVpnConfigPolicy.PolicyName"] == nil or A0_141["OpenVpnConfigPolicy.PolicyName"] == "" then
    printCLIError("Invalid policy_name value")
    return false
  end
  if A0_141["OpenVpnConfigPolicy.DestinationObjectType"] == "1" then
    if A0_141["OpenVpnConfigPolicy.Address"] == nil or A0_141["OpenVpnConfigPolicy.Address"] == "" then
      printCLIError("Invalid policy_address value")
      return false
    end
    if A0_141["OpenVpnConfigPolicy.StartPort"] == nil or A0_141["OpenVpnConfigPolicy.StartPort"] == "" then
      printCLIError("Invalid start_port value")
      return false
    end
    if A0_141["OpenVpnConfigPolicy.EndPort"] == nil or A0_141["OpenVpnConfigPolicy.EndPort"] == "" then
      printCLIError("Invalid end_port value")
      return false
    end
  elseif A0_141["OpenVpnConfigPolicy.DestinationObjectType"] == "2" then
    if A0_141["OpenVpnConfigPolicy.Address"] == nil or A0_141["OpenVpnConfigPolicy.Address"] == "" then
      printCLIError("Invalid policy_address value")
      return false
    end
    if A0_141["OpenVpnConfigPolicy.MaskLength"] == nil or A0_141["OpenVpnConfigPolicy.MaskLength"] == "" then
      printCLIError("Invalid policy_masklength value")
      return false
    end
    if A0_141["OpenVpnConfigPolicy.StartPort"] == nil or A0_141["OpenVpnConfigPolicy.StartPort"] == "" then
      printCLIError("Invalid start_port value")
      return false
    end
    if A0_141["OpenVpnConfigPolicy.EndPort"] == nil or A0_141["OpenVpnConfigPolicy.EndPort"] == "" then
      printCLIError("Invalid end_port value")
      return false
    end
  end
  if A0_141["OpenVpnConfigPolicy.Permission"] == nil or A0_141["OpenVpnConfigPolicy.Permission"] == "" then
    printCLIError("Invalid policy_permission value")
    return false
  end
end
function openvpnPolicyCfgDel(A0_143)
  local L1_144, L2_145, L3_146
  L1_144 = {L2_145}
  L2_145 = A0_143[1]
  rows = L1_144
  L1_144 = "ERROR"
  L2_145 = ""
  L3_146 = ""
  DBTable = "OpenVpnConfigPolicy"
  if db.getRow("OpenVpnConfigPolicy", "_ROWID_", A0_143[1]) == nil then
    printCLIError("Row does not exist")
    return L1_144, "Row does not exist"
  end
  L1_144, L2_145 = openvpn.deletePolicy(rows)
  if L1_144 == "OK" then
    db.save()
  end
  L3_146 = getStatusMsgFromCode(L2_145)
  printCLIError(L3_146 or L2_145)
  return L1_144, L3_146
end
function openvpnPolicyShow(A0_147)
  local L1_148, L2_149
  L1_148 = db
  L1_148 = L1_148.getTable
  L2_149 = "OpenVpnConfigPolicy"
  L1_148 = L1_148(L2_149)
  L2_149 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_148) do
    resTab.insertField(L2_149, "Row Id", _FORV_8_["OpenVpnConfigPolicy._ROWID_"])
    resTab.insertField(L2_149, "Policy Name", _FORV_8_["OpenVpnConfigPolicy.PolicyName"] or "")
    resTab.insertField(L2_149, "Destination Object", _FORV_8_["OpenVpnConfigPolicy.DestinationObject"] or "")
    resTab.insertField(L2_149, "Permission", _FORV_8_["OpenVpnConfigPolicy.Permission"] or "")
    resTab.insertField(L2_149, "Scope", _FORV_8_["OpenVpnConfigPolicy.PolicyType"] or "")
  end
  printLabel("OmniSSL Server Policies List")
  resTab.print(L2_149, 0)
end
function getStatusMsgFromCode(A0_150)
  local L1_151
  if A0_150 == nil then
    L1_151 = " "
    statusMsg = L1_151
  elseif A0_150 == "10187" then
    L1_151 = "Administrator privileges are required"
    statusMsg = L1_151
  elseif A0_150 == "12265" then
    L1_151 = "Operation Succeeded"
    statusMsg = L1_151
  elseif A0_150 == "12224" then
    L1_151 = "Server Policy Configuration Failed"
    statusMsg = L1_151
  elseif A0_150 == "12830" then
    L1_151 = "OPENVPN Policy Delete Failed"
    statusMsg = L1_151
  elseif A0_150 == "10740" then
    L1_151 = "End IP address must greater than or equal to the start IP address"
    statusMsg = L1_151
  elseif A0_150 == "14436" then
    L1_151 = "Server policy configuration failed"
    statusMsg = L1_151
  end
  L1_151 = statusMsg
  L1_151 = L1_151 or A0_150
  return L1_151
end
function openvpnCertificatesCfgInit(A0_152)
  local L1_153
  L1_153 = {}
  if A0_152[1] ~= nil then
    L1_153 = db.getRow("OpenvpnCertificates", "OpenvpnCertificates._ROWID_", A0_152[1])
    if L1_153 == nil then
      printCLIError("Row does not exist")
      return -1, {}
    else
      return 1, L1_153
    end
  else
    return 1, L1_153
  end
end
function openvpnCertificatesCfgSave(A0_154)
  local L1_155, L2_156, L3_157, L4_158
  L1_155 = ""
  L2_156 = ""
  L3_157 = ""
  L4_158 = nil
  L1_155 = _UPVALUE0_.easyrsaConfigParamCreate(A0_154)
  statusMessage = _UPVALUE1_.errorStringGet(L1_155)
  if L1_155 == 0 then
    L1_155 = "OK"
    db.save()
  else
    L1_155 = "ERROR"
  end
  return L1_155, statusMessage
end
function openvpnCertificatesCfgInputVal(A0_159)
  if A0_159["openvpnCertificates.countryName"] == nil or A0_159["openvpnCertificates.countryName"] == "" then
    printCLIError("Invalid CountryName")
    return false
  end
  if A0_159["openvpnCertificates.commonName"] == nil or A0_159["openvpnCertificates.commonName"] == "" then
    printCLIError("Invalid CommonName")
    return false
  end
  if A0_159["openvpnCertificates.serverName"] == nil or A0_159["openvpnCertificates.serverName"] == "" then
    printCLIError("Invalid Server Name")
    return false
  end
  if A0_159["openvpnCertificates.clientName"] == nil or A0_159["openvpnCertificates.clientName"] == "" then
    printCLIError("Invalid clientName value")
    return false
  end
end
function openvpnCertificatesCfgDel(A0_160)
  local L1_161, L2_162, L3_163, L4_164, L5_165, L6_166
  L1_161 = {}
  L2_162 = ""
  L3_163 = ""
  L4_164 = {}
  L5_165 = ""
  L6_166 = nil
  L4_164 = db.getRow("OpenVpnEasyrsaCert", "_ROWID_", A0_160[1])
  if L4_164 == nil then
    L3_163 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L3_163, statusMessage
  else
    L4_164["openvpnCertificates.cookie"] = L4_164["OpenVpnEasyrsaCert._ROWID_"]
    L3_163, L6_166 = _UPVALUE0_.easyrsaConfigParamDelete(L4_164)
    statusMessage = _UPVALUE1_.errorStringGet(L3_163)
  end
  if L3_163 == 0 then
    L3_163 = "OK"
    db.save()
  else
    L3_163 = "ERROR"
    printCLIError(statusMessage)
  end
  return L3_163, statusMessage
end
function openvpnCLICertificatesDownload(A0_167, A1_168, A2_169)
  local L3_170, L4_171, L5_172
  L3_170 = "/tmp/openVpnCerts.tar"
  L4_171 = "/pfrm2.0/var/www/openvpnCertsDownload.sh"
  L5_172 = {}
  if _UPVALUE0_.is_fqdn_address(A2_169) == false and _UPVALUE0_.is_ipv4_address(A2_169) == false then
    print(" Please enter a valid IP/Domain Address ")
    return false
  end
  if string.find(A1_168, ";") or string.find(A1_168, "|") or string.find(A1_168, "`") then
    print(" Please enter a valid filename ")
    return false
  end
  L5_172 = db.getRow("OpenVpnEasyrsaCert", "_ROWID_", A0_167)
  if L5_172 == nil then
    errorFlag = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return errorFlag, statusMessage
  else
    curCookie = A0_167
    os.execute("/bin/sh " .. L4_171 .. " " .. curCookie)
    if os.execute("tftp -p -l " .. L3_170 .. " -r " .. A1_168 .. " " .. A2_169) == 256 then
      printCLIError("TFTP failed ")
    end
    os.execute("/bin/rm -rf " .. "/tmp/openVpnCerts/" .. "*")
    os.execute("/bin/rm -rf " .. "/tmp/openVpnCerts.tar")
  end
end
function openvpnCLICertificatesDefaultServer(A0_173)
  local L1_174, L2_175, L3_176, L4_177
  L1_174 = "/pfrm2.0/var/www/openvpnCertsServerDefault.sh"
  L2_175 = ""
  L3_176 = {}
  L4_177 = nil
  L3_176 = db.getRow("OpenVpnEasyrsaCert", "_ROWID_", A0_173)
  if L3_176 == nil then
    L2_175 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L2_175, statusMessage
  else
    L3_176["openvpnCertificates.cookie"] = L3_176["OpenVpnEasyrsaCert._ROWID_"]
    L2_175, L4_177 = _UPVALUE0_.easyrsaCertsServerDefault(L3_176)
    statusMessage = _UPVALUE1_.errorStringGet(L2_175)
  end
  if L2_175 == 0 then
    L2_175 = "OK"
    db.save()
  else
    L2_175 = "ERROR"
    printCLIError(statusMessage)
  end
  return L2_175, statusMessage
end
function openvpnCLICertificatesDefaultClient(A0_178)
  local L1_179, L2_180, L3_181, L4_182
  L1_179 = "/pfrm2.0/var/www/openvpnCertsClientDefault.sh"
  L2_180 = ""
  L3_181 = {}
  L4_182 = nil
  L3_181 = db.getRow("OpenVpnEasyrsaCert", "_ROWID_", A0_178)
  if L3_181 == nil then
    L2_180 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L2_180, statusMessage
  else
    L3_181["openvpnCertificates.cookie"] = L3_181["OpenVpnEasyrsaCert._ROWID_"]
    L2_180, L4_182 = _UPVALUE0_.easyrsaCertsClientDefault(L3_181)
    statusMessage = _UPVALUE1_.errorStringGet(L2_180)
  end
  if L2_180 == 0 then
    L2_180 = "OK"
    db.save()
  else
    L2_180 = "ERROR"
    printCLIError(statusMessage)
  end
  return L2_180, statusMessage
end
function openvpnCertificatesShow(A0_183)
  local L1_184, L2_185
  L1_184 = db
  L1_184 = L1_184.getTable
  L2_185 = "OpenVpnEasyrsaCert"
  L1_184 = L1_184(L2_185)
  L2_185 = {}
  for _FORV_7_, _FORV_8_ in pairs(L1_184) do
    resTab.insertField(L2_185, "Row Id", _FORV_8_["OpenVpnEasyrsaCert._ROWID_"])
    resTab.insertField(L2_185, "Subject Name", _FORV_8_["OpenVpnEasyrsaCert.SubjectName"] or "")
    resTab.insertField(L2_185, "Server Name", _FORV_8_["OpenVpnEasyrsaCert.ServerName"] or "")
    resTab.insertField(L2_185, "Client Name", _FORV_8_["OpenVpnEasyrsaCert.ClientName"] or "")
  end
  printLabel("OpenVPN Certificates List")
  resTab.print(L2_185, 0)
end
function openvpncaUploadOnly(A0_186)
  local L1_187, L2_188, L3_189, L4_190, L5_191
  L1_187 = {}
  L2_188 = ""
  L3_189 = ""
  L4_190 = {}
  L5_191 = ""
  L4_190["openVpnAuthentication.UploadCaOnly"] = A0_186
  L3_189 = _UPVALUE0_.openvpnAuthConfigSet(L4_190)
  statusMessage = _UPVALUE1_.errorStringGet(L3_189)
  if L3_189 == 0 then
    L3_189 = "OK"
    db.save()
  else
    L3_189 = "ERROR"
  end
  return L3_189, statusMessage
end
function certificatesListGet()
  local L0_192, L1_193, L2_194, L3_195
  L0_192 = 0
  L1_193 = {}
  L2_194 = nil
  L3_195 = db
  L3_195 = L3_195.getTable
  L3_195 = L3_195("OpenvpnAuthCertificates")
  print("display available certificates list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_195) do
    L0_192 = L0_192 + 1
    if L0_192 ~= nil then
      resTab.insertField(L1_193, "ROW ID", L3_195[L0_192]["OpenvpnAuthCertificates._ROWID_"] or "")
      resTab.insertField(L1_193, "Name", L3_195[L0_192]["OpenvpnAuthCertificates.name"] or "")
      resTab.insertField(L1_193, "CA Subject Name", L3_195[L0_192]["OpenvpnAuthCertificates.caSubjectName"] or "")
      resTab.insertField(L1_193, "Server / Client Cert Subject Name", L3_195[L0_192]["OpenvpnAuthCertificates.crtSubjectName"] or "")
      resTab.insertField(L1_193, "Server / Client Key Uploaded", L3_195[L0_192]["OpenvpnAuthCertificates.keyExist"] or "")
      resTab.insertField(L1_193, "Dh Key Uploaded", L3_195[L0_192]["OpenvpnAuthCertificates.dhExist"] or "")
    end
  end
  resTab.print(L1_193, 0)
end
function tlscertificatesListGet()
  local L0_196, L1_197, L2_198, L3_199
  L0_196 = 0
  L1_197 = {}
  L2_198 = nil
  L3_199 = db
  L3_199 = L3_199.getTable
  L3_199 = L3_199("OpenvpnTlsCertificates")
  print("display available tls certificates list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_199) do
    L0_196 = L0_196 + 1
    if L0_196 ~= nil then
      resTab.insertField(L1_197, "ROW ID", L3_199[L0_196]["OpenvpnTlsCertificates._ROWID_"] or "")
      resTab.insertField(L1_197, "Name", L3_199[L0_196]["OpenvpnTlsCertificates.name"] or "")
      resTab.insertField(L1_197, "TLS Uploaded", L3_199[L0_196]["OpenvpnTlsCertificates.tlsExist"] or "")
    end
  end
  resTab.print(L1_197, 0)
end
function crlCerticatesListGet()
  local L0_200, L1_201, L2_202, L3_203
  L0_200 = 0
  L1_201 = {}
  L2_202 = nil
  L3_203 = db
  L3_203 = L3_203.getTable
  L3_203 = L3_203("OpenvpnCrlCertificates")
  print("display available crl certificates list\n")
  for _FORV_7_, _FORV_8_ in pairs(L3_203) do
    L0_200 = L0_200 + 1
    if L0_200 ~= nil then
      resTab.insertField(L1_201, "ROW ID", L3_203[L0_200]["OpenvpnCrlCertificates._ROWID_"] or "")
      resTab.insertField(L1_201, "Name", L3_203[L0_200]["OpenvpnCrlCertificates.name"] or "")
      resTab.insertField(L1_201, "CRL Uploaded", L3_203[L0_200]["OpenvpnCrlCertificates.crlExist"] or "")
    end
  end
  resTab.print(L1_201, 0)
end
function OpenvpnAuthCertificatesConfigCfgInit(A0_204)
  if A0_204[1] == nil then
    configRow = {}
    configRow["OpenvpnAuthCertificates._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenvpnAuthCertificates", "_ROWID_", A0_204[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenvpnAuthCertificates._ROWID_"], configRow
end
function OpenvpnAuthCertificatesConfigCfgSave(A0_205)
  local L1_206, L2_207, L3_208, L4_209
  L1_206 = ""
  L2_207 = ""
  L3_208 = ""
  L4_209 = nil
  if db.getTable("OpenvpnAuthCertificates") ~= nil and #db.getTable("OpenvpnAuthCertificates") >= _UPVALUE0_ then
    statusMessage = "Maximum limit for OpenVPN server/client certificates is reached."
    return "ERROR", statusMessage
  end
  if A0_205["OpenvpnAuthCertificates.ca_fileName"] ~= nil then
    L1_206, statusMessage = openvpnCertsUploadSet(A0_205["OpenvpnAuthCertificates.ca_fileName"], A0_205["OpenvpnAuthCertificates.ca_ipAddr"])
    if L1_206 ~= "OK" then
      return L1_206, statusMessage
    end
  end
  if A0_205["OpenvpnAuthCertificates.crt_fileName"] ~= nil then
    L1_206, statusMessage = openvpnSerCliCertsUploadSet(A0_205["OpenvpnAuthCertificates.crt_fileName"], A0_205["OpenvpnAuthCertificates.crt_ipAddr"])
    if L1_206 ~= "OK" then
      return L1_206, statusMessage
    end
  end
  if A0_205["OpenvpnAuthCertificates.key_fileName"] ~= nil then
    L1_206, statusMessage = openvpnSerCliKeyUploadSet(A0_205["OpenvpnAuthCertificates.key_fileName"], A0_205["OpenvpnAuthCertificates.key_ipAddr"])
    if L1_206 ~= "OK" then
      return L1_206, statusMessage
    end
  end
  if A0_205["OpenvpnAuthCertificates.dh_fileName"] ~= nil then
    L1_206, statusMessage = openvpnDHkeyUploadSet(A0_205["OpenvpnAuthCertificates.dh_fileName"], A0_205["OpenvpnAuthCertificates.dh_ipAddr"])
    if L1_206 ~= "OK" then
      return L1_206, statusMessage
    end
  end
  if L1_206 == "OK" then
    L1_206 = _UPVALUE1_.openvpnAuthConfigCreate(A0_205)
    statusMessage = _UPVALUE2_.errorStringGet(L1_206)
    if L1_206 == 0 then
      L1_206 = "OK"
      db.save()
    else
      os.execute("rm" .. " /var/certs/ca.crt")
      os.execute("rm" .. " /var/certs/server.crt")
      os.execute("rm" .. " /var/certs/server.key")
      os.execute("rm" .. " /var/certs/dh.pem")
      L1_206 = "ERROR"
    end
  end
  return L1_206, statusMessage
end
function OpenvpnAuthCertificatesConfigCfgInputVal(A0_210)
  local L1_211, L2_212
  L1_211 = A0_210["serverClientCertificate.certificateName"]
  if L1_211 == nil then
    L1_211 = printCLIError
    L2_212 = "Please enter valid name"
    L1_211(L2_212)
    L1_211 = false
    return L1_211
  end
  L1_211 = A0_210["OpenvpnAuthCertificates.ca_fileName"]
  if L1_211 == nil then
    L1_211 = printCLIError
    L2_212 = "Please enter valid ca certifcicate(CA cert)"
    L1_211(L2_212)
    L1_211 = false
    return L1_211
  end
  L1_211 = A0_210["OpenvpnAuthCertificates.ca_ipAddr"]
  if L1_211 == nil then
    L1_211 = printCLIError
    L2_212 = "Please enter valid Ip Address corresponding ca certificate(CA Cert)"
    L1_211(L2_212)
    L1_211 = false
    return L1_211
  end
  L1_211 = A0_210["OpenvpnAuthCertificates.crt_fileName"]
  if L1_211 ~= nil then
    L1_211 = A0_210["OpenvpnAuthCertificates.key_fileName"]
    if L1_211 == nil then
      L1_211 = printCLIError
      L2_212 = "Please upload server.key file corresponding server.crt certificate"
      L1_211(L2_212)
      L1_211 = false
      return L1_211
    end
  end
  L1_211 = A0_210["OpenvpnAuthCertificates.crt_fileName"]
  if L1_211 == nil then
    L1_211 = A0_210["OpenvpnAuthCertificates.key_fileName"]
    if L1_211 ~= nil then
      L1_211 = printCLIError
      L2_212 = "Please upload server.crt file corresponding server.key"
      L1_211(L2_212)
      L1_211 = false
      return L1_211
    end
  end
  L1_211 = A0_210["serverClientCertificate.certificateName"]
  L2_212 = db
  L2_212 = L2_212.getTable
  L2_212 = L2_212("openvpnAuthCertificates", false)
  for _FORV_6_, _FORV_7_ in ipairs(L2_212) do
    if L2_212[_FORV_6_].name == L1_211 then
      util.appendDebugOut("Already name configuration exists")
      printCLIError("Certificate name already exists")
      return false
    end
  end
end
function OpenvpnAuthCertificatesConfigCfgDel(A0_213)
  local L1_214, L2_215, L3_216, L4_217, L5_218, L6_219
  L1_214 = {}
  L2_215 = ""
  L3_216 = ""
  L4_217 = {}
  L5_218 = ""
  L6_219 = nil
  L4_217 = db.getRow("openvpnAuthCertificates", "_ROWID_", A0_213[1])
  if L4_217 == nil then
    L3_216 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L3_216, statusMessage
  else
    L4_217["serverClientCertificate.cookie"] = L4_217["openvpnAuthCertificates._ROWID_"]
    L3_216, L6_219 = _UPVALUE0_.OpenvpnCertsDelete(L4_217)
    statusMessage = _UPVALUE1_.errorStringGet(L3_216)
  end
  if L3_216 == 0 then
    L3_216 = "OK"
    db.save()
  else
    L3_216 = "ERROR"
    printCLIError(statusMessage)
  end
  return L3_216, statusMessage
end
function OpenvpnTlsCertificatesCfgInit(A0_220)
  if A0_220[1] == nil then
    configRow = {}
    configRow["OpenvpnTlsCertificates._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenvpnTlsCertificates", "_ROWID_", A0_220[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenvpnTlsCertificates._ROWID_"], configRow
end
function OpenvpnTlsCertificatesCfgSave(A0_221)
  local L1_222, L2_223, L3_224, L4_225, L5_226
  L1_222 = ""
  L2_223 = ""
  L3_224 = ""
  L4_225 = nil
  L5_226 = ""
  if db.getTable("OpenvpnTlsCertificates") ~= nil and #db.getTable("OpenvpnTlsCertificates") >= _UPVALUE0_ then
    statusMessage = "Maximum limit for OpenVPN tls certificates is reached."
    return "ERROR", statusMessage
  end
  L1_222, L2_223, L5_226 = openvpnTlskeyUploadSet(A0_221["OpenvpnTlsCertificates.fileName"], A0_221["OpenvpnTlsCertificates.ipAddr"])
  if L1_222 == "OK" then
    L1_222, L3_224 = openvpn.openvpnTlsConfigCreate(A0_221, L5_226)
    if L1_222 == "OK" then
      db.save()
    end
    L2_223 = db.getAttribute("stringsMap", "stringId", L3_224, LANGUAGE) or L3_224
  end
  return L1_222, L2_223
end
function OpenvpnTlsCertificatesCfgInputVal(A0_227)
  local L1_228, L2_229
  L1_228 = A0_227["OpenvpnTlsCertificates.name"]
  if L1_228 == nil then
    L1_228 = printCLIError
    L2_229 = "Please enter valid name"
    L1_228(L2_229)
    L1_228 = false
    return L1_228
  end
  L1_228 = A0_227["OpenvpnTlsCertificates.fileName"]
  if L1_228 == nil then
    L1_228 = printCLIError
    L2_229 = "Please enter valid tls key(ta.key)"
    L1_228(L2_229)
    L1_228 = false
    return L1_228
  end
  L1_228 = A0_227["OpenvpnTlsCertificates.ipAddr"]
  if L1_228 == nil then
    L1_228 = printCLIError
    L2_229 = "Please enter valid Ip Address corresponding ta key"
    L1_228(L2_229)
    L1_228 = false
    return L1_228
  end
  L1_228 = A0_227["OpenvpnTlsCertificates.name"]
  L2_229 = db
  L2_229 = L2_229.getTable
  L2_229 = L2_229("OpenvpnTlsCertificates", false)
  for _FORV_6_, _FORV_7_ in ipairs(L2_229) do
    if L2_229[_FORV_6_].name == L1_228 then
      util.appendDebugOut("Already name configuration exists")
      printCLIError("tls key name already exists")
      return false
    end
  end
end
function OpenvpnTlsCertificatesCfgDel(A0_230)
  local L1_231, L2_232, L3_233, L4_234, L5_235, L6_236
  L1_231 = {}
  L2_232 = ""
  L3_233 = ""
  L4_234 = {}
  L5_235 = ""
  L6_236 = nil
  L4_234 = db.getRow("OpenvpnTlsCertificates", "_ROWID_", A0_230[1])
  if L4_234 == nil then
    L3_233 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L3_233, statusMessage
  else
    L4_234["tlsCertificates.cookie"] = L4_234["OpenvpnTlsCertificates._ROWID_"]
    L3_233, L6_236 = _UPVALUE0_.tlsCertsDelete(L4_234)
    statusMessage = _UPVALUE1_.errorStringGet(L3_233)
  end
  if L3_233 == 0 then
    L3_233 = "OK"
    db.save()
  else
    L3_233 = "ERROR"
    printCLIError(statusMessage)
  end
  return L3_233, statusMessage
end
function OpenvpnCrlCertificatesConfigCfgInit(A0_237)
  if A0_237[1] == nil then
    configRow = {}
    configRow["OpenvpnCrlCertificates._ROWID_"] = "-1"
  else
    configRow = db.getRow("OpenvpnCrlCertificates", "_ROWID_", A0_237[1])
  end
  if configRow == nil then
    print("Entered rowid does not exist\n")
    return -1, {}
  end
  return configRow["OpenvpnCrlCertificates._ROWID_"], configRow
end
function OpenvpnCrlCertificatesConfigCfgSave(A0_238)
  local L1_239, L2_240, L3_241, L4_242, L5_243
  L1_239 = ""
  L2_240 = ""
  L3_241 = ""
  L4_242 = nil
  L5_243 = ""
  if db.getTable("OpenvpnCrlCertificates") ~= nil and #db.getTable("OpenvpnCrlCertificates") >= _UPVALUE0_ then
    statusMessage = "Maximum limit for OpenVPN crl certificates is reached."
    return "ERROR", statusMessage
  end
  L1_239, statusMessage, L5_243 = openvpnCrlCertUploadSet(A0_238["OpenvpnCrlCertificates.fileName"], A0_238["OpenvpnCrlCertificates.ipAddr"])
  if L1_239 == "OK" then
    L1_239, L3_241 = openvpn.openvpnCrlConfigCreate(A0_238, L5_243)
    if L1_239 == "OK" then
      db.save()
    end
    L2_240 = db.getAttribute("stringsMap", "stringId", L3_241, LANGUAGE) or L3_241
  end
  return L1_239, statusMessage
end
function OpenvpnCrlCertificatesConfigCfgInputVal(A0_244)
  local L1_245, L2_246
  L1_245 = A0_244["OpenvpnCrlCertificates.name"]
  if L1_245 == nil then
    L1_245 = printCLIError
    L2_246 = "Please enter valid name"
    L1_245(L2_246)
    L1_245 = false
    return L1_245
  end
  L1_245 = A0_244["OpenvpnCrlCertificates.fileName"]
  if L1_245 == nil then
    L1_245 = printCLIError
    L2_246 = "Please enter valid crl cert"
    L1_245(L2_246)
    L1_245 = false
    return L1_245
  end
  L1_245 = A0_244["OpenvpnCrlCertificates.ipAddr"]
  if L1_245 == nil then
    L1_245 = printCLIError
    L2_246 = "Please enter valid Ip Address corresponding crl cert"
    L1_245(L2_246)
    L1_245 = false
    return L1_245
  end
  L1_245 = A0_244["OpenvpnCrlCertificates.name"]
  L2_246 = db
  L2_246 = L2_246.getTable
  L2_246 = L2_246("OpenvpnCrlCertificates", false)
  for _FORV_6_, _FORV_7_ in ipairs(L2_246) do
    if L2_246[_FORV_6_].name == L1_245 then
      util.appendDebugOut("Already name configuration exists")
      printCLIError("crl name already exists")
      return false
    end
  end
end
function OpenvpnCrlCertificatesConfigCfgDel(A0_247)
  local L1_248, L2_249, L3_250, L4_251, L5_252, L6_253
  L1_248 = {}
  L2_249 = ""
  L3_250 = ""
  L4_251 = {}
  L5_252 = ""
  L6_253 = nil
  L4_251 = db.getRow("OpenvpnCrlCertificates", "_ROWID_", A0_247[1])
  if L4_251 == nil then
    L3_250 = "ERROR"
    statusMessage = "Row doesnt exist"
    printCLIError("Row doesnt exist")
    return L3_250, statusMessage
  else
    L4_251["OpenvpnCrlCertificates.cookie"] = L4_251["OpenvpnCrlCertificates._ROWID_"]
    L3_250, L6_253 = _UPVALUE0_.crlCertsDelete(L4_251)
    statusMessage = _UPVALUE1_.errorStringGet(L3_250)
  end
  if L3_250 == 0 then
    L3_250 = "OK"
    db.save()
  else
    L3_250 = "ERROR"
    printCLIError(statusMessage)
  end
  return L3_250, statusMessage
end
