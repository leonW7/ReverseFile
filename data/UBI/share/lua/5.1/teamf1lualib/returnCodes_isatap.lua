module("com.teamf1.core.ipv6.isatap.returnCodes", package.seeall)
PREFIX_IS_NIL = 1811939329
INVALID_PREFIX = PREFIX_IS_NIL + 1
USELAN_IS_NIL = INVALID_PREFIX + 1
INVALID_USELAN = USELAN_IS_NIL + 1
USELAN_NOT_ENABLED = INVALID_USELAN + 1
INVALID_ENDPOINTADDR = USELAN_NOT_ENABLED + 1
INVALID_COOKIE = INVALID_ENDPOINTADDR + 1
DUPLICATE_ADDRESS = INVALID_COOKIE + 1
DUPLICATE_PREFIX = DUPLICATE_ADDRESS + 1
returnCodesToString = {
  [PREFIX_IS_NIL] = "Isatap Prefix Value is nil",
  [INVALID_PREFIX] = "Invalid IPv6 address",
  [USELAN_IS_NIL] = "Use LAN as end point paameter value is nil",
  [INVALID_USELAN] = "Invalid Use LAN as end point parameter value",
  [USELAN_NOT_ENABLED] = "Please enable Use LAN as end point",
  [INVALID_ENDPOINTADDR] = "Invalid IPv4 address",
  [INVALID_COOKIE] = "Invalid cookie",
  [DUPLICATE_ADDRESS] = "IP Address already associate with other isatap tunnel",
  [DUPLICATE_PREFIX] = "Prefix already configured"
}
