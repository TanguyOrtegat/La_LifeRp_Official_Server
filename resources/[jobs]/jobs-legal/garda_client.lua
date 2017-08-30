local DrawMarkerShow = true
local DrawBlipTradeShow = true
local camionSorti = false
local isMine = false
local isProc = false
local isSell = false
local isSellDiams = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipMine
local BlipTraitement
local BlipVenteMine
local BlipVenteDiams
local BlipGarda
local isVehicleTruck
local truck
local vehicle
local playerPos
local distance
local isCheckMine = false
local isCheckTraitement = false
local isCheckVente = false
local isCheckVenteDiams = false
local serviceOn = false

local Positions = {
  spawnCamion={x=-5.4240908622742,y=-670.26330566406,z=31.338108062744 ,distance=8},
  priseServicePatron={x=-19.634185791016,y=-658.01831054688,z=32.45295715332, distance=10},
  priseServiceTrans={x=11.6775541305541,y=-661.40563964844,z=32.448764801025, distance=8},
  spawnVoiture={x=-19.072584152222,y=-671.11462402344,z=31.33810043335,distance=8},
--  priseServiceSecu={x=-636.49652099609,y=-234.8143157959,z=37.921588897705,distance=10},
  spawnEscorte={x=2.3695800304413,y=-671.96942138672,z=31.338062286377,distance=8},
}

local arme_garda = {
"WEAPON_NIGHTSTICK",
"WEAPON_PISTOL",
"WEAPON_FlASHLIGHT",
"WEAPON_PUMPSHOTGUN",
"WEAPON_SMG",
}



function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x, y)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

function ShowBlipGarda()
  BlipGarda = AddBlipForCoord(Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z)

  SetBlipSprite(BlipGarda, 175)
  SetBlipColour(BlipGarda, 26)
  SetBlipScale(BlipGarda, 1.0)
  SetBlipAsShortRange(BlipGarda, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('LaGarda')
  EndTextCommandSetBlipName(BlipGarda)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
     ShowBlipGarda()
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.priseServiceTrans.x, Positions.priseServiceTrans.y, Positions.priseServiceTrans.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 0.5, 20, 165, 255, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.priseServicePatron.x, Positions.priseServicePatron.y, Positions.priseServicePatron.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
--      DrawMarker(1, Positions.priseServiceSecu.x, Positions.priseServiceSecu.y, Positions.priseServiceSecu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnVoiture.x, Positions.spawnVoiture.y, Positions.spawnVoiture.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnEscorte.x, Positions.spawnEscorte.y, Positions.spawnEscorte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseServiceTrans.x, Positions.priseServiceTrans.y, Positions.priseServiceTrans.z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 26 or myjob == 27 then
                Wait(100)
                Citizen.Wait(1)
		              OutfitTrans()
                  GunGarda()
		        TriggerServerEvent("player:serviceOn", "garda")
                serviceOn = true
                TriggerEvent("itinerance:notif", "~g~Vous avez pris votre service(Transport de fond) !")
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être transporteur de fonds !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~quitter votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 26 or myjob == 27 or myjob == 28 then
              	TriggerServerEvent("player:serviceOff", "garda")
		            TriggerServerEvent("vmenu:lastChar")
		            serviceOn = false
            end
          end
        end
      end
    end
end
end)

function OutfitTrans()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 11, 220, 25, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 31, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 10, 1, 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
    AddArmourToPed(GetPlayerPed(-1),100)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 230, 25, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 30, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 12, 1, 0)
    SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
  AddArmourToPed(GetPlayerPed(-1),100)
  end
end

function GunGarda() -- target = Dernier joueur à avoir parlé, pas besoin ici. Mais obligatoire !
		for _, arme in ipairs(arme_garda) do
        local hash = GetHashKey(arme)
        GiveWeaponToPed(GetPlayerPed(-1), hash, 1000, 0, false)
			     Wait(250)
        end
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 0x359B7AAE)--Flashlight
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 0x7BC4CDDC)--Flashlight
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 0x7BC4CDDC)
		GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 0x9D2FBF29)--Flashlight
    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 0x7BC4CDDC)--Flashlight
    GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), 0x350966FB)--Magasine
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre camion~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 26 or myjob == 27 then
			           if serviceOn == true then
                local car = GetHashKey("stockade")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z , 0.0, true, false)
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
                WashDecalsFromVehicle(vehicle, 1.0)
                SetVehicleDirtLevel(vehicle, 0.0)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				        onJobLegal = 1
			else
				TriggerEvent("itinerance:notif", "~r~Vous n'êtes pas en service !")
			end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être un employé !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 26 or myjob == 27 then
              camionSortie = false
			           onJobLegal = 3
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnEscorte.x, Positions.spawnEscorte.y, Positions.spawnEscorte.z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo("~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre vehicule d'escorte lourd~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 27 then
			           if serviceOn == true then
                local car = GetHashKey("insurgent2")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, Positions.spawnEscorte.x, Positions.spawnEscorte.y, Positions.spawnEscorte.z , 0.0, true, false)
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
              TriggerEvent("itinerance:notif", "~r~Vous devez le patron !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 26 or myjob == 27 then
              camionSortie = false
			           onJobLegal = 3
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnVoiture.x, Positions.spawnVoiture.y, Positions.spawnVoiture.z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre voiture~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 28 or myjob == 27 then
			           if serviceOn == true then
                local car = GetHashKey("contender")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, Positions.spawnVoiture.x, Positions.spawnVoiture.y, Positions.spawnVoiture.z , 0.0, true, false)
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
				        SetVehicleNumberPlateText(vehicle, job.plate)
				        Wait(100)
				        SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 0, 0)
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                WashDecalsFromVehicle(vehicle, 1.0)
                SetVehicleDirtLevel(vehicle, 0.0)
                SetVehicleExtra(vehicle,1,0)
                SetVehicleExtra(vehicle,2,0)
                SetVehicleExtra(vehicle,3,0)
                SetVehicleExtra(vehicle,4,0)
                SetVehicleExtra(vehicle,5,0)
                SetVehicleExtra(vehicle,6,0)
                SetVehicleExtra(vehicle,7,0)
                SetVehicleExtra(vehicle,8,0)
                SetVehicleExtra(vehicle,9,0)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				        onJobLegal = 1
			else
				TriggerEvent("itinerance:notif", "~r~Vous n'êtes pas en service !")
			end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être un employé !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre voiture~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 28 or myjob == 27 then
              camionSortie = false
			           onJobLegal = 3
            end
          end
        end
      end
    end
end
end)

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", "garda")
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseServicePatron.x, Positions.priseServicePatron.y, Positions.priseServicePatron.z, true)
    if not IsInVehicle() then
      if distance < 1.5 then
        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre métier~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("garda:pdg")
            --TriggerEvent("vmenu:poleemploi",18)
          end
      end
    end
end
end
end)
