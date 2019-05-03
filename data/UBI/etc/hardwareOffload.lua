#!/pfrm2.0/bin/lua 

--[[
#### sat
#### TeamF1
#### www.TeamF1.com
#### sep 13, 2008

#### File: hardwareOffload.lua
#### Description: restore defaults

#### Revisions:
None
]]--


--************* Requires *************
require "teamf1lualib/util"
require "teamf1lualib/db"

--************* Initial Code *************

--************* Logic *************

db.connect(arg[1])
--local bwRow = {}
local l2bwRow = {}
local ipsRow = {}
local smtpAlgRow = {}
local wanModeRow = {}
local jumboRow = {}
local modelId = {}
local hwEnabled = 0
--bwRow = db.getRow("BandWidthProfileStatus", "_ROWID_", "1")
l2bwRow = db.getRow("L2BandWidthProfileStatus", "_ROWID_", "1")
ipsRow = db.getRow("IPSConfig", "_ROWID_", "1")
--contentRow = db.getRow("ContentFiltering","_ROWID_","1")
smtpAlgRow = db.getRow("smtpAlg","_ROWID_","1")
wanModeRow = db.getRow("WanMode","_ROWID_","1")
jumboRow = db.getRow ("PowerModeConf", "_ROWID_", "1")
modelId = db.getRow ("unitInfo", "_ROWID_", "1")
local procEntry = db.getAttribute("environment", "name", "HW_OFFLOAD_PROC_ENTRY", "value")
--[[if (bwRow["BandWidthProfileStatus.Status"] == "1") then
    print("Disable hardware offload as bandwidth profile is enabled")
    os.execute("echo 0 >" .. procEntry)]]--
if (l2bwRow["L2BandWidthProfileStatus.Status"] == "1") then
    print("Disable hardware offload as Bridge bandwidth profile is enabled")
    os.execute("echo 0 >" .. procEntry)
elseif (ipsRow["IPSConfig.ipsEnable"] == "1") then
    print("Disable hardware offload as IPS is enabled")
    os.execute("echo 0 >" .. procEntry)
elseif (ipsRow["IPSConfig.idsEnable"] == "1") then
    print("Disable hardware offload as IDS is enabled")
    os.execute("echo 0 >" .. procEntry)
--[[elseif (contentRow["ContentFiltering.Status"] == "1") then
    print("Disable hardware offload as content filtering is enabled")
    os.execute("echo 0 >" .. procEntry)]]--
elseif (smtpAlgRow["smtpAlg.smtpAlgStatus"] == "1") then
    print("Disable hardware offload as SMTP ALG is enabled")
    os.execute("echo 0 >" .. procEntry)
elseif (wanModeRow["WanMode.Wanmode"] == "3") then
    print("Disable hardware offload as Wan Mode is Spill over")
    os.execute("echo 0 >" .. procEntry)
elseif (modelId ["unitInfo.modelId"] ~= "DSR-150" and modelId ["unitInfo.modelId"] ~= "DSR-150N" and modelId ["unitInfo.modelId"] ~= "DSR-250" and modelId ["unitInfo.modelId"] ~= "DSR-250N" and jumboRow ["PowerModeConf.JumboFrameEnable"] == "1") then
    print ("Disable hardware offload as Jumbo Frame is enabled")
    os.execute ("echo 0 >" .. procEntry)    
else
    print("Enable hardware offload")
    hwEnabled = 1
    os.execute("echo 1 >" .. procEntry)
end
