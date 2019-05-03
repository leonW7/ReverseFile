local L0_0
L0_0 = module
L0_0("com.teamf1.core.filter.dynamic", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/filter_content")
L0_0 = require
L0_0("teamf1lualib/admin_license")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/filter_validation")
L0_0 = require
L0_0("teamf1lualib/wcf_returnCodes")
L0_0 = "siteCategory"
dynamicTable = L0_0
L0_0 = {}
L0_0.feature = "wcfStatus"
L0_0.categoryList = "categoryList"
L0_0.nonManagedVerdict = "nonManagedVerdict"
L0_0.categoryVerdict = "categoryVerdict"
L0_0.timeout = "timeout"
L0_0.updateAccess = "updateAccess"
function isfeatureEnabled()
  local L0_1, L1_2
  L0_1 = _UPVALUE0_.wcfLicenseStatusGet()
  if not L0_1 then
    return _UPVALUE1_.WCFLICENCE_DEACTIVATED
  end
  L1_2 = db.getAttribute(dynamicTable, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_.feature)
  if L1_2 == _UPVALUE5_.NIL then
    return _UPVALUE5_.FAILURE
  end
  return _UPVALUE5_.SUCCESS, _UPVALUE3_, L1_2
end
function isfeatureEnabledNext(A0_3)
  local L2_4
  L2_4 = _UPVALUE0_
  L2_4 = L2_4.NOT_SUPPORTED
  return L2_4, A0_3
end
function featureEnable()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10
  L5_10 = _UPVALUE0_
  L0_5 = _UPVALUE1_.wcfLicenseStatusGet()
  if not L0_5 then
    return _UPVALUE2_.WCFLICENCE_DEACTIVATED, L5_10
  end
  L3_8, L2_7, L1_6 = _UPVALUE3_.isfeatureEnabled()
  if L3_8 ~= _UPVALUE4_.SUCCESS or L1_6 ~= _UPVALUE5_ then
    return _UPVALUE2_.WCFSTATUS_DISABLED, L5_10
  end
  L4_9 = db.setAttribute(dynamicTable, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_.feature, _UPVALUE5_)
  if not L4_9 then
    return _UPVALUE4_.FAILURE, L5_10
  else
    return _UPVALUE4_.SUCCESS, L5_10
  end
end
function featureDisable()
  local L0_11, L1_12, L2_13, L3_14, L4_15, L5_16
  L2_13 = _UPVALUE0_
  L3_14, L4_15, L5_16 = nil, nil, nil
  L0_11 = _UPVALUE1_.wcfLicenseStatusGet()
  if not L0_11 then
    return _UPVALUE2_.WCFLICENCE_DEACTIVATED, L2_13
  end
  L4_15, L3_14, L1_12 = _UPVALUE3_.isfeatureEnabled()
  if L4_15 ~= _UPVALUE4_.SUCCESS or L1_12 == _UPVALUE5_ then
    return _UPVALUE2_.WCFSTATUS_DISABLED, L2_13
  end
  L5_16 = db.setAttribute(dynamicTable, _UPVALUE6_, _UPVALUE7_, _UPVALUE8_.feature, _UPVALUE9_)
  if not L5_16 then
    return _UPVALUE4_.FAILURE
  end
  return _UPVALUE4_.SUCCESS
end
function categoryListGet()
  local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24
  L7_24 = {}
  L0_17 = _UPVALUE0_.wcfLicenseStatusGet()
  if not L0_17 then
    return _UPVALUE1_.WCFLICENCE_DEACTIVATED
  end
  L7_24 = db.getRow(dynamicTable, _UPVALUE2_, _UPVALUE3_)
  if L7_24 == _UPVALUE4_.NIL then
    return _UPVALUE4_.FAILURE
  end
  L2_19 = L7_24[dynamicTable .. "." .. _UPVALUE5_.feature]
  L1_18 = L7_24[dynamicTable .. "." .. _UPVALUE5_.categoryList]
  L3_20 = L7_24[dynamicTable .. "." .. _UPVALUE5_.nonManagedVerdict]
  L4_21 = L7_24[dynamicTable .. "." .. _UPVALUE5_.categoryVerdict]
  L5_22 = tonumber(L7_24[dynamicTable .. "." .. _UPVALUE5_.timeout]) * 60
  L6_23 = L7_24[dynamicTable .. "." .. _UPVALUE5_.updateAccess]
  return _UPVALUE4_.SUCCESS, _UPVALUE3_, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
end
function categoryListGetNext(A0_25)
  local L2_26
  L2_26 = _UPVALUE0_
  L2_26 = L2_26.NOT_SUPPORTED
  return L2_26, A0_25
end
function categoryListSet(A0_27, A1_28, A2_29, A3_30, A4_31, A5_32)
  local L6_33, L7_34, L8_35, L9_36, L10_37, L11_38
  L11_38 = {}
  if A0_27 == _UPVALUE0_.NIL then
    return _UPVALUE1_.WCFCATEGORY_LIST_NIL
  end
  L6_33 = _UPVALUE2_.validCategoryList(A0_27)
  if not L6_33 then
    return _UPVALUE1_.INVALID_WCFCATEGORY_LIST
  end
  L8_35, L10_37, L9_36 = _UPVALUE3_.isfeatureEnabled()
  if L8_35 ~= _UPVALUE0_.SUCCESS then
    return L8_35
  end
  if L9_36 ~= _UPVALUE4_ then
    return _UPVALUE1_.WCFSTATUS_DISABLED
  end
  L11_38[dynamicTable .. "." .. _UPVALUE5_.categoryList] = A0_27
  L11_38[dynamicTable .. "." .. _UPVALUE5_.nonManagedVerdict] = A2_29
  L11_38[dynamicTable .. "." .. _UPVALUE5_.categoryVerdict] = A3_30
  if A4_31 ~= nil then
    L11_38[dynamicTable .. "." .. _UPVALUE5_.timeout] = tonumber(A4_31) / 60
  end
  L11_38[dynamicTable .. "." .. _UPVALUE5_.updateAccess] = A5_32
  status = db.update(dynamicTable, L11_38, _UPVALUE6_)
  if not status then
    return _UPVALUE0_.FAILURE, L7_34
  end
  return _UPVALUE0_.SUCCESS, L7_34
end
