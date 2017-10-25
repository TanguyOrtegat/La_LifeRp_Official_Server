AddEventHandler("menupeche:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 57 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 56 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	--VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	--VMenu.AddFunc(98, "Donner facture", "menupeche:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 56 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menupeche:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager a la peche", "menupeche:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menupeche:fire", {}, "Accéder")
	end
end)

AddEventHandler("menupeche:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menupeche:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menupeche:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menupeche:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menupeche:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menupeche:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menupeche:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menupeche:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
