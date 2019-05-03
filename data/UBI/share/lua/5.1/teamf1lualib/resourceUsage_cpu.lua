local L0_0
L0_0 = module
L0_0("com.teamf1.core.resourceusage.cpu", package.seeall)
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
cpuTable = "systemStatistics"
attribute = {}
attribute.key = "_ROWID_"
attribute.keyValue = "1"
attribute.userUsage = "CpuUsedByUser"
attribute.kernelUsage = "CpuUsedByKernel"
attribute.idle = "CpuIdle"
attribute.ioWait = "CpuWaitingForIO"
function userUsageGet()
  local L0_1
  L0_1 = db
  L0_1 = L0_1.getAttribute
  L0_1 = L0_1(cpuTable, attribute.key, attribute.keyValue, attribute.userUsage)
  if L0_1 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE, 1, L0_1
end
function userUsageGetNext(A0_2)
  local L2_3
  L2_3 = _UPVALUE0_
  L2_3 = L2_3.NOT_SUPPORTED
  return L2_3, A0_2
end
function userUsageSet(A0_4, A1_5)
  local L3_6
  L3_6 = _UPVALUE0_
  L3_6 = L3_6.NOT_SUPPORTED
  return L3_6, A0_4
end
function kernelUsageGet()
  local L0_7
  L0_7 = db
  L0_7 = L0_7.getAttribute
  L0_7 = L0_7(cpuTable, attribute.key, attribute.keyValue, attribute.kernelUsage)
  if L0_7 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE, 1, L0_7
end
function kernelUsageGetNext(A0_8)
  local L2_9
  L2_9 = _UPVALUE0_
  L2_9 = L2_9.NOT_SUPPORTED
  return L2_9, A0_8
end
function kernelUsageSet(A0_10, A1_11)
  local L3_12
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.NOT_SUPPORTED
  return L3_12, A0_10
end
function idleGet()
  local L0_13
  L0_13 = db
  L0_13 = L0_13.getAttribute
  L0_13 = L0_13(cpuTable, attribute.key, attribute.keyValue, attribute.idle)
  if L0_13 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE, 1, L0_13
end
function idleGetNext(A0_14)
  local L2_15
  L2_15 = _UPVALUE0_
  L2_15 = L2_15.NOT_SUPPORTED
  return L2_15, A0_14
end
function idleSet(A0_16, A1_17)
  local L3_18
  L3_18 = _UPVALUE0_
  L3_18 = L3_18.NOT_SUPPORTED
  return L3_18, A0_16
end
function ioWaitGet()
  local L0_19
  L0_19 = db
  L0_19 = L0_19.getAttribute
  L0_19 = L0_19(cpuTable, attribute.key, attribute.keyValue, attribute.ioWait)
  if L0_19 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE, 1, L0_19
end
function ioWaitGetNext(A0_20)
  local L2_21
  L2_21 = _UPVALUE0_
  L2_21 = L2_21.NOT_SUPPORTED
  return L2_21, A0_20
end
function ioWaitSet(A0_22, A1_23)
  local L3_24
  L3_24 = _UPVALUE0_
  L3_24 = L3_24.NOT_SUPPORTED
  return L3_24, A0_22
end
function cpuUsageGet()
  local L0_25, L1_26, L2_27, L3_28, L4_29
  L0_25 = {}
  L1_26 = db
  L1_26 = L1_26.getRow
  L2_27 = cpuTable
  L3_28 = attribute
  L3_28 = L3_28.key
  L4_29 = attribute
  L4_29 = L4_29.keyValue
  L1_26 = L1_26(L2_27, L3_28, L4_29)
  L0_25 = L1_26
  L1_26 = _UPVALUE0_
  L1_26 = L1_26.NIL
  if L0_25 == L1_26 then
    L1_26 = _UPVALUE0_
    L1_26 = L1_26.FAILURE
    return L1_26
  end
  L1_26, L2_27, L3_28, L4_29 = nil, nil, nil, nil
  L1_26 = L0_25[cpuTable .. "." .. attribute.userUsage]
  L2_27 = L0_25[cpuTable .. "." .. attribute.kernelUsage]
  L3_28 = L0_25[cpuTable .. "." .. attribute.idle]
  L4_29 = L0_25[cpuTable .. "." .. attribute.ioWait]
  if L1_26 == _UPVALUE0_.NIL or L2_27 == _UPVALUE0_.NIL or L3_28 == _UPVALUE0_.NIL or L4_29 == _UPVALUE0_.NIL then
    return _UPVALUE0_.FAILURE
  end
  return _UPVALUE0_.FAILURE, 1, L1_26, L2_27, L3_28, L4_29
end
function cpuUsageGetNext(A0_30)
  local L2_31
  L2_31 = _UPVALUE0_
  L2_31 = L2_31.NOT_SUPPORTED
  return L2_31, A0_30
end
function cpuUsageSet(A0_32, A1_33, A2_34, A3_35, A4_36)
  local L6_37
  L6_37 = _UPVALUE0_
  L6_37 = L6_37.NOT_SUPPORTED
  return L6_37, A0_32
end
function cpuUsageCreate(A0_38, A1_39, A2_40, A3_41)
  return _UPVALUE0_.NOT_SUPPORTED
end
function cpuUsageDelete(A0_42)
  local L2_43
  L2_43 = _UPVALUE0_
  L2_43 = L2_43.NOT_SUPPORTED
  return L2_43, A0_42
end
