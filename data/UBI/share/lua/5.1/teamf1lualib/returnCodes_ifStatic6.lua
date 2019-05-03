module("com.teamf1.core.ipv6.ifStatic6.returnCodes", package.seeall)
WAN_IFSTATIC_IPV6ADDR_IS_NIL = 1677721601
WAN_IFSTATIC_INVALID_IPV6ADDR = WAN_IFSTATIC_IPV6ADDR_IS_NIL + 1
WAN_IFSTATIC_GW_NIL = WAN_IFSTATIC_INVALID_IPV6ADDR + 1
WAN_IFSTATIC_INVALID_GW = WAN_IFSTATIC_GW_NIL + 1
WAN_IFSTATIC_PREFIXLENGTH_NIL = WAN_IFSTATIC_INVALID_GW + 1
WAN_IFSTATIC_INVALID_PREFIXLENGTH = WAN_IFSTATIC_PREFIXLENGTH_NIL + 1
WAN_IFSTATIC_PRI_DNS_NIL = WAN_IFSTATIC_INVALID_PREFIXLENGTH + 1
WAN_IFSTATIC_INVALID_PRI_DNS = WAN_IFSTATIC_PRI_DNS_NIL + 1
WAN_IFSTATIC_SEC_DNS_NIL = WAN_IFSTATIC_INVALID_PRI_DNS + 1
WAN_IFSTATIC_INVALID_SEC_DNS = WAN_IFSTATIC_SEC_DNS_NIL + 1
returnCodesToString = {
  [WAN_IFSTATIC_IPV6ADDR_IS_NIL] = "IPv6 Address is nil",
  [WAN_IFSTATIC_INVALID_IPV6ADDR] = "Invalid IPv6 adddress",
  [WAN_IFSTATIC_GW_NIL] = "Gateway IP is nil",
  [WAN_IFSTATIC_INVALID_GW] = "Invalid Gateway address",
  [WAN_IFSTATIC_PREFIXLENGTH_NIL] = "Prefix length is nil",
  [WAN_IFSTATIC_INVALID_PREFIXLENGTH] = "Invalid Prefix length",
  [WAN_IFSTATIC_PRI_DNS_NIL] = "Primary DNS is nil",
  [WAN_IFSTATIC_INVALID_PRI_DNS] = "Invalid Primary DNS",
  [WAN_IFSTATIC_SEC_DNS_NIL] = "Secondary DNS is nil",
  [WAN_IFSTATIC_INVALID_SEC_DNS] = "Invalid Secondary DNS"
}
