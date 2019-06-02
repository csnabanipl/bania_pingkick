local ImmunitetIds = { -- DONT KICK ADMINS PLS!!!
	-- "steam:11000010076d282",
	-- "steam:11000010076d282"
}

local pingLimit = 120 -- Ping Limit / configurable

function SteamIdInList(id)
    for k, v in pairs(ImmunitetIds) do 
	if (id == v) then 
	   return true 
	end 
    end

   return false 
end

RegisterServerEvent("checkPing")
AddEventHandler("checkPing", function()
    local id = GetPlayerIdentifiers(source)[1]
    ping = GetPlayerPing(source)

    if ping >= pingLimit then
	if (SteamIdInList(id)) then -- If Admin then just chat Info
	    TriggerClientEvent('chatMessage', source, 'PING KICKER ', { 255, 0, 0 }, "Your Ping is too high!")
	else
	    DropPlayer(source, "Ping is too high (Limit: " .. pingLimit .. " Your Ping: " .. ping .. ")")
	end	
    end
end)
