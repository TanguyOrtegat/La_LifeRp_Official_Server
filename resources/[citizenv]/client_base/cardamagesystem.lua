
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsUsing(ped)
		local damage = GetVehicleEngineHealth(vehicle)
		if IsPedInAnyVehicle(ped, false) then
			SetPlayerVehicleDamageModifier(PlayerId(), 100) -- Seems to not work at the moment --
			if damage < 900 then
				SetVehicleUndriveable(vehicle, true)
				TriggerEvent("itinerance:notif", "~r~Votre véhicule est endommagé, appellez un dépanneur.")
			end
		end
	end
end)
