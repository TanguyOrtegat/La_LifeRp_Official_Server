local DrawMarkerShow = true
local DrawBlipTradeShow = true
local camionSorti = false
local isvining = false
local isProc = false
local isSell = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipCamionVin
local BlipZone1
local BlipZone2
local BlipZone3
local BlipZone4
local BlipVenteVin
local BlipPressage
local isVehicleTruck
local truck
local vehicle
local playerPos
local distance
local distance2
local distance3
local distance4
local chance = 1000
local chance_mat = 50
local isCheckvining = false
local isCheckTraitement = false
local isCheckVente = false

local Positions = {
  spawnCamion={x=-80.688720703125,y=1878.8931884766,z=196.23928833008,distance=5},
  traitement={x=365.15237426758,y=3411.1508789063,z=35.40355682373,distance=10},
  Zone1={x=-1906.9057617188,y=1915.3786621094,z=165.13967895508, distance=15},
  Zone2={x=-1723.8148193359,y=1946.2926025391,z=128.25283813477, distance=20},
  Zone3={x=-1664.0681152344,y=2298.9689941406,z=58.750789642334, distance=20},
  Zone4={x=-1813.3675537109,y=2157.484375,z=114.65515899658, distance=25},
  vente={x=-178.01277160645,y=307.41897583008,z=105.37180328369, distance=8},
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

function viningEnding()
  RemoveBlipvining()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function viningEnding2()
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
  RemoveBlipvining()
  Citizen.Trace("Cleared")
  EndingDay = false
end

function RemoveBlipvining()
  RemoveBlip(BlipZone1)
  RemoveBlip(BlipZone2)
  RemoveBlip(BlipZone3)
  RemoveBlip(BlipZone4)
  RemoveBlip(BlipPressage)
  RemoveBlip(BlipVenteVin)
end



function viningOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 4, 90, 8, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 41, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 97, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 4, 93, 8, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 88, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 57, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
    SetPedPropIndex(GetPlayerPed(-1), 0, 20, 0, 0)
  end
end

function ShowBlipsCieVin()
  BlipCamionVin = AddBlipForCoord(Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z)

  SetBlipSprite(BlipCamionVin, 85)
  SetBlipColour(BlipCamionVin, 50)
  SetBlipScale(BlipCamionVin, 1.1)
  SetBlipAsShortRange(BlipCamionVin, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Vigneron')
  EndTextCommandSetBlipName(BlipCamionVin)
end

function ShowBlipsvining()

  BlipZone1 = AddBlipForCoord(Positions.Zone1.x, Positions.Zone1.y, Positions.Zone1.z)

  SetBlipSprite(BlipZone1, 164)
  SetBlipColour(BlipZone1, 50)
  SetBlipScale(BlipZone1, 0.9)
  SetBlipAsShortRange(BlipZone1, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de récolte')
  EndTextCommandSetBlipName(BlipZone1)

  BlipZone2 = AddBlipForCoord(Positions.Zone2.x, Positions.Zone2.y, Positions.Zone2.z)

  SetBlipSprite(BlipZone2, 164)
  SetBlipColour(BlipZone2, 50)
  SetBlipScale(BlipZone2, 0.9)
  SetBlipAsShortRange(BlipZone2, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de récolte')
  EndTextCommandSetBlipName(BlipZone2)

  BlipZone3 = AddBlipForCoord(Positions.Zone3.x, Positions.Zone3.y, Positions.Zone3.z)

  SetBlipSprite(BlipZone3, 164)
  SetBlipColour(BlipZone3, 50)
  SetBlipScale(BlipZone3, 0.9)
  SetBlipAsShortRange(BlipZone3, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de récolte')
  EndTextCommandSetBlipName(BlipZone3)

  BlipZone4 = AddBlipForCoord(Positions.Zone4.x, Positions.Zone4.y, Positions.Zone4.z)

  SetBlipSprite(BlipZone4, 164)
  SetBlipColour(BlipZone4, 50)
  SetBlipScale(BlipZone4, 0.9)
  SetBlipAsShortRange(BlipZone4, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Zone de récolte')
  EndTextCommandSetBlipName(BlipZone4)

  BlipVenteVin = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVenteVin, 431)
  SetBlipColour(BlipVenteVin, 50)
  SetBlipScale(BlipVenteVin, 0.9)
  SetBlipAsShortRange(BlipVenteVin, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de vin')
  EndTextCommandSetBlipName(BlipVenteVin)

  BlipPressage = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipPressage, 280)
  SetBlipColour(BlipPressage, 50)
  SetBlipScale(BlipPressage, 0.9)
  SetBlipAsShortRange(BlipPressage, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Pressage du raisin')
  EndTextCommandSetBlipName(BlipPressage)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
     ShowBlipsCieVin()
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 155, 44, 222, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 1.0, 155, 44, 222, 75, 0, 0, 2, 0, 0, 0, 0)
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
            if myjob == 23 then
                local car = GetHashKey("mule2b")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                viningOutfits()
                camionSorti = true
                vehicle = CreateVehicle(car, Positions.spawnCamion.x,  Positions.spawnCamion.y,  Positions.spawnCamion.z, 0.0, true, false)
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
                Wait(100)
                ShowBlipsvining()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être vigneron !")
            end
          end
        else
          if myjob == 23 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
            if IsControlJustPressed(1,38) and camionSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              viningEnding()
              Wait(100)
              camionSorti = false
            end
          end
        end
      end
    end
    end
end)


------------------------------------------------------------------------------------------------------
---------------------------------------------VENDANGES------------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Zone1.x, Positions.Zone1.y, Positions.Zone1.z, true)
      distance2 = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Zone2.x, Positions.Zone2.y, Positions.Zone2.z, true)
      distance3 = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Zone3.x, Positions.Zone3.y, Positions.Zone3.z, true)
      distance4 = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.Zone4.x, Positions.Zone4.y, Positions.Zone4.z, true)
      if not IsInVehicle() then
        if distance < Positions.Zone1.distance or distance2 < Positions.Zone2.distance or distance3 < Positions.Zone3.distance or distance4 < Positions.Zone4.distance then
            if isvining == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer a vendanger~w~.", 0)
            end
            if isvining == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter a vendanger~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isvining == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('mule2b')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isvining = true
                isCheckvining = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour vendanger !")
              end
            end
            if IsControlJustPressed(1, 38) and isvining == true then
              Citizen.Wait(1)
              isvining = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
          while true do
          Citizen.Wait(0)
          if isvining == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckvining = false
            if myjob == 23 then
                while true do
                  Citizen.Wait(0)
                   if isvining == true then
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(1000)
                      inv_qty = tonumber(ITEMSJOB[36].quantity)
                      Citizen.Wait(1000)
                   if tonumber(inv_qty) < 30 then
                       ShowMsgtime.msg = 'En train de vendanger...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 Grappe de raisins'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 36, 1)
                   else
                    TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
                    isvining = false
                   end
                  end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être vigneron !")
            end
         end
     end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------PRESSAGE-------------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
      if not IsInVehicle() then
        if distance < Positions.traitement.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer le pressage~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter le pressage~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('mule2b')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isProc = true
                isCheckTraitement = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour presser !")
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
            if myjob == 23 then
                while true do
                  Citizen.Wait(0)
                  if isProc == true then
                        Wait(100)
                        Citizen.Wait(1)
                        TriggerEvent("inventory:getQuantityJob")
                        Citizen.Wait(1000)
                        inv_qty = tonumber(ITEMSJOB[37].quantity)+tonumber(ITEMSJOB[38].quantity)
                        Citizen.Wait(1000)
                      if ITEMSJOB[36].quantity > 0 and tonumber(inv_qty) <= 30 then
                        ShowMsgtime.msg = 'Chargement du camion en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 Vin'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 36, 1)
                        TriggerEvent("player:receiveItem", 37, 1)
                      else
                        TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de grappe de raisins sur vous !")
                        isProc = false
                      end
                   end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être vigneron !")
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
              truck = GetHashKey('mule2b')
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
            if myjob == 23 then
                while true do
                  Citizen.Wait(0)
                  if isSell == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[37].quantity) > 0 then
                      --TriggerServerEvent("jobs:getBoursePrice", 37)
                      --TriggerServerEvent("jobs:changeBoursePrice", 37)
                      ShowMsgtime.msg = 'Vente en cours...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      --local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Vin ~w~/ ~g~+' .. 50 .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 37, 50, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de vin sur vous !")
                      isSell = false
                    end
                 end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être vigneron !")
            end
         end
      end
end)
