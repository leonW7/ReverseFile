module("com.teamf1.core.time.returnCodes", package.seeall)
TIME_SYNC_INTERVAL_INVALID = 469827585
TIME_PRIMAY_NTP_SERVER_INVALID = TIME_SYNC_INTERVAL_INVALID + 1
TIME_BACKUP_NTP_SERVER_INVALID = TIME_PRIMAY_NTP_SERVER_INVALID + 1
TIME_WCF_ACTIVATED = TIME_BACKUP_NTP_SERVER_INVALID + 1
returnCodesToString = {
  [TIME_SYNC_INTERVAL_INVALID] = "Time to synchronize value is invalid",
  [TIME_PRIMAY_NTP_SERVER_INVALID] = "Invalid primary NTP server",
  [TIME_BACKUP_NTP_SERVER_INVALID] = "Invalid Backup NTP server",
  [TIME_WCF_ACTIVATED] = "we are not allowed to off NTP servers when wcf license is activated"
}
