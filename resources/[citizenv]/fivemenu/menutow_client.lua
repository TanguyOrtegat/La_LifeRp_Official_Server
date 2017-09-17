local currentlyTowedVehicle = nil

local pos = {
[1] = { ["x"] = 191.33288574219, ["y"] = -1024.1374511719, ["z"] = -99.0, ["name"] = 'Entreprise Taxi'},
[2] = { ["x"] = 172.90441894531, ["y"] = -1000.0408935547, ["z"] = -98.999847412109, ["name"] = 'Entreprise Taxi'},

}
local item = {
	--[[
	[1] = {["libelle"] = "" ,["valeur"] = 0},
	[2] = {["libelle"] = "" ,["valeur"] = 0},
	[3] = {["libelle"] = "" ,["valeur"] = 0},
	[4] = {["libelle"] = "" ,["valeur"] = 0},
	[5] = {["libelle"] = "" ,["valeur"] = 0},
	[6] = {["libelle"] = "" ,["valeur"] = 0},
	[7] = {["libelle"] = "" ,["valeur"] = 0},
	[8] = {["libelle"] = "" ,["valeur"] = 0},
	[9] = {["libelle"] = "" ,["valeur"] = 0},
	[10] = {["libelle"] = "" ,["valeur"] = 0},
	[11] = {["libelle"] = "" ,["valeur"] = 0},
	[12] = {["libelle"] = "" ,["valeur"] = 0},
	[13] = {["libelle"] = "" ,["valeur"] = 0},
	[14] = {["libelle"] = "" ,["valeur"] = 0},
	[15] = {["libelle"] = "" ,["valeur"] = 0},
	[16] = {["libelle"] = "" ,["valeur"] = 0},
	[17] = {["libelle"] = "" ,["valeur"] = 0},
	[18] = {["libelle"] = "" ,["valeur"] = 0},
	[19] = {["libelle"] = "" ,["valeur"] = 0},
	[20] = {["libelle"] = "" ,["valeur"] = 0},
	[21] = {["libelle"] = "" ,["valeur"] = 0},
	[22] = {["libelle"] = "" ,["valeur"] = 0},
	[23] = {["libelle"] = "" ,["valeur"] = 0},
	[24] = {["libelle"] = "" ,["valeur"] = 0},
	[25] = {["libelle"] = "" ,["valeur"] = 0},
	[26] = {["libelle"] = "" ,["valeur"] = 0},
	[27] = {["libelle"] = "" ,["valeur"] = 0}
	]]--
}

local user_item = {
	--[[
	[1] = {["libelle"] = "Bouteille d'eau" ,["valeur"] = 0},
	[2] = {["libelle"] = "Sandwich" ,["valeur"] = 0},
	[3] = {["libelle"] = "Filet Mignon" ,["valeur"] = 0},
	[4] = {["libelle"] = "Cannabis" ,["valeur"] = 0},
	[5] = {["libelle"] = "Cannabis roulé" ,["valeur"] = 0},
	[6] = {["libelle"] = "Feuille de cocaïne" ,["valeur"] = 0},
	[7] = {["libelle"] = "Feuille de cocaïne 50" ,["valeur"] = 0},
	[8] = {["libelle"] = "Cocaïne" ,["valeur"] = 0},
	[9] = {["libelle"] = "Éphédrine" ,["valeur"] = 0},
	[10] = {["libelle"] = "Éphédrine 33" ,["valeur"] = 0},
	[11] = {["libelle"] = "Éphédrine 66" ,["valeur"] = 0},
	[12] = {["libelle"] = "Meth" ,["valeur"] = 0},
	[13] = {["libelle"] = "Organe" ,["valeur"] = 0},
	[14] = {["libelle"] = "Organe emballé" ,["valeur"] = 0},
	[15] = {["libelle"] = "Organe analysé" ,["valeur"] = 0},
	[16] = {["libelle"] = "Organe livrable" ,["valeur"] = 0},
	[17] = {["libelle"] = "Cuivre" ,["valeur"] = 0},
	[18] = {["libelle"] = "Fer" ,["valeur"] = 0},
	[19] = {["libelle"] = "Diamant" ,["valeur"] = 0},
	[20] = {["libelle"] = "Cuivre traité" ,["valeur"] = 0},
	[21] = {["libelle"] = "Fer traité" ,["valeur"] = 0},
	[22] = {["libelle"] = "Diamant traité" ,["valeur"] = 0},
	[23] = {["libelle"] = "Roche" ,["valeur"] = 0},
	[24] = {["libelle"] = "Roche traité" ,["valeur"] = 0},
	[25] = {["libelle"] = "Poisson" ,["valeur"] = 0},
	[26] = {["libelle"] = "Corps" ,["valeur"] = 0},
	[27] = {["libelle"] = "Corps traité" ,["valeur"] = 0}
	]]--
}

