local DrawMarkerShow = true
local DrawBlipTradeShow = true
local camionSorti = false
local isTenue = false
local isMine = false
local isProc = false
local isSell = false
local inv_qty = 0
local inv_qty_proc = 0
local BlipForgerie
local BlipTraitement
local BlipRecolte
local BlipVenteForge
local isVehicleTruck
local truck
local vehicle
local playerPos
local distance
local chance = 1000
local chance_mat = 50
local isCheckMine = false
local isCheckTraitement = false
local isCheckVente = false

local Positions = {
  spawnCamion={x=1072.1214599609,y=-1953.7750244141,z=30.014249801636,distance=10},
  recolte={x=1077.8233642578,y=-1991.4226074219,z=29.875495910645, distance=5},
  traitement={x=1115.2315673828,y=-2018.0078125,z=34.46492767334, distance=8},
  vente={x=1015.1377563477,y=2444.9155273438,z=43.310844421387, distance=10},
  priseDeService={x=1077.9719238281,y=-1978.8187255859,z=30.471817016602, distance=3},
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

function forgeEnding()
  RemoveBlipForge()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function RemoveBlipForge()
  RemoveBlip(BlipTraitement)
  RemoveBlip(BlipVenteForge)
   RemoveBlip(BlipRecolte)
end

function forgeOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 11, 65, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 38, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 66, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 11, 60, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 49, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 39, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
  end
end

function ShowBlipsCieForge()
  BlipForgerie = AddBlipForCoord(Positions.priseDeService.x, Positions.priseDeService.y, Positions.priseDeService.z)

  SetBlipSprite(BlipForgerie, 88)
  SetBlipColour(BlipForgerie, 46)
  SetBlipScale(BlipForgerie, 0.9)
  SetBlipAsShortRange(BlipForgerie, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Forge')
  EndTextCommandSetBlipName(BlipForgerie)
end

function ShowBlipsMetal()

  BlipTraitement = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipTraitement, 436)
  SetBlipColour(BlipTraitement, 46)
  SetBlipScale(BlipForgerie, 0.8)
  SetBlipAsShortRange(BlipTraitement, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Fonte')
  EndTextCommandSetBlipName(BlipTraitement)

  BlipRecolte = AddBlipForCoord(Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)

  SetBlipSprite(BlipRecolte, 164)
  SetBlipColour(BlipRecolte, 46)
  SetBlipScale(BlipForgerie, 0.8)
  SetBlipAsShortRange(BlipRecolte, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Ramassage')
  EndTextCommandSetBlipName(BlipRecolte)

  BlipVenteForge = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVenteForge, 434)
  SetBlipColour(BlipVenteForge, 46)
  SetBlipScale(BlipForgerie, 1.0)
  SetBlipAsShortRange(BlipVenteForge, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de métal')
  EndTextCommandSetBlipName(BlipVenteForge)

end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
     ShowBlipsCieForge()
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, Positions.priseDeService.x, Positions.priseDeService.y, Positions.priseDeService.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 240, 240, 20, 50, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 240, 240, 20, 50, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 240, 240, 20, 50, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 240, 240, 20, 50, 0, 0, 2, 0, 0, 0, 0)
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
            if myjob == 24 then
                local car = GetHashKey("pounderc")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                forgeOutfits()
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
                ShowBlipForge()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être métallurgiste !")
            end
          end
        else
          if myjob == 24 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
            if IsControlJustPressed(1,38) and camionSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              forgeEnding()
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
    distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseDeService.x, Positions.priseDeService.y, Positions.priseDeService.z, true)
    if not IsInVehicle() then
      if distance < Positions.priseDeService.distance then
        if isTenue == false then
          ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir sa tenue~w~.", 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 24 then
                isTenue = true
                forgeOutfits()
                ShowBlipsMetal()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être métallurgiste !")
            end
          end
        else
          if myjob == 24 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~remettre ses vêtements~w~.", 0)
            if IsControlJustPressed(1,38) and isTenue == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              RemoveBlipForge()
              TriggerServerEvent("vmenu:lastChar")
              Wait(100)
              isTenue = false
            end
          end
        end
      end
    end
    end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------RAMASSAGE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, true)
      if not IsInVehicle() then
        if distance < Positions.recolte.distance then
            if isMine == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à ramasser~w~.", 0)
            end
            if isMine == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de ramasser~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isMine == false then
                Citizen.Wait(1)
                isMine = true
                isCheckMine = true
            end
            if IsControlJustPressed(1, 38) and isMine == true then
              Citizen.Wait(1)
              isMine = false
            end
        end
      end
  end
