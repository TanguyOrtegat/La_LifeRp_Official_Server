local serviceOn = false
local camionSortie = false
local DrawMarkerShow = true
local vehicle

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
      DrawMarker(1, 895.73828125, -179.41184997559, 73.700325012207, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, 916.96960449219, -160.69403076172, 73.456153869629, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 255, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, -1043.7398681641, -2729.3371582031, 19.169290542603, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, 283.71105957031, -1409.5361328125, 28.812883377075, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, 343.84085083008, -1483.6494140625, 28.27240562439, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 255, 0, 75, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1043.7398681641, -2729.3371582031, 19.169290542603, true)
    if not IsInVehicle() then
      if distance < 5 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~y~appeler un taxi~w~.', 0)
          if IsControlJustPressed(1,38) then
				TriggerServerEvent("call:makeCall", "taxi", {x=playerPos.x,y=playerPos.y,z=playerPos.z}, "Quelqu'un à l'aéroport appelle un taxi !")
          end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 283.71105957031, -1409.5361328125, 28.812883377075, true)
    if not IsInVehicle() then
      if distance < 5 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~y~appeler un taxi~w~.', 0)
          if IsControlJustPressed(1,38) then
				TriggerServerEvent("call:makeCall", "taxi", {x=playerPos.x,y=playerPos.y,z=playerPos.z}, "Quelqu'un à l'hopital appelle un taxi !")

          end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 343.84085083008, -1483.6494140625, 28.27240562439, true)
    if not IsInVehicle() then
      if distance < 5 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~y~appeler un taxi~w~.', 0)
          if IsControlJustPressed(1,38) then
				TriggerServerEvent("call:makeCall", "taxi", {x=playerPos.x,y=playerPos.y,z=playerPos.z}, "Quelqu'un à l'hopital appelle un taxi !")
          end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 895.73828125, -179.41184997559, 74.700325012207, true)
    if not IsInVehicle() then
      if distance < 5 then
        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 17 or myjob == 18 then
                OutfitsTaxi()
                Wait(100)
                Citizen.Wait(1)
				TriggerServerEvent("player:serviceOn", "taxi")
                serviceOn = true
                TriggerEvent("itinerance:notif", "~g~Vous avez pris votre service !")
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être chauffeur de taxi !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~quitter votre service~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 17 or myjob == 18 then
              	TriggerServerEvent("player:serviceOff", "taxi")
				        serviceOn = false
				        TriggerServerEvent("vmenu:lastChar")
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 916.96960449219, -160.69403076172, 74.456153869629, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre taxi~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 17 or myjob == 18 then
			if serviceOn == true then
                local car = GetHashKey("taxia")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, 916.96960449219, -160.69403076172, 74.456153869629, 339.27685546875, true, false)
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
				        SetVehicleNumberPlateText(vehicle, job.plate)
				        Wait(100)
				        SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
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
              TriggerEvent("itinerance:notif", "~r~Vous devez être chauffeur de taxi !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre taxi~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 17 or myjob == 18 then
              camionSortie = false
			         onJobLegal = 3
            end
          end
        end
      end
    end
end
end)

function OutfitsTaxi()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 20, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 10, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 31, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 29, 1, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 4, 4, 9, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 150, 1, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 20, 0, 0)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 1, 1, 0)
  end
end

function ShowInfo(text, state)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)DisplayHelpTextFromStringLabel(0, state, 0, -1)
end

AddEventHandler('playerDropped', function()
	TriggerServerEvent("player:serviceOff", "taxi")
end)