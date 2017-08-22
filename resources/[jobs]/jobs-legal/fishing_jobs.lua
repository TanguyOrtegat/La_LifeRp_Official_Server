-- Pécheur : Prise de service
--{ ['x'] = 117.98916625977, ['y'] = -3092.4345703125, ['z'] = 6.0189809799194 },
--94.491676330566
-- Pécheur : (spawn bateau) / ranger bateau
--{ ['x'] = 101.07535552979, ['y'] = -3093.8371582031, ['z'] = 4.0190649032593 },
--273.0
-- Pécheur : Lieu de pèche
--{ ['x'] = 102.75986480713, ['y'] = -5199.7348632813, ['z'] = 3.1498336791992 },
--36.007244110107
-- Pécheur : Sortie du camion / ranger camion
--{ ['x'] = 137.32316589355, ['y'] = -3088.830078125, ['z'] = 5.8963122367859 },
--260.99389648438
-- Pécheur : Lieu de vente
--{ ['x'] = 970.26184082031, ['y'] = -1628.3770751953, ['z'] = 30.110679626465 },
--178.44902038574

local DrawMarkerShow = true
local DrawBlipTradeShow = true

local bateauSorti = false
local camionSorti = false
local isFishing = false
local isProc = false
local isSell = false
local isAnim = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipCamionPeche
local BlipZonePeche
local BlipVentePeche
local isVehicleTug
local truck
local vehicle
local playerPos
local distance
local chance = 1000
local chance_mat = 50
local isCheckPeche = false
local isCheckTraitement = false
local isCheckVente = false

