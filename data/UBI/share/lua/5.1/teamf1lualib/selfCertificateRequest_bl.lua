local L0_0
L0_0 = module
L0_0("com.teamf1.bl.certificates.selfCertRequest", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/certificates_selfCertificates")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function selfCertReqGetAll()
  local L0_1, L1_2
  L0_1, L1_2 = _UPVALUE0_.selfCertificateGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function selfCertReqCreate(A0_3)
  local L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16
  L1_4 = ACCESS_LEVEL
  if L1_4 ~= 0 then
    L1_4 = util
    L1_4 = L1_4.appendDebugOut
    L2_5 = "Detected Unauthorized access for page selfCertificateRequest"
    L1_4(L2_5)
    L1_4 = _UPVALUE0_
    L1_4 = L1_4.UNAUTHORIZED
    return L1_4
  end
  L1_4 = A0_3["selfCertificateRequest.name"]
  L2_5 = A0_3["selfCertificateRequest.subject"]
  L3_6 = A0_3["selfCertificateRequest.hashAlo"]
  L4_7 = "1"
  L5_8 = A0_3["selfCertificateRequest.signatureKeyLength"]
  L6_9 = A0_3["selfCertificateRequest.ipAddress"]
  L7_10 = A0_3["selfCertificateRequest.domainName"]
  L8_11 = A0_3["selfCertificateRequest.emailAddress"]
  L9_12 = A0_3["selfCertificateRequest.appType"]
  L10_13 = _UPVALUE1_
  L11_14 = tonumber
  L12_15 = L5_8
  L11_14 = L11_14(L12_15)
  L5_8 = L10_13[L11_14]
  L10_13 = A0_3["selfCertificateRequest.dbUpdateFlag"]
  L11_14 = A0_3["selfCertificateRequest.requestStatus"]
  L12_15 = _UPVALUE0_
  L12_15 = L12_15.NIL
  if L1_4 == L12_15 then
    L12_15 = util
    L12_15 = L12_15.appendDebugOut
    L13_16 = "Set : Invalid requestName"
    L12_15(L13_16)
    L12_15 = _UPVALUE0_
    L12_15 = L12_15.BAD_PARAMETER
    return L12_15
  end
  L12_15 = _UPVALUE0_
  L12_15 = L12_15.NIL
  if L2_5 == L12_15 then
    L12_15 = util
    L12_15 = L12_15.appendDebugOut
    L13_16 = "Set : Invalid subjectName"
    L12_15(L13_16)
    L12_15 = _UPVALUE0_
    L12_15 = L12_15.BAD_PARAMETER
    return L12_15
  end
  L12_15, L13_16 = nil, nil
  _UPVALUE2_.start()
  L12_15, L13_16 = _UPVALUE3_.selfCertificateCreate(L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14)
  if L12_15 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in configuring values in page selfCertificateRequest" .. L12_15)
    _UPVALUE2_.abort()
    return L12_15
  end
  _UPVALUE2_.complete()
  _UPVALUE2_.save()
  return _UPVALUE0_.SUCCESS, L13_16
end
function selfCertReqDelete(A0_17)
  local L1_18, L2_19
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for selfCertificateRequest PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  L1_18 = A0_17["selfCertificateRequest.cookie"]
  if L1_18 == _UPVALUE0_.NIL then
    util.appendDebugOut("Delete : Invalid Cookie")
    return _UPVALUE0_.BAD_PARAMETER
  end
  _UPVALUE1_.start()
  L2_19, cookie = _UPVALUE2_.selfCertificateDelete(L1_18)
  if L2_19 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in selfCertificateRequest page " .. L2_19)
    _UPVALUE1_.abort()
    return L2_19
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return L2_19, cookie
end
function selfCertReqDeleteAll()
  local L0_20
  if ACCESS_LEVEL ~= 0 then
    util.appendDebugOut("Detected Unauthorized access for selfCertificateRequest PAGE")
    return _UPVALUE0_.UNAUTHORIZED
  end
  _UPVALUE1_.start()
  L0_20 = _UPVALUE2_.selfCertificateDeleteAll()
  if L0_20 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Opetation in selfCertificateRequest page " .. L0_20)
    _UPVALUE1_.abort()
    return L0_20
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function certificateDetailsGet(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26, L6_27
  L1_22 = _UPVALUE0_
  L1_22 = L1_22.NIL
  if A0_21 == L1_22 then
    L1_22 = _UPVALUE0_
    L1_22 = L1_22.BAD_PARAMETER
    return L1_22
  end
  L1_22, L2_23, L3_24, L4_25, L5_26, L6_27 = nil, nil, nil, nil, nil, nil
  L1_22, A0_21, L2_23, L3_24, L4_25, L5_26, L6_27 = _UPVALUE1_.certDetailsGet(A0_21)
  if L3_24 == "2" then
    L3_24 = "SHA1"
  elseif L3_24 == "1" then
    L3_24 = "MD5"
  end
  L4_25 = "RSA"
  if L1_22 ~= _UPVALUE0_.SUCCESS then
    return L1_22
  end
  return _UPVALUE0_.SUCCESS, A0_21, L2_23, L3_24, L4_25, L5_26, L6_27
end
