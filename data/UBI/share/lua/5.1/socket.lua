local L0_0
L0_0 = _G
module("socket")
function connect(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6, L6_7, L7_8
  L4_5 = _UPVALUE0_
  L4_5 = L4_5.tcp
  L5_6 = L4_5()
  if not L4_5 then
    L6_7 = nil
    L7_8 = L5_6
    return L6_7, L7_8
  end
  if A2_3 then
    L7_8 = L4_5
    L6_7 = L4_5.bind
    L7_8 = L6_7(L7_8, A2_3, A3_4, -1)
    if not L6_7 then
      return nil, L7_8
    end
  end
  L7_8 = L4_5
  L6_7 = L4_5.connect
  L7_8 = L6_7(L7_8, A0_1, A1_2)
  if not L6_7 then
    return nil, L7_8
  end
  return L4_5
end
function bind(A0_9, A1_10, A2_11)
  local L3_12, L4_13, L5_14, L6_15
  L3_12 = _UPVALUE0_
  L3_12 = L3_12.tcp
  L4_13 = L3_12()
  if not L3_12 then
    L5_14 = nil
    L6_15 = L4_13
    return L5_14, L6_15
  end
  L6_15 = L3_12
  L5_14 = L3_12.setoption
  L5_14(L6_15, "reuseaddr", true)
  L6_15 = L3_12
  L5_14 = L3_12.bind
  L6_15 = L5_14(L6_15, A0_9, A1_10)
  if not L5_14 then
    return nil, L6_15
  end
  L5_14, L6_15 = L3_12:listen(A2_11)
  if not L5_14 then
    return nil, L6_15
  end
  return L3_12
end
try = newtry()
function choose(A0_16)
  local L1_17
  function L1_17(A0_18, A1_19, A2_20)
    local L3_21
    L3_21 = _UPVALUE0_
    L3_21 = L3_21.type
    L3_21 = L3_21(A0_18)
    if L3_21 ~= "string" then
      L3_21 = "default"
      A1_19, A2_20 = A0_18, A1_19
      A0_18 = L3_21
    end
    L3_21 = _UPVALUE1_
    L3_21 = L3_21[A0_18 or "nil"]
    if not L3_21 then
      _UPVALUE0_.error("unknown key (" .. _UPVALUE0_.tostring(A0_18) .. ")", 3)
    else
      return L3_21(A1_19, A2_20)
    end
  end
  return L1_17
end
sourcet = {}
sinkt = {}
BLOCKSIZE = 2048
sinkt["close-when-done"] = function(A0_22)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function(A0_23, A1_24, A2_25)
      if not A1_24 then
        _UPVALUE0_:close()
        return 1
      else
        return _UPVALUE0_:send(A1_24)
      end
    end
  })
end
sinkt["keep-open"] = function(A0_26)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function(A0_27, A1_28, A2_29)
      if A1_28 then
        return _UPVALUE0_:send(A1_28)
      else
        return 1
      end
    end
  })
end
sinkt.default = sinkt["keep-open"]
sink = choose(sinkt)
sourcet["by-length"] = function(A0_30, A1_31)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function()
      local L0_32, L1_33, L2_34
      L0_32 = _UPVALUE0_
      if L0_32 <= 0 then
        L0_32 = nil
        return L0_32
      end
      L0_32 = _UPVALUE1_
      L0_32 = L0_32.min
      L1_33 = _UPVALUE2_
      L1_33 = L1_33.BLOCKSIZE
      L2_34 = _UPVALUE0_
      L0_32 = L0_32(L1_33, L2_34)
      L1_33 = _UPVALUE3_
      L2_34 = L1_33
      L1_33 = L1_33.receive
      L2_34 = L1_33(L2_34, L0_32)
      if L2_34 then
        return nil, L2_34
      end
      _UPVALUE0_ = _UPVALUE0_ - _UPVALUE4_.len(L1_33)
      return L1_33
    end
  })
end
sourcet["until-closed"] = function(A0_35)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function()
      local L0_36, L1_37
      L0_36 = _UPVALUE0_
      if L0_36 then
        L0_36 = nil
        return L0_36
      end
      L0_36 = _UPVALUE1_
      L1_37 = L0_36
      L0_36 = L0_36.receive
      L1_37 = L0_36(L1_37, _UPVALUE2_.BLOCKSIZE)
      if not L1_37 then
        return L0_36
      elseif L1_37 == "closed" then
        _UPVALUE1_:close()
        _UPVALUE0_ = 1
        return L0_36(L1_37, _UPVALUE2_.BLOCKSIZE)
      else
        return nil, L1_37
      end
    end
  })
end
sourcet.default = sourcet["until-closed"]
source = choose(sourcet)
