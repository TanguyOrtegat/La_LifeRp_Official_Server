Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1098.1137695313, -256.23852539063, 37.684909820557, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 21 then
                local car = GetHashKey("rumpo3")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, -1098.1137695313, -256.23852539063, 37.484909820557, 0.0, true, false)		
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
              TriggerEvent("itinerance:notif", "~r~Vous devez être journaliste !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 21 then
              camionSortie = false
			  onJobLegal = 2
            end
          end
        end
      end
    end
end
end)

local DrawMarkerShow = true

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
    DrawMarker(1, -1098.1137695313, -256.23852539063, 36.684909820557, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 1.0, 0, 0, 255, 75, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1063.4641113281, -240.86503601074, 44.021141052246, true)
    if not IsInVehicle() then
      if distance < 1 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~entrer dans la salle~w~.', 0)
          if IsControlJustPressed(1,38) then
            Wait(200)
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -1063.2497558594, -239.28302001953, 44.021141052246)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
          end
      end
    end
end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1063.2497558594, -239.28302001953, 44.021141052246, true)
    if not IsInVehicle() then
      if distance < 1 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~sortir de la salle~w~.', 0)
          if IsControlJustPressed(1,38) then
            Wait(200)
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -1063.4641113281, -240.86503601074, 44.021141052246)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
          end
      end
    end
end
end)