AddEventHandler("menugarde:GardeOG", function(target)
		if target ~= -1 then
			nameTarget = "Vous ciblez quelqu'un"
		else
			nameTarget = "Aucune cible"
		end
		VMenu.garde = true
		VMenu.ResetMenu(98, "", "default")
		Wait(100)
		VMenu.AddSep(98, tostring(nameTarget))
		VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
		VMenu.AddFunc(98, "Verifier papier", "menupolice:verifp", {}, "Accéder")
		VMenu.AddFunc(98, "Fouiller le véhicule le plus près", "menupolice:searchveh", {}, "Accéder")
		VMenu.AddFunc(98, "Fouiller le civil le plus près", "menupolice:searchciv", {}, "Accéder")
		VMenu.AddBool(98, "Escorter un civil menotté", "EscortM", false, "Toggle")
		VMenu.AddBool(98, "Menotter/Démenotter", "Menotter", false, "Toggle")
		VMenu.AddFunc(98, "Forcer l'entrée d'un civil dans un véhicule", "menupolice:civtocar", {}, "Accéder")
		VMenu.AddFunc(98, "Forcer la sortie des civils du véhicule", "menupolice:civuncar", {}, "Accéder")
		VMenu.AddFunc(98, "Enfermer le civil en prison", "menupolice:jail", {}, "Accéder")
		--VMenu.AddFunc(98, "Crocheter la serrure du véhicule ", "menupolice:unlock", {}, "Accéder")
		--VMenu.AddFunc(98, "Consulter la liste des suspects recherchés", "menupolice:consultwanted", {}, "Accéder")

end)