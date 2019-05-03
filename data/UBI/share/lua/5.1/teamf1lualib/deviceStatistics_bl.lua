local L0_0
L0_0 = module
L0_0("com.teamf1.bl.deviceStatistics", package.seeall)
L0_0 = require
L0_0("teamf1lualib/db")
L0_0 = require
L0_0("teamf1lualib/util")
L0_0 = require
L0_0("teamf1lualib/validations")
L0_0 = require
L0_0("teamf1lualib/returnCodes")
L0_0 = require
L0_0("teamf1lualib/statistics_traffic")
L0_0 = require
L0_0("teamf1lualib/management_config")
L0_0 = require
L0_0 = L0_0("com.teamf1.core.config")
function deviceStatisticsSectionGetAll()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = {}
  L1_2 = {}
  L2_3 = {}
  L3_4 = {}
  L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12 = nil, nil, nil, nil, nil, nil, nil, nil
  L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11 = _UPVALUE0_.DedicatedinterfaceStatsGet()
  if L4_5 ~= _UPVALUE1_.SUCCESS then
    return L4_5
  end
  L0_1.tx_packets = L5_6
  L0_1.rx_packets = L6_7
  L0_1.collisions = L7_8
  L0_1.tx_bytes_rate = L8_9
  L0_1.rx_bytes_rate = L9_10
  L0_1.wanUptime = L10_11
  L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11 = _UPVALUE0_.laninterfaceStatsGet()
  if L4_5 ~= _UPVALUE1_.SUCCESS then
    return L4_5
  end
  L1_2.tx_packets = L5_6
  L1_2.rx_packets = L6_7
  L1_2.collisions = L7_8
  L1_2.tx_bytes_rate = L8_9
  L1_2.rx_bytes_rate = L9_10
  L1_2.wanUptime = L10_11
  L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12 = _UPVALUE0_.configurablePortStatsGet()
  if L4_5 ~= _UPVALUE1_.SUCCESS then
    return L4_5
  end
  L2_3.tx_packets = L5_6
  L2_3.rx_packets = L6_7
  L2_3.collisions = L7_8
  L2_3.tx_bytes_rate = L8_9
  L2_3.rx_bytes_rate = L9_10
  L2_3.wanUptime = L10_11
  L2_3.interfaceName = L11_12
  L4_5, L3_4 = _UPVALUE0_.vlanPortStatsGet()
  return _UPVALUE1_.SUCCESS, L0_1, L2_3, L1_2, L3_4
end
function configPortUsageGet()
  return (_UPVALUE0_.configurablePortUsageGet())
end
