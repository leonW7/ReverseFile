if ACCESS_LEVEL ~= 0 then
  errorFlag, statusMessage = -1, "Administrator Privileges Are Required"
  Page = "diagPtrace.htm"
  web.goToPage(Page, false, true)
else
  web.download("/var/pkt.cap", "pkt.cap")
end
