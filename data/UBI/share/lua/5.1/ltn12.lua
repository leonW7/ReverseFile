local L0_0
L0_0 = require
L0_0 = L0_0("string")
module("ltn12")
filter = {}
source = {}
sink = {}
pump = {}
BLOCKSIZE = 2048
_VERSION = "LTN12 1.0.1"
function filter.cycle(A0_1, A1_2, A2_3)
  _UPVALUE0_.assert(A0_1)
  return function(A0_4)
    local L1_5
    L1_5, _UPVALUE0_ = _UPVALUE1_(_UPVALUE0_, A0_4, _UPVALUE2_)
    return L1_5
  end
end
function filter.chain(...)
  return function(A0_7)
    _UPVALUE0_ = A0_7 and _UPVALUE0_
    while true do
      if _UPVALUE1_ == _UPVALUE2_ then
        A0_7 = _UPVALUE3_[_UPVALUE1_](A0_7)
        if A0_7 == "" or _UPVALUE2_ == _UPVALUE4_ then
          return A0_7
        elseif A0_7 then
          _UPVALUE1_ = _UPVALUE1_ + 1
        else
          _UPVALUE2_ = _UPVALUE2_ + 1
          _UPVALUE1_ = _UPVALUE2_
        end
      else
        A0_7 = _UPVALUE3_[_UPVALUE1_](A0_7 or "")
        if A0_7 == "" then
          _UPVALUE1_ = _UPVALUE1_ - 1
          A0_7 = _UPVALUE0_
        elseif A0_7 then
          if _UPVALUE1_ == _UPVALUE4_ then
            return A0_7
          else
            _UPVALUE1_ = _UPVALUE1_ + 1
          end
        else
          _UPVALUE5_.error("filter returned inappropriate nil")
        end
      end
    end
  end
end
function source.empty()
  local L0_8, L1_9
  L0_8 = _UPVALUE0_
  return L0_8
end
function source.error(A0_10)
  local L1_11
  function L1_11()
    local L0_12, L1_13
    L1_13 = _UPVALUE0_
    return L0_12, L1_13
  end
  return L1_11
end
function source.file(A0_14, A1_15)
  if A0_14 then
    return function()
      if not _UPVALUE0_:read(BLOCKSIZE) then
        _UPVALUE0_:close()
      end
      return (_UPVALUE0_:read(BLOCKSIZE))
    end
  else
    return source.error(A1_15 or "unable to open file")
  end
end
function source.simplify(A0_16)
  _UPVALUE0_.assert(A0_16)
  return function()
    local L0_17, L1_18
    L0_17 = _UPVALUE0_
    L1_18 = L0_17()
    _UPVALUE0_ = L1_18 or _UPVALUE0_
    if not L0_17 then
      return nil, L1_18
    else
      return L0_17
    end
  end
end
function source.string(A0_19)
  if A0_19 then
    return function()
      _UPVALUE2_ = _UPVALUE2_ + BLOCKSIZE
      if _UPVALUE0_.sub(_UPVALUE1_, _UPVALUE2_, _UPVALUE2_ + BLOCKSIZE - 1) ~= "" then
        return (_UPVALUE0_.sub(_UPVALUE1_, _UPVALUE2_, _UPVALUE2_ + BLOCKSIZE - 1))
      else
        return nil
      end
    end
  else
    return source.empty()
  end
end
function source.rewind(A0_20)
  _UPVALUE0_.assert(A0_20)
  return function(A0_21)
    if not A0_21 then
      A0_21 = _UPVALUE0_.remove(_UPVALUE1_)
      if not A0_21 then
        return _UPVALUE2_()
      else
        return A0_21
      end
    else
      _UPVALUE0_.insert(_UPVALUE1_, A0_21)
    end
  end
