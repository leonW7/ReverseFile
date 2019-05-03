local L0_0
L0_0 = require
L0_0 = L0_0("lfs")
module("cgilua.session")
function delete(A0_1)
  local L1_2
  L1_2 = _UPVALUE0_
  L1_2(_UPVALUE1_(A0_1))
  L1_2 = _UPVALUE2_
  L1_2(_UPVALUE3_(A0_1))
end
function new()
  local L0_3
  L0_3 = _UPVALUE0_
  L0_3 = L0_3()
  if _UPVALUE1_(L0_3 .. ".lua") then
    repeat
      L0_3 = _UPVALUE0_(L0_3)
    until not _UPVALUE1_(L0_3 .. ".lua")
    _UPVALUE2_(_UPVALUE3_(L0_3, 999999999))
  end
  return L0_3
end
function setidgenerator(A0_4)
  if _UPVALUE0_(A0_4) == "function" then
    _UPVALUE1_ = A0_4
  end
end
function load(A0_5)
  local L1_6, L2_7
  L1_6 = _UPVALUE0_
  L2_7 = _UPVALUE1_
  L2_7 = L2_7(A0_5)
  L1_6(L2_7, L2_7(A0_5))
  L1_6 = _UPVALUE2_
  L2_7 = _UPVALUE3_
  L2_7 = L2_7(A0_5)
  L2_7 = L1_6(L2_7, L2_7(A0_5))
  if not L1_6 then
    return nil, L2_7
  else
    return L1_6()
  end
end
function save(A0_8, A1_9)
  local L2_10
  L2_10 = _UPVALUE0_
  L2_10(_UPVALUE1_(A0_8))
  L2_10 = _UPVALUE0_
  L2_10 = L2_10(_UPVALUE2_(_UPVALUE3_(A0_8), "w+"))
  L2_10:write("return ")
  _UPVALUE4_(A1_9, function(A0_11)
    _UPVALUE0_:write(A0_11)
  end)
  L2_10:close()
end
function cleanup()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18
  L0_12 = {}
  L1_13 = _UPVALUE0_
  L1_13 = L1_13()
  for L5_17 in L2_14(L3_15) do
    L6_18 = _UPVALUE3_
    L6_18 = L6_18(_UPVALUE2_ .. "/" .. L5_17)
    if L6_18 and L6_18.mode == "file" and L1_13 > L6_18.modification + _UPVALUE4_ then
      _UPVALUE5_(L0_12, L5_17)
    end
  end
  for L5_17, L6_18 in L2_14(L3_15) do
    _UPVALUE7_(_UPVALUE2_ .. "/" .. L6_18)
  end
end
function setsessiontimeout(A0_19)
  if _UPVALUE0_(A0_19) == "number" then
    _UPVALUE1_ = A0_19
  end
end
function setsessiondir(A0_20)
  local L1_21, L2_22, L3_23
  L1_21 = _UPVALUE0_
  L2_22 = A0_20
  L3_23 = "[/\\]$"
  L1_21 = L1_21(L2_22, L3_23, "")
  A0_20 = L1_21
  L1_21 = _UPVALUE1_
  L2_22 = A0_20
  L3_23 = "mode"
  L1_21 = L1_21(L2_22, L3_23)
  if not L1_21 then
    L1_21 = _UPVALUE2_
    L2_22 = _UPVALUE3_
    L3_23 = A0_20
    L3_23 = L2_22(L3_23)
    L1_21(L2_22, L3_23, L2_22(L3_23))
  end
  L1_21 = A0_20
  L2_22 = "/test"
  L1_21 = L1_21 .. L2_22
  L2_22 = _UPVALUE4_
  L3_23 = L1_21
  L3_23 = L2_22(L3_23, "w")
  if not L2_22 then
    _UPVALUE5_("Could not open a file in session directory: " .. _UPVALUE6_(L3_23), 2)
  end
  L2_22:close()
  _UPVALUE7_(L1_21)
  _UPVALUE8_ = A0_20
end
function open()
  local L0_24
  L0_24 = _UPVALUE0_
  L0_24 = L0_24.cgilua
  L0_24 = L0_24.mkurlpath
  function _UPVALUE0_.cgilua.mkurlpath(A0_25, A1_26)
    A1_26 = A1_26 or {}
    A1_26[_UPVALUE0_] = _UPVALUE1_
    return _UPVALUE2_(A0_25, A1_26)
  end
  function _M.destroy()
    _M.data = {}
    _M.delete(_UPVALUE0_)
  end
  cleanup()
  _UPVALUE2_ = _UPVALUE0_.cgi[_UPVALUE1_] or new()
  if _UPVALUE2_ then
    _UPVALUE0_.cgi[_UPVALUE1_] = nil
    _UPVALUE0_.cgilua.session.data = load(_UPVALUE2_) or {}
  end
end
function close()
  if _UPVALUE0_(_UPVALUE1_.cgilua.session.data) then
    save(_UPVALUE2_, _UPVALUE1_.cgilua.session.data)
    _UPVALUE2_ = nil
  end
end