User = {
	Spawned = false,
	Loaded = false,
	group = "0",
	permission_level = 0,
	money = 0,
	dirtymoney = 0,
	job = 0,
	police = 0,
	enService = 0,
	nom = "",
	prenom = "",
	vehicle = "",
	identifier = nil,
	telephone = "",
	gender = ""
}

local entrer = false
local isBuy = 0
local money = 0
local dirtymoney = 0
local depositcash = false
local depositdirtycash = false
local depositapart = ""
local target = 0
local islock = 0
local isClick = false
local freeze = false

local lang = 'fr'

local txt = {
  ['fr'] = {
        ['fermermenu'] = 'Fermer le menu',
        ['sonner'] = 'Sonner a la porte',
        ['gohome'] = 'Rentrer chez moi',
        ['vendre'] = 'Revendre l\'appartement',
        ['acheter'] = 'Acheter l\'appartement',
        ['visiter'] = 'Visiter l\'appartement',
        ['menu'] = 'Appuyez sur ~g~E~s~ pour ouvrir le menu',
        ['soon'] = 'Cette fonctionnalite arrivera bientot',
        ['exit'] = 'Sortir',
        ['retirerargent'] = 'Retirer de l\'argent propre',
        ['retirersale'] = 'Retirer de l\'argent sale',
        ['deposerargent'] = 'Deposer de l\'argent propre',
        ['deposersale'] = 'Deposer de l\'argent sale'
  },

    ['en'] = {
        ['fermermenu'] = 'Close menu',
        ['sonner'] = 'Ring the doorbell',
        ['gohome'] = 'Go to home',
        ['vendre'] = 'Sell apartment',
        ['acheter'] = 'Buy apartment',
        ['visiter'] = 'Visit the apartment',
        ['menu'] = 'Press ~g~E~s~ to open menu',
        ['soon'] = 'This functionality will come soon',
        ['exit'] = 'Exit',
        ['retirerargent'] = 'Withdraw clean money',
        ['retirersale'] = 'Withdraw dirty money',
        ['deposerargent'] = 'Deposit clean money',
        ['deposersale'] = 'Deposit dirty money'
    }
}


