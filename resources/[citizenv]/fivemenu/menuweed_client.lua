AddEventHandler("menuweed:menuOG", function(target, ranglost)
VMenu.AddMenu(98, "", "default")
Citizen.Trace(ranglost)
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.cartel = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
    if ranglost == 14 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	if ranglost == 14 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuweed:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Bras-Droit", "menuweed:promote_2", {}, "Accéder")
        VMenu.AddFunc(98, "Soldat", "menuweed:promote_1", {}, "Accéder")
		VMenu.AddFunc(98, "Banbim", "menuweed:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuweed:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuweed:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuweed:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuweed:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuweed:promote_1", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:promote_1_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuweed:promote_2", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:promote_2_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)


AddEventHandler("menuweed:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuweed:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
