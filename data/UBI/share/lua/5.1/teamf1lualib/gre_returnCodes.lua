module("com.teamf1.core.vpn.gre.returnCodes", package.seeall)
GRE_INVALID_COOKIE = 2113994753
MAX_LIMIT_REACHED = GRE_INVALID_COOKIE + 1
GRE_TABLENIL = MAX_LIMIT_REACHED + 1
returnCodesToString = {
  [GRE_INVALID_COOKIE] = "Invalid cookie value in gre",
  [MAX_LIMIT_REACHED] = "Maximum gre tunnels limit reached",
  [GRE_TABLENIL] = "gre table is nil"
}
