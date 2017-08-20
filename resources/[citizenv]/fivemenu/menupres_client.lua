AddEventHandler("menupres:MayorOG", function(target)
		if target ~= -1 then
			nameTarget = "Vous ciblez quelqu'un"
		else
			nameTarget = "Aucune cible"
		end
		VMenu.pres = true
		VMenu.ResetMenu(98, "", "default")
		Wait(100)
		VMenu.AddSep(98, tostring(nameTarget))
		VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
		VMenu.AddFunc(98, "Engager en tant que secrétaire", "menupres:hiresec", {}, "Accéder")
		VMenu.AddFunc(98, "Engager en tant qu'agent du FBI", "menupres:hiregarde", {}, "Accéder")
		VMenu.AddFunc(98, "Licencier", "menupres:hiresec", {}, "Accéder")
		
end)