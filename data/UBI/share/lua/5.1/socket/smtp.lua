local L0_0
L0_0 = _G
module("socket.smtp")
TIMEOUT = 60
SERVER = "localhost"
PORT = 25
DOMAIN = require("os").getenv("SERVER_NAME") or "localhost"
ZONE = "-0000"
;({
  __index = {}
}).__index.greet = function(A0_1, A1_2)
  A0_1.try(A0_1.tp:check("2.."))
  A0_1.try(A0_1.tp:command("EHLO", A1_2 or DOMAIN))
  return _UPVALUE0_.skip(1, A0_1.try(A0_1.tp:check("2..")))
end
;({
  __index = {}
}).__index.mail = function(A0_3, A1_4)
  local L2_5
  L2_5 = A0_3.try
  L2_5(A0_3.tp:command("MAIL", "FROM:" .. A1_4))
  L2_5 = A0_3.try
  return L2_5(A0_3.tp:check("2.."))
end
;({
  __index = {}
}).__index.rcpt = function(A0_6, A1_7)
  local L2_8
  L2_8 = A0_6.try
  L2_8(A0_6.tp:command("RCPT", "TO:" .. A1_7))
  L2_8 = A0_6.try
  return L2_8(A0_6.tp:check("2.."))
end
;({
  __index = {}
}).__index.data = function(A0_9, A1_10, A2_11)
  local L3_12
  L3_12 = A0_9.try
  L3_12(A0_9.tp:command("DATA"))
  L3_12 = A0_9.try
  L3_12(A0_9.tp:check("3.."))
  L3_12 = A0_9.try
  L3_12(A0_9.tp:source(A1_10, A2_11))
  L3_12 = A0_9.try
  L3_12(A0_9.tp:send("\r\n.\r\n"))
  L3_12 = A0_9.try
  return L3_12(A0_9.tp:check("2.."))
end
;({
  __index = {}
}).__index.quit = function(A0_13)
  local L1_14
  L1_14 = A0_13.try
  L1_14(A0_13.tp:command("QUIT"))
  L1_14 = A0_13.try
  return L1_14(A0_13.tp:check("2.."))
end
;({
  __index = {}
}).__index.close = function(A0_15)
  return A0_15.tp:close()
end
;({
  __index = {}
}).__index.login = function(A0_16, A1_17, A2_18)
  local L3_19
  L3_19 = A0_16.try
  L3_19(A0_16.tp:command("AUTH", "LOGIN"))
  L3_19 = A0_16.try
  L3_19(A0_16.tp:check("3.."))
  L3_19 = A0_16.try
  L3_19(A0_16.tp:command(_UPVALUE0_.b64(A1_17)))
  L3_19 = A0_16.try
  L3_19(A0_16.tp:check("3.."))
  L3_19 = A0_16.try
  L3_19(A0_16.tp:command(_UPVALUE0_.b64(A2_18)))
  L3_19 = A0_16.try
  return L3_19(A0_16.tp:check("2.."))
end
;({
  __index = {}
}).__index.plain = function(A0_20, A1_21, A2_22)
  local L3_23
  L3_23 = "PLAIN "
  L3_23 = L3_23 .. _UPVALUE0_.b64("\000" .. A1_21 .. "\000" .. A2_22)
  A0_20.try(A0_20.tp:command("AUTH", L3_23))
  return A0_20.try(A0_20.tp:check("2.."))
end
;({
  __index = {}
}).__index.auth = function(A0_24, A1_25, A2_26, A3_27)
  if not A1_25 or not A2_26 then
    return 1
  end
  if _UPVALUE0_.find(A3_27, [[
AUTH[^
]+LOGIN]]) then
    return A0_24:login(A1_25, A2_26)
  elseif _UPVALUE0_.find(A3_27, [[
AUTH[^
]+PLAIN]]) then
    return A0_24:plain(A1_25, A2_26)
  else
    A0_24.try(nil, "authentication not supported")
  end
end
;({
  __index = {}
}).__index.send = function(A0_28, A1_29)
  local L2_30, L3_31, L4_32, L5_33, L6_34
  L2_30(L3_31, L4_32)
  if L2_30 == "table" then
    for L5_33, L6_34 in L2_30(L3_31) do
      A0_28:rcpt(L6_34)
    end
  else
    L2_30(L3_31, L4_32)
  end
  L5_33 = A1_29.source
  L6_34 = _UPVALUE2_
  L6_34 = L6_34.stuff
  L6_34 = L6_34()
  L5_33 = A1_29.step
  L2_30(L3_31, L4_32, L5_33)
end
function open(A0_35, A1_36, A2_37)
  local L3_38
  L3_38 = _UPVALUE0_
  L3_38 = L3_38.try
  L3_38 = L3_38(_UPVALUE1_.connect(A0_35 or SERVER, A1_36 or PORT, TIMEOUT, A2_37))
  _UPVALUE2_.setmetatable({tp = L3_38}, _UPVALUE3_).try = _UPVALUE0_.newtry(function()
    _UPVALUE0_:close()
  end)
  return (_UPVALUE2_.setmetatable({tp = L3_38}, _UPVALUE3_))
end
function message(A0_39)
  _UPVALUE0_(A0_39)
  return function()
    local L0_40, L1_41, L2_42
    L0_40 = _UPVALUE0_
    L0_40 = L0_40.resume
    L1_41 = _UPVALUE1_
    L2_42 = L0_40(L1_41)
    if L0_40 then
      return L1_41, L2_42
    else
      return nil, L1_41
    end
  end
end
send = require("socket").protect(function(A0_43)
  local L1_44, L2_45
  L1_44 = open
  L2_45 = A0_43.server
  L1_44 = L1_44(L2_45, A0_43.port, A0_43.create)
  L2_45 = L1_44.greet
  L2_45 = L2_45(L1_44, A0_43.domain)
  L1_44:auth(A0_43.user, A0_43.password, L2_45)
  L1_44:send(A0_43)
  L1_44:quit()
  return L1_44:close()
end)
