local L0_0
L0_0 = require
L0_0("luasql.sqlite3")
L0_0 = nil
__CLISH_CUR_OBJ_ID = L0_0
L0_0 = nil
__CLISH_CUR_CFG_INIT_FN = L0_0
L0_0 = nil
__CLISH_CUR_CFG_EXEC_FN = L0_0
L0_0 = nil
__CLISH_CUR_CFG_IPVAL_FN = L0_0
L0_0 = {}
__CLISH_CUR_CONFIG_ROW = L0_0
L0_0 = {}
__CLISH_EDIT_CONFIG_ROW = L0_0
L0_0 = ""
__CLISH_EDIT_SESSION_OBJECT = L0_0
L0_0 = nil
__CLISH_SESSION_ARGS = L0_0
function L0_0(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6
  for L4_5, L5_6 in L1_2(L2_3) do
    print(L4_5, L5_6)
  end
  return A0_1
end
clishPrintArgs = L0_0
function L0_0(A0_7, A1_8)
  local L2_9, L3_10
  L3_10 = __CLISH_CUR_OBJ_ID
  if L3_10 ~= A0_7 then
    return L2_9
  end
  L3_10 = __CLISH_EDIT_CONFIG_ROW
  L3_10 = L3_10[A1_8]
  if L3_10 ~= nil then
    L3_10 = __CLISH_EDIT_CONFIG_ROW
    L2_9 = L3_10[A1_8]
  else
    L3_10 = __CLISH_CUR_CONFIG_ROW
    L3_10 = L3_10[A1_8]
    if L3_10 ~= nil then
      L3_10 = __CLISH_CUR_CONFIG_ROW
      L2_9 = L3_10[A1_8]
    end
  end
  return L2_9
end
clishCfgAttrGet = L0_0
function L0_0(A0_11, ...)
  local L2_13, L3_14, L4_15, L5_16, L6_17, L7_18, L8_19
  L2_13 = {
    [7] = ...
  }
  L8_19 = ...
  ;({
    [7] = ...
  })[1] = L3_14
  ;({
    [7] = ...
  })[2] = L4_15
  ;({
    [7] = ...
  })[3] = L5_16
  ;({
    [7] = ...
  })[4] = L6_17
  ;({
    [7] = ...
  })[5] = L7_18
  ;({
    [7] = ...
  })[6] = L8_19
  L3_14 = {}
  for L7_18, L8_19 in L4_15(L5_16) do
    table.insert(L3_14, L8_19)
  end
  return L4_15(L5_16)
end
clishCmdExec = L0_0
function L0_0()
  local L0_20, L1_21
  __CLISH_CUR_CFG_INIT_FN = L0_20
  L0_20 = nil
  __CLISH_CUR_CFG_EXEC_FN = L0_20
  L0_20 = nil
  __CLISH_CUR_CFG_IPVAL_FN = L0_20
  L0_20 = args
  __CLISH_SESSION_ARGS = L0_20
  L0_20 = nil
  __CLISH_CUR_OBJ_ID = L0_20
  L0_20 = {}
  __CLISH_CUR_CONFIG_ROW = L0_20
  L0_20 = {}
  __CLISH_EDIT_CONFIG_ROW = L0_20
end
function clishCfgObjReset()
  local L1_22
  L1_22 = {}
  __CLISH_EDIT_CONFIG_ROW = L1_22
end
function clishCfgObjDel(A0_23)
  local L1_24, L2_25
  L1_24 = __CLISH_CUR_OBJ_ID
  if L1_24 ~= A0_23 then
    L1_24 = "ERROR"
    return L1_24
  end
  L1_24 = __CLISH_CUR_CFG_EXEC_FN
  L2_25 = __CLISH_CUR_CONFIG_ROW
  L2_25 = L1_24(L2_25, targs)
  if L1_24 ~= "OK" then
    printCLIError(L2_25 .. ". Configuration not deleted.")
  end
  return "OK"
end
function clishCfgObjExec(A0_26, ...)
  local L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34
  L2_28 = {}
  L3_29 = {
    [6] = ...
  }
  L6_32 = ...
  ;({
    [6] = ...
  })[1] = L4_30
  ;({
    [6] = ...
  })[2] = L5_31
  ;({
    [6] = ...
  })[3] = L6_32
  ;({
    [6] = ...
  })[4] = L7_33
  ;({
    [6] = ...
  })[5] = L8_34
  L4_30, L5_31 = nil, nil
  L6_32 = __CLISH_CUR_OBJ_ID
  if L6_32 ~= A0_26 then
    L6_32 = "ERROR"
    return L6_32
  end
  L6_32 = util
  L6_32 = L6_32.fileExists
  L6_32 = L6_32(L7_33)
  if not L6_32 then
    L7_33(L8_34)
    return L7_33
  end
  if L7_33 ~= 0 then
    for _FORV_10_, _FORV_11_ in L7_33(L8_34) do
      L2_28[_FORV_10_] = __CLISH_EDIT_CONFIG_ROW[_FORV_10_]
    end
    for _FORV_10_, _FORV_11_ in L7_33(L8_34) do
      if __CLISH_EDIT_CONFIG_ROW[_FORV_10_] == nil then
        L2_28[_FORV_10_] = __CLISH_CUR_CONFIG_ROW[_FORV_10_]
      end
    end
  else
    L2_28 = __CLISH_CUR_CONFIG_ROW
  end
  if L7_33 ~= nil then
    if L7_33 == false then
      if L8_34 ~= nil then
        printCLIError(L8_34)
      end
      return "ERROR"
    end
  end
  if L7_33 ~= "OK" then
    if L8_34 == "SaveWireless" then
    else
      printCLIError(L8_34)
      printCLIError("** Configuration could not be saved, Please try again. **")
    end
  else
    clishCfgObjReset()
  end
  L4_30, __CLISH_CUR_CONFIG_ROW = __CLISH_CUR_CFG_INIT_FN(__CLISH_SESSION_ARGS)
  if __CLISH_CUR_CONFIG_ROW == nil then
    _UPVALUE0_()
    printCLIError("Error reading config after save.")
    return "ERROR"
  end
  return "OK"
end
function clishCfgObjAdd(A0_35, A1_36, A2_37)
  local L3_38
  L3_38 = __CLISH_CUR_OBJ_ID
  if L3_38 ~= A0_35 then
    L3_38 = "ERROR"
    return L3_38
  end
  L3_38 = __CLISH_EDIT_CONFIG_ROW
  L3_38[A1_36] = A2_37
  L3_38 = "OK"
  return L3_38
end
function clishCfgObjNew(A0_39, A1_40, A2_41, A3_42, ...)
  local L5_44, L6_45, L7_46, L8_47, L9_48, L10_49, L11_50, L12_51
  L5_44 = {}
  L6_45 = nil
  L7_46 = {
    [6] = ...
  }
  L12_51 = ...
  ;({
    [6] = ...
  })[1] = L8_47
  ;({
    [6] = ...
  })[2] = L9_48
  ;({
    [6] = ...
  })[3] = L10_49
  ;({
    [6] = ...
  })[4] = L11_50
  ;({
    [6] = ...
  })[5] = L12_51
  for L11_50, L12_51 in L8_47(L9_48) do
    table.insert(L5_44, L12_51)
  end
  L8_47()
  if A1_40 == nil or A2_41 == nil or A0_39 == nil then
    L8_47(L9_48)
    return L8_47
  end
  __CLISH_CUR_CFG_INIT_FN = A1_40
  __CLISH_CUR_CFG_EXEC_FN = A2_41
  __CLISH_CUR_CFG_IPVAL_FN = A3_42
  __CLISH_CUR_OBJ_ID = A0_39
  __CLISH_SESSION_ARGS = L5_44
  __CLISH_CUR_CONFIG_ROW = L9_48
  L6_45 = L8_47
  if L8_47 == nil then
    L8_47()
    L8_47(L9_48)
    return L8_47
  end
end
