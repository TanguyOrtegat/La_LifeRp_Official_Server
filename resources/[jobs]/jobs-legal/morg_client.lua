----------------------------------------------------
--===================Aurelien=====================--
----------------------------------------------------
------------------------Lua-------------------------

local DrawMarkerShow = true
local DrawBlipTradeShow = true

-- -900.0, -3002.0, 13.0
-- -800.0, -3002.0, 13.0
-- -1078.0, -3002.0, 13.0
local Price = 25
local random = 1
local Blip
local vehicle
local vehicleSorti = false
local morgue = {
  [1] = {["name"] = "Disposition",["x"] = 289.727600097656, ["y"] = -1344.177734375, ["z"] = 24.5377960205078},
  [2] = {["name"] = "Véhicule morgue",["x"] = 245.443954467773, ["y"] = -1410.55725097656, ["z"] = 30.587495803833},
  [3] = {["name"] = "Morgue",["x"] = 223.208068847656, ["y"] = -1387.89562988281, ["z"] = 30.5365390777588},
}
local hopital = {
  [1] = {["name"] = "Hôpital",["x"]=-654.125671386719,["y"]=309.119750976563,["z"]=82.9213256835938},
  [2] = {["name"] = "Hôpital",["x"]=-910.559753417969,["y"]=-335.803131103516,["z"]=38.979133605957},
  [3] = {["name"] = "Hôpital",["x"]=-427.751342773438,["y"]=-328.891357421875,["z"]=33.1089820861816},
  [4] = {["name"] = "Hôpital",["x"]=319.811828613281,["y"]=-557.3583984375,["z"]=28.7437915802002},
  [5] = {["name"] = "Hôpital",["x"]=1136.01513671875,["y"]=-1599.89086914063,["z"]=34.6925392150879},
  [6] = {["name"] = "Hôpital",["x"]=1233.5589599609,["y"]=-455.62115478516,["z"]=66.675270080566},
  [7] = {["name"] = "Hôpital",["x"]=-497.61752319336,["y"]=-335.79220581055,["z"]=34.501731872559},
  [8] = {["name"] = "Hôpital",["x"]=-504.9264831543,["y"]=-293.52209472656,["z"]=35.456760406494},
  [9] = {["name"] = "Hôpital",["x"]=748.44775390625,["y"]=220.52754211426,["z"]=87.030059814453},
  [10] = {["name"] = "Hôpital",["x"]=581.04315185547,["y"]=139.20729064941,["z"]=99.474792480469},
  [11] = {["name"] = "Hôpital",["x"]=-568.74279785156,["y"]=169.65185546875,["z"]=66.584465026855},
  [12] = {["name"] = "Hôpital",["x"]=-1108.9742431641,["y"]=-1527.5051269531,["z"]=6.7795352935791},
  [13] = {["name"] = "Hôpital",["x"]=-1063.5714111328,["y"]=-504.89562988281,["z"]=36.60973739624},
  [14] = {["name"] = "Hôpital",["x"]=-1114.5349121094,["y"]=-1531.3332519531,["z"]=3.9796371459961},
  [15] = {["name"] = "Hôpital",["x"]=-1111.1964111328,["y"]=-1535.7476806641,["z"]=4.3780755996704},
  [16] = {["name"] = "Hôpital",["x"]=-737.27355957031,["y"]=-2277.1765136719,["z"]=13.43744468689},
  [17] = {["name"] = "Hôpital",["x"]=796.64776611328,["y"]=-2988.3466796875,["z"]=6.0209360122681},
  [18] = {["name"] = "Hôpital",["x"]=809.27935791016,["y"]=-490.42205810547,["z"]=30.612243652344},
  [19] = {["name"] = "Hôpital",["x"]=2523.3527832031,["y"]=-351.61367797852,["z"]=94.13697052002},
  [20] = {["name"] = "Hôpital",["x"]=232.04777526855,["y"]=672.65588378906,["z"]=189.94561767578},
  [21] = {["name"] = "Rien mon gros criss",["x"]=0.0,["y"]=10.0,["z"]=-999.0},
}

