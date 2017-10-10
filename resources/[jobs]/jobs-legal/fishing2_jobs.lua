local DrawMarkerShow = true
local DrawBlipTradeShow = true

local bateauSorti = false
local camionSorti = false
local isfishing2 = false
local isProc = false
local isSell = false
local isAnim = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipCamionpeche2
local BlipZonepeche2
local BlipVentepeche2
local isVehicleTug
local truck
local vehicle
local playerPos
local distance
local chance = 1000
local chance_mat = 50
local isCheckpeche2 = false
local isCheckTraitement = false
local isCheckVente = false

local Positions = {
  spawnCamion={x=1305.7674560547,y=4325.0209960938,z=37.274467468262,distance=10},
  traitement={x=1308.4174804688,y=4312.7983398438,z=36.76490020752,distance=10},
  spawnBateau={x=1332.3034667969,y=4265.93603515631,z=30.972761154175,distance=10},
  peche2={x=-466.41549682617,y=4424.2509765625,z=29.74536895752, distance=50},
  priseServicepeche2={x=1320.4821777344,y=4314.5092773438,z=37.141288757324, distance=5},
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

function fishing2Ending()
  RemoveBlipfishing2()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function fishing2Ending2()
  if ( DoesEntityExist(MISSION.boat) ) then
    --SetEntityAsNoLongerNeeded(MISSION.boat)
    SetVehicleDoorsLocked(MISSION.boat, 2)
    SetVehicleUndriveable(MISSION.boat, true)

    local tempboat = MISSION.boat

    MISSION.boat = 0
    SetEntityAsMissionEntity(tempboat, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(tempboat))
  end
  onJobLegal = 0
  TriggerServerEvent("vmenu:lastChar")
  RemoveBlipfishing2()
  Citizen.Trace("Cleared")
  EndingDay = false
end

function RemoveBlipfishing2()
Citizen.Trace("Cleared")
  RemoveBlip(BlipCamionpeche2)
  RemoveBlip(BlipZonepeche2)
   RemoveBlip(BlipVentepeche2)
end

function fishing2Outfits()
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

function ShowBlipsfishing2()

  BlipCamionpeche2 = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipCamionpeche2, 318)
  SetBlipColour(BlipCamionpeche2, 3)
  SetBlipScale(BlipCamionpeche2, 0.7)
  SetBlipAsShortRange(BlipCamionpeche2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Camion de pêcheur')
  EndTextCommandSetBlipName(BlipCamionpeche2)

  BlipZonepeche2 = AddBlipForCoord(Positions.peche2.x, Positions.peche2.y, Positions.peche2.z)

  SetBlipSprite(BlipZonepeche2, 164)
  SetBlipColour(BlipZonepeche2, 3)
  SetBlipScale(BlipZonepeche2, 1.0)
  SetBlipAsShortRange(BlipZonepeche2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de pêche')
  EndTextCommandSetBlipName(BlipZonepeche2)

  BlipVentepeche2 = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVentepeche2, 431)
  SetBlipColour(BlipVentepeche2, 3)
  SetBlipScale(BlipVentepeche2, 0.8)
  SetBlipAsShortRange(BlipVentepeche2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de poisson')
  EndTextCommandSetBlipName(BlipVentepeche2)

end

function PlayScenario(param1, param2, param3)
  TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
  PlayAmbientSpeech1(GetPlayerPed(-1), param2, param3)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
    SetBlipTrade(410, "Port de plaisance", 3, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z)
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 32, 125, 232, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.priseServicepeche2.x, Positions.priseServicepeche2.y, Positions.priseServicepeche2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 32, 125, 232, 75, 0, 0, 2, 0, 0, 0, 0)
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
                fishing2Outfits()
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
                ShowBlipsfishing2()
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
              fishing2Ending()
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
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseServicepeche2.x, Positions.priseServicepeche2.y, Positions.priseServicepeche2.z, true)
    if not IsInVehicle() then
      if distance < Positions.priseServicepeche2.distance then
        if bateauSorti == false then
          ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre bateau~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 22 then
                local car = GetHashKey("dinghy2")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                fishing2Outfits()
                bateauSorti = true
                vehicle = CreateVehicle(car, Positions.spawnBateau.x,  Positions.spawnBateau.y,  Positions.spawnBateau.z, 0.0, true, false)
                MISSION.boat = vehicle
                SetVehicleOnGroundProperly(vehicle)
                Wait(100)
                SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 25, 25)
                SetVehicleLivery(vehicle, 4)
                SetVehicleEngineOn(vehicle, true, false, false)
                ShowBlipsfishing2()
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
              fishing2Ending2()
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
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.peche2.x, Positions.peche2.y, Positions.peche2.z, true)
      if not IsInVehicle() then
        if distance < Positions.peche2.distance then
            if isfishing2 == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à pêcher~w~.", 0)
            end
            if isfishing2 == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de pêcher~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isfishing2 == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('dinghy2')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isfishing2 = true
                isCheckpeche2 = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre bateau pour pêcher !")
              end
            end
            if IsControlJustPressed(1, 38) and isfishing2 == true then
              Citizen.Wait(1)
              isfishing2 = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
while true do
      Citizen.Wait(0)
      if isAnim == true and isfishing2 == false then
      	ClearPedTasksImmediately(GetPlayerPed(-1))
      	isAnim = false
    	end
end
end)

Citizen.CreateThread(function()
          while true do
          Citizen.Wait(0)
          if isCheckpeche2 == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckfishing2 = false
            if myjob == 22 then
                while true do
                  Citizen.Wait(0)
                  local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.peche2.x, Positions.peche2.y, Positions.peche2.z, true)
                  if distance < Positions.peche2.distance then
                   if isfishing2 == true then
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
                    isfishing2 = false
                   end
                  end
              else
                  isfishing2 = false
                  isfishing2 = false
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
                            Wait(0)
                            local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
                            if distance < Positions.traitement.distance then
                                Citizen.Trace(distance)
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
                      else
                          isProc = false
                          isCheckTraitement = false
                      end
                      end
                  else
                      TriggerEvent("itinerance:notif", "~r~Vous devez être pêcheur !")
                  end
         end
      end
end)
