local L0_0
L0_0 = require
L0_0("teamf1lualib/fwSchedules")
L0_0 = "ScheduleName"
fw.ul.schedules = {}
function fw.ul.schedules.delete(A0_1)
  local L1_2, L2_3, L3_4
  if A0_1 == NIL then
    return returnCodes.INVALID_ARGUMENT
  end
  L1_2 = db.existsRow(schedulesTables, _UPVALUE0_, A0_1)
  if not L1_2 then
    return returnCodes.COOKIEFAIL
  end
  L1_2 = firewallRowWhereExists("FirewallRules", "ScheduleName = '" .. A0_1 .. "'")
  if L1_2 then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE
  end
  L1_2 = firewallRowWhereExists("FirewallRules6", "ScheduleName = '" .. A0_1 .. "'")
  if L1_2 then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE
  end
  L1_2 = firewallRowWhereExists("sessionLimitProfiles", "scheduleProfile = '" .. A0_1 .. "'")
  if L1_2 then
    return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE_BY_SESSION_LIMIT
  end
  L3_4 = fw.core.schedules.delete(A0_1)
  return L3_4, A0_1
end
function fw.ul.schedules.deleteAll()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13
  L1_6 = fw
  L1_6 = L1_6.core
  L1_6 = L1_6.schedules
  L1_6 = L1_6.GetAll
  L2_7 = L1_6()
  if L1_6 ~= L3_8 then
    return L3_8
  end
  for L6_11, L7_12 in L3_8(L4_9) do
    L8_13 = firewallRowExists
    L8_13 = L8_13("FirewallRules", "ScheduleName", L7_12.ScheduleName)
    if L8_13 then
      return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE
    end
    L8_13 = firewallRowExists("FirewallRules6", "ScheduleName", L7_12.ScheduleName)
    if L8_13 then
      return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE
    end
    L8_13 = firewallRowExists("sessionLimitProfiles", "scheduleProfile", L7_12.ScheduleName)
    if L8_13 then
      return fwReturnCodes.COMP_FIREWALL_SCHEDULE_IN_USE_BY_SESSION_LIMIT
    end
  end
  L0_5 = L3_8
  return L0_5
end
