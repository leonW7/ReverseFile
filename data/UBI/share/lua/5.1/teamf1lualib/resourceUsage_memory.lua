local L0_0
L0_0 = module
L0_0("com.teamf1.core.resourceusage.memory", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
memoryTable = "systemStatistics"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyValue = "1"
attribute.totalMemory = "MemoryTotal"
attribute.usedMemory = "MemoryUsed"
attribute.freeMemory = "MemoryFree"
attribute.cachedMemory = "MemoryCached"
attribute.bufferMemory = "MemoryBuffers"
function totalMemoryGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(memoryTable, attribute.key, attribute.keyValue, attribute.totalMemory)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_1
end
function totalMemoryGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function totalMemorySet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function usedMemoryGet()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(memoryTable, attribute.key, attribute.keyValue, attribute.usedMemory)
  if L0_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_7
end
function usedMemoryGetNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function usedMemorySet(A0_10, A1_11)
  local L3_12
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  return L3_12, A0_10
end
function freeMemoryGet()
  local L0_13
  L0_13 = db
  L0_13 = L0_13.getAttribute
  L0_13 = L0_13(memoryTable, attribute.key, attribute.keyValue, attribute.freeMemory)
  if L0_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_13
end
function freeMemoryGetNext(A0_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, A0_14
end
function freeMemorySet(A0_16, A1_17)
  local L3_18
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NOT_SUPPORTED
  return L3_18, A0_16
end
function cachedMemoryGet()
  local L0_19
  L0_19 = db
  L0_19 = L0_19.getAttribute
  L0_19 = L0_19(memoryTable, attribute.key, attribute.keyValue, attribute.cachedMemory)
  if L0_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_19
end
function cachedMemoryGetNext(A0_20)
  local L2_21
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NOT_SUPPORTED
  return L2_21, A0_20
end
function cachedMemorySet(A0_22, A1_23)
  local L3_24
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.NOT_SUPPORTED
  return L3_24, A0_22
end
function bufferMemoryGet()
  local L0_25
  L0_25 = db
  L0_25 = L0_25.getAttribute
  L0_25 = L0_25(memoryTable, attribute.key, attribute.keyValue, attribute.bufferMemory)
  if L0_25 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L0_25
end
function bufferMemoryGetNext(A0_26)
  local L2_27
  L2_27 = _UPVALUE0_
  L2_27 = L2_27.NOT_SUPPORTED
  return L2_27, A0_26
end
function bufferMemorySet(A0_28, A1_29)
  local L3_30
  L3_30 = _UPVALUE0_
  L3_30 = L3_30.NOT_SUPPORTED
  return L3_30, A0_28
end
function memoryUsageGet()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36
  L0_31 = {}
  L1_32 = db
  L1_32 = L1_32.getRow
  L2_33 = memoryTable
  L3_34 = attribute
  L3_34 = L3_34.key
  L4_35 = attribute
  L4_35 = L4_35.keyValue
  L1_32 = L1_32(L2_33, L3_34, L4_35)
  L0_31 = L1_32
  L1_32 = _UPVALUE0_
  L1_32 = L1_32.NIL
  if L0_31 == L1_32 then
    L1_32 = _UPVALUE0_
    L1_32 = L1_32.FAILURE
    return L1_32
  end
  L1_32, L2_33, L3_34, L4_35, L5_36 = nil, nil, nil, nil, nil
  L1_32 = L0_31[memoryTable .. "." .. attribute.totalMemory]
  L2_33 = L0_31[memoryTable .. "." .. attribute.usedMemory]
  L3_34 = L0_31[memoryTable .. "." .. attribute.freeMemory]
  L4_35 = L0_31[memoryTable .. "." .. attribute.cachedMemory]
  L5_36 = L0_31[memoryTable .. "." .. attribute.bufferMemory]
  if L1_32 == _UPVALUE0_.NIL or L2_33 == _UPVALUE0_.NIL or L3_34 == _UPVALUE0_.NIL or L4_35 == _UPVALUE0_.NIL or L5_36 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.SUCCESS, 1, L1_32, L2_33, L3_34, L4_35, L5_36
end
function memoryUsageGetNext(A0_37)
  local L2_38
  L2_38 = _UPVALUE0_
  L2_38 = L2_38.NOT_SUPPORTED
  return L2_38, A0_37
end
function memoryUsageSet(A0_39, A1_40, A2_41, A3_42, A4_43, A5_44)
  local L7_45
  L7_45 = _UPVALUE0_
  L7_45 = L7_45.NOT_SUPPORTED
  return L7_45, A0_39
end
function memoryUsageCreate(A0_46, A1_47, A2_48, A3_49, A4_50)
  return _UPVALUE0_.NOT_SUPPORTED
end
function memoryUsageDelete(A0_51)
  local L2_52
  L2_52 = _UPVALUE0_
  L2_52 = L2_52.NOT_SUPPORTED
  return L2_52, A0_51
end
