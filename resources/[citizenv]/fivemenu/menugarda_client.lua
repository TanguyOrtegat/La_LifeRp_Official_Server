local currentlyTowedVehicle = nil

local pos = {
[1] = { ["x"] = 191.33288574219, ["y"] = -1024.1374511719, ["z"] = -99.0, ["name"] = 'Entreprise Taxi'},
[2] = { ["x"] = 172.90441894531, ["y"] = -1000.0408935547, ["z"] = -98.999847412109, ["name"] = 'Entreprise Taxi'},

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


AddEventHandler("menugarda:menuOG", function(target, rangDepan)
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
	VMenu.AddNum10(98, "Montant facture", "AmfacTow", 0, 10000, "La facturation vous permet d'envoyer directement l'argent dans le coffre")
	VMenu.AddFunc(98, "Donner facture", "menugarda:givefac", {getOpt("AmfacTow")}, "Accéder")
	VMenu.AddFunc(98, "Fouiller le civil le plus près", "menupolice:verifp", {}, "Accéder")
	VMenu.AddBool(98, "Menotter/Démenotter", "Menotter", false, "Toggle")
	if rangDepan == 27 then
		VMenu.AddSep(98, "~y~Gestion administrative~w~")
		VMenu.AddFunc(98, "Céder la place de patron", "menugarda:promote", {}, "Accéder")
		VMenu.AddFunc(98, "Engager chez GardaLife", "menugarda:hire", {}, "Accéder")
		VMenu.AddFunc(98, "Renvoyer", "menugarda:fire", {}, "Accéder")
	end
end)

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
	for k,v in pairs(infos) do
		User[k] = v
	end
end)

Citizen.CreateThread(function()
  TriggerServerEvent("job:getinvitem")
end)
