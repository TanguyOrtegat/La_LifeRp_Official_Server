AddEventHandler("menuasso:menuOG", function(target, ranglost)
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
    if ranglost == 43 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	if ranglost == 43 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuasso:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Ajouter", "menuasso:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menulost:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuasso:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuasso:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuasso:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuasso:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuasso:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuasso:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
