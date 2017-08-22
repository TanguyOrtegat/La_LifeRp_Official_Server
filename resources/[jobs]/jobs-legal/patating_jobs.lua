local DrawMarkerShow = true
local DrawBlipTradeShow = true
local tracteurSorti = false
local camionSorti = false
local ispatating = false
local isProc = false
local isSell = false
local isAnim = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipTracteur
local BlipRecoltePatate
local BlipVentePatate
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
  spawnCamion={x=2564.51171875,y=4695.6220703125,z=33.016395568848,distance=4},
  spawnTracteur={x=2543.4006347656,y=4667.18359375,z=33.076808929443,distance=4},
  traitement={x=2565.1044921875,y=4684.3754882813,z=33.138164520264,distance=4},
  recolte={x=2857.1486816406,y=4629.8310546875,z=47.987895965576, distance=30},
  vente={x=90.667350769043,y=298.20275878906,z=109.21018981934, distance=4},
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

function patatingEnding()
  RemoveBlippatating()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function patatingEnding2()
  if ( DoesEntityExist(MISSION.tractor) ) then
    SetEntityAsNoLongerNeeded(MISSION.tractor)
    SetVehicleDoorsLocked(MISSION.tractor, 2)
    SetVehicleUndriveable(MISSION.tractor, true)

    local temptractor = MISSION.tractor

    MISSION.tractor = 0
    SetEntityAsMissionEntity(temptractor, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(temptractor))
  end
  onJobLegal = 0
  TriggerServerEvent("vmenu:lastChar")
  RemoveBlippatating()
  Citizen.Trace("Cleared")
  EndingDay = false
end

function RemoveBlippatating()
Citizen.Trace("Cleared")
  RemoveBlip(BlipRecoltePatate)
  RemoveBlip(BlipVentePatate)
end

function patatingOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 4, 90, 2, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 41, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 97, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 1, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 4, 93, 2, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 88, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 57, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, 20, 0, 0)
  end
end

function ShowBlipspatating()

  BlipRecoltePatate = AddBlipForCoord(Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)

  SetBlipSprite(BlipRecoltePatate, 164)
  SetBlipColour(BlipRecoltePatate, 21)
  SetBlipScale(BlipRecoltePatate, 1.0)
  SetBlipAsShortRange(BlipRecoltePatate, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Champs de pommes de terre')
  EndTextCommandSetBlipName(BlipRecoltePatate)

  BlipVentePatate = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVentePatate, 434)
  SetBlipColour(BlipVentePatate, 21)
  SetBlipScale(BlipVentePatate, 0.9)
  SetBlipAsShortRange(BlipVentePatate, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Vente de pommes de terre')
  EndTextCommandSetBlipName(BlipVentePatate)

end

function ShowBlipsCieFerme()
  BlipTracteur = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipTracteur, 318)
  SetBlipColour(BlipTracteur, 21)
  SetBlipScale(BlipTracteur, 0.9)
  SetBlipAsShortRange(BlipTracteur, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Ferme')
  EndTextCommandSetBlipName(BlipTracteur)
end

function PlayScenario(param1, param2, param3)
  TaskStartScenarioInPlace(GetPlayerPed(-1), param1, 0, 1)
  PlayAmbientSpeech1(GetPlayerPed(-1), param2, param3)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
     ShowBlipsCieFerme()
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 150, 90, 40, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnTracteur.x, Positions.spawnTracteur.y, Positions.spawnTracteur.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 150, 90, 40, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.vente.x, Positions.vente.y, Positions.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 150, 90, 40, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 150, 90, 40, 75, 0, 0, 2, 0, 0, 0, 0)
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
            if myjob == 25 then
                local car = GetHashKey("mulea")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                patatingOutfits()
                patatingEnding()
                camionSorti = true
                vehicle = CreateVehicle(car, Positions.spawnCamion.x,  Positions.spawnCamion.y,  Positions.spawnCamion.z, 0.0, true, false)
                MISSION.tractor = vehicle
                SetVehicleOnGroundProperly(vehicle)
                Wait(100)
                SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleColours(vehicle, 25, 25)
                SetVehicleLivery(vehicle, 4)
                SetVehicleEngineOn(vehicle, true, false, false)
                Wait(100)
                ShowBlipspatating()
				SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être agriculteur !")
            end
          end
        else
          if myjob == 25 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
            if IsControlJustPressed(1,38) and camionSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              patatingEnding2()
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
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnTracteur.x, Positions.spawnTracteur.y, Positions.spawnTracteur.z, true)
    if not IsInVehicle() then
      if distance < Positions.spawnCamion.distance then
        if tracteurSorti == false then
          ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre tracteur~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 25 then
                local car = GetHashKey("tractor2")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                patatingOutfits()
                tracteurSorti = true
                vehicle = CreateVehicle(car, Positions.spawnTracteur.x,  Positions.spawnTracteur.y,  Positions.spawnTracteur.z, 0.0, true, false)
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
                ShowBlipspatating()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être agriculteur !")
            end
          end
        else
          if myjob == 25 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre tracteur~w~.", 0)
            if IsControlJustPressed(1,38) and tracteurSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              patatingEnding()
              Wait(100)
              tracteurSorti = false
            end
          end
        end
      end
    end
    end
