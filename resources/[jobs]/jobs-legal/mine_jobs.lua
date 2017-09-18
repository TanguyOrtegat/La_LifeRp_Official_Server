local DrawMarkerShow = true
local DrawBlipTradeShow = true
local PrixRoche = 5
local PrixCuivre = 15
local PrixFer = 25
local PrixDiams = 400
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
local BlipCie
local isVehicleTruck
local truck
local vehicle
local playerPos
local distance
local chance = 5000
local chance_mat = 50
local isCheckMine = false
local isCheckTraitement = false
local isCheckVente = false
local isCheckVenteDiams = false

local Positions = {
  spawnCamion={x=978.145690917969,y=-1919.07055664063,z=30.1356315612793,distance=10},
  recolte={x=2969.47827148438,y=2777.9873046875,z=38.5488739013672, distance=15},
  traitement={x=288.19515991211,y=2862.6137695313,z=42.642417907715, distance=10},
  vente={x=1073.6827392578,y=-1987.5504150391,z=29.913116455078, distance=3},
  venteDiams={x=-619.454223632813,y=-226.972839355469,z=38.0569648742676, distance=3},
  tenue={x=2952.7358398438,y=2742.62890625,z=42.437859344482, distance=3},
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

function mineEnding()
  RemoveBlip()
  Wait(100)
  TriggerServerEvent("vmenu:lastChar")
  clearJob()
end

function mineOutfits()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 63, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 36, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 56, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 3, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 72, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 49, 1, 0)
  end
end

