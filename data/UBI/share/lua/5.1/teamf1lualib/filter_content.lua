local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.content", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.validations")
contentTable = "ContentFiltering"
webComponetTable = "WebComponents"
;({}).feature = "Status"
;({}).webProxy = "ProxyEnable"
;({}).java = "JavaComponentEnable"
;({}).activex = "ActivexControlEnable"
;({}).cookies = "CookiesEnable"
;({}).wcfStatus = "wcfStatus"
function isfeatureEnabled()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(contentTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.feature)
  if L0_1 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_1
end
function isfeatureEnabledNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function featureEnable()
  local L0_4, L1_5, L2_6
  L2_6 = _UPVALUE0_
  L0_4 = _UPVALUE1_.wcfLicenseStatusGet()
  L1_5 = db.setAttribute(contentTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.feature, _UPVALUE5_)
  if not L1_5 then
    return _UPVALUE6_.FAILURE, L2_6
  end
  if L0_4 then
    L1_5 = db.setAttribute(_UPVALUE7_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.wcfStatus, _UPVALUE5_)
    if not L1_5 then
      return _UPVALUE6_.FAILURE, L2_6
    end
  end
  return _UPVALUE6_.SUCCESS, L2_6
end
function featureDisable()
  local L0_7, L1_8, L2_9
  L2_9 = _UPVALUE0_
  L0_7 = _UPVALUE1_.wcfLicenseStatusGet()
  L1_8 = db.setAttribute(contentTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.feature, _UPVALUE5_)
  if not L1_8 then
    return _UPVALUE6_.FAILURE, L2_9
  end
  if L0_7 then
    L1_8 = db.setAttribute(_UPVALUE7_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.wcfStatus, _UPVALUE5_)
    if not L1_8 then
      return _UPVALUE6_.FAILURE, L2_9
    end
  end
  return _UPVALUE6_.SUCCESS, L2_9
end
function iswebProxyEnabled()
  local L0_10
  L0_10 = db.getAttribute(webComponetTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.webProxy)
  if L0_10 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_10
end
function iswebProxyEnabledNext(A0_11)
  local L2_12
  L2_12 = _UPVALUE0_
  L2_12 = L2_12.NOT_SUPPORTED
  return L2_12, A0_11
end
function webProxyEnable()
  local L0_13, L1_14, L2_15, L3_16, L4_17
  L3_16 = _UPVALUE0_
  L4_17 = nil
  L0_13, L2_15, L1_14 = isfeatureEnabled()
  if L0_13 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_14 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_17 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.webProxy, _UPVALUE2_)
  if not L4_17 then
    return _UPVALUE1_.FAILURE, L3_16
  end
  return _UPVALUE1_.SUCCESS, L3_16
end
function webProxyDisable()
  local L0_18, L1_19, L2_20, L3_21, L4_22
  L3_21 = _UPVALUE0_
  L4_22 = nil
  L0_18, L2_20, L1_19 = isfeatureEnabled()
  if L0_18 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_19 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_22 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.webProxy, _UPVALUE7_)
  if not L4_22 then
    return _UPVALUE1_.FAILURE, L3_21
  end
  return _UPVALUE1_.SUCCESS, L3_21
end
function isjavaEnabled()
  local L0_23
  L0_23 = db.getAttribute(webComponetTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.java)
  if L0_23 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_23
end
function isjavaEnabledNext(A0_24)
  local L2_25
  L2_25 = _UPVALUE0_
  L2_25 = L2_25.NOT_SUPPORTED
  return L2_25, A0_24
end
function javaEnable()
  local L0_26, L1_27, L2_28, L3_29, L4_30
  L3_29 = _UPVALUE0_
  L4_30 = nil
  L0_26, L2_28, L1_27 = isfeatureEnabled()
  if L0_26 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_27 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_30 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.java, _UPVALUE2_)
  if not L4_30 then
    return _UPVALUE1_.FAILURE, L3_29
  end
  return _UPVALUE1_.SUCCESS, L3_29
end
function javaDisable()
  local L0_31, L1_32, L2_33, L3_34, L4_35
  L3_34 = _UPVALUE0_
  L4_35 = nil
  L0_31, L2_33, L1_32 = isfeatureEnabled()
  if L0_31 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_32 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_35 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.java, _UPVALUE7_)
  if not L4_35 then
    return _UPVALUE1_.FAILURE, L3_34
  end
  return _UPVALUE1_.SUCCESS, L3_34
end
function isactivexEnabled()
  local L0_36
  L0_36 = db.getAttribute(webComponetTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.activex)
  if L0_36 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_36
end
function isactivexEnabledNext(A0_37)
  local L2_38
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NOT_SUPPORTED
  return L2_38, A0_37
end
function activexEnable()
  local L0_39, L1_40, L2_41, L3_42, L4_43
  L3_42 = _UPVALUE0_
  L4_43 = nil
  L0_39, L2_41, L1_40 = isfeatureEnabled()
  if L0_39 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_40 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_43 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.activex, _UPVALUE2_)
  if not L4_43 then
    return _UPVALUE1_.FAILURE, L3_42
  end
  return _UPVALUE1_.SUCCESS, L3_42
end
function activexDisable()
  local L0_44, L1_45, L2_46, L3_47, L4_48
  L3_47 = _UPVALUE0_
  L4_48 = nil
  L0_44, L2_46, L1_45 = isfeatureEnabled()
  if L0_44 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_45 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_48 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.activex, _UPVALUE7_)
  if not L4_48 then
    return _UPVALUE1_.FAILURE, L3_47
  end
  return _UPVALUE1_.SUCCESS, L3_47
