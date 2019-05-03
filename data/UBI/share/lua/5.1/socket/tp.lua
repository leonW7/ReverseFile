local L0_0
L0_0 = _G
module("socket.tp")
TIMEOUT = 60
;({
  __index = {}
}).__index.check = function(A0_1, A1_2)
  local L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9
  L2_3 = _UPVALUE0_
  L3_4 = A0_1.c
  L3_4 = L2_3(L3_4)
  if not L2_3 then
    return L4_5, L5_6
  end
  if L4_5 ~= "function" then
    if L4_5 == "table" then
      for L7_8, L8_9 in L4_5(L5_6) do
        if _UPVALUE2_.find(L2_3, L8_9) then
          return _UPVALUE1_.tonumber(L2_3), L3_4
        end
      end
      return L4_5, L5_6
    elseif L4_5 then
      return L4_5, L5_6
    else
      return L4_5, L5_6
    end
  else
    return L4_5(L5_6, L6_7)
  end
end
;({
  __index = {}
}).__index.command = function(A0_10, A1_11, A2_12)
  if A2_12 then
    return A0_10.c:send(A1_11 .. " " .. A2_12 .. "\r\n")
  else
    return A0_10.c:send(A1_11 .. "\r\n")
  end
end
;({
  __index = {}
}).__index.sink = function(A0_13, A1_14, A2_15)
  local L3_16, L4_17, L5_18, L6_19
  L3_16 = c
  L4_17 = L3_16
  L3_16 = L3_16.receive
  L5_18 = A2_15
  L4_17 = L3_16(L4_17, L5_18)
  L5_18 = A1_14
  L6_19 = L3_16
  return L5_18(L6_19, L4_17)
end
;({
  __index = {}
}).__index.send = function(A0_20, A1_21)
  return A0_20.c:send(A1_21)
end
;({
  __index = {}
}).__index.receive = function(A0_22, A1_23)
  return A0_22.c:receive(A1_23)
end
;({
  __index = {}
}).__index.getfd = function(A0_24)
  return A0_24.c:getfd()
end
;({
  __index = {}
}).__index.dirty = function(A0_25)
  return A0_25.c:dirty()
end
;({
  __index = {}
}).__index.getcontrol = function(A0_26)
  local L1_27
  L1_27 = A0_26.c
  return L1_27
end
;({
  __index = {}
}).__index.source = function(A0_28, A1_29, A2_30)
  local L3_31, L4_32, L5_33
  L3_31 = _UPVALUE0_
  L3_31 = L3_31.sink
  L4_32 = "keep-open"
  L5_33 = A0_28.c
  L3_31 = L3_31(L4_32, L5_33)
  L4_32 = _UPVALUE1_
  L4_32 = L4_32.pump
  L4_32 = L4_32.all
  L5_33 = A1_29
  L5_33 = L4_32(L5_33, L3_31, A2_30 or _UPVALUE1_.pump.step)
  return L4_32, L5_33
end
;({
  __index = {}
}).__index.close = function(A0_34)
  A0_34.c:close()
  return 1
end
function connect(A0_35, A1_36, A2_37, A3_38)
  local L4_39, L5_40, L6_41, L7_42
  L4_39 = A3_38 or L4_39.tcp
  L5_40 = L4_39()
  if not L4_39 then
    L6_41 = nil
    L7_42 = L5_40
    return L6_41, L7_42
  end
  L7_42 = L4_39
  L6_41 = L4_39.settimeout
  L6_41(L7_42, A2_37 or TIMEOUT)
  L7_42 = L4_39
  L6_41 = L4_39.connect
  L7_42 = L6_41(L7_42, A0_35, A1_36)
  if not L6_41 then
    L4_39:close()
    return nil, L7_42
  end
  return _UPVALUE1_.setmetatable({c = L4_39}, _UPVALUE2_)
end