AddEventHandler("menutow:DepanOG", function(target, rangDepan)
	if target ~= -1 then
		nameTarget = "Vous ciblez quelqu'un"
	else
		nameTarget = "Aucune cible"
	end
	VMenu.depan = true
	VMenu.ResetMenu(98, "", "default")
	Wait(100)
	VMenu.AddSep(98, tostring(nameTarget))
	if rangDepan == 15 then
		VMenu.AddSep(98, "Employé")
	elseif rangDepan == 16 then
		VMenu.AddSep(98, "Patron")
	end
	VMenu.AddFunc(98, "~r~Retour", "vmenu:MainMenuOG", {}, "Retour")
	VMenu.AddFunc(98, "Annuler l'appel", "call:cancelCall", {}, "Accéder")
	VMenu.AddFunc(98, "Attacher/détacher", "menutow:attach", {}, "Accéder")
	VMenu.AddFunc(98, "Réparer le véhicule", "menutow:repair", {}, "Accéder")
	VMenu.AddFunc(98, "Nettoyer le véhicule", "menutow:wash", {}, "Accéder")
	VMenu.AddNum10(98, "Montant facture", "AmfacTow", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menutow:givefac", {getOpt("AmfacTow")}, "Accéder")
	if rangDepan == 16 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menutow:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager chez les dépanneurs", "menutow:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menutow:fire", {}, "Accéder")
	end
end)

RegisterNetEvent('menutow:attach')
AddEventHandler('menutow:attach', function()
	local playerped = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(playerped, true)

	local towmodel = GetHashKey('flatbed1')
	local isVehicleTow = IsVehicleModel(vehicle, towmodel)

	if isVehicleTow then
		local plyCoords = GetEntityCoords(playerped, 0)
		targetVehicle = GetClosestVehicle(plyCoords["x"], plyCoords["y"], plyCoords["z"], 5.001, 0, 70)

		if currentlyTowedVehicle == nil then
			if DoesEntityExist(targetVehicle) then
				if not IsPedInAnyVehicle(playerped, true) then
					if vehicle ~= targetVehicle then
						Citizen.Wait(500)
						AttachEntityToEntity(targetVehicle, vehicle, 20, -0.5, -5.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
						currentlyTowedVehicle = targetVehicle
						TriggerEvent("itinerance:notif", "~g~Véhicule attaché !")
					else
						TriggerEvent("itinerance:notif", "~r~Vous ne pouvez pas attacher votre propre véhicule !")
					end
				else
					TriggerEvent("itinerance:notif", "~r~Sortez de votre véhicule !")
				end
			else
				TriggerEvent("itinerance:notif", "~r~Trop loin du véhicule !")
			end
		else
			AttachEntityToEntity(currentlyTowedVehicle, vehicle, 20, -0.5, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
			DetachEntity(currentlyTowedVehicle, true, true)
			currentlyTowedVehicle = nil
			TriggerEvent("itinerance:notif", "~g~Véhicule détaché !")
		end
	else
		TriggerEvent("itinerance:notif", "~r~Montez dans votre dépanneuse, redescendez puis réessayez !")
	end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

RegisterNetEvent('menutow:repair')
AddEventHandler('menutow:repair',function()
	Citizen.CreateThread(function()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	veh = GetClosestVehicle(plyCoords["x"], plyCoords["y"], plyCoords["z"], 5.001, 0, 70)
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_VEHICLE_MECHANIC", 0, true)
	Citizen.Wait(20000)
	SetVehicleFixed(veh, 1)
	SetVehicleDeformationFixed(veh, 1)
	SetVehicleUndriveable(vehicle, false)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	TriggerEvent("itinerance:notif", "~g~Véhicule réparé !")
	end)
end)

--Allow tower to wash vehicle
RegisterNetEvent('menutow:wash')
AddEventHandler('menutow:wash',function()
	Citizen.CreateThread(function()
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	veh = GetClosestVehicle(plyCoords["x"], plyCoords["y"], plyCoords["z"], 5.001, 0, 70)
	TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MAID_CLEAN", 0, true)
	Citizen.Wait(10000)
	WashDecalsFromVehicle(veh, 1)
	SetVehicleDirtLevel(veh, 0)
	SetVehicleUndriveable(vehicle, false)
	ClearPedTasksImmediately(GetPlayerPed(-1))
	TriggerEvent("itinerance:notif", "~g~Votre véhicule est propre !")
	end)
end)

AddEventHandler("job:MenuJob",function()
	  Wait(1000)
	Citizen.Trace("Dans l'event")
	--VMenu.apart = true
  VMenu.curItem = 1
  VMenu.ResetMenu(28, "", "default")
--	Wait(150)
	for i=1, #pos do
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), pos[i].x,pos[i].y,pos[i].z, true) < 1.599 then
  TriggerServerEvent("job:getCash", pos[i].name)
  TriggerServerEvent("job:getAppart", pos[i].name)
	TriggerServerEvent("job:getlock", pos[i].name)
	Citizen.Trace("ici loll")
	Wait(450)
	if((User.job == 16 or User.police > 3) and islock == 0) then
    VMenu.AddFunc(28,"Argent propre: " .. money .. " $","job:privetimuseless",{},"Rien")
    VMenu.AddFunc(28,"Argent sale: " .. dirtymoney .." $","job:privetimuseless",{},"Rien")
    VMenu.AddFunc(28,txt[lang]['deposerargent'],"job:deposerargent",{pos[i].name},"Déposer")
    VMenu.AddFunc(28,txt[lang]['deposersale'],"job:deposersale",{pos[i].name},"Déposer")
    VMenu.AddFunc(28,txt[lang]['retirerargent'],"job:retirerargent",{pos[i].name},"Retirer")
    VMenu.AddFunc(28,txt[lang]['retirersale'],"job:retirersale",{pos[i].name},"Retirer")
    VMenu.AddFunc(28,"Ajouter un item","job:Madditem",{pos[i].name},"Déposer")
    VMenu.AddFunc(28,"Retirer un item","job:Mremitem",{pos[i].name},"Retirer")
		VMenu.AddFunc(28,"Vérouiller/Dévérouiller","job:lock",{pos[i].name},"Vérouiller/Dévérouiller")
	end
			VMenu.AddFunc(28,"Fermer le menu","job:CloseMenu",{},"Fermer")
		end
	end
end)
--[[
AddEventHandler("job:MenuTaxi",function()
	VMenu.apart = true
  VMenu.curItem = 1
  VMenu.ResetMenu(27, "", "default")
  TriggerServerEvent("job:getCash", "Entreprise Taxi")
  TriggerServerEvent("job:getAppart", "Entreprise Taxi")
	TriggerServerEvent("job:getlock", "Entreprise Taxi")
  Wait(750)
	if((User.job == 18 or User.police > 3) and islock == 0) then
    VMenu.AddFunc(27,"Argent propre: " .. money .. " $","job:privetimuseless",{},"Rien")
    VMenu.AddFunc(27,"Argent sale: " .. dirtymoney .." $","job:privetimuseless",{},"Rien")
    VMenu.AddFunc(27,txt[lang]['deposerargent'],"job:deposerargent",{"Entreprise Taxi"},"Déposer")
    VMenu.AddFunc(27,txt[lang]['deposersale'],"job:deposersale",{"Entreprise Taxi"},"Déposer")
    VMenu.AddFunc(27,txt[lang]['retirerargent'],"job:retirerargent",{"Entreprise Taxi"},"Retirer")
    VMenu.AddFunc(27,txt[lang]['retirersale'],"job:retirersale",{"Entreprise Taxi"},"Retirer")
    VMenu.AddFunc(27,"Ajouter un item","job:Madditem",{"Entreprise Taxi"},"Déposer")
    VMenu.AddFunc(27,"Retirer un item","job:Mremitem",{"Entreprise Taxi"},"Retirer")
	else
	end
			VMenu.AddFunc(27,"Vérouiller/Dévérouiller","job:lock",{"Entreprise Taxi"},"Vérouiller/Dévérouiller")
			VMenu.AddFunc(27,"Fermer le menu","job:CloseMenu",{},"Fermer")
end)]]--

AddEventHandler("job:Madditem",function(name)
	VMenu.ResetMenu(28, "", "default")
	VMenu.curItem = 1
	Wait(200)
	TriggerServerEvent("job:user_getitem", name)
	Wait(500)
				for j=1,27 do
					--Citizen.Trace(item[1].valeur)
					--Citizen.Trace(item[i].value)
					if (tonumber(user_item[j].valeur) > 0) then
						VMenu.AddFunc(28,tostring(user_item[j].libelle).." "..":".." "..tostring(item[j].valeur),"job:additem",{j,name},"Retirer")
					end
				end
						VMenu.AddFunc(28,"Retour","job:MenuJob",{},"Retour")
            VMenu.AddFunc(28,txt[lang]['fermermenu'],"job:CloseMenu",{},"Fermer")
end)

AddEventHandler("job:Mremitem",function(name)
	VMenu.ResetMenu(28, "", "default")
  VMenu.curItem = 1
	Wait(1000)
  TriggerServerEvent("job:getitem", name)
				for j=1,27 do
					--Citizen.Trace(item[1].valeur)
					--Citizen.Trace(item[i].value)
					if (tonumber(item[j].valeur) > 0) then
						VMenu.AddFunc(28,tostring(item[j].libelle).." "..":".." "..tostring(item[j].valeur),"job:remitem",{j,item[j].libelle,name},"Retirer")
					end
				end
			     VMenu.AddFunc(28,"Retour","job:MenuJob",{},"Retour")
           VMenu.AddFunc(28,txt[lang]['fermermenu'],"job:CloseMenu",{},"Fermer")
end)


AddEventHandler("job:additem",function(target,id,id_nom,nom)
  TriggerServerEvent("job:additem_s",id_nom,nom)
  Wait(500)
  --TriggerEvent("player:receiveItem", tonumber(id), 1)
  Citizen.Trace(id)
  TriggerEvent("player:looseItem", tonumber(id), 1)
  Wait(1000)
  TriggerEvent("job:Madditem")
end)

AddEventHandler("job:remitem",function(target,id,id_nom,nom)
  TriggerServerEvent("job:remitem_s",id_nom,nom)
  Wait(500)
  --TriggerEvent("player:receiveItem", tonumber(id), 1)
  Citizen.Trace(id)
  TriggerEvent("inventory:giveItem_f", tonumber(id), 1)
  Wait(1000)
  TriggerEvent("job:Mremitem")
end)

AddEventHandler("job:privetimuseless",function()
end)

AddEventHandler("job:deposerargent",function(target,apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("job:depositcash", txt, apart)
      Wait(800)
		   TriggerEvent("job:MenuJob")
		end
	end
end)

AddEventHandler("job:deposersale",function(target,apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("job:depositdirtycash", txt, apart)
      Wait(500)
			TriggerEvent("job:MenuJob")
		end
	end
end)

AddEventHandler("job:retirerargent",function(target,apart)
	print("coucou")
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			print("ok c bon")
			TriggerServerEvent("job:takecash", txt, apart)
      Wait(500)
      TriggerEvent("job:MenuJob")
		end
	end
end)

AddEventHandler("job:retirersale",function(target,apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("job:takedirtycash", txt, apart)
      Wait(500)
      TriggerEvent("job:MenuJob")
		end
	end
end)

AddEventHandler("job:CloseMenu",function()
	Citizen.Trace("fermer menu")
    TriggerEvent("vmenu:toggleMenu")
	freeze = not freeze
end)

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
	for k,v in pairs(infos) do
		User[k] = v
	end
end)

RegisterNetEvent("job:getitem_f")
AddEventHandler("job:getitem_f", function(info)
	item = info
end)

RegisterNetEvent("job:user_getitem_f")
AddEventHandler("job:user_getitem_f", function(info)
	item = info
end)

RegisterNetEvent("job:getCash")
AddEventHandler("job:getCash", function(moneyparm, dirtymoneyparm)
  money = moneyparm
  dirtymoney = dirtymoneyparm
end)

RegisterNetEvent("job:islock")
AddEventHandler("job:islock", function(lock)
  islock = lock
end)

AddEventHandler("job:lock",function(target,nom)
    TriggerServerEvent("job:lock_s", nom)
		Wait(1500)
		TriggerEvent("job:MenuTow")
--    TriggerEvent("apart:CloseMenu")
end)

Citizen.CreateThread(function()
  TriggerServerEvent("job:getinvitem")
end)
