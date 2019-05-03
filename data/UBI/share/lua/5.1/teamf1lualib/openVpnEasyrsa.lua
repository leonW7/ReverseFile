local L0_0
L0_0 = module
L0_0("com.teamf1.core.vpn.openVpnEasyrsa", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/openvpn_returnCodes")
L0_0 = require
L0_0("openvpnLuaLib")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
;({}).subjectName = "SubjectName"
;({}).serverName = "ServerName"
;({}).clientName = "ClientName"
function easyrsaConfigGetAll()
  local L0_1, L1_2
  L0_1 = "SELECT * FROM OpenVpnEasyrsaCert"
  L1_2 = db
  L1_2 = L1_2.getTable
  L1_2 = L1_2(_UPVALUE0_, false)
  if L1_2 == _UPVALUE1_.NIL then
    return _UPVALUE1_.FAILURE
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function easyrsaConfigDelete(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8
  if A0_3 == _UPVALUE0_.NIL or tonumber(A0_3) == _UPVALUE0_.NIL then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  if tonumber(A0_3) == 1 then
    return _UPVALUE1_.DEFAULT_ROW
  end
  easyrsaCertConfig = db.getRow(_UPVALUE2_, _UPVALUE3_, A0_3)
  if easyrsaCertConfig == nil then
    return _UPVALUE0_.INVALID_ARGUMENT
  end
  L3_6 = easyrsaCertConfig["OpenVpnEasyrsaCert.ServerName"]
  L4_7 = easyrsaCertConfig["OpenVpnEasyrsaCert.ClientName"]
  L5_8 = easyrsaCertConfig["OpenVpnEasyrsaCert.SubjectName"]
  L1_4 = db.deleteRow(_UPVALUE2_, _UPVALUE3_, A0_3)
  if L1_4 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS
end
function findDuplicateCN(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18, L10_19, L11_20, L12_21, L13_22, L14_23, L15_24, L16_25, L17_26, L18_27, L19_28
  L1_10 = _UPVALUE0_
  L1_10 = L1_10.SUCCESS
  L2_11, L3_12, L4_13, L5_14 = nil, nil, nil, nil
  L2_11 = L6_15
  if L2_11 ~= L6_15 then
    for L9_18, L10_19 in L6_15(L7_16) do
      for L14_23, L15_24 in L11_20(L12_21) do
        if L14_23 == L16_25 then
          for L19_28 in L16_25(L17_26, L18_27) do
            if string.find(L19_28, "CN=") then
              L5_14 = string.gsub(L19_28, "CN=", "")
              if L5_14 == A0_9 then
                L1_10 = _UPVALUE0_.FAILURE
              end
            end
          end
        end
      end
    end
  end
  return L1_10
end
function uploadCertsCreate(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39, L11_40, L12_41, L13_42, L14_43, L15_44, L16_45, L17_46, L18_47, L19_48
  L3_32 = {}
  L4_33, L5_34, L6_35, L7_36, L8_37, L9_38 = nil, nil, nil, nil, nil, nil
  L10_39 = util
  L10_39 = L10_39.fileExists
  L11_40 = "/var/certs/ca.crt"
  L10_39 = L10_39(L11_40)
  L11_40 = util
  L11_40 = L11_40.fileExists
  L12_41 = "/var/certs/server.crt"
  L11_40 = L11_40(L12_41)
  L12_41 = util
  L12_41 = L12_41.fileExists
  L13_42 = "/var/certs/server.key"
  L12_41 = L12_41(L13_42)
  L13_42 = util
  L13_42 = L13_42.fileExists
  L14_43 = "/var/certs/dh.pem"
  L13_42 = L13_42(L14_43)
  if L10_39 then
    L14_43 = util
    L14_43 = L14_43.fileToString
    L15_44 = "/var/certs/ca.crt"
    L14_43 = L14_43(L15_44)
    L4_33 = L14_43
    L14_43, L15_44, L16_45, L17_46, L18_47, L19_48 = nil, nil, nil, nil, nil, nil
    L14_43, L15_44, L5_34, L16_45, L17_46, L18_47, L19_48 = x509Lib.certLoad(L4_33, "ca")
    if L14_43 == -1 then
      return false
    end
    os.execute("rm" .. " /var/certs/ca.crt")
  else
    L14_43 = _UPVALUE0_
    L14_43 = L14_43.CA_UPLOAD_BUTTON
    return L14_43
  end
  if L11_40 ~= true or L12_41 == true then
  else
    L14_43 = _UPVALUE0_
    L14_43 = L14_43.SERVER_CERT_KEY_UPLOAD_BUTTON
    return L14_43
  end
  if L11_40 then
    L14_43 = util
    L14_43 = L14_43.fileToString
    L15_44 = "/var/certs/server.crt"
    L14_43 = L14_43(L15_44)
    L7_36 = L14_43
    L14_43, L15_44, L16_45, L17_46, L18_47, L19_48 = nil, nil, nil, nil, nil, nil
    L14_43, L15_44, L6_35, L16_45, L17_46, L18_47, L19_48 = x509Lib.certLoad(L7_36, "crt")
    if L14_43 == -1 then
      return false
    end
    os.execute("rm" .. " /var/certs/server.crt")
  end
  if L12_41 then
    L14_43 = util
    L14_43 = L14_43.fileToString
    L15_44 = "/var/certs/server.key"
    L14_43 = L14_43(L15_44)
    L8_37 = L14_43
    L14_43 = os
    L14_43 = L14_43.execute
    L15_44 = "rm"
    L16_45 = " /var/certs/server.key"
    L15_44 = L15_44 .. L16_45
    L14_43(L15_44)
  end
  if L13_42 then
    L14_43 = util
    L14_43 = L14_43.fileToString
    L15_44 = "/var/certs/dh.pem"
    L14_43 = L14_43(L15_44)
    L9_38 = L14_43
    L14_43 = os
    L14_43 = L14_43.execute
    L15_44 = "rm"
    L16_45 = " /var/certs/dh.pem"
    L15_44 = L15_44 .. L16_45
    L14_43(L15_44)
  end
  L3_32["OpenvpnAuthCertificates.name"] = A0_29
  L3_32["OpenvpnAuthCertificates.caSubjectName"] = L5_34
  L3_32["OpenvpnAuthCertificates.crtSubjectName"] = L6_35
  L3_32["OpenvpnAuthCertificates.caCertData"] = L4_33
  L3_32["OpenvpnAuthCertificates.crtCertData"] = L7_36
  L3_32["OpenvpnAuthCertificates.keyCertData"] = L8_37
  L3_32["OpenvpnAuthCertificates.dhCertData"] = L9_38
  if L8_37 then
    L3_32["OpenvpnAuthCertificates.keyExist"] = "yes"
  else
    L3_32["OpenvpnAuthCertificates.keyExist"] = "no"
  end
  if L9_38 then
    L3_32["OpenvpnAuthCertificates.dhExist"] = "yes"
  else
    L3_32["OpenvpnAuthCertificates.dhExist"] = "no"
  end
  L14_43 = db
  L14_43 = L14_43.getRowWhere
  L15_44 = "OpenvpnAuthCertificates"
  L16_45 = "name = 'autoupload'"
  L14_43 = L14_43(L15_44, L16_45)
  if L14_43 ~= nil then
    L15_44 = db
    L15_44 = L15_44.update
    L16_45 = "OpenvpnAuthCertificates"
    L17_46 = L3_32
    L18_47 = L14_43["OpenvpnAuthCertificates._ROWID_"]
    L15_44 = L15_44(L16_45, L17_46, L18_47)
    L1_30 = L15_44
  else
    L15_44 = db
    L15_44 = L15_44.insert
    L16_45 = "OpenvpnAuthCertificates"
    L17_46 = L3_32
    L15_44 = L15_44(L16_45, L17_46)
    L1_30 = L15_44
  end
  if L1_30 then
  else
    L15_44 = _UPVALUE0_
    L15_44 = L15_44.CERTS_NOT_FOUND
    return L15_44
  end
  L15_44 = _UPVALUE1_
  L15_44 = L15_44.SUCCESS
  return L15_44
end
