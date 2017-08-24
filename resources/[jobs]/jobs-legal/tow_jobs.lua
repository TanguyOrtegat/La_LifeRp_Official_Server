local serviceOn = false
local camionSortie = false
local DrawMarkerShow = true
local vehicle

local item = {
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
}

local user_item = {
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

Citizen.CreateThread(function()

  while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, 473.07241821289, -1310.0407714844, 28.230070114136, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, 491.9787902832, -1334.0855712891, 28.420988082886, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
		DrawMarker(1, 169.60827636719, -1000.9912719727, -99.999992370605, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0, 255, 255, 75, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 473.07241821289, -1310.0407714844, 28.230070114136, true)
    if not IsInVehicle() then
      if distance < 5 then
        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 15 or myjob == 16 then
                Wait(100)
                Citizen.Wait(1)
		OutfitTow()
		TriggerServerEvent("player:serviceOn", "tow")
                serviceOn = true
                TriggerEvent("itinerance:notif", "~g~Vous avez pris votre service !")
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être dépanneur !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~quitter votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 15 or myjob == 16 then
              	TriggerServerEvent("player:serviceOff", "tow")
		            TriggerServerEvent("vmenu:lastChar")
		            serviceOn = false
            end
          end
        end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 491.9787902832, -1334.0855712891, 28.420988082886, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre dépanneuse~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 15 or myjob == 16 then
			if serviceOn == true then
                local car = GetHashKey("flatbed1")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, 491.9787902832, -1334.0855712891, 28.420988082886 , 358.92181396484, true, false)
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
				        SetVehicleNumberPlateText(vehicle, job.plate)
				        Wait(100)
				        SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 25, 25)
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				        onJobLegal = 1
			else
				TriggerEvent("itinerance:notif", "~r~Vous n'êtes pas en service !")
			end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être dépanneur !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre dépanneuse~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 15 or myjob == 16 then
              camionSortie = false
			  onJobLegal = 3
            end
          end
        end
      end
    end
end
end)

function OutfitTow()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 11, 65, 3, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 38, 3, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 59, 3, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 38, 3, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 7, 0, 0)
  end
end

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", "tow")
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 169.60827636719, -1000.9912719727, -98.999992370605, true)
    if not IsInVehicle() then
      if distance < 1.5 then
        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("tow:pdg")
            --TriggerEvent("vmenu:poleemploi",18)
          end
      end
    end
end
end
end)
