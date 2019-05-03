local L0_0
L0_0 = require
L0_0("teamf1lualib/login")
L0_0 = require
L0_0("teamf1lualib/errorMap")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.returnCodes")
web = {}
function web.goToPage(A0_1, A1_2, A2_3)
  local L3_4
  L3_4 = {"13256"}
  util.appendDebugOut("Wanting to go to page: " .. A0_1 .. "<br>")
  if A2_3 then
    ButtonType = nil
  end
  if A0_1 == "" or A0_1 == nil then
    A0_1 = PLATFORM_PAGE
  end
  if A1_2 then
    A0_1 = A0_1 .. ".html"
  end
  if A0_1 == PLATFORM_PAGE then
    cgilua.lp.include(HOME_PAGE)
  elseif A0_1 ~= nil and util.fileExists(A0_1) then
    if rebootFlag then
      util.appendDebugOut("Going to reboot page: " .. REBOOT_PAGE .. "<br>")
      cgilua.lp.include(REBOOT_PAGE)
    else
      if not util.fileExists("/tmp/bootComplete") and A2_3 and A0_1 ~= "dashboard.html" then
        statusErrorMessage = _UPVALUE0_.errorStringGet(_UPVALUE1_.ROUTER_INITIALIZING_AFTER_REBOOT)
      end
      util.appendDebugOut("Going to the page: " .. A0_1 .. "<br>")
      cgilua.lp.include(A0_1)
    end
  else
    cgilua.lp.include(HOME_PAGE)
  end
end
function web.runPage(A0_5)
  if cgi.page == PLATFORM_PAGE then
    cgilua.lp.include(HOME_PAGE)
  elseif A0_5 ~= nil and util.fileExists(A0_5) then
    dofile(A0_5)
  else
    cgilua.lp.include(HOME_PAGE)
  end
end
function web.includeFile(A0_6)
  cgilua.put(util.fileToString(A0_6))
end
function web.includeMenu(A0_7)
  cgilua.lp.include(A0_7)
end
function web.cgiToLuaTable(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16
  L1_9 = {}
  L2_10 = {}
  L3_11 = ""
  for L7_15, L8_16 in L4_12(L5_13) do
    L2_10 = util.split(L7_15, ".")
    if #L2_10 == 2 then
      if type(L8_16) == "table" and #L8_16 == 2 then
        L1_9[L2_10[1] .. "." .. L2_10[2]] = L8_16[1]
      elseif type(L8_16) == "table" and #L8_16 == 4 then
        L1_9[L2_10[1] .. "." .. L2_10[2]] = L8_16
      else
        L1_9[L2_10[1] .. "." .. L2_10[2]] = L8_16
      end
    end
  end
  return L1_9
end
function web.cgiFindButton(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25
  L1_18 = web
  L1_18 = L1_18.cgiSearch
  L2_19 = A0_17
  L3_20 = "button"
  L3_20 = L1_18(L2_19, L3_20)
  if L2_19 ~= nil then
    if L4_21 ~= "x" then
    elseif L4_21 == "y" then
      L4_21(L5_22, L6_23)
      L1_18 = L2_19[1]
      for L7_24, L8_25 in L4_21(L5_22) do
        if L7_24 ~= 1 then
          L1_18 = L1_18 .. "." .. L8_25
        end
      end
    end
  end
  return L4_21, L5_22, L6_23
end
function web.cgiSearch(A0_26, A1_27)
  local L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34
  L2_28 = {}
  L3_29 = {}
  for L7_33, L8_34 in L4_30(L5_31) do
    L2_28 = util.split(L7_33, ".")
    if #L2_28 >= 1 and L2_28[1] == A1_27 then
      if type(L8_34) == "table" then
        return L7_33, L2_28, L8_34
      else
        L3_29["1"] = L8_34
        return L7_33, L2_28, L3_29
      end
    end
  end
  return L4_30, L5_31, L6_32
end
function web.checkboxSelected(A0_35)
  local L1_36
  if A0_35 then
    L1_36 = "CHECKED"
    return L1_36
  else
    L1_36 = ""
    return L1_36
  end
end
function web.radioSelected(A0_37)
  local L1_38
  if A0_37 then
    L1_38 = "CHECKED"
    return L1_38
  else
    L1_38 = ""
    return L1_38
  end
end
function web.dropdownSelected(A0_39)
  local L1_40
  if A0_39 then
    L1_40 = "SELECTED"
    return L1_40
  else
    L1_40 = ""
    return L1_40
  end
end
function web.multiDropDownSelected(A0_41, A1_42)
  for _FORV_5_, _FORV_6_ in pairs(A0_41) do
    if _FORV_6_ == A1_42 then
      return "SELECTED"
    end
  end
  return ""
end
function web.inputDisabled(A0_43)
  local L1_44
  if A0_43 then
    L1_44 = "DISABLED"
    return L1_44
  else
    L1_44 = ""
    return L1_44
  end
end
function web.getArgsFromIndex(A0_45, A1_46, A2_47, A3_48, A4_49)
  if A0_45 == "0" then
    return A1_46
  elseif A0_45 == "1" then
    return A2_47
  elseif A0_45 == "2" then
    return A3_48
  elseif A0_45 == "3" then
    return A4_49
  end
end
function web.download(A0_50, A1_51)
  cgilua.cookies.set("TeamF1Download", "started")
  cgilua.header("Content-type", "application/octet-stream;")
  cgilua.header("Content-disposition", "attachment; filename=" .. A1_51)
  cgilua.put("\n" .. util.fileToString(A0_50))
end
