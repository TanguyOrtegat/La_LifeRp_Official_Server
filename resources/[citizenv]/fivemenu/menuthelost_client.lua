AddEventHandler("menulost:menuOG", function(target, ranglost)
VMenu.AddMenu(98, "", "default")
Citizen.Trace(ranglost)
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.lost = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
    if ranglost == 42 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	if ranglost == 42 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menulost:promote", {}, "Accéder")
        VMenu.AddFunc(98, "Membre", "menulost:promote_1", {}, "Accéder")
		VMenu.AddFunc(98, "Prospect", "menulost:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menulost:fire", {}, "Accéder")
	end
end)

AddEventHandler("menulost:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menulost:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menulost:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menulost:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menulost:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menulost:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menulost:promote_1", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menulost:promote_1_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menulost:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menulost:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
