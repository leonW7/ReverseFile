local L0_0
L0_0 = module
L0_0("com.teamf1.bl.certificates.activeSelfCertificates", package.seeall)
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
L0_0("teamf1lualib/certificates_selfCertificates")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function selfCertificatesSectionGetAll()
  local L0_1, L1_2
  L1_2 = {}
  L0_1, L1_2 = _UPVALUE0_.selfCertificateGetAll()
  if L0_1 ~= _UPVALUE1_.SUCCESS then
    return L0_1
  end
  return _UPVALUE1_.SUCCESS, L1_2
end
function uploadSelfCACert(A0_3, A1_4)
  local L2_5
  L2_5 = ACCESS_LEVEL
  if L2_5 ~= 0 then
    L2_5 = util
    L2_5 = L2_5.appendDebugOut
    L2_5("Detected Unauthorized access for activeSelfCertificates PAGE")
    L2_5 = _UPVALUE0_
    L2_5 = L2_5.UNAUTHORIZED
    return L2_5
  end
  L2_5 = _UPVALUE1_
  L2_5 = L2_5.start
  L2_5()
  L2_5 = _UPVALUE2_
  L2_5 = L2_5.uploadSelfCert
  L2_5 = L2_5(A0_3, A1_4)
  if L2_5 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in upload Operaion in activeSelfCertificates PAGE" .. L2_5)
    _UPVALUE1_.abort()
    return L2_5
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function activeSelfCertificatesSectionDelete(A0_6)
  local L1_7, L2_8
  L1_7 = ACCESS_LEVEL
  if L1_7 ~= 0 then
    L1_7 = util
    L1_7 = L1_7.appendDebugOut
    L2_8 = "Detected Unauthorized access for activeSelfCertificates PAGE"
    L1_7(L2_8)
    L1_7 = _UPVALUE0_
    L1_7 = L1_7.UNAUTHORIZED
    return L1_7
  end
  L1_7 = _UPVALUE1_
  L1_7 = L1_7.start
  L1_7()
  L1_7 = _UPVALUE2_
  L1_7 = L1_7.activeSelfCertDelete
  L2_8 = A0_6
  L2_8 = L1_7(L2_8)
  if L1_7 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in delete Operaion in activeSelfCertificates PAGE" .. L1_7)
    _UPVALUE1_.abort()
    return L1_7
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_8
end
function activeSelfCertificatesSectionDeleteAll(A0_9)
  local L1_10
  L1_10 = ACCESS_LEVEL
  if L1_10 ~= 0 then
    L1_10 = util
    L1_10 = L1_10.appendDebugOut
    L1_10("Detected Unauthorized access for activeSelfCertificates PAGE")
    L1_10 = _UPVALUE0_
    L1_10 = L1_10.UNAUTHORIZED
    return L1_10
  end
  L1_10 = _UPVALUE1_
  L1_10 = L1_10.start
  L1_10()
  L1_10 = _UPVALUE2_
  L1_10 = L1_10.activeSelfCertDeleteAll
  L1_10 = L1_10()
  if L1_10 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in delete Operaion in activeSelfCertificates PAGE" .. L1_10)
    _UPVALUE1_.abort()
    return L1_10
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS
end
function activeSelfCertificatesSectionDefault(A0_11)
  local L1_12, L2_13
  L1_12 = ACCESS_LEVEL
  if L1_12 ~= 0 then
    L1_12 = util
    L1_12 = L1_12.appendDebugOut
    L2_13 = "Detected Unauthorized access for activeSelfCertificates PAGE"
    L1_12(L2_13)
    L1_12 = _UPVALUE0_
    L1_12 = L1_12.UNAUTHORIZED
    return L1_12
  end
  L1_12 = _UPVALUE1_
  L1_12 = L1_12.start
  L1_12()
  L1_12 = _UPVALUE2_
  L1_12 = L1_12.activeSelfCertDefault
  L2_13 = A0_11
  L2_13 = L1_12(L2_13)
  if L1_12 ~= _UPVALUE0_.SUCCESS then
    util.appendDebugOut("Error in default Operaion in activeSelfCertificates PAGE" .. L1_12)
    _UPVALUE1_.abort()
    return L1_12
  end
  _UPVALUE1_.complete()
  _UPVALUE1_.save()
  return _UPVALUE0_.SUCCESS, L2_13
end