end
function iscookiesEnabled()
  local L0_49
  L0_49 = db.getAttribute(webComponetTable, _UPVALUE0_, _UPVALUE1_, _UPVALUE2_.cookies)
  if L0_49 == _UPVALUE3_.NIL then
    return _UPVALUE3_.FAILURE
  end
  return _UPVALUE3_.SUCCESS, _UPVALUE1_, L0_49
end
function iscookiesEnabledNext(A0_50)
  local L2_51
  L2_51 = _UPVALUE0_
  L2_51 = L2_51.NOT_SUPPORTED
  return L2_51, A0_50
end
function cookiesEnable()
  local L0_52, L1_53, L2_54, L3_55, L4_56
  L3_55 = _UPVALUE0_
  L4_56 = nil
  L0_52, L2_54, L1_53 = isfeatureEnabled()
  if L0_52 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_53 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_56 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.cookies, _UPVALUE2_)
  if not L4_56 then
    return _UPVALUE1_.FAILURE, L3_55
  end
  return _UPVALUE1_.SUCCESS, L3_55
end
function cookiesDisable()
  local L0_57, L1_58, L2_59, L3_60, L4_61
  L3_60 = _UPVALUE0_
  L4_61 = nil
  L0_57, L2_59, L1_58 = isfeatureEnabled()
  if L0_57 ~= _UPVALUE1_.SUCCESS or _UPVALUE2_ ~= L1_58 then
    return _UPVALUE3_.WCFSTATUS_DISABLED
  end
  L4_61 = db.setAttribute(webComponetTable, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_.cookies, _UPVALUE7_)
  if not L4_61 then
    return _UPVALUE1_.FAILURE, L3_60
  end
  return _UPVALUE1_.SUCCESS, L3_60
end
function webComponentBlockGet()
  local L0_62, L1_63, L2_64, L3_65, L4_66
  L4_66 = {}
  L4_66 = db.getRow(webComponetTable, _UPVALUE0_, _UPVALUE1_)
  if L4_66 == _UPVALUE2_.NIL then
    return _UPVALUE2_.FAILURE
  else
    L0_62 = L4_66[webComponetTable .. "." .. _UPVALUE3_.webProxy]
    L1_63 = L4_66[webComponetTable .. "." .. _UPVALUE3_.java]
    L3_65 = L4_66[webComponetTable .. "." .. _UPVALUE3_.cookies]
    L2_64 = L4_66[webComponetTable .. "." .. _UPVALUE3_.activex]
    return _UPVALUE2_.SUCCESS, _UPVALUE1_, L0_62, L1_63, L3_65, L2_64
  end
end
function webComponentBlockGetNext(A0_67)
  local L2_68
  L2_68 = _UPVALUE0_
  L2_68 = L2_68.NOT_SUPPORTED
  return L2_68, A0_67
end
function webComponentBlockSet(A0_69, A1_70, A2_71, A3_72)
  local L4_73, L5_74, L6_75, L7_76, L8_77
  L5_74 = {}
  L6_75, L7_76, L8_77 = nil, nil, nil
  if A0_69 == _UPVALUE0_.NIL then
    return _UPVALUE1_.WEBPROXY_NIL, L8_77
  end
  L4_73 = _UPVALUE2_.isBoolean(A0_69)
  if L4_73 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_WEBPROXY_VALUE, L8_77
  end
  if A1_70 == _UPVALUE0_.NIL then
    return _UPVALUE1_.JAVA_NIL, L8_77
  end
  L4_73 = _UPVALUE2_.isBoolean(A1_70)
  if L4_73 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_JAVA_VALUE, L8_77
  end
  if A2_71 == _UPVALUE0_.NIL then
    return _UPVALUE1_.ACTIVEX_NIL, L8_77
  end
  L4_73 = _UPVALUE2_.isBoolean(A2_71)
  if L4_73 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_ACTIVEX_VALUE, L8_77
  end
  if A3_72 == _UPVALUE0_.NIL then
    return _UPVALUE1_.WEBCOOKIE_NIL, L8_77
  end
  L4_73 = _UPVALUE2_.isBoolean(A3_72)
  if L4_73 ~= _UPVALUE0_.SUCCESS then
    return _UPVALUE1_.INVALID_WEBCOOKIE_VALUE, L8_77
  end
  L6_75, L8_77, L7_76 = isfeatureEnabled()
  if L6_75 ~= _UPVALUE0_.SUCCESS or L7_76 ~= _UPVALUE3_ then
    return _UPVALUE1_.WCFSTATUS_DISABLED, L8_77
  end
  L5_74[webComponetTable .. "." .. _UPVALUE4_.webProxy] = A0_69
  L5_74[webComponetTable .. "." .. _UPVALUE4_.java] = A1_70
  L5_74[webComponetTable .. "." .. _UPVALUE4_.cookies] = A3_72
  L5_74[webComponetTable .. "." .. _UPVALUE4_.activex] = A2_71
  L7_76 = db.update(webComponetTable, L5_74, _UPVALUE5_)
  if not L7_76 then
    return _UPVALUE0_.FAILURE, L8_77
  end
  return _UPVALUE0_.SUCCESS, L8_77
end
function webComponentBlockCreate(A0_78, A1_79, A2_80, A3_81)
  local L5_82
  L5_82 = _UPVALUE0_
  L5_82 = L5_82.NOT_SUPPORTED
  return L5_82, cookie
end
function webComponentBlockDelete(A0_83)
  local L2_84
  L2_84 = _UPVALUE0_
  L2_84 = L2_84.NOT_SUPPORTED
  return L2_84, A0_83
end
