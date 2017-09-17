function DrawNotif(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

nameTarget = ""
local all_arme = {
--"WEAPON_COUGAR",
"WEAPON_KNIFE",
"WEAPON_NIGHTSTICK",
"WEAPON_HAMMER",
"WEAPON_BAT",
"WEAPON_GOLFCLUB",
"WEAPON_CROWBAR",
"WEAPON_PISTOL",
"WEAPON_COMBATPISTOL",
"WEAPON_APPISTOL",
"WEAPON_PISTOL50",
"WEAPON_MICROSMG",
"WEAPON_SMG",
"WEAPON_ASSAULTSMG",
"WEAPON_ASSAULTRIFLE",
"WEAPON_CARBINERIFLE",
"WEAPON_ADVANCEDRIFLE",
"WEAPON_MG",
"WEAPON_COMBATMG",
"WEAPON_PUMPSHOTGUN",
"WEAPON_SAWNOFFSHOTGUN",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_BULLPUPSHOTGUN",
"WEAPON_STUNGUN",
"WEAPON_SNIPERRIFLE",
"WEAPON_HEAVYSNIPER",
"WEAPON_REMOTESNIPER",
"WEAPON_GRENADELAUNCHER",
"WEAPON_GRENADELAUNCHER_SMOKE",
"WEAPON_RPG",
"WEAPON_PASSENGER_ROCKET",
"WEAPON_AIRSTRIKE_ROCKET",
"WEAPON_STINGER",
"WEAPON_MINIGUN",
"WEAPON_GRENADE",
"WEAPON_STICKYBOMB",
"WEAPON_SMOKEGRENADE",
"WEAPON_BZGAS",
"WEAPON_MOLOTOV",
"WEAPON_FIREEXTINGUISHER",
"WEAPON_PETROLCAN",
"WEAPON_DIGISCANNER",
"WEAPON_BRIEFCASE",
"WEAPON_BRIEFCASE_02",
"WEAPON_BALL",
"WEAPON_FLARE",
"WEAPON_GUSENBERG",
"WEAPON_BOTTLE",
"WEAPON_SNSPISTOL",
"WEAPON_SPECIALCARBINE",
"WEAPON_HEAVYPISTOL",
"WEAPON_BULLPUPRIFLE",
"WEAPON_DAGGER",
"WEAPON_VINTAGEPISTOL",
"WEAPON_FIREWORK",
"WEAPON_MUSKET",
"WEAPON_HEAVYSHOTGUN",
"WEAPON_MARKSMANRIFLE",
"WEAPON_HOMINGLAUNCHER",
"WEAPON_GARBAGEBAG",
"WEAPON_PROXMINE",
"WEAPON_FLAREGUN",
"WEAPON_GARBAGEBAG",
"WEAPON_HANDCUFFS",
"WEAPON_COMBATPDW",
"WEAPON_MARKSMANPISTOL",
"WEAPON_KNUCKLE",
"WEAPON_HATCHET",
"WEAPON_RAILGUN",
"WEAPON_MACHETE",
"WEAPON_MACHINEPISTOL",
"WEAPON_AIR_DEFENCE_GUN",
"WEAPON_SWITCHBLADE",
"WEAPON_REVOLVER",
"WEAPON_DBSHOTGUN",
"WEAPON_COMPACTRIFLE",
"WEAPON_AUTOSHOTGUN",
"WEAPON_BATTLEAXE",
"WEAPON_COMPACTLAUNCHER",
"WEAPON_MINISMG",
"WEAPON_PIPEBOMB",
"WEAPON_POOLCUE",
"WEAPON_WRENCH",
}
local arme_illegal = {
"WEAPON_MICROSMG",
"WEAPON_SMG",
"WEAPON_ASSAULTSMG",
"WEAPON_ASSAULTRIFLE",
"WEAPON_CARBINERIFLE",
"WEAPON_ADVANCEDRIFLE",
"WEAPON_MG",
"WEAPON_COMBATMG",
"WEAPON_PUMPSHOTGUN",
"WEAPON_SAWNOFFSHOTGUN",
"WEAPON_ASSAULTSHOTGUN",
"WEAPON_BULLPUPSHOTGUN",
"WEAPON_STUNGUN",
"WEAPON_SNIPERRIFLE",
"WEAPON_HEAVYSNIPER",
"WEAPON_REMOTESNIPER",
"WEAPON_GRENADELAUNCHER",
"WEAPON_GRENADELAUNCHER_SMOKE",
"WEAPON_RPG",
"WEAPON_PASSENGER_ROCKET",
"WEAPON_AIRSTRIKE_ROCKET",
"WEAPON_STINGER",
"WEAPON_MINIGUN",
"WEAPON_GRENADE",
"WEAPON_STICKYBOMB",
"WEAPON_SMOKEGRENADE",
"WEAPON_BZGAS",
"WEAPON_MOLOTOV",
"WEAPON_GUSENBERG",
"WEAPON_SPECIALCARBINE",
"WEAPON_BULLPUPRIFLE",
"WEAPON_FIREWORK",
"WEAPON_MUSKET",
"WEAPON_HEAVYSHOTGUN",
"WEAPON_MARKSMANRIFLE",
"WEAPON_HOMINGLAUNCHER",
"WEAPON_PROXMINE",
"WEAPON_COMBATPDW",
"WEAPON_MARKSMANPISTOL",
"WEAPON_RAILGUN",
"WEAPON_MACHINEPISTOL",
"WEAPON_AIR_DEFENCE_GUN",
"WEAPON_DBSHOTGUN",
"WEAPON_COMPACTRIFLE",
"WEAPON_AUTOSHOTGUN",
"WEAPON_COMPACTLAUNCHER",
"WEAPON_MINISMG",
"WEAPON_PIPEBOMB",
}
RegisterNetEvent("menupolice:f_getTargetN")
AddEventHandler('menupolice:f_getTargetN', function(info)
	nameTarget = info[1].. " " ..info[2]
end)

AddEventHandler("menupolice:PoliceOG", function(target, rangPolice) -- 0 rien, 1 Cadet, 2 Brigadier, 3 Sergent, 4 Lieutenant, 5 Capitaine, 6 Commandant
		Citizen.Trace(target)
		if target ~= -1 then
				nameTarget = "Vous cilblez un civil"
		else
				nameTarget = "Aucune target"
		end
		VMenu.police = true
		VMenu.ResetMenu(98, "", "default")
		Wait(100)
		VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
		VMenu.AddSep(98, tostring(nameTarget))
		if rangPolice == 6 then
				VMenu.AddSep(98, "Commandant")
		elseif rangPolice == 5 then
				VMenu.AddSep(98, "Capitaine")
		elseif rangPolice == 4 then
				VMenu.AddSep(98, "Lieutenant")
		elseif rangPolice == 3 then
				VMenu.AddSep(98, "Sergent")
		elseif rangPolice == 2 then
				VMenu.AddSep(98, "Officier")
		elseif rangPolice == 1 then
				VMenu.AddSep(98, "Cadet")
		end
		VMenu.AddFunc(98, "Annuler l'appel", "call:cancelCall", {}, "Accéder")
	 	VMenu.AddFunc(98, "Verifier papier", "menupolice:verifp", {}, "Accéder")
	 	VMenu.AddNum100(98, "Montant contravention", "Amcon", 0, 100000, "Montant de la contravention")
		VMenu.AddFunc(98, "Donner contravention", "menupolice:givecon", {getOpt("Amcon")}, "Accéder")
		VMenu.AddFunc(98, "Vérifier la plaque du véhicule", "menupolice:searchveh", {}, "Accéder")
		VMenu.AddFunc(98, "Fouiller le civil le plus près", "menupolice:verifp", {}, "Accéder")
		VMenu.AddFunc(98, "Saisir l'argent sale", "menupolice:seizecash", {}, "Accéder")
		VMenu.AddFunc(98, "Saisir les objets illégaux", "menupolice:seizedrug", {}, "Accéder")
		VMenu.AddFunc(98, "Saisir les armes illégales", "menupolice:seizeillegalweapons", {}, "Accéder")
		VMenu.AddFunc(98, "Saisir les armes", "menupolice:seizeweapons", {}, "Accéder")
		VMenu.AddNum(98, "Nombre de points à retirer", "AmountP", 0, 12, "Retirer les points sur le permis")
    	VMenu.AddFunc(98, "Retirer les points sur le permis", "menupolice:removepp", {getOpt("AmountP")}, "Accéder")
		VMenu.AddFunc(98, "Saisir le permis de port d'armes", "menupolice:removeparme", {}, "Accéder")
		VMenu.AddFunc(98, "Saisir le permis de conduire", "menupolice:removep", {}, "Accéder")
    	VMenu.AddFunc(98, "Saisir les points du permis de c.", "menupolice:removepp", {}, "Accéder")
		VMenu.AddBool(98, "Escorter un civil menotté", "EscortM", false, "Toggle")
		VMenu.AddBool(98, "Menotter/Démenotter", "Menotter", false, "Toggle")
		VMenu.AddFunc(98, "Forcer l'entrée d'un civil dans un véhicule", "menupolice:civtocar", {}, "Accéder")
		VMenu.AddFunc(98, "Forcer la sortie des civils du véhicule", "menupolice:civuncar", {}, "Accéder")
		--VMenu.AddFunc(98, "Enfermer le civil en prison", "menupolice:jail", {}, "Accéder")
		VMenu.AddFunc(98, "Crocheter la serrure du véhicule", "menupolice:unlock", {}, "Accéder")
		--VMenu.AddFunc(98, "Consulter la liste des suspects recherchés ", "menupolice:consultwanted", {}, "Accéder")

		-- Ajouter/Retirer dans le commissariat
end)

PhandCuffed = false
PEscorthandCuffed = false
PhandCuffedName = ""

handCuffed = false
EscorthandCuffed = false

EscortGuy = 0



RegisterNetEvent("menupolice:f_cuff")
AddEventHandler('menupolice:f_cuff', function(civitem)
	handCuffed = true
end)

AddEventHandler('menupolice:cuff', function(target)
	PhandCuffed = true
end)

RegisterNetEvent("menupolice:f_escortcuff")
AddEventHandler('menupolice:f_escortcuff', function(civitem, pname, lebool)
	EscortGuy = civitem
	if lebool == true then
		PhandCuffedName  = pname
		EscorthandCuffed = not EscorthandCuffed
		handCuffed = not handCuffed
	else

	end
end)

RegisterNetEvent("menupolice:f_uncuff")
AddEventHandler('menupolice:f_uncuff', function()
	handCuffed = false
end)

AddEventHandler('menupolice:uncuff', function(target)
	if PhandCuffed then
		PhandCuffed = false
	else
		DrawNotif("Aucun civil à proximité n'est menotté")
	end
end)

AddEventHandler('menupolice:consultwanted', function()
	TriggerServerEvent("wanted:getWanted")
end)

AddEventHandler('menupolice:seizeillegalweapons', function(target)
	if target ~= -1 then
	TriggerServerEvent("menupolice:seizeillegalweapons_s",GetPlayerServerId(VMenu.target))
	Wait(3000)
	TriggerEvent("itinerance:notif", "~r~ Les armes ont été saisie")
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

AddEventHandler('menupolice:seizeweapons', function(target)
	if target ~= -1 then
	Citizen.Trace('ICI')
	TriggerServerEvent("menupolice:seizeweapons_s",GetPlayerServerId(VMenu.target))
	Wait(3000)
	TriggerEvent("itinerance:notif", "~r~ Les armes ont été saisies")
	else
		TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cible")
	end
end)

RegisterNetEvent("menupolice:f_seizeillegalweapons")
AddEventHandler('menupolice:f_seizeillegalweapons', function(target)
	        for _, arme in ipairs(arme_illegal) do
			Wait(1)
			Citizen.Trace(arme)
            RemoveWeaponFromPed(GetPlayerPed(-1),GetHashKey(arme))
			Wait(10)
			TriggerServerEvent('menupolice:delillegalweapon',arme)
			Wait(100)
			end
end)

RegisterNetEvent("menupolice:f_seizeweapons")
AddEventHandler('menupolice:f_seizeweapons', function(target)
			Citizen.Trace('ICI2')
			for _, arme in ipairs(all_arme) do
			Wait(1)
			Citizen.Trace(arme)
            RemoveWeaponFromPed(GetPlayerPed(-1),GetHashKey(arme))
			Wait(10)
			end
			TriggerServerEvent('menupolice:delweapon')
end)

local showIdPolice = false

RegisterNetEvent("menupolice:f_verifp")
AddEventHandler("menupolice:f_verifp", function(name, tel, job, police, entreprise, permis, permisArme, permisBateau, permisPilote,arme,civitems,money,dirtymoney)
	showIdPolice = true
		Citizen.Wait(0)
		if (showIdPolice == true) then
			TriggerEvent("itinerance:notif", "~h~Carte d'identité")
			TriggerEvent("itinerance:notif", "~b~Nom: ~w~" ..name)
			TriggerEvent("itinerance:notif", "~b~Numéro de téléphone: ~w~" ..tel)
			TriggerEvent("itinerance:notif", "~g~Argent: ~w~" ..money)
			TriggerEvent("itinerance:notif", "~r~Argent Sale: ~w~" ..dirtymoney)
			if arme == "oui" then
				TriggerEvent("itinerance:notif", "~g~arme: ~r~"..arme)
			else
				TriggerEvent("itinerance:notif", "~g~arme: ~g~"..arme)
			end
			if tonumber(job) == 1 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Sans emploi")
			elseif tonumber(job) == 2 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Nettoyeur de piscines")
			elseif tonumber(job) == 3 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Éboueur")
			elseif tonumber(job) == 4 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Mineur")
			elseif tonumber(job) == 5 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Chauffeur de taxi")
			elseif tonumber(job) == 6 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Livreur de bois")
			elseif tonumber(job) == 7 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Livreur de citerne")
			elseif tonumber(job) == 8 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Livreur de conteneur")
			elseif tonumber(job) == 9 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Livreur de médicament")
			elseif tonumber(job) == 10 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Policier")
			elseif tonumber(job) == 11 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Fossoyeur")
			elseif tonumber(job) == 12 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Préposé à la morgue")
			elseif tonumber(job) == 13 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Ambulancier")
			elseif tonumber(job) == 14 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Président")
			elseif tonumber(job) == 15 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Dépanneur")
			elseif tonumber(job) == 16 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Dépanneur (patron)")
			elseif tonumber(job) == 17 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Chauffeur de taxi")
			elseif tonumber(job) == 18 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Chauffeur de taxi (patron)")
			elseif tonumber(job) == 19 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~FBI")
			elseif tonumber(job) == 20 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Secrétaire")
			elseif tonumber(job) == 21 then
				TriggerEvent("itinerance:notif", "~y~Métier: ~w~Journaliste")
			elseif tonumber(job) == 22 then
        		TriggerEvent("itinerance:notif", "~y~Métier: ~w~Pêcheur")
      		elseif tonumber(job) == 23 then
        		TriggerEvent("itinerance:notif", "~y~Métier: ~w~Vigneron")
      		elseif tonumber(job) == 25 then
        		TriggerEvent("itinerance:notif", "~y~Métier: ~w~Metallurgiste")
      		elseif tonumber(job) == 26 then
        		TriggerEvent("itinerance:notif", "~y~Métier: ~w~Agriculteur")
			else
				TriggerEvent("itinerance:notif", "~y~Métier: ~r~Erreur")
			end
			if tonumber(permisArme) == 0 then
				TriggerEvent("itinerance:notif", "~g~Permis de port d'armes: ~r~Non")
			elseif tonumber(permisArme) == 1 then
				TriggerEvent("itinerance:notif", "~g~Permis de port d'armes: ~g~Oui")
			else
				TriggerEvent("itinerance:notif", "~g~Permis de port d'armes: ~r~Erreur")
			end
			if permis == 0 then
			  TriggerEvent("itinerance:notif", "~g~Permis de conduire: ~r~non")
			elseif permis >= 1 then
			  TriggerEvent("itinerance:notif", "~g~Permis de conduire: ~g~"..permis)
		 	end

			for _, item in pairs(civitems) do
				if item.valeur > 0 then
					TriggerEvent("itinerance:notif", item.libelle .. item.valeur)
				end
			end
		end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if showIdPolice == true then
			Citizen.Wait(10000)
			showIdPolice = false
		end
	end
end)
