local L0_0
L0_0 = module
L0_0("com.teamf1.bl.certificates.trustedcertificates", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/certificates_trustedCertificates")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function trustedCertificatesSectionGet()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1, L9_10, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9 = _UPVALUE0_.trustedCertificateGet()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return L0_1, L9_10, L1_2, L3_4, L4_5
end
function trustedCertificatesSectionGetNext(A0_11)
  local L1_12, L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L1_12 = A0_11["trustedCertificates.cookie"]
  L2_13 = _UPVALUE0_
  L2_13 = L2_13.NIL
  if L1_12 == L2_13 then
    L2_13 = util
    L2_13 = L2_13.appendDebugOut
    L3_14 = "GetNext : Invalid Cookie"
    L2_13(L3_14)
    L2_13 = _UPVALUE0_
    L2_13 = L2_13.BAD_PARAMETER
    return L2_13
  end
  L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22 = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  L2_13, L11_22, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19, L9_20, L10_21 = _UPVALUE1_.trustedCertificateGetNext(L1_12)
  if L2_13 ~= _UPVALUE0_.SUCCESS then
    return L2_13
  end
  return L2_13, L11_22, L3_14, L5_16, L6_17
end
function trustedCertificatesSectionGetAll()
  local L0_23, L1_24
  L1_24 = {}
  L0_23, L1_24 = _UPVALUE0_.trustedCertificateGetAll()
  if L0_23 ~= _UPVALUE1_.SUCCESS then
    return L0_23
  end
  return L0_23, L1_24
end
function trustedCertificatesSectionDelete(A0_25)
  local L1_26, L2_27
  L1_26 = ACCESS_LEVEL
  if L1_26 ~= 0 then
    L1_26 = util
    L1_26 = L1_26.appendDebugOut
    L2_27 = "Detected Unauthorized access for page trustedCertificates PAGE"
    L1_26(L2_27)
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.UNAUTHORIZED
    return L1_26
  end
  L1_26 = A0_25["trustedCertificates.cookie"]
  if L1_26 == nil then
    L2_27 = util
    L2_27 = L2_27.appendDebugOut
    L2_27("Delete : Invalid Cookie")
    L2_27 = _UPVALUE0_
    L2_27 = L2_27.BAD_PARAMETER
    return L2_27
  end
  L2_27 = nil
  _UPVALUE1_.start()
  L2_27, cookie = _UPVALUE2_.trustedCertificateDelete(L1_26)
  if L2_27 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in approvedMailIds PAGE" .. L2_27)
    _UPVALUE1_.abort()
    return L2_27, L1_26
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, cookie
end
function trustedCertificatesSectionDeleteAll()
  local L0_28
  L0_28 = ACCESS_LEVEL
  if L0_28 ~= 0 then
    L0_28 = util
    L0_28 = L0_28.appendDebugOut
    L0_28("Detected Unauthorized access for page trustedCertificates PAGE")
    L0_28 = _UPVALUE0_
    L0_28 = L0_28.UNAUTHORIZED
    return L0_28
  end
  L0_28 = nil
  _UPVALUE1_.start()
  L0_28 = _UPVALUE2_.trustedCertificateDeleteAll()
  if L0_28 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in Delete Operaion in approvedMailIds PAGE" .. L0_28)
    _UPVALUE1_.abort()
    return L0_28
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function uploadTrustedCACert(A0_29)
  local L1_30
  L1_30 = ACCESS_LEVEL
  if L1_30 ~= 0 then
    L1_30 = util
    L1_30 = L1_30.appendDebugOut
    L1_30("Detected Unauthorized access for page trustedCertificates PAGE")
    L1_30 = _UPVALUE0_
    L1_30 = L1_30.UNAUTHORIZED
    return L1_30
  end
  L1_30 = _UPVALUE1_
  L1_30 = L1_30.start
  L1_30()
  L1_30 = _UPVALUE2_
  L1_30 = L1_30.uploadTrustedCert
  L1_30 = L1_30(A0_29)
  if L1_30 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in upload Operaion in trustedCertificates PAGE" .. L1_30)
    _UPVALUE1_.abort()
    return L1_30
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