end
function source.chain(A0_22, A1_23)
  _UPVALUE0_.assert(A0_22 and A1_23)
  return function()
    if not _UPVALUE0_ then
      _UPVALUE1_.error("source is empty!", 2)
    end
    while true do
      if _UPVALUE2_ == "feeding" then
        _UPVALUE3_, _UPVALUE4_ = _UPVALUE5_()
        if _UPVALUE4_ then
          return nil, _UPVALUE4_
        end
        _UPVALUE0_ = _UPVALUE6_(_UPVALUE3_)
        if not _UPVALUE0_ then
          if _UPVALUE3_ then
            _UPVALUE1_.error("filter returned inappropriate nil")
          else
            return nil
          end
        elseif _UPVALUE0_ ~= "" then
          _UPVALUE2_ = "eating"
          if _UPVALUE3_ then
            _UPVALUE3_ = ""
          end
          return _UPVALUE0_
        end
      else
        _UPVALUE0_ = _UPVALUE6_(_UPVALUE3_)
        if _UPVALUE0_ == "" then
          if _UPVALUE3_ == "" then
            _UPVALUE2_ = "feeding"
          else
            _UPVALUE1_.error("filter returned \"\"")
          end
        elseif not _UPVALUE0_ then
          if _UPVALUE3_ then
            _UPVALUE1_.error("filter returned inappropriate nil")
          else
            return nil
          end
        else
          return _UPVALUE0_
        end
      end
    end
  end
end
function source.cat(...)
  return function()
    local L0_25, L1_26
    while true do
      L0_25 = _UPVALUE0_
      if L0_25 then
        L0_25 = _UPVALUE0_
        L1_26 = L0_25()
        if L0_25 then
          return L0_25
        end
        if L1_26 then
          return nil, L1_26
        end
        _UPVALUE0_ = _UPVALUE1_.remove(_UPVALUE2_, 1)
      end
    end
  end
end
function sink.table(A0_27)
  local L1_28, L2_29, L3_30
  if not A0_27 then
    L1_28 = {}
    A0_27 = L1_28
  end
  function L1_28(A0_31, A1_32)
    if A0_31 then
      _UPVALUE0_.insert(_UPVALUE1_, A0_31)
    end
    return 1
  end
  L2_29 = L1_28
  L3_30 = A0_27
  return L2_29, L3_30
end
function sink.simplify(A0_33)
  _UPVALUE0_.assert(A0_33)
  return function(A0_34, A1_35)
    local L2_36, L3_37
    L2_36 = _UPVALUE0_
    L3_37 = A0_34
    L3_37 = L2_36(L3_37, A1_35)
    if not L2_36 then
      return nil, L3_37
    end
    _UPVALUE0_ = L3_37 or _UPVALUE0_
    return 1
  end
end
function sink.file(A0_38, A1_39)
  if A0_38 then
    return function(A0_40, A1_41)
      if not A0_40 then
        _UPVALUE0_:close()
        return 1
      else
        return _UPVALUE0_:write(A0_40)
      end
    end
  else
    return sink.error(A1_39 or "unable to open file")
  end
end
function sink.null()
  local L0_42, L1_43
  L0_42 = _UPVALUE0_
  return L0_42
end
function sink.error(A0_44)
  local L1_45
  function L1_45()
    local L0_46, L1_47
    L1_47 = _UPVALUE0_
    return L0_46, L1_47
  end
  return L1_45
end
function sink.chain(A0_48, A1_49)
  _UPVALUE0_.assert(A0_48 and A1_49)
  return function(A0_50, A1_51)
    local L2_52, L3_53, L4_54, L5_55
    if A0_50 ~= "" then
      L2_52 = _UPVALUE0_
      L3_53 = A0_50
      L2_52 = L2_52(L3_53)
      L3_53 = A0_50 and ""
      while true do
        L4_54 = _UPVALUE1_
        L5_55 = L2_52
        L5_55 = L4_54(L5_55, A1_51)
        if not L4_54 then
          return nil, L5_55
        end
        if L2_52 == L3_53 then
          return 1
        end
        L2_52 = _UPVALUE0_(L3_53)
      end
    else
      L2_52 = 1
      return L2_52
    end
  end
end
function pump.step(A0_56, A1_57)
  local L2_58, L3_59, L4_60, L5_61
  L2_58 = A0_56
  L3_59 = L2_58()
  L4_60 = A1_57
  L5_61 = L2_58
  L5_61 = L4_60(L5_61, L3_59)
  if L2_58 and L4_60 then
    return 1
  else
    return nil, L3_59 or L5_61
  end
end
function pump.all(A0_62, A1_63, A2_64)
  local L3_65, L4_66
  L3_65 = _UPVALUE0_
  L3_65 = L3_65.assert
  L4_66 = A0_62 and A1_63
  L3_65(L4_66)
  if not A2_64 then
    L3_65 = pump
    A2_64 = L3_65.step
  end
  while true do
    L3_65 = A2_64
    L4_66 = A0_62
    L4_66 = L3_65(L4_66, A1_63)
    if not L3_65 then
      if L4_66 then
        return nil, L4_66
      else
        return 1
      end
    end
  end
end
