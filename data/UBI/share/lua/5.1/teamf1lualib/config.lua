require("teamf1lualib/util")
config = {}
function config.config(A0_0, A1_1, A2_2, A3_3)
  if db.typeAndRangeValidate(A1_1) and A3_3 == "edit" then
    return db.update(A0_0, A1_1, A2_2)
  end
  return false
end
function config.getChecksum(A0_4)
  local L1_5, L2_6
  L1_5 = io
  L1_5 = L1_5.popen
  L2_6 = "cat '"
  L2_6 = L2_6 .. A0_4 .. "' | grep -v 'checksum' | md5sum  | cut -d' ' -f1"
  L1_5 = L1_5(L2_6)
  L2_6 = L1_5.read
  L2_6 = L2_6(L1_5, "*a")
  L1_5:close()
  return string.gsub(L2_6, "\n", "")
end
function config.verifyChecksum(A0_7)
  if pcall(loadfile(A0_7)) then
    dofile(A0_7)
  else
    return nil
  end
  if util.getLuaVariable("systemConfig") ~= nil then
    if util.getLuaVariable("systemConfig")[1].checksum == config.getChecksum(A0_7) or util.getLuaVariable("systemConfig")[1].checksum == "0" then
      return "ok"
    else
      return nil
    end
  else
    return nil
  end
end
function config.updateChecksum(A0_8, A1_9)
  local L2_10, L3_11
  L2_10 = config
  L2_10 = L2_10.getChecksum
  L3_11 = A1_9
  L2_10 = L2_10(L3_11)
  L3_11 = A0_8.getAttribute
  L3_11 = L3_11("systemConfig", "systemConfig._ROWID_", 1, "checksum")
  os.execute("sed 's/systemConfig\\[1\\]\\[\"checksum\"\\] = \"" .. L3_11 .. "\"/systemConfig\\[1\\]\\[\"checksum\"\\] = \"" .. L2_10 .. "\"/' -i " .. SETTINGS_FILE)
end
function config.configConfigSupport(A0_12, A1_13, A2_14)
  local L3_15
  L3_15 = false
  if ACCESS_LEVEL ~= 0 then
    return "ACCESS_DENIED", "10187"
  end
  db.beginTransaction()
  L3_15 = config.config("ConfigSupport", A0_12, A1_13, A2_14)
  if L3_15 then
    db.commitTransaction(true)
    return "OK", "12265"
  else
    db.rollback()
    return "ERROR", "11481"
  end
end
function config.compareChecksum()
  local L0_16, L1_17, L2_18, L3_19, L4_20
  L2_18 = config
  L2_18 = L2_18.getChecksum
  L3_19 = SETTINGS_FILE
  L2_18 = L2_18(L3_19)
  L3_19 = io
  L3_19 = L3_19.open
  L4_20 = SETTINGS_FILE
  L3_19 = L3_19(L4_20, "r")
  if L3_19 ~= nil then
    L4_20 = 0
    value = L4_20
    while true do
      L4_20 = L3_19.read
      L4_20 = L4_20(L3_19, "*l")
      if L4_20 == nil then
        break
      end
      if string.find(L4_20, "checksum") then
        value = 1
        text = L4_20
        break
      end
    end
    L4_20 = value
    if L4_20 then
      L4_20 = string
      L4_20 = L4_20.match
      L4_20 = L4_20(text, "=.*$")
      L1_17 = L4_20
      L4_20 = string
      L4_20 = L4_20.match
      L4_20 = L4_20(L1_17, "[^=%s].*$")
      L1_17 = L4_20
      L4_20 = string
      L4_20 = L4_20.sub
      L4_20 = L4_20(L1_17, 2, -2)
      L1_17 = L4_20
    end
  end
  if L2_18 == L1_17 then
    L4_20 = 0
    return L4_20
  else
    L4_20 = 1
    return L4_20
  end
end