function ShowBlipsCie()
  BlipCie = AddBlipForCoord(Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z)

  SetBlipSprite(BlipCie, 67)
  SetBlipColour(BlipCie, 69)
  SetBlipScale(BlipCie, 0.8)
  SetBlipAsShortRange(BlipCie, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Compagnie minière')
  EndTextCommandSetBlipName(BlipCie)
end

function ShowBlips()

  BlipMine = AddBlipForCoord(Positions.recolte.x, Positions.recolte.y, Positions.recolte.z)

  SetBlipSprite(BlipMine, 78)
  SetBlipColour(BlipMine, 69)
  SetBlipAsShortRange(BlipMine, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Mine')
  EndTextCommandSetBlipName(BlipMine)

  BlipTraitement = AddBlipForCoord(Positions.traitement.x, Positions.traitement.y, Positions.traitement.z)

  SetBlipSprite(BlipTraitement, 233)
  SetBlipColour(BlipTraitement, 69)
  SetBlipAsShortRange(BlipTraitement, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Traitement de minéraux')
  EndTextCommandSetBlipName(BlipTraitement)

  BlipVenteMine = AddBlipForCoord(Positions.vente.x, Positions.vente.y, Positions.vente.z)

  SetBlipSprite(BlipVenteMine, 434)
  SetBlipColour(BlipVenteMine, 69)
  SetBlipAsShortRange(BlipVenteMine, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de minéraux')
  EndTextCommandSetBlipName(BlipVenteMine)

  BlipVenteDiams = AddBlipForCoord(Positions.venteDiams.x, Positions.venteDiams.y, Positions.venteDiams.z)

  SetBlipSprite(BlipVenteDiams, 434)
  SetBlipColour(BlipVenteDiams, 18)
  SetBlipAsShortRange(BlipVenteDiams, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Acheteur de diamant')
  EndTextCommandSetBlipName(BlipVenteDiams)
end

Citizen.CreateThread(function()
  --Création des blips pour les faire aparaitre et disparaitre --
  if DrawBlipTradeShow then
     ShowBlipsCie()
  end

   while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      --DrawMarker(1, Position.Recolet.x, Position.Recolet.y, Position.Recolet.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
      --DrawMarker(1, Position.traitement.x, Position.traitement.y, Position.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.vente.x, Positions.vente.y, Positions.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
      --DrawMarker(1, Position.venteDiams.x, Position.venteDiams.y, Position.venteDiams.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
      DrawMarker(1, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 20, 165, 75, 75, 0, 0, 2, 0, 0, 0, 0)
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
            if myjob == 4 then
                local car = GetHashKey("Tiptruck2")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                mineOutfits()
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
                ShowBlips()
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
            end
          end
        else
          if myjob == 4 then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.", 0)
            if IsControlJustPressed(1,38) and camionSorti == true then
              TriggerServerEvent("poleemploi:getjobs")
              Wait(100)
              mineEnding()
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
---------------------------------------------MINAGE-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.recolte.x, Positions.recolte.y, Positions.recolte.z, true)
      if not IsInVehicle() then
        if distance < Positions.recolte.distance then
            if isMine == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à miner~w~.", 0)
            end
            if isMine == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de miner~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isMine == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('tiptruck2')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isMine = true
                isCheckMine = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour miner !")
              end
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
            if myjob == 4 then
                while true do
                  Citizen.Wait(0)
                  if isMine == true then
                      chance_mat = math.random(0, chance)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Wait(1000)
                      inv_qty = tonumber(ITEMSJOB[23].quantity)+tonumber(ITEMSJOB[17].quantity)+tonumber(ITEMSJOB[18].quantity)+tonumber(ITEMSJOB[19].quantity)+tonumber(ITEMSJOB[24].quantity)+tonumber(ITEMSJOB[20].quantity)+tonumber(ITEMSJOB[21].quantity)+tonumber(ITEMSJOB[22].quantity)
                      Citizen.Wait(1000)
                   if tonumber(inv_qty) < 30 and chance_mat >= 0 and chance_mat < 2500 then
                       ShowMsgtime.msg = 'En train de miner...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 roche'
                       ShowMsgtime.time = 150
                       chance = chance + 1
                       TriggerEvent("player:receiveItem", 23, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 2500 and chance_mat < 4000 then
                       ShowMsgtime.msg = 'En train de miner...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 cuivre'
                       ShowMsgtime.time = 150
                       chance = chance + 1
                       TriggerEvent("player:receiveItem", 17, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 4000 and chance_mat < 4999 then
                       ShowMsgtime.msg = 'En train de miner...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 fer'
                       ShowMsgtime.time = 150
                       chance = chance + 1
                       TriggerEvent("player:receiveItem", 18, 1)
                   elseif tonumber(inv_qty) < 30 and chance_mat >= 4999 and chance_mat <= 5000 then
                       ShowMsgtime.msg = 'En train de miner...'
                       ShowMsgtime.time = 250
                       TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                       Wait(2500)
                       ShowMsgtime.msg = '+1 cuivre'
                       ShowMsgtime.time = 150
                       chance = chance + 1
                       TriggerEvent("player:receiveItem", 19, 1)
                   else
                    TriggerEvent("itinerance:notif", "~r~Votre inventaire est plein !")
                    isMine = false
                   end
                  end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
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
        if distance < Positions.recolte.distance then
            if isProc == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à traiter~w~.", 0)
            end
            if isProc == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de traiter~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isProc == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('tiptruck2')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isProc = true
                isCheckTraitement = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour traiter !")
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
            if myjob == 4 then
                while true do
                  Citizen.Wait(0)
                  if isProc == true then
                        Wait(100)
                        Citizen.Wait(1)
                        TriggerEvent("inventory:getQuantityJob")
                        Citizen.Trace(tostring(ITEMSJOB[24].quantity))
                        Citizen.Trace(tostring(ITEMSJOB[20].quantity))
                        Citizen.Trace(tostring(ITEMSJOB[21].quantity))
                        Citizen.Trace(tostring(ITEMSJOB[22].quantity))
                        Citizen.Wait(1000)
                        inv_qty = tonumber(ITEMSJOB[23].quantity)+tonumber(ITEMSJOB[17].quantity)+tonumber(ITEMSJOB[18].quantity)+tonumber(ITEMSJOB[19].quantity)+tonumber(ITEMSJOB[24].quantity)+tonumber(ITEMSJOB[20].quantity)+tonumber(ITEMSJOB[21].quantity)+tonumber(ITEMSJOB[22].quantity)
                        Citizen.Wait(1000)
                      if ITEMSJOB[23].quantity > 0 and tonumber(inv_qty) <= 30 then
                        ShowMsgtime.msg = 'Traitement en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 roche traitée'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 23, 1)
                        TriggerEvent("player:receiveItem", 24, 1)
                      elseif ITEMSJOB[17].quantity > 0 then
                        ShowMsgtime.msg = 'Traitement en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 cuivre traité'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 17, 1)
                        TriggerEvent("player:receiveItem", 20, 1)
                      elseif ITEMSJOB[18].quantity > 0 then
                        ShowMsgtime.msg = 'Traitement en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 fer traité'
                        ShowMsgtime.time = 150
                        TriggerEvent("player:looseItem", 18, 1)
                        TriggerEvent("player:receiveItem", 21, 1)
                      elseif ITEMSJOB[19].quantity > 0 then
                        ShowMsgtime.msg = 'Traitement en cours...'
                        ShowMsgtime.time = 250
                        Wait(2500)
                        ShowMsgtime.msg = '+1 diamant traité'
                        ShowMsgtime.time = 150

                        TriggerEvent("player:looseItem", 19, 1)
                        TriggerEvent("player:receiveItem", 22, 1)
                      else
                        TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de minerais sur vous !")
                        isProc = false
                      end
                   end
                end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
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
              truck = GetHashKey('tiptruck2')
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
            if myjob == 4 then
                while true do
                  Citizen.Wait(0)
                  if isSell == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Trace(tostring(ITEMSJOB[24].quantity))
                      Citizen.Trace(tostring(ITEMSJOB[20].quantity))
                      Citizen.Trace(tostring(ITEMSJOB[21].quantity))
                      Citizen.Trace(tostring(ITEMSJOB[22].quantity))
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[24].quantity) > 0 then
                      --TriggerServerEvent("jobs:getBoursePrice", 24)
                      --TriggerServerEvent("jobs:changeBoursePrice", 24)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      --local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 roche traité ~w~/ ~g~+' .. 25 .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 24, 25, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[20].quantity) > 0 then
                      --TriggerServerEvent("jobs:getBoursePrice", 20)
                      --TriggerServerEvent("jobs:changeBoursePrice", 20)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      --local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 cuivre traité ~w~/ ~g~+' .. 35 .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 20, 35, "")
                      Wait(2000)
                    elseif tonumber(ITEMSJOB[21].quantity) > 0 then
                      --TriggerServerEvent("jobs:getBoursePrice", 21)
                      --TriggerServerEvent("jobs:changeBoursePrice", 21)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      --local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 fer traité ~w~/ ~g~+' .. 55 .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 21, 55, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de minerais traités sur vous !")
                      isSell = false
                    end
                 end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
            end
         end
      end
end)

------------------------------------------------------------------------------------------------------
---------------------------------------------VENTEDIAMS-----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      playerPos = GetEntityCoords(GetPlayerPed(-1))
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.venteDiams.x, Positions.venteDiams.y, Positions.venteDiams.z, true)
      if not IsInVehicle() then
        if distance < Positions.venteDiams.distance then
            if isSellDiams == false then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~commencer à vendre~w~.", 0)
            end
            if isSellDiams == true then
              ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~arrêter de vendre~w~.", 0)
            end
            if IsControlJustPressed(1, 38) and isSellDiams == false then
              vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
              truck = GetHashKey('tiptruck2')
              isVehicleTruck = IsVehicleModel(vehicle, truck)
              if isVehicleTruck then
                Citizen.Wait(1)
                isSellDiams = true
                isCheckVenteDiams = true
              else
                TriggerEvent("itinerance:notif", "~r~Remontez dans votre camion pour vendre !")
              end
            end
            if IsControlJustPressed(1, 38) and isSellDiams == true then
              Citizen.Wait(1)
              isSellDiams = false
            end
        end
      end
  end
end)

Citizen.CreateThread(function()
        while true do
          Citizen.Wait(0)
          if isCheckVenteDiams == true then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            isCheckVenteDiams = false
            if myjob == 4 then
                while true do
                  Citizen.Wait(0)
                  if isSellDiams == true then
                      Wait(100)
                      Citizen.Wait(1)
                      TriggerEvent("inventory:getQuantityJob")
                      Citizen.Trace(tostring(ITEMSJOB[22].quantity))
                      Citizen.Wait(200)
                    if tonumber(ITEMSJOB[22].quantity) > 0 then
                      --TriggerServerEvent("jobs:getBoursePrice", 22)
                      --TriggerServerEvent("jobs:changeBoursePrice", 22)
                      ShowMsgtime.msg = 'En train de vendre...'
                      ShowMsgtime.time = 250
                      Wait(2500)
                      --local price = math.ceil(PriceBourse)
                      ShowMsgtime.msg = '~r~-1 diamant traité ~w~/ ~g~+' .. 500 .. '$'
                      ShowMsgtime.time = 150
                      TriggerEvent("inventory:sell",0, 1, 22, 500, "")
                      Wait(2000)
                    else
                      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas de minerais traités sur vous !")
                      isSellDiams = false
                    end
                  end
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
            end
        end
    end
end)


------------------------------------------------------------------------------------------------------
--------------------------------------CHANGER TENUE MINE----------------------------------------------
------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      DrawMarker(1, Positions.tenue.x, Positions.tenue.y, Positions.tenue.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 75, 255, 75, 100, 0, 0, 2, 0, 0, 0, 0)
  end
end)

Citizen.CreateThread(function()
         while true do
          Citizen.Wait(0)
          playerPos = GetEntityCoords(GetPlayerPed(-1))
          local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.tenue.x, Positions.tenue.y, Positions.tenue.z, true)
          if distance < Positions.tenue.distance then
            ShowInfo("Appuyez sur ~INPUT_CONTEXT~ pour ~b~mettre votre tenue de mineur~w~.", 0)
            if IsControlJustPressed(1, 38) then
              TriggerServerEvent("poleemploi:getjobs")
              if  myjob == 4 then
                mineOutfits()
              else
                TriggerEvent("itinerance:notif", "~r~Vous devez être mineur !")
              end
            end
         end
      end
end)
