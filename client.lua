local firstspawn = false
local checkRate = 5000 -- Check Every 5 sec

AddEventHandler('playerSpawned', function(spawn)
	Citizen.Wait(10000)
	firstspawn = true
end)

Citizen.CreateThread(function()
	while true do
		Wait(checkRate)

		if firstspawn then
			TriggerServerEvent("checkPing")
		end
	end
end)