local organe = {
  [1] = {["name"] = "Récolte d'organes",["x"] = 425.209655761719, ["y"] = -978.861267089844, ["z"] = 30.7105674743652, ["cost"] = 5000},
  [2] = {["name"] = "Emballage d'organes",["x"] = 425.209655761719, ["y"] = -978.861267089844, ["z"] = 30.7105674743652, ["cost"] = 5000},
  [3] = {["name"] = "Identification d'organes",["x"] = 425.209655761719, ["y"] = -978.861267089844, ["z"] = 30.7105674743652, ["cost"] = 5000},
  [4] = {["name"] = "Vente d'organes",["x"] = 425.209655761719, ["y"] = -978.861267089844, ["z"] = 30.7105674743652, ["cost"] = 5000},
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
  DrawText(x , y)
end

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end

local org = 0
local nborg = 0

RegisterNetEvent('org:f_getcorp')
AddEventHandler('org:f_getcorp',function(org)
  nborg = org
end)

AddEventHandler("tradeill:cbgetQuantity", function(itemQty)
  org = itemQty
end)

Citizen.CreateThread(function()

  if DrawBlipTradeShow then
    SetBlipTrade(305, "Morgue", 40, morgue[3].x, morgue[3].y, morgue[3].z)
  end

  while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      --DrawMarker(1, morgue[1].x, morgue[1].y, morgue[1].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
      -- DrawMarker(1, Position.traitement.x, Position.traitement.y, Position.traitement.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
      -- DrawMarker(1, Position.traitement2.x, Position.traitement2.y, Position.traitement2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
      -- DrawMarker(1, Position.traitement3.x, Position.traitement3.y, Position.traitement3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 25, 0, 0, 2, 0, 0, 0, 0)
      -- DrawMarker(1, Position.vente.x, Position.vente.y, Position.vente.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))

    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, morgue[3].x, morgue[3].y, morgue[3].z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if onJobLegal == 0 then
          ShowInfo('Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir la destination~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 12 then
              if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
                SetPedComponentVariation(GetPlayerPed(-1), 3, 16, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, 25, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, 4, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, 4, 0, 0)
              elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
                SetPedComponentVariation(GetPlayerPed(-1), 3, 41, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 8, 51, 1, 0)
                SetPedComponentVariation(GetPlayerPed(-1), 11, 52, 2, 0)
              end
              local car = GetHashKey("Burrito3")
              RequestModel(car)
              while not HasModelLoaded(car) do
                Wait(1)
              end
              vehicle =  CreateVehicle(car, morgue[2].x,  morgue[2].y,  morgue[2].z, 0.0, true, false)
              MISSION.truck = vehicle
              Wait(100)
              SetVehicleOnGroundProperly(vehicle)
              --SetVehicleNumberPlateText(vehicle, job.plate)
              SetVehicleHasBeenOwnedByPlayer(vehicle,true)
              SetVehRadioStation(vehicle, "OFF")
              SetVehicleColours(vehicle, 25, 25)
              SetVehicleLivery(vehicle, 4)
              SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
              SetVehicleEngineOn(vehicle, true, false, false)
              SetEntityAsMissionEntity(vehicle, true, true)
              random = math.random(1, 8)
              Blip = AddBlipForCoord(hopital[random].x, hopital[random].y, hopital[random].z)

              SetBlipSprite(Blip, 273)
              SetBlipColour(Blip, 2)
              SetBlipRoute(Blip,true)

              BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Allez chercher le ~y~corps~w~.")
              EndTextCommandSetBlipName(Blip)
              -- TriggerEvent("player:getQuantity", 4, function(data)
              --     weedcount = data.count
              -- end)
              Wait(100)
              onJobLegal = 1
              Citizen.Wait(1)
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être préposé à la morgue !")
              Blip = false
            end
          end
        else
          ShowInfo('Appuyez sur ~INPUT_CONTEXT~ pour terminer votre ~b~journée de travail~w~.', 0)
          if IsControlJustPressed(1,38) and EndingDay == false then
            EndingDay = true
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            morgEnding()
          end
        end
      end
    end

    if onJobLegal == 1 and myjob == 12 then
      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, hopital[random].x, hopital[random].y, hopital[random].z, true)
      if not IsInVehicle() then
        if distance < 5 then
          ShowInfo('Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir un corps~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 12 then
              -- TriggerEvent("player:getQuantity", 4, function(data)
              --      weedcount = data.count
              -- end)
              TriggerEvent("inventory:getQuantityJob")
              Wait(100)
              inv_qty = tonumber(ITEMSJOB[26].quantity)
			        Citizen.Trace(inv_qty)
              if inv_qty < 1 then
                ShowMsgtime.msg = 'Ramassage du corps...'
                ShowMsgtime.time = 250
                TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                Wait(2500)
                ShowMsgtime.msg = '+1 corps'
                ShowMsgtime.time = 150
                TriggerEvent("player:receiveItem", 26, 1)
                ShowMsgtime.msg = 'Allez porter le ~y~corps~w~ à la morgue.'
                ShowMsgtime.time = 150
                random = 21
                RemoveBlip(Blip)
                Blip = AddBlipForCoord(morgue[3].x, morgue[3].y, morgue[3].z)

                SetBlipSprite(Blip, 273)
                SetBlipColour(Blip, 2)
                SetBlipRoute(Blip,true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Morgue")
                EndTextCommandSetBlipName(Blip)
              else
                ShowMsgtime.msg = 'Vous avez déjà un ~y~corps~w~, allez le porter à la morgue.'
                ShowMsgtime.time = 150
                RemoveBlip(Blip)
                random = 21
                Blip = AddBlipForCoord(morgue[3].x, morgue[3].y, morgue[3].z)

                SetBlipSprite(Blip, 273)
                SetBlipColour(Blip, 2)
                SetBlipRoute(Blip,true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Morgue")
                EndTextCommandSetBlipName(Blip)
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être préposé à la morgue !")
              RemoveBlip(Blip)
              Blip = false
            end
          end
        end
      end

      local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, morgue[1].x, morgue[1].y, morgue[1].z, true)
      if not IsInVehicle() then
        if distance < 5 then
          ShowInfo('Appuyez sur ~INPUT_CONTEXT~ pour ~b~préparer le corps~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 12 then
              weedcount = 0
              -- TriggerEvent("player:getQuantity", 5, function(data)
              --         weedcount = data.count
              -- end)
              TriggerEvent("inventory:getQuantityJob")
              Wait(100)
              inv_qty = tonumber(ITEMSJOB[26].quantity)
              if inv_qty ~= 0 then
                ShowMsgtime.msg = 'Préparation du corps...'
                ShowMsgtime.time = 250
                TriggerEvent("vmenu:anim" ,"pickup_object", "pickup_low")
                Wait(2500)
                TriggerServerEvent("org:addcorp")
                TriggerServerEvent("org:getcorp")
                TriggerEvent("inventory:sell",0, 1, 26, Price, "")
                RemoveBlip(Blip)
                random = math.random(1, 8)
                Blip = AddBlipForCoord(hopital[random].x, hopital[random].y, hopital[random].z)
                SetBlipSprite(Blip, 273)
                SetBlipColour(Blip, 2)
                SetBlipRoute(Blip,true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Allez chercher le ~y~corps~w~.")
                EndTextCommandSetBlipName(Blip)
                --SetEntityAsNoLongerNeeded(Blip.company)
              else
                ShowMsgtime.msg = "~r~Vous n'avez pas de corps, allez en chercher un !"
                ShowMsgtime.time = 150
              end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être préposé à la morgue !")
            end
          end
        end
      end
      --------------------------------
    end

  end
end)

function morgEnding()
  RemoveBlip(Blip)
  onJobLegal = 2
end

RegisterNetEvent("jobslegal:morgEnding")
AddEventHandler("jobslegal:morgEnding", function()
  morgEnding()
end)

function SetBlipTrade(id, text, color, x, y, z)
  local Blip = AddBlipForCoord(x, y, z)

  SetBlipSprite(Blip, id)
  SetBlipColour(Blip, color)
  SetBlipAsShortRange(Blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(Blip)
end
