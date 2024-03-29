local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17
L0_0 = require
L1_1 = "socket"
L0_0 = L0_0(L1_1)
function L1_1(A0_18)
  local L1_19
  function L1_19(...)
    local L1_21
    L1_21 = {
      pcall(_UPVALUE0_, unpack(L0_20))
    }
    if table.remove(L1_21, 1) then
      return unpack(L1_21)
    end
    return nil, unpack(L1_21)
  end
  return L1_19
end
L0_0.protect = L1_1
function L1_1(A0_22)
  local L1_23
  function L1_23(...)
    local L1_25
    L1_25 = L0_24[1]
    L1_25 = L1_25 or false
    if L1_25 == false then
      table.remove(L0_24, 1)
      error(L0_24[1], 0)
    end
    return unpack(L0_24)
  end
  return L1_23
end
L0_0.newtry = L1_1
L1_1 = module
L2_2 = "copas"
L3_3 = package
L3_3 = L3_3.seeall
L1_1(L2_2, L3_3)
L1_1 = "Copyright (C) 2004-2006 Kepler Project"
_COPYRIGHT = L1_1
L1_1 = "Coroutine Oriented Portable Asynchronous Services"
_DESCRIPTION = L1_1
L1_1 = "Copas 1.1"
_VERSION = L1_1
function L1_1()
  local L0_26, L1_27, L2_28
  L0_26 = {}
  L1_27 = {}
  L2_28 = {}
  setmetatable(L1_27, {
    __index = {
      insert = function(A0_29, A1_30)
        if not _UPVALUE0_[A1_30] then
          table.insert(A0_29, A1_30)
          _UPVALUE0_[A1_30] = table.getn(A0_29)
        end
      end,
      remove = function(A0_31, A1_32)
        local L2_33
        L2_33 = _UPVALUE0_
        L2_33 = L2_33[A1_32]
        if L2_33 then
          _UPVALUE0_[A1_32] = nil
          if table.remove(A0_31) ~= A1_32 then
            A0_31[L2_33], _UPVALUE0_[table.remove(A0_31)] = table.remove(A0_31), L2_33
          end
        end
      end,
      push = function(A0_34, A1_35, A2_36)
        if _UPVALUE0_[A1_35] == nil then
          _UPVALUE0_[A1_35] = {A2_36}
        else
          table.insert(_UPVALUE0_[A1_35], A2_36)
        end
      end,
      pop = function(A0_37, A1_38)
        local L2_39
        L2_39 = _UPVALUE0_
        L2_39 = L2_39[A1_38]
        if L2_39 ~= nil then
          if L2_39[1] == nil then
            _UPVALUE0_[A1_38] = nil
          end
          return (table.remove(L2_39, 1))
        end
      end
    }
  })
  return L1_27
end
L2_2 = L1_1
L2_2 = L2_2()
L3_3 = L1_1
L3_3 = L3_3()
L4_4 = L1_1
L4_4 = L4_4()
function L5_5(A0_40, A1_41)
  local L2_42, L3_43, L4_44
  A1_41 = A1_41 or "*l"
  while true do
    L2_42, L3_43, L4_44 = A0_40:receive(A1_41, L4_44)
    if L2_42 or L3_43 ~= "timeout" then
      return L2_42, L3_43, L4_44
    end
    coroutine.yield(A0_40, _UPVALUE0_)
  end
end
receive = L5_5
function L5_5(A0_45, A1_46)
  local L2_47, L3_48, L4_49
  A1_46 = A1_46 or "*l"
  while true do
    L2_47, L3_48, L4_49 = A0_45:receive(A1_46)
    if L2_47 or type(A1_46) == "number" and L4_49 ~= "" and L4_49 ~= nil or L3_48 ~= "timeout" then
      return L2_47, L3_48, L4_49
    end
    coroutine.yield(A0_45, _UPVALUE0_)
  end
