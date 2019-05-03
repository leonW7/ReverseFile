module("com.teamf1.core.rip_returnCodes", package.seeall)
COMP_RIP_RETURNCODE_START = 956301312
RIP_RIP_RETURNCODE_START = 956366848
RIP_INVALID_FIRST_KEYID = RIP_RIP_RETURNCODE_START + 1
RIP_INVALID_SECOND_KEYID = RIP_INVALID_FIRST_KEYID + 1
RIP_RIP_RETURNCODE_END = 956432383
returnCodesToString = {
  [COMP_RIP_RETURNCODE_START] = "Unknown error occured",
  [RIP_RIP_RETURNCODE_START] = "Unknown error occured",
  [RIP_INVALID_FIRST_KEYID] = "First key ID is invalid",
  [RIP_INVALID_SECOND_KEYID] = "Second key ID is invalid",
  [RIP_RIP_RETURNCODE_END] = "Unknown error occured"
}
