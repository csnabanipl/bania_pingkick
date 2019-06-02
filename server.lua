local ImmunitetIds = {
	-- 'steam:11000010076d282',
	-- 'steam:11000010076d282'
}

local MaxPing = 120

function SteamIdInList(id)
   for k, v in pairs(ImmunitetIds) do 
      if (id == v) then 
	  return true 
      end 
   end

   return false 
end

RegisterServerEvent('checkPing')
AddEventHandler('checkPing', function()
    local id = GetPlayerIdentifiers(source)[1]
    local ping = GetPlayerPing(source)

    if ping >= MaxPing then
	if (SteamIdInList(id)) then
	    TriggerClientEvent('chatMessage', source, 'PING KICKER ', { 255, 0, 0 }, 'Your Ping is too high!')
	else
	    DropPlayer(source, 'Your Ping is too high (Ping Limit: ' .. MaxPing .. ' Your Ping: ' .. ping .. ')')
	end	
    end
end)