end
receivePartial = L5_5
function L5_5(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56
  L5_55 = 1
  L6_56 = 0
  while true do
    L5_55 = L5_55 + L6_56
    L2_52, L3_53, L6_56 = A0_50:send(A1_51, L5_55)
    if math.random(100) > 90 then
      coroutine.yield(A0_50, _UPVALUE0_)
    end
    if L2_52 or L3_53 ~= "timeout" then
      return L2_52, L3_53, L6_56
    end
    coroutine.yield(A0_50, _UPVALUE0_)
  end
end
send = L5_5
function L5_5(A0_57, A1_58, A2_59)
  local L3_60, L4_61
  L4_61 = A0_57
  L3_60 = A0_57.settimeout
  L3_60(L4_61, 0)
  L4_61 = A0_57
  L3_60 = A0_57.connect
  L4_61 = L3_60(L4_61, A1_58, A2_59)
  if L3_60 or L4_61 ~= "timeout" then
    return L3_60, L4_61
  end
  coroutine.yield(A0_57, _UPVALUE0_)
  L3_60, L4_61 = A0_57:connect(A1_58, A2_59)
  if L4_61 == "already connected" then
    return 1
  end
  return L3_60, L4_61
end
connect = L5_5
function L5_5(A0_62)
  local L1_63
end
flush = L5_5
L5_5 = {}
L6_6 = {}
function L7_7(A0_64, A1_65)
  return send(A0_64.socket, A1_65)
end
L6_6.send = L7_7
function L7_7(A0_66, A1_67)
  if A0_66.timeout == 0 then
    return receivePartial(A0_66.socket, A1_67)
  end
  return receive(A0_66.socket, A1_67)
end
L6_6.receive = L7_7
function L7_7(A0_68)
  return flush(A0_68.socket)
end
L6_6.flush = L7_7
function L7_7(A0_69, A1_70)
  A0_69.timeout = A1_70
  return
end
L6_6.settimeout = L7_7
L5_5.__index = L6_6
function L6_6(A0_71)
  return setmetatable({socket = A0_71}, _UPVALUE0_)
end
wrap = L6_6
L6_6 = {}
function L7_7(A0_72)
  if coroutine.running() then
    _UPVALUE0_[coroutine.running()] = A0_72
  end
end
setErrorHandler = L7_7
function L7_7(A0_73, A1_74, A2_75)
  print(A0_73, A1_74, A2_75)
end
function L8_8(A0_76, A1_77, ...)
  local L3_79, L4_80, L5_81
  if not A0_76 then
    return
  end
  L3_79 = coroutine
  L3_79 = L3_79.resume
  L4_80 = A0_76
  L5_81 = A1_77
  L5_81 = L3_79(L4_80, L5_81, unpack(L2_78))
  if L3_79 and L4_80 and L5_81 then
    L5_81:insert(L4_80)
    L5_81:push(L4_80, A0_76)
  else
    if not L3_79 then
      pcall(_UPVALUE0_[A0_76] or _UPVALUE1_, L4_80, A0_76, A1_77)
    end
    if A1_77 then
      A1_77:close()
    end
    _UPVALUE0_[A0_76] = nil
  end
end
function L9_9(A0_82, A1_83)
  local L2_84, L3_85
  L3_85 = A0_82
  L2_84 = A0_82.accept
  L2_84 = L2_84(L3_85)
  if L2_84 then
    L3_85 = L2_84.settimeout
    L3_85(L2_84, 0)
    L3_85 = coroutine
    L3_85 = L3_85.create
    L3_85 = L3_85(A1_83)
    _UPVALUE0_(L3_85, L2_84)
  end
  return L2_84
end
function L10_10(A0_86)
  _UPVALUE0_(_UPVALUE1_:pop(A0_86), A0_86)
end
function L11_11(A0_87)
  _UPVALUE0_(_UPVALUE1_:pop(A0_87), A0_87)
end
function L12_12(A0_88, A1_89, A2_90)
  A0_88:settimeout(A2_90 or 0.1)
  _UPVALUE0_[A0_88] = A1_89
  _UPVALUE1_:insert(A0_88)
end
addserver = L12_12
function L12_12(A0_91, ...)
  local L2_93
  L2_93 = coroutine
  L2_93 = L2_93.create
  L2_93 = L2_93(A0_91)
  _UPVALUE0_(L2_93, nil, unpack(L1_92))
end
addthread = L12_12
L12_12 = {}
function L13_13(A0_94)
  local L1_95
  L1_95 = _UPVALUE0_
  A0_94.def_tick = L1_95
  L1_95 = _UPVALUE1_
  L1_95[A0_94] = true
end
function L14_14(A0_96)
  local L1_97
  L1_97 = _UPVALUE0_
  A0_96.def_tick = L1_97
  L1_97 = _UPVALUE1_
  L1_97[A0_96] = true
end
function L15_15()
  local L0_98, L1_99
  L0_98 = next
  L1_99 = _UPVALUE0_
  return L0_98, L1_99
end
L16_16 = {}
function L17_17(A0_100)
  local L2_101
  L2_101 = 0
  return function()
    local L0_102
    L0_102 = _UPVALUE0_
    L0_102 = L0_102 + 1
    _UPVALUE0_ = L0_102
    L0_102 = _UPVALUE1_
    L0_102 = L0_102._evs
    L0_102 = L0_102[_UPVALUE0_]
    return L0_102
  end
end
L16_16.events = L17_17
function L17_17(A0_103, A1_104)
  local L2_105
  L2_105 = _UPVALUE0_
  L2_105 = L2_105[A1_104]
  if L2_105 then
    A1_104 = _UPVALUE1_(A1_104, L2_105)
  else
    _UPVALUE2_:remove(A1_104)
    A0_103.def_tick(A1_104)
  end
end
L16_16.tick = L17_17
L17_17 = L13_13
L17_17(L16_16)
L17_17 = {}
function L17_17.events(A0_106)
  local L2_107
  L2_107 = 0
  return function()
    local L0_108
    L0_108 = _UPVALUE0_
    L0_108 = L0_108 + 1
    _UPVALUE0_ = L0_108
    L0_108 = _UPVALUE1_
    L0_108 = L0_108._evs
    L0_108 = L0_108[_UPVALUE0_]
    return L0_108
  end
end
function L17_17.tick(A0_109, A1_110)
  _UPVALUE0_:remove(A1_110)
  A0_109.def_tick(A1_110)
end
L14_14(L17_17)
function step(A0_111)
  local L1_112, L2_113, L3_114, L4_115, L5_116, L6_117, L7_118, L8_119, L9_120
  L1_112 = _UPVALUE0_
  L1_112 = L1_112(L2_113)
  if L1_112 == "timeout" then
    return
  end
  if L1_112 then
    L2_113(L3_114)
  end
  for L5_116 in L2_113() do
    for L9_120 in L6_117(L7_118) do
      L5_116:tick(L9_120)
    end
  end
end
function loop(A0_121)
  while true do
    step(A0_121)
  end
end