end)


Citizen.CreateThread(function()
          while true do
          Citizen.Wait(0)
          if isCheckMine == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckMine = false
            if myjob == 24 then
                while true do
                  Citizen.Wait(0)
                  if isMine == true then
                      chance_mat = math.random(0, chance)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(1000)
                      inv_qty = tonumber(ITEMSJOB[38].quantity)+tonumber(ITEMSJOB[39].quantity)
                      Citizen.Wait(1000)
                   if tonumber(inv_qty) < 30 and chance_mat >= 500 and chance_mat < 1001 then
                       ShowMsgtime.msg = 'En train de ramasser...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 cuivre pur'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 38, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 0 and chance_mat < 500 then
                       ShowMsgtime.msg = 'En train de ramasser...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 fer pur'
                       ShowMsgtime.time = 150
                       TriggerEvent("player:receiveItem", 39, 1)
                   else
                    TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
                    isMine = false
                   end
                  end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être métallurgiste !")
            end
         end
     end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------FONTE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.traitement.x, Positions.traitement.y, Positions.traitement.z, true)
      if not IsInVehicle() then
        if distance < Positions.recolte.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à fondre~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de fondre~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
                Citizen.Wait(1)
                isProc = true
                isCheckTraitement = true
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
            if myjob == 24 then
                while true do
                  Citizen.Wait(0)
                  if isProc == true then
                        Wait(100)
                        Citizen.Wait(1)
                        TriggerEvent("inventory:getQuantityJob")
                        Citizen.Wait(1000)
                        inv_qty = tonumber(ITEMSJOB[38].quantity)+tonumber(ITEMSJOB[39].quantity)+tonumber(ITEMSJOB[40].quantity)+tonumber(ITEMSJOB[41].quantity)
                        Citizen.Wait(1000)
                      if ITEMSJOB[38].quantity > 0 then
                        ShowMsgtime.msg = 'Fonte en cours...'
                        ShowMsgtime.time = 300
                        Wait(3000)
                        ShowMsgtime.msg = '+1 Bobine de cuivre'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 38, 1)
                        TriggerEvent("player:receiveItem", 40, 1)
                      elseif ITEMSJOB[39].quantity > 0 then
                        ShowMsgtime.msg = 'Fonte en cours...'
                        ShowMsgtime.time = 300
                        Wait(3000)
                        ShowMsgtime.msg = '+1 Plaque de fer'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 39, 1)
                        TriggerEvent("player:receiveItem", 41, 1)
                      else
                        TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de métal sur vous !")
                        isProc = false
                      end
                   end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être métallurgiste !")
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
              truck = GetHashKey('pounderc')
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
            if myjob == 24 then
                while true do
                  Citizen.Wait(0)
                  if isSell == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[40].quantity) > 0 then
                      TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[40].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[40].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Bobine de cuivre ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 40, price, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[41].quantity) > 0 then
                      TriggerServerEvent("jobs:getBoursePrice", ITEMSJOB[41].libelle)
                      TriggerServerEvent("jobs:changeBoursePrice", ITEMSJOB[41].libelle)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 Plaque de fer ~w~/ ~g~+' .. price .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 41, price, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de minerais fondus sur vous !")
                      isSell = false
                    end
                 end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être métallurgiste !")
            end
         end
      end
end)
