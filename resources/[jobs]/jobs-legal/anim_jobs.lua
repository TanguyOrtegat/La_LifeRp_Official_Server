local Positions = {
  priseServiceAni={x=1024.5660400391,y=-2508.4357910156,z=27.455450057983 ,distance=1},
}

local camionSortie = false

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 1016.3478393555, -2528.2729492188, 28.301971435547, true) -- Demande véhicule 1
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 29 then
                local car = GetHashKey("bisonpi")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, 1014.2610473633, -2522.470703125, 28.305421829224, 0.0, true, false)		-- Sortie véhicule 1
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
        				--SetVehicleNumberPlateText(vehicle, job.plate)
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
              TriggerEvent("itinerance:notif", "~r~Vous devez être animateur !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 29 then
              camionSortie = false
			  onJobLegal = 2
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 1018.6030883789, -2511.8034667969, 28.473833084106, true) -- Demande véhicule 2
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 29 then
                local car = GetHashKey("packerpi")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, 1024.1528320313, -2501.1918945313, 28.420265197754, 84.89, true, false)		-- Sortie véhicule 2
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
        				--SetVehicleNumberPlateText(vehicle, job.plate)
        				Wait(100)
        				SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleLivery(vehicle, 4)
                SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                SetVehicleEngineOn(vehicle, true, false, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                Wait(100)
                Citizen.Wait(1)
                -- camionSortie = true
				        onJobLegal = 1
                car = GetHashKey("tvtrailerpi")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, 1039.0118408203, -2502.7395019531, 28.416711807251, 78.20, true, false)		-- Sortie véhicule 2
                MISSION.truck = vehicle
                SetVehicleOnGroundProperly(vehicle)
        				--SetVehicleNumberPlateText(vehicle, job.plate)
        				Wait(100)
        				SetVehicleHasBeenOwnedByPlayer(vehicle,true)
                SetVehRadioStation(vehicle, "OFF")
                SetVehicleLivery(vehicle, 4)
                SetVehicleEngineOn(vehicle, true, false, false)
                SetEntityAsMissionEntity(vehicle, true, true)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				onJobLegal = 1
			else
              TriggerEvent("itinerance:notif", "~r~Vous devez être animateur !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre véhicule~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 29 then
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
    DrawMarker(1, 1016.3478393555, -2528.2729492188, 27.301971435547, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.00, 3.00, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)-- Demande véhicule 1
    DrawMarker(1, Positions.priseServiceAni.x, Positions.priseServiceAni.y, Positions.priseServiceAni.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.00, 1.00, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
    DrawMarker(1, 1018.6030883789, -2511.8034667969, 27.473833084106, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.00, 3.00, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)-- Demande véhicule 2
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.priseServiceAni.x, Positions.priseServiceAni.y, Positions.priseServiceAni.z, true)
    if not IsInVehicle() then
      if distance < 1.5 then
--        if serviceOn == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~prendre votre métier~w~.', 0)
          if IsControlJustPressed(1,38) then
                Citizen.Trace(distance)
            TriggerServerEvent("ani:pdg")
            --TriggerEvent("vmenu:poleemploi",18)
          end
--      end
    end
end
end
end)