local Positions = {
  spawnCamion={x=137.32316589355,y=-3088.830078125,z=4.8963122367859,distance=10},
  traitement={x=135.88681030273,y=-3106.8635253906,z=4.8963074684143,distance=10},
  spawnBateau={x=99.07535552979,y=-3093.8371582031,z=3.0190649032593,distance=10},
  peche={x=102.75986480713,y=-5199.7348632813,z=2.1498336791992, distance=60},
  priseServicePeche={x=117.98916625977,y=-3092.4345703125,z=5.0189809799194, distance=5},
  vente={x=970.26184082031,y=-1628.3770751953,z=29.110679626465, distance=10},
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

function fishingEnding()
  RemoveBlipFishing()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function fishingEnding2()
  if ( DoesEntityExist(MISSION.boat) ) then
    SetEntityAsNoLongerNeeded(MISSION.boat)
    SetVehicleDoorsLocked(MISSION.boat, 2)
    SetVehicleUndriveable(MISSION.boat, true)

    local tempboat = MISSION.boat

    MISSION.boat = 0
    SetEntityAsMissionEntity(tempboat, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(tempboat))
  end
  onJobLegal = 0
  TriggerServerEvent("vmenu:lastChar")
  RemoveBlipFishing()
  Citizen.Trace("Cleared")
  EndingDay = false
end

function RemoveBlipFishing()
Citizen.Trace("Cleared")
  RemoveBlip(BlipCamionPeche)
  RemoveBlip(BlipZonePeche)
   RemoveBlip(BlipVentePeche)
end

function fishingOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 4, 36, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 124, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 72, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 48, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 11, 54, 2, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 49, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
  end
end

function ShowBlipsFishing()

  BlipCamionPeche = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipCamionPeche, 318)
  SetBlipColour(BlipCamionPeche, 3)
  SetBlipScale(BlipCamionPeche, 0.7)
  SetBlipAsShortRange(BlipCamionPeche, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Camion de pêcheur')
  EndTextCommandSetBlipName(BlipCamionPeche)

  BlipZonePeche = AddBlipForCoord(Positions.peche.x, Positions.peche.y, Positions.peche.z)

  SetBlipSprite(BlipZonePeche, 164)
  SetBlipColour(BlipZonePeche, 3)
  SetBlipScale(BlipZonePeche, 1.0)
  SetBlipAsShortRange(BlipZonePeche, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de pêche')
  EndTextCommandSetBlipName(BlipZonePeche)

  BlipVentePeche = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVentePeche, 431)
  SetBlipColour(BlipVentePeche, 3)
  SetBlipScale(BlipVentePeche, 0.8)
  SetBlipAsShortRange(BlipVentePeche, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de poisson')
  EndTextCommandSetBlipName(BlipVentePeche)

end

function PlayScenario(param1, param2, param3)
  TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
  PlayAmbientSpeech1(GetPlayerPed(-1), param2, param3)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
    SetBlipTrade(68, "Port de pêche", 32, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z)
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 32, 125, 232, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.priseServicePeche.x, Positions.priseServicePeche.y, Positions.priseServicePeche.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 32, 125, 232, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 32, 125, 232, 75, 0, 0, 2, 0, 0, 0, 0)
      end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, true)
    if not IsInVehicle() then
      if distance < Positions.spawnCamion.distance then
        if camionSorti == false then
          ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre camion~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 22 then
                local car = GetHashKey("benson1")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                fishingOutfits()
                camionSorti = true
                vehicle = CreateVehicle(car, Positions.spawnCamion.x,  Positions.spawnCamion.y,  Positions.spawnCamion.z, 0.0, true, false)
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
                Wait(100)
                SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 25, 25)
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                Wait(100)
                ShowBlipsFishing()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
            end
          end
        else
          if myjob == 22 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
            if IsControlJustPressed(1,38) and camionSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              fishingEnding()
              Wait(100)
              camionSorti = false
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
    playerPos = GetEntityCoords(GetPlayerPed(-1))
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseServicePeche.x, Positions.priseServicePeche.y, Positions.priseServicePeche.z, true)
    if not IsInVehicle() then
      if distance < Positions.priseServicePeche.distance then
        if bateauSorti == false then
          ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre bateau~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 22 then
                local car = GetHashKey("tug")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                fishingOutfits()
                bateauSorti = true
                vehicle = CreateVehicle(car, Positions.spawnBateau.x,  Positions.spawnBateau.y,  Positions.spawnBateau.z, 0.0, true, false)
                MISSION.boat = vehicle
                SetVehicleOnGroundProperly(vehicle)
                Wait(100)
                SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 25, 25)
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                ShowBlipsFishing()
                Wait(100)
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
            end
          end
        else
          if myjob == 22 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre bateau de pêcheur~w~.", 0)
            if IsControlJustPressed(1,38) and bateauSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              fishingEnding2()
              Wait(100)
              bateauSorti = false
            end
          end
        end
      end
    end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------PÊCHE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.peche.x, Positions.peche.y, Positions.peche.z, true)
      if not IsInVehicle() then
        if distance < Positions.peche.distance then
            if isFishing == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à pêcher~w~.", 0)
            end
            if isFishing == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de pêcher~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isFishing == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('tug')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isFishing = true
                isCheckPeche = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre bateau pour pêcher !")
              end
            end
            if IsControlJustPressed(1, 38) and isFishing == true then
              Citizen.Wait(1)
              isFishing = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
while true do
      Citizen.Wait(0)
      if isAnim == true and isFishing == false then
      	ClearPedTasksImmediately(GetPlayerPed(-1))
      	isAnim = false
    	end
end
end)

