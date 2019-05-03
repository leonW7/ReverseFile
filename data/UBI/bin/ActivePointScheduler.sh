#! /pfrm2.0/bin/lua
require "teamf1lualib/db"

local dbHandle = "/tmp/system.db"

db.connect (dbHandle);

local vapEnable = db.getAttribute("dot11VAP", "vapName", arg[1], "vapEnabled")

if (vapEnable == nil) then
    db.close() 
    return;
end


db.close()
local currentTimeInMinutes=tonumber(os.date("%H"))*60 + tonumber(os.date("%M"))

if( tonumber(currentTimeInMinutes) > tonumber(arg[2]) and tonumber(currentTimeInMinutes) < tonumber(arg[3] )) then
    if(tonumber(arg[4]) == 0 and tonumber(vapEnable) == 0) then
	    os.execute("/pfrm2.0/bin/stopStartVapInstance.sh 1 ".. arg[1])
    elseif(tonumber(arg[4]) == 1 and tonumber(vapEnable) == 1)then
        os.execute("/pfrm2.0/bin/stopStartVapInstance.sh 0 ".. arg[1])
    end
else
    if(tonumber(arg[4]) == 0 and tonumber(vapEnable) == 1) then
        os.execute("/pfrm2.0/bin/stopStartVapInstance.sh 0 ".. arg[1])
    elseif(tonumber(arg[4]) == 1 and tonumber(vapEnable) == 0)then
        os.execute("/pfrm2.0/bin/stopStartVapInstance.sh 1 ".. arg[1])
    end
end

