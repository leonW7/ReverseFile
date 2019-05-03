local L0_0
L0_0 = require
L0_0 = L0_0("socket")
module("socket.http")
TIMEOUT = 60
PORT = 80
USERAGENT = L0_0._VERSION
L0_0.sourcet["http-chunked"] = function(A0_1, A1_2)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function()
      local L0_3, L1_4, L2_5, L3_6, L4_7
      L0_3 = _UPVALUE0_
      L1_4 = L0_3
      L0_3 = L0_3.receive
      L1_4 = L0_3(L1_4)
      if L1_4 then
        L2_5 = nil
        L3_6 = L1_4
        return L2_5, L3_6
      end
      L2_5 = _UPVALUE1_
      L2_5 = L2_5.tonumber
      L3_6 = _UPVALUE2_
      L3_6 = L3_6.gsub
      L4_7 = L0_3
      L3_6 = L3_6(L4_7, ";.*", "")
      L4_7 = 16
      L2_5 = L2_5(L3_6, L4_7)
      if not L2_5 then
        L3_6 = nil
        L4_7 = "invalid chunk size"
        return L3_6, L4_7
      end
      if L2_5 > 0 then
        L3_6 = _UPVALUE0_
        L4_7 = L3_6
        L3_6 = L3_6.receive
        L4_7 = L3_6(L4_7, L2_5)
        if L3_6 then
          _UPVALUE0_:receive()
        end
        return L3_6, L4_7
      else
        L3_6 = _UPVALUE4_
        L4_7 = _UPVALUE0_
        L4_7 = L3_6(L4_7, _UPVALUE3_)
        L1_4 = L4_7
        _UPVALUE3_ = L3_6
        L3_6 = _UPVALUE3_
        if not L3_6 then
          L3_6 = nil
          L4_7 = L1_4
          return L3_6, L4_7
        end
      end
    end
  })
end
L0_0.sinkt["http-chunked"] = function(A0_8)
  return _UPVALUE0_.setmetatable({
    getfd = function()
      return _UPVALUE0_:getfd()
    end,
    dirty = function()
      return _UPVALUE0_:dirty()
    end
  }, {
    __call = function(A0_9, A1_10, A2_11)
      local L3_12
      if not A1_10 then
        L3_12 = _UPVALUE0_
        L3_12 = L3_12.send
        return L3_12(L3_12, "0\r\n\r\n")
      end
      L3_12 = _UPVALUE1_
      L3_12 = L3_12.format
      L3_12 = L3_12("%X\r\n", _UPVALUE1_.len(A1_10))
      return _UPVALUE0_:send(L3_12 .. A1_10 .. "\r\n")
    end
  })
end
function open(A0_13, A1_14, A2_15)
  _UPVALUE1_.setmetatable({
    c = _UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)()
  }, _UPVALUE2_).try = _UPVALUE0_.newtry(function()
    _UPVALUE0_:close()
  end)
  _UPVALUE1_.setmetatable({
    c = _UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)()
  }, _UPVALUE2_).try(_UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)():settimeout(TIMEOUT))
  _UPVALUE1_.setmetatable({
    c = _UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)()
  }, _UPVALUE2_).try(_UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)():connect(A0_13, A1_14 or PORT))
  return (_UPVALUE1_.setmetatable({
    c = _UPVALUE0_.try(A2_15 or _UPVALUE0_.tcp)()
  }, _UPVALUE2_))
end
;({
  __index = {}
}).__index.sendrequestline = function(A0_16, A1_17, A2_18)
  local L3_19
  L3_19 = _UPVALUE0_
  L3_19 = L3_19.format
  L3_19 = L3_19("%s %s HTTP/1.1\r\n", A1_17 or "GET", A2_18)
  return A0_16.try(A0_16.c:send(L3_19))
end
;({
  __index = {}
}).__index.sendheaders = function(A0_20, A1_21)
  local L2_22, L3_23, L4_24, L5_25, L6_26, L7_27
  L2_22 = "\r\n"
  for L6_26, L7_27 in L3_23(L4_24) do
    L2_22 = L6_26 .. ": " .. L7_27 .. "\r\n" .. L2_22
  end
  L6_26 = L2_22
  L7_27 = L4_24(L5_25, L6_26)
  L3_23(L4_24, L5_25, L6_26, L7_27, L4_24(L5_25, L6_26))
  return L3_23
end
;({
  __index = {}
}).__index.sendbody = function(A0_28, A1_29, A2_30, A3_31)
  local L4_32
  if not A2_30 then
    L4_32 = _UPVALUE0_
    L4_32 = L4_32.source
    L4_32 = L4_32.empty
    L4_32 = L4_32()
    A2_30 = L4_32
  end
  if not A3_31 then
    L4_32 = _UPVALUE0_
    L4_32 = L4_32.pump
    A3_31 = L4_32.step
  end
  L4_32 = "http-chunked"
  if A1_29["content-length"] then
    L4_32 = "keep-open"
  end
  return A0_28.try(_UPVALUE0_.pump.all(A2_30, _UPVALUE1_.sink(L4_32, A0_28.c), A3_31))
end
;({
  __index = {}
}).__index.receivestatusline = function(A0_33)
  local L1_34, L2_35
  L1_34 = A0_33.try
  L2_35 = A0_33.c
  L2_35 = L2_35.receive
  L2_35 = L2_35(L2_35)
  L1_34 = L1_34(L2_35, L2_35(L2_35))
  L2_35 = _UPVALUE0_
  L2_35 = L2_35.skip
  L2_35 = L2_35(2, _UPVALUE1_.find(L1_34, "HTTP/%d*%.%d* (%d%d%d)"))
  return A0_33.try(_UPVALUE2_.tonumber(L2_35), L1_34)
end
;({
  __index = {}
}).__index.receiveheaders = function(A0_36)
  local L1_37
  L1_37 = A0_36.try
  return L1_37(_UPVALUE0_(A0_36.c))
end
;({
  __index = {}
}).__index.receivebody = function(A0_38, A1_39, A2_40, A3_41)
  local L4_42, L5_43, L6_44
  if not A2_40 then
    L4_42 = _UPVALUE0_
    L4_42 = L4_42.sink
    L4_42 = L4_42.null
    L4_42 = L4_42()
    A2_40 = L4_42
  end
  if not A3_41 then
    L4_42 = _UPVALUE0_
    L4_42 = L4_42.pump
    A3_41 = L4_42.step
  end
  L4_42 = _UPVALUE1_
  L4_42 = L4_42.tonumber
  L5_43 = A1_39["content-length"]
  L4_42 = L4_42(L5_43)
  L5_43 = A1_39["transfer-encoding"]
  L6_44 = "default"
  if L5_43 and L5_43 ~= "identity" then
    L6_44 = "http-chunked"
  elseif _UPVALUE1_.tonumber(A1_39["content-length"]) then
    L6_44 = "by-length"
  end
  return A0_38.try(_UPVALUE0_.pump.all(_UPVALUE2_.source(L6_44, A0_38.c, L4_42), A2_40, A3_41))
end
;({
  __index = {}
}).__index.close = function(A0_45)
  return A0_45.c:close()
end
request = L0_0.protect(function(A0_46, A1_47)
  if _UPVALUE0_.type(A0_46) == "string" then
    return _UPVALUE1_(A0_46, A1_47)
  else
    return _UPVALUE2_(A0_46)
  end
end)
