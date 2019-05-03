local L0_0, L1_1, L2_2, L3_3
L0_0 = require
L1_1 = "string"
L0_0 = L0_0(L1_1)
L1_1 = _G
L2_2 = require
L3_3 = "table"
L2_2 = L2_2(L3_3)
L3_3 = module
L3_3("socket.url")
L3_3 = "URL 1.0.1"
_VERSION = L3_3
function L3_3(A0_4)
  return _UPVALUE0_.gsub(A0_4, "([^A-Za-z0-9_])", function(A0_5)
    local L2_6
    L2_6 = _UPVALUE0_
    L2_6 = L2_6.format
    return L2_6("%%%02x", _UPVALUE0_.byte(A0_5))
  end)
end
escape = L3_3
function L3_3(A0_7)
  for _FORV_5_, _FORV_6_ in _UPVALUE0_.ipairs(A0_7) do
    ({})[A0_7[_FORV_5_]] = 1
  end
  return {}
end
function unescape(A0_8)
  return _UPVALUE0_.gsub(A0_8, "%%(%x%x)", function(A0_9)
    return _UPVALUE0_.char(_UPVALUE1_.tonumber(A0_9, 16))
  end)
end
function parse(A0_10, A1_11)
  local L2_12, L3_13, L4_14
  L2_12 = {}
  L4_14 = A1_11 or L2_12
  for _FORV_6_, _FORV_7_ in L3_13(L4_14) do
    L2_12[_FORV_6_] = _FORV_7_
  end
  if not A0_10 or A0_10 == "" then
    return L3_13, L4_14
  end
  A0_10 = L3_13
  A0_10 = L3_13
  A0_10 = L3_13
  A0_10 = L3_13
  A0_10 = L3_13
  if A0_10 ~= "" then
    L2_12.path = A0_10
  end
  if not L3_13 then
    return L2_12
  end
  if L3_13 ~= "" then
    L2_12.host = L3_13
  end
  if not L4_14 then
    return L2_12
  end
  L2_12.user = L4_14
  return L2_12
end
function build(A0_15)
  local L1_16, L2_17, L3_18, L4_19
  L1_16 = parse_path
  L2_17 = A0_15.path
  L2_17 = L2_17 or ""
  L1_16 = L1_16(L2_17)
  L2_17 = build_path
  L3_18 = L1_16
  L2_17 = L2_17(L3_18)
  L3_18 = A0_15.params
  if L3_18 then
    L3_18 = L2_17
    L4_19 = ";"
    L2_17 = L3_18 .. L4_19 .. A0_15.params
  end
  L3_18 = A0_15.query
  if L3_18 then
    L3_18 = L2_17
    L4_19 = "?"
    L2_17 = L3_18 .. L4_19 .. A0_15.query
  end
  L3_18 = A0_15.authority
  L4_19 = A0_15.host
  if L4_19 then
    L3_18 = A0_15.host
    L4_19 = A0_15.port
    if L4_19 then
      L4_19 = L3_18
      L3_18 = L4_19 .. ":" .. A0_15.port
    end
    L4_19 = A0_15.userinfo
    if A0_15.user then
      L4_19 = A0_15.user
      if A0_15.password then
        L4_19 = L4_19 .. ":" .. A0_15.password
      end
    end
    if L4_19 then
      L3_18 = L4_19 .. "@" .. L3_18
    end
  end
  if L3_18 then
    L4_19 = "//"
    L2_17 = L4_19 .. L3_18 .. L2_17
  end
  L4_19 = A0_15.scheme
  if L4_19 then
    L4_19 = A0_15.scheme
    L2_17 = L4_19 .. ":" .. L2_17
  end
  L4_19 = A0_15.fragment
  if L4_19 then
    L4_19 = L2_17
    L2_17 = L4_19 .. "#" .. A0_15.fragment
  end
  return L2_17
end
function absolute(A0_20, A1_21)
  local L2_22
  L2_22 = _UPVALUE0_
  L2_22 = L2_22.type
  L2_22 = L2_22(A0_20)
  if L2_22 == "table" then
    base_parsed = A0_20
    L2_22 = build
    L2_22 = L2_22(base_parsed)
    A0_20 = L2_22
  else
    L2_22 = parse
    L2_22 = L2_22(A0_20)
    base_parsed = L2_22
  end
  L2_22 = parse
  L2_22 = L2_22(A1_21)
  if not base_parsed then
    return A1_21
  elseif not L2_22 then
    return A0_20
  elseif L2_22.scheme then
    return A1_21
  else
    L2_22.scheme = base_parsed.scheme
    if not L2_22.authority then
      L2_22.authority = base_parsed.authority
      if not L2_22.path then
        L2_22.path = base_parsed.path
        if not L2_22.params then
          L2_22.params = base_parsed.params
          if not L2_22.query then
            L2_22.query = base_parsed.query
          end
        end
      else
        L2_22.path = _UPVALUE1_(base_parsed.path or "", L2_22.path)
      end
    end
    return build(L2_22)
  end
end
function parse_path(A0_23)
  local L1_24
  L1_24 = {}
  A0_23 = A0_23 or ""
  _UPVALUE0_.gsub(A0_23, "([^/]+)", function(A0_25)
    _UPVALUE0_.insert(_UPVALUE1_, A0_25)
  end)
  for _FORV_5_ = 1, _UPVALUE1_.getn(L1_24) do
    L1_24[_FORV_5_] = unescape(L1_24[_FORV_5_])
  end
  if _FOR_.sub(A0_23, 1, 1) == "/" then
    L1_24.is_absolute = 1
  end
  if _UPVALUE0_.sub(A0_23, -1, -1) == "/" then
    L1_24.is_directory = 1
  end
  return L1_24
end
function build_path(A0_26, A1_27)
  local L2_28
  L2_28 = ""
  if A1_27 then
    for _FORV_7_ = 1, _UPVALUE0_.getn(A0_26) - 1 do
      L2_28 = L2_28 .. A0_26[_FORV_7_]
      L2_28 = L2_28 .. "/"
    end
    if _UPVALUE0_.getn(A0_26) > 0 then
      L2_28 = L2_28 .. A0_26[_UPVALUE0_.getn(A0_26)]
      if A0_26.is_directory then
        L2_28 = L2_28 .. "/"
      end
    end
  else
    for _FORV_7_ = 1, _UPVALUE0_.getn(A0_26) - 1 do
      L2_28 = L2_28 .. _UPVALUE1_(A0_26[_FORV_7_])
      L2_28 = L2_28 .. "/"
    end
    if _UPVALUE0_.getn(A0_26) > 0 then
      L2_28 = L2_28 .. _UPVALUE1_(A0_26[_UPVALUE0_.getn(A0_26)])
      if A0_26.is_directory then
        L2_28 = L2_28 .. "/"
      end
    end
  end
  if A0_26.is_absolute then
    L2_28 = "/" .. L2_28
  end
  return L2_28
end
