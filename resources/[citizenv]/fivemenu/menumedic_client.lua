AddEventHandler("menumedic:MedicOG", function(target)
		if target ~= -1 then
			nameTarget = "Vous ciblez quelqu'un"
		else
			nameTarget = "Aucune cible"
		end
		VMenu.medic = true
		VMenu.ResetMenu(98, "", "default")
		Wait(100)
		VMenu.AddSep(98, tostring(nameTarget))
		VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
		VMenu.AddFunc(98, "Annuler l'appel", "call:cancelCall", {}, "Acc�der")
		VMenu.AddFunc(98, "Soigner la cible dans le coma", "menumedic:healcoma", {}, "Acc�der")
		VMenu.AddFunc(98, "Soigner la cible (PV)", "menumedic:heal", {}, "Acc�der")
end)

RegisterNetEvent("menumedic:healcoma_f")
AddEventHandler("menumedic:healcoma_f", function()
	local isRes = false
	local ped = GetPlayerPed(-1)
	while not isRes do
		Citizen.Wait(0)
		TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
		Citizen.Wait(8000)
		ClearPedTasks(ped);
	    isRes = true
	end
end)

RegisterNetEvent("menumedic:heal_f")
AddEventHandler("menumedic:heal_f", function()
	local ped = GetPlayerPed(-1)
	SetEntityHealth(ped, 200)
end)