#!/pfrm2.0/bin/lua

--[[
--#### File: stopStartVapInstance.sh
--#### Description: wrapper to enable/disable vap interfaces
--#### Usage: stopStartVapInstance.sh <enable(1)/disable(0)> <apName>
--
--#### Revisions:
--01a,17feb09, nsr written
--]]--
--

--************* Requires *************
require "teamf1lualib/db"
require "teamf1lualib/dot11View"

--************* Initial Code *************
local dbHandle = "/tmp/system.db"
local setState = arg[1];
local vapName  = arg[2];
local valid = false

--************* Logic *************

ACCESS_LEVEL = 0;   -- override access level

db.connect (dbHandle);
SETTINGS_FILE = db.getAttribute("environment", "name", "TEAMF1_CFG_ASCII", "value")

local rowids = {}
local rows = db.getRowsWhere ("dot11VAP", "vapName = '" .. vapName .. "'")

-- check if the vap entries for the AP exist
if (rows == nil or #rows == 0) then
    db.close() -- close db handle
    return;
end

-- construct rowids table 
for k,v in pairs (rows) do
    rowids [k] = v["dot11VAP._ROWID_"]
end

if (setState == "enable" or setState == "1") then
    valid = dot11.VAP_enable (rowids, true);
elseif (setState == "disable" or setState == "0") then
    valid = dot11.VAP_enable (rowids, false);
end

if (not valid) then
    print ("Failed to " .. setState .. " " .. vapName);
end
db.save()
db.close() -- close db handle
