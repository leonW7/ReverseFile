local L0_0
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = {}
smtpAlg = L0_0
L0_0 = {}
smtpAlgStatus = L0_0
L0_0 = {}
approvedMail = L0_0
L0_0 = {}
blockedMail = L0_0
L0_0 = {}
subjectList = L0_0
L0_0 = db
L0_0 = L0_0.crud
smtpAlgDBConfig = L0_0
L0_0 = db
L0_0 = L0_0.getTable
smtpAlgDBTableGet = L0_0
L0_0 = db
L0_0 = L0_0.getAttribute
smtpAlgAttributesGet = L0_0
L0_0 = db
L0_0 = L0_0.setAttribute
smtpAlgAttributesSet = L0_0
L0_0 = db
L0_0 = L0_0.getColNames
smtpAlgColsNamesGet = L0_0
L0_0 = db
L0_0 = L0_0.getRow
smtpAlgRowsGet = L0_0
L0_0 = db
L0_0 = L0_0.getRowsWhere
smtpAlgRowsWhereGet = L0_0
L0_0 = db
L0_0 = L0_0.getRowWhere
smtpAlgRowWhereGet = L0_0
L0_0 = db
L0_0 = L0_0.existsRow
smtpAlgRowExists = L0_0
L0_0 = db
L0_0 = L0_0.existsRowWhere
smtpAlgRowWhereExists = L0_0
L0_0 = db
L0_0 = L0_0.getDefaults
smtpAlgDefaultsGet = L0_0
L0_0 = db
L0_0 = L0_0.execute
smtpAlgCommandExecute = L0_0
L0_0 = db
L0_0 = L0_0.getTable
smtpAlgGetTable = L0_0
function L0_0(A0_1, A1_2, A2_3, A3_4)
  if db.typeAndRangeValidate(A1_2) then
    if A3_4 == "add" then
      return db.insert(A0_1, A1_2)
    elseif A3_4 == "edit" then
      return db.update(A0_1, A1_2, A2_3)
    elseif A3_4 == "delete" then
      return db.delete(A0_1, A1_2)
    end
  end
  return false
end
function smtpAlgStatus.add(A0_5)
  local L1_6, L2_7
  L1_6 = false
  L2_7 = "smtpAlg"
  L1_6 = _UPVALUE0_(L2_7, A0_5, "-1", "add")
  if L1_6 then
    return "OK", "12265"
  else
    return "ERROR", "10971"
  end
end
function approvedMail.add(A0_8)
  local L1_9, L2_10
  L1_9 = false
  L2_10 = "approvedMailIdList"
  L1_9 = _UPVALUE0_(L2_10, A0_8, "-1", "add")
  if L1_9 then
    return "OK", "12265"
  else
    return "ERROR", "10971"
  end
end
function blockedMail.add(A0_11)
  local L1_12, L2_13
  L1_12 = false
  L2_13 = "blockedMailIdList"
  L1_12 = _UPVALUE0_(L2_13, A0_11, "-1", "add")
  if L1_12 then
    return "OK", "12265"
  else
    return "ERROR", "10971"
  end
end
function subjectList.add(A0_14)
  local L1_15, L2_16
  L1_15 = false
  L2_16 = "subjectList"
  L1_15 = _UPVALUE0_(L2_16, A0_14, "-1", "add")
  if L1_15 then
    return "OK", "12265"
  else
    return "ERROR", "10971"
  end
end
function smtpAlgStatus.edit(A0_17, A1_18)
  local L2_19, L3_20
  L2_19 = false
  L3_20 = "smtpAlg"
  L2_19 = _UPVALUE0_(L3_20, A0_17, A1_18, "edit")
  if L2_19 then
    return "OK", "12265"
  else
    return "ERROR", "10669"
  end
end
function approvedMail.edit(A0_21, A1_22)
  local L2_23, L3_24
  L2_23 = false
  L3_24 = "approvedMailIdList"
  L2_23 = _UPVALUE0_(L3_24, A0_21, A1_22, "edit")
  if L2_23 then
    return "OK", "12265"
  else
    return "ERROR", "10669"
  end
end
function blockedMail.edit(A0_25, A1_26)
  local L2_27, L3_28
  L2_27 = false
  L3_28 = "blockedMailIdList"
  L2_27 = _UPVALUE0_(L3_28, A0_25, A1_26, "edit")
  if L2_27 then
    return "OK", "12265"
  else
    return "ERROR", "10669"
  end
end
function subjectList.edit(A0_29, A1_30)
  local L2_31, L3_32
  L2_31 = false
  L3_32 = "subjectList"
  L2_31 = _UPVALUE0_(L3_32, A0_29, A1_30, "edit")
  if L2_31 then
    return "OK", "12265"
  else
    return "ERROR", "10669"
  end
end
function smtpAlgStatus.get(A0_33)
  return (smtpAlgRowsGet("smtpAlg", "_ROWID_", A0_33))
end
function approvedMail.get(A0_34)
  return (smtpAlgRowsGet("approvedMailIdList", "_ROWID_", A0_34))
end
function blockedMail.get(A0_35)
  return (smtpAlgRowsGet("blockedMailIdList", "_ROWID_", A0_35))
end
function subjectList.get(A0_36)
  return (smtpAlgRowsGet("subjectList", "_ROWID_", A0_36))
end
function smtpAlgStatus.delete(A0_37)
  local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45
  L1_38 = false
  L2_39 = "smtpAlg"
  for L6_43, L7_44 in L3_40(L4_41) do
    L8_45 = {}
    L8_45["smtpAlg._ROWID_"] = L7_44
    L1_38 = _UPVALUE0_(L2_39, L8_45, L7_44, "delete")
  end
  if L1_38 then
    return L3_40, L4_41
  else
    return L3_40, L4_41
  end
end
function approvedMail.delete(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54
  L1_47 = false
  L2_48 = "approvedMailIdList"
  for L6_52, L7_53 in L3_49(L4_50) do
    L8_54 = {}
    L8_54["approvedMailIdList._ROWID_"] = L7_53
    L1_47 = _UPVALUE0_(L2_48, L8_54, L7_53, "delete")
  end
  if L1_47 then
    return L3_49, L4_50
  else
    return L3_49, L4_50
  end
end
function blockedMail.delete(A0_55)
  local L1_56, L2_57, L3_58, L4_59, L5_60, L6_61, L7_62, L8_63
  L1_56 = false
  L2_57 = "blockedMailIdList"
  for L6_61, L7_62 in L3_58(L4_59) do
    L8_63 = {}
    L8_63["blockedMailIdList._ROWID_"] = L7_62
    L1_56 = _UPVALUE0_(L2_57, L8_63, L7_62, "delete")
  end
  if L1_56 then
    return L3_58, L4_59
  else
    return L3_58, L4_59
  end
end
function subjectList.delete(A0_64)
  local L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72
  L1_65 = false
  L2_66 = "subjectList"
  for L6_70, L7_71 in L3_67(L4_68) do
    L8_72 = {}
    L8_72["subjectList._ROWID_"] = L7_71
    L1_65 = _UPVALUE0_(L2_66, L8_72, L7_71, "delete")
  end
  if L1_65 then
    return L3_67, L4_68
  else
    return L3_67, L4_68
  end
end
