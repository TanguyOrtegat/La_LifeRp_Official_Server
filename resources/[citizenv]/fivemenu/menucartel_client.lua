AddEventHandler("menucartel:menuOG", function(target, ranglost)
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
    if ranglost == 47 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	if ranglost == 47 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menucartel:promote", {}, "Accéder")
        VMenu.AddFunc(98, "Membre", "menucartel:promote_1", {}, "Accéder")
		VMenu.AddFunc(98, "Prospect", "menucartel:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menucartel:fire", {}, "Accéder")
	end
end)

AddEventHandler("menucartel:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menucartel:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menucartel:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menucartel:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menucartel:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menucartel:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menucartel:promote_1", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menucartel:promote_1_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menucartel:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menucartel:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