end)

------------------------------------------------------------------------------------------------------
-----------------------------------------------RECOLTE--------------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, true)
      if not IsInVehicle() then
        if distance < Positions.recolte.distance then
            if ispatating == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à récolter~w~.", 0)
            end
            if ispatating == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de récolter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and ispatating == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('tractor2')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                ispatating = true
                isCheckpatating = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre tracteur pour récolter !")
              end
            end
            if IsControlJustPressed(1, 38) and ispatating == true then
              Citizen.Wait(1)
              ispatating = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
while true do
      Citizen.Wait(0)
      if isAnim == true and ispatating == false then
      	ClearPedTasksImmediately(GetPlayerPed(-1))
      	isAnim = false
    	end
end
end)

Citizen.CreateThread(function()
          while true do
          Citizen.Wait(0)
          if isCheckpatating == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckpatating = false
            if myjob == 25 then
                while true do
                  Citizen.Wait(0)
                   if ispatating == true then
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(1000)
                      inv_qty = tonumber(ITEMSJOB[42].quantity)+tonumber((ITEMSJOB[43].quantity)*2)
                      Citizen.Wait(1000)
              		  	if isAnim == false then
                				PlayScenario("WORLD_HUMAN_GARDENER_PLANT","GENERIC_CURSE_MED" ,"SPEECH_PARAMS_FORCE")
                				isAnim = true
                			end
                   if tonumber(inv_qty) < 60 then
                       ShowMsgtime.msg = 'En train de récolter...'
                       ShowMsgtime.time = 250
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Pomme de terre'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 42, 1)
                   else
                    TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
                    ispatating = false
                   end
                  end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être agriculteur !")
            end
         end
     end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------EMBALLAGE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer l'emballage~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter l'emballage~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('mulea')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isProc = true
                isCheckTraitement = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour emballer !")
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
            if myjob == 25 then
                while true do
                  Citizen.Wait(0)
                  if isProc == true then
                        Wait(100)
                        Citizen.Wait(1)
                        TriggerEvent("inventory:getQuantityJob")
                        Citizen.Wait(1000)
                        inv_qty = tonumber(ITEMSJOB[42].quantity)
                        Citizen.Wait(1000)
                      if ITEMSJOB[42].quantity > 0 and tonumber(inv_qty) <= 60 then
                        ShowMsgtime.msg = 'Emballage en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Sac de pommes de terre'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 42, 1)
                        TriggerEvent("player:receiveItem", 43, 1)
                      else
                        TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de pommes de terre sur vous, allez vendre avec votre camion!")
                        isProc = false
                      end
                   end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être agriculteur !")
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
              truck = GetHashKey('mulea')
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
            if myjob == 25 then
                while true do
                  Citizen.Wait(0)
                  if isSell == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[43].quantity) > 0 then
                      TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[43].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[43].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Sac de pommes de terre ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 43, price, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de sac de pommes de terre sur vous !")
                      isSell = false
                    end
                 end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être agriculteur !")
            end
         end
      end
end)
