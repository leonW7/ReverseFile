local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L27_27, L28_28, L29_29, L30_30
L0_0 = _G
L1_1 = SAPI
L2_2 = require
L3_3 = "cgilua.urlcode"
L2_2 = L2_2(L3_3)
L3_3 = require
L4_4 = "cgilua.lp"
L3_3 = L3_3(L4_4)
L4_4 = require
L5_5 = "cgilua.post"
L4_4 = L4_4(L5_5)
L5_5 = require
L6_6 = "lfs"
L5_5 = L5_5(L6_6)
L6_6 = require
L7_7 = "debug"
L6_6 = L6_6(L7_7)
L7_7 = assert
L8_8 = error
L9_9 = ipairs
L10_10 = type
L11_11 = xpcall
L12_12 = string
L12_12 = L12_12.gsub
L13_13 = string
L13_13 = L13_13.format
L14_14 = string
L14_14 = L14_14.find
L15_15 = string
L15_15 = L15_15.lower
L16_16 = string
L16_16 = L16_16.sub
L17_17 = tostring
L18_18 = io
L18_18 = L18_18.open
L19_19 = io
L19_19 = L19_19.close
L20_20 = table
L20_20 = L20_20.insert
L21_21 = table
L21_21 = L21_21.remove
L22_22 = os
L22_22 = L22_22.date
L23_23 = package
L23_23 = L23_23.seeall
L24_24 = L3_3.setoutfunc
L25_25 = "cgilua.put"
L24_24(L25_25)
L24_24 = L3_3.setcompatmode
L25_25 = true
L24_24(L25_25)
L24_24 = module
L25_25 = "cgilua"
L24_24(L25_25)
L24_24 = L6_6.traceback
L25_25 = L24_24
function L26_26(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  L1_32 = "defaultErrorOutput"
  L2_33 = _UPVALUE0_
  L3_34 = A0_31
  L2_33 = L2_33(L3_34)
  if L2_33 ~= "string" then
    L2_33 = _UPVALUE0_
    L3_34 = A0_31
    L2_33 = L2_33(L3_34)
    if L2_33 ~= "number" then
      L2_33 = _UPVALUE1_
      L3_34 = "bad argument #1 to 'error' (string expected, got %s)"
      L4_35 = _UPVALUE0_
      L4_35 = L4_35(A0_31)
      L2_33 = L2_33(L3_34, L4_35, L4_35(A0_31))
      A0_31 = L2_33
    end
  end
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = A0_31
  L2_33(L3_34)
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = " "
  L2_33(L3_34)
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = _UPVALUE2_
  L3_34 = L3_34.Request
  L3_34 = L3_34.servervariable
  L4_35 = "REMOTE_ADDR"
  L4_35 = L3_34(L4_35)
  L2_33(L3_34, L4_35, L3_34(L4_35))
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = " "
  L2_33(L3_34)
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = _UPVALUE3_
  L4_35 = L3_34()
  L2_33(L3_34, L4_35, L3_34())
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.errorlog
  L3_34 = "\n"
  L2_33(L3_34)
  L2_33 = _UPVALUE2_
  L2_33 = L2_33.Response
  L2_33 = L2_33.contenttype
  L3_34 = "text/html"
  L2_33(L3_34)
  L2_33 = _UPVALUE4_
  L2_33 = L2_33.cgi
  L2_33 = L2_33.page
  if L2_33 ~= nil then
    L2_33 = _UPVALUE4_
    L2_33 = L2_33.cgi
    L1_32 = L2_33.page
    L2_33 = _UPVALUE5_
    L3_34 = L1_32
    L4_35 = "%."
    L2_33 = L2_33(L3_34, L4_35, "_")
    L1_32 = L2_33
  end
  L2_33 = _UPVALUE6_
  L3_34 = "/var/criticalPageDebug/"
  L4_35 = L1_32
  L3_34 = L3_34 .. L4_35
  L4_35 = "w+"
  L2_33 = L2_33(L3_34, L4_35)
  if L2_33 then
    L4_35 = L2_33
    L3_34 = L2_33.write
    L3_34(L4_35, A0_31)
    L3_34 = _UPVALUE7_
    L4_35 = L2_33
    L3_34(L4_35)
  end
  L3_34 = _UPVALUE6_
  L4_35 = "/pfrm2.0/var/www/luaError.html"
  L3_34 = L3_34(L4_35)
  if L3_34 then
    L4_35 = L3_34.read
    L4_35 = L4_35(L3_34, "*a")
    _UPVALUE7_(L3_34)
    _UPVALUE2_.Response.write(L4_35)
  else
    L4_35 = _UPVALUE5_
    L4_35 = L4_35(_UPVALUE5_(A0_31, "\n", "<br>\n"), "\t", "&nbsp;&nbsp;")
    A0_31 = L4_35
    L4_35 = _UPVALUE2_
    L4_35 = L4_35.Response
    L4_35 = L4_35.write
    L4_35(A0_31)
  end
end
L27_27 = L26_26
L28_28 = 104857600
L29_29 = L28_28
L30_30 = 104857600
script_path = false
_COPYRIGHT = "Copyright (C) 2003-2006 Kepler Project"
_DESCRIPTION = "CGILua is a tool for creating dynamic Web pages and manipulating input data from forms"
_VERSION = "CGILua 5.0.1"
header = L1_1.Response.header
function contentheader(A0_36, A1_37)
  _UPVALUE0_.Response.contenttype(A0_36 .. "/" .. A1_37)
end
function htmlheader()
  _UPVALUE0_.Response.contenttype("text/html")
end
function redirect(A0_38, A1_39)
  local L2_40
  L2_40 = _UPVALUE0_
  L2_40 = L2_40(A0_38, "^https?:")
  if L2_40 then
    L2_40 = ""
    if A1_39 then
      L2_40 = "?" .. _UPVALUE1_.encodetable(A1_39)
    end
    return _UPVALUE2_.Response.redirect(A0_38 .. L2_40)
  else
    L2_40 = _UPVALUE2_
    L2_40 = L2_40.Response
    L2_40 = L2_40.redirect
    return L2_40(mkabsoluteurl(mkurlpath(A0_38, A1_39)))
  end
end
function relRedirect(A0_41, A1_42)
  local L2_43
  L2_43 = ""
  if A1_42 then
    L2_43 = "?" .. _UPVALUE0_.encodetable(A1_42)
  end
  return _UPVALUE1_.Response.redirect(A0_41 .. L2_43)
end
servervariable = L1_1.Request.servervariable
function errorlog(A0_44, A1_45)
  local L2_46
  L2_46 = _UPVALUE0_
  L2_46 = L2_46(A0_44)
  if L2_46 == "string" or L2_46 == "number" then
    _UPVALUE1_.Response.errorlog(A0_44, A1_45)
  else
    _UPVALUE2_("bad argument #1 to `cgilua.errorlog' (string expected, got " .. L2_46 .. ")", 2)
  end
end
function put(A0_47)
  local L1_48
  L1_48 = _UPVALUE0_
  L1_48 = L1_48(A0_47)
  if L1_48 == "string" or L1_48 == "number" then
    _UPVALUE1_.Response.write(A0_47)
  else
    _UPVALUE2_("bad argument #1 to `cgilua.put' (string expected, got " .. L1_48 .. ")", 2)
  end
end
function removeglobals(A0_49)
  for _FORV_4_, _FORV_5_ in _UPVALUE0_(A0_49) do
    if _UPVALUE1_(_UPVALUE2_[_FORV_5_]) ~= "function" then
      _UPVALUE2_[_FORV_5_] = nil
    else
      _UPVALUE2_[_FORV_5_] = function()
        _UPVALUE0_("Function '" .. _UPVALUE1_ .. "' is not allowed in CGILua scripts.")
      end
    end
  end
end
function doscript(A0_50)
  local L1_51, L2_52
  L1_51 = _UPVALUE0_
  L1_51 = L1_51.loadfile
  L2_52 = A0_50
  L2_52 = L1_51(L2_52)
  if not L1_51 then
    _UPVALUE1_(_UPVALUE2_([[
Cannot execute `%s'. Exiting.
%s]], A0_50, L2_52))
  else
    return L1_51()
  end
end
function doif(A0_53)
  local L1_54, L2_55
  if not A0_53 then
    return
  end
  L1_54 = _UPVALUE0_
  L2_55 = A0_53
  L2_55 = L1_54(L2_55)
  if not L1_54 then
    return nil, L2_55
  end
  L1_54:close()
  return doscript(A0_53)
end
function setmaxinput(A0_56)
  local L1_57
  _UPVALUE0_ = A0_56
end
function setmaxfilesize(A0_58)
  local L1_59
  _UPVALUE0_ = A0_58
end
function handlelp(A0_60)
  _UPVALUE0_()
  _UPVALUE1_.include(A0_60)
end
function buildplainhandler(A0_61, A1_62)
  local L2_63
  function L2_63(A0_64)
    local L1_65, L2_66
    L1_65 = contentheader
    L2_66 = _UPVALUE0_
    L1_65(L2_66, _UPVALUE1_)
    L1_65 = _UPVALUE2_
    L2_66 = _UPVALUE3_
    L2_66 = L2_66(A0_64)
    L1_65 = L1_65(L2_66, L2_66(A0_64))
    L2_66 = L1_65.read
    L2_66 = L2_66(L1_65, "*a")
    L1_65:close()
    put(L2_66)
  end
  return L2_63
end
function buildprocesshandler(A0_67, A1_68)
  local L2_69
  function L2_69(A0_70)
    contentheader(_UPVALUE0_, _UPVALUE1_)
    _UPVALUE2_.include(A0_70)
  end
  return L2_69
end
function mkurlpath(A0_71, A1_72)
  local L2_73
  L2_73 = ""
  if A1_72 then
    L2_73 = "?" .. _UPVALUE0_.encodetable(A1_72)
  end
  if _UPVALUE1_(A0_71, 1, 1) == "/" then
    return urlpath .. A0_71 .. L2_73
  else
    return urlpath .. script_vdir .. A0_71 .. L2_73
  end
end
function mkabsoluteurl(A0_74, A1_75)
  A1_75 = A1_75 or "http"
  if A0_74:sub(1, 1) ~= "/" then
    A0_74 = "/" .. A0_74
  end
  return _UPVALUE0_("%s://%s:%s%s", A1_75, servervariable("SERVER_NAME"), servervariable("SERVER_PORT"), A0_74)
end
function splitpath(A0_76)
  local L1_77, L2_78, L3_79, L4_80
  L1_77 = _UPVALUE0_
  L2_78 = A0_76
  L3_79 = "^(.-)([^:/\\]*)$"
  L4_80 = L1_77(L2_78, L3_79)
  return L3_79, L4_80
end
function addscripthandler(A0_81, A1_82)
  _UPVALUE0_(_UPVALUE1_(A0_81) == "string", "File extension must be a string")
  if _UPVALUE2_(A0_81, "%.", 1) then
    A0_81 = _UPVALUE3_(A0_81, 2)
  end
  A0_81 = _UPVALUE4_(A0_81)
  _UPVALUE0_(_UPVALUE1_(A1_82) == "function", "Handler must be a function")
  _UPVALUE5_[A0_81] = A1_82
end
function getscripthandler(A0_83)
  return _UPVALUE1_[_UPVALUE2_(_UPVALUE0_(A0_83, "%.([^.]+)$") or "")]
end
function handle(A0_84)
  local L1_85
  L1_85 = getscripthandler
  L1_85 = L1_85(A0_84)
  if not L1_85 then
    redirect("https://" .. _UPVALUE0_.Request.servervariable("SERVER_ADDR") .. ":" .. _UPVALUE0_.Request.servervariable("SERVER_PORT"))
  else
    return L1_85(A0_84)
  end
end
function seterrorhandler(A0_86)
  local L1_87
  L1_87 = _UPVALUE0_
  L1_87 = L1_87(A0_86)
  if L1_87 == "function" then
    _UPVALUE1_ = A0_86
  else
    _UPVALUE2_(_UPVALUE3_("Invalid type: expected `function', got `%s'", L1_87))
  end
end
function seterroroutput(A0_88)
  local L1_89
  L1_89 = _UPVALUE0_
  L1_89 = L1_89(A0_88)
  if L1_89 == "function" then
    _UPVALUE1_ = A0_88
  else
    _UPVALUE2_(_UPVALUE3_("Invalid type: expected `function', got `%s'", L1_89))
  end
end
function addclosefunction(A0_90)
  local L1_91
  L1_91 = _UPVALUE0_
  L1_91 = L1_91(A0_90)
  if L1_91 == "function" then
    _UPVALUE1_(_UPVALUE2_, A0_90)
  else
    _UPVALUE3_(_UPVALUE4_("Invalid type: expected `function', got `%s'", L1_91))
  end
end
function addopenfunction(A0_92)
  local L1_93
  L1_93 = _UPVALUE0_
  L1_93 = L1_93(A0_92)
  if L1_93 == "function" then
    _UPVALUE1_(_UPVALUE2_, A0_92)
  else
    _UPVALUE3_(_UPVALUE4_("Invalid type: expected `function', got `%s'", L1_93))
  end
end
function main()
  local L0_94
  L0_94 = addscripthandler
  L0_94("lua", doscript)
  L0_94 = addscripthandler
  L0_94("lp", handlelp)
  L0_94 = _UPVALUE0_
  L0_94(function()
    _UPVALUE0_.require("cgilua.config")
  end)
  L0_94 = removeglobals
  L0_94({
    "os.execute",
    "loadlib",
    "package",
    "debug"
  })
  L0_94 = _UPVALUE1_
  L0_94.package = {seeall = _UPVALUE2_}
  L0_94 = _UPVALUE1_
  L0_94.cgi = {}
  L0_94 = _UPVALUE0_
  L0_94(function()
    _UPVALUE0_(_UPVALUE1_.cgi)
  end)
  L0_94 = _UPVALUE4_
  L0_94 = L0_94.currentdir
  L0_94 = L0_94()
  _UPVALUE0_(function()
    _UPVALUE0_.chdir(script_pdir)
  end)
  _UPVALUE0_(_UPVALUE5_)
  _UPVALUE0_(_UPVALUE6_)
  _UPVALUE7_()
  _UPVALUE0_(function()
    _UPVALUE0_.chdir(_UPVALUE1_)
  end)
  if _UPVALUE0_(function()
    return handle(script_file)
  end) then
    return (_UPVALUE0_(function()
      return handle(script_file)
    end))
  end
end