Citizen.CreateThread(function()
          while true do
          Citizen.Wait(0)
          if isCheckPeche == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckFishing = false
            if myjob == 22 then
                while true do
                  Citizen.Wait(0)
                   if isFishing == true then
                      chance_mat = math.random(0, chance)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(1000)
                      inv_qty = tonumber(ITEMSJOB[28].quantity)+tonumber(ITEMSJOB[29].quantity)+tonumber(ITEMSJOB[30].quantity)+tonumber(ITEMSJOB[31].quantity)+tonumber(ITEMSJOB[32].quantity)+tonumber(ITEMSJOB[33].quantity)+tonumber(ITEMSJOB[34].quantity)+tonumber(ITEMSJOB[35].quantity)
                      Citizen.Wait(1000)
              				if isAnim == false then
                				PlayScenario("WORLD_HUMAN_STAND_FISHING","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE")
                				isAnim = true
                			end
                   if tonumber(inv_qty) < 30 and chance_mat >= 0 and chance_mat < 500 then
                       ShowMsgtime.msg = 'En train de pêcher...'
                       ShowMsgtime.time = 250
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Morue'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 28, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 500 and chance_mat < 800 then
                       ShowMsgtime.msg = 'En train de pêcher...'
                       ShowMsgtime.time = 250
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Sardine'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 29, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 800 and chance_mat < 975 then
                       ShowMsgtime.msg = 'En train de pêcher...'
                       ShowMsgtime.time = 250
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Daurade'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 30, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 975 and chance_mat <= 1000 then
                       ShowMsgtime.msg = 'En train de pêcher...'
                       ShowMsgtime.time = 250
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Saumon'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 31, 1)
                   else
                    TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
                    isFishing = false
                   end
                  end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
            end
         end
     end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------TRAITEMENT-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer le chargement~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter le chargement~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('benson1')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isProc = true
                isCheckTraitement = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour charger !")
              end
            end
            if IsControlJustPressed(1, 38) and isProc == true then
              Citizen.Wait(1)
              isProc = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
      while true do
        Citizen.Wait(0)
        if isCheckTraitement == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckTraitement = false
            if myjob == 22 then
                while true do
                  Citizen.Wait(0)
                  if isProc == true then
                        Wait(100)
                        Citizen.Wait(1)
                        TriggerEvent("inventory:getQuantityJob")
                        Citizen.Wait(1000)
                        inv_qty = tonumber(ITEMSJOB[28].quantity)+tonumber(ITEMSJOB[29].quantity)+tonumber(ITEMSJOB[30].quantity)+tonumber(ITEMSJOB[31].quantity)+tonumber(ITEMSJOB[32].quantity)+tonumber(ITEMSJOB[33].quantity)+tonumber(ITEMSJOB[34].quantity)+tonumber(ITEMSJOB[35].quantity)
                        Citizen.Wait(1000)
                      if ITEMSJOB[28].quantity > 0 and tonumber(inv_qty) <= 30 then
                        ShowMsgtime.msg = 'Chargement du camion en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Morue surgelée'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 28, 1)
                        TriggerEvent("player:receiveItem", 32, 1)
                      elseif ITEMSJOB[29].quantity > 0 then
                        ShowMsgtime.msg = 'Chargement du camion en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Sardine surgelée'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 29, 1)
                        TriggerEvent("player:receiveItem", 33, 1)
                      elseif ITEMSJOB[30].quantity > 0 then
                        ShowMsgtime.msg = 'Chargement du camion en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Daurade surgelée'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 30, 1)
                        TriggerEvent("player:receiveItem", 34, 1)
                      elseif ITEMSJOB[31].quantity > 0 then
                        ShowMsgtime.msg = 'Chargement du camion en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Saumon surgelé'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 31, 1)
                        TriggerEvent("player:receiveItem", 35, 1)
                      else
                        TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de poissons sur vous !")
                        isProc = false
                      end
                   end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
            end
         end
      end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------VENTE----------------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.vente.x, Positions.vente.y, Positions.vente.z, true)
      if not IsInVehicle() then
        if distance < Positions.vente.distance then
            if isSell == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à vendre~w~.", 0)
            end
            if isSell == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de vendre~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isSell == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('benson1')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isSell = true
                isCheckVente = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour vendre !")
              end
            end
            if IsControlJustPressed(1, 38) and isSell == true then
              Citizen.Wait(1)
              isSell = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
         while true do
          Citizen.Wait(0)
          if isCheckVente == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckVente = false
            if myjob == 22 then
                while true do
                  Citizen.Wait(0)
                  if isSell == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[32].quantity) > 0 then
					  TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[32].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[32].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price - math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Morue surgelée ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 32, price, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[33].quantity) > 0 then
					TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[33].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[32].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price - math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Sardine surgelée ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 33, price, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[34].quantity) > 0 then
					TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[34].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[34].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price - math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Daurade surgelée ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 34, price, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[35].quantity) > 0 then
					TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[35].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[35].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price - math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Saumon surgelé ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 35, price, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de poisson surgelé sur vous !")
                      isSell = false
                    end
                 end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
            end
         end
      end
end)
