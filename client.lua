local firstspawn = false

AddEventHandler('playerSpawned', function(spawn)
    Citizen.Wait(10000)
    firstspawn = true
end)

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(5000)

        if firstspawn then
	   TriggerServerEvent('checkPing')
	end
    end
end)
