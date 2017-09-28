AddEventHandler("menuls1:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 31 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 30 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menuls1:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 30 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuls1:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager au Custom", "menuls1:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuls1:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuls1:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls1:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls1:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls1:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls1:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls1:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls1:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls1:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------


AddEventHandler("menuls2:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 33 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 32 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menuls2:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 32 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuls2:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager au Custom", "menuls2:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuls2:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuls2:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls2:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls2:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls2:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls2:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls2:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls2:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls2:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------


AddEventHandler("menuls3:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 35 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 34 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menuls3:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 34 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuls3:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager au Custom", "menuls3:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuls3:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuls3:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls3:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls3:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls3:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls3:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls3:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls3:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls3:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------


AddEventHandler("menuls4:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 37 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 36 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menuls3:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 36 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuls4:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager au Custom", "menuls4:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuls4:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuls4:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls4:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls4:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls4:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls4:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls4:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls4:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls4:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

--------------------------------------------------------------------------------------------------------------------------------------------------------


AddEventHandler("menuls5:menuOG", function(target, rangls)
VMenu.AddMenu(98, "", "default")
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.ls = true
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangls == 39 then
		VMenu.AddSep(98, "Employé")
	elseif rangls == 38 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddNum10(98, "Montant facture", "AmfacGarda", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menuls3:givefac", {getOpt("AmfacGarda")}, "Accéder")
	if rangls == 38 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menuls5:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager au Custom", "menuls5:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menuls5:fire", {}, "Accéder")
	end
end)

AddEventHandler("menuls5:hire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls5:hire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls5:fire", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls5:fire_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls5:promote", function(target)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls5:promote_s", cible)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler("menuls5:givefac", function(target, prix)
	if target ~= -1 then
		local cible = GetPlayerServerId(target)
		TriggerServerEvent("menuls5:givefac_s", cible, prix)
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)
