local camionSortie = false

local Positions = {
  spawnCamion={ ['x'] = 320.56762695313, ['y'] = -1477.7418212891, ['z'] = 29.807613372803, distance=3 },
 }

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z, true)
    if not IsInVehicle() then
      if distance < 5 then
        if camionSortie == false then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~obtenir votre camion~w~.', 0)
          if IsControlJustPressed(1,38) then
            TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
            if myjob == 13 then
			           --if serviceOn == true then
                local car = GetHashKey("ambu")
                RequestModel(car)
                while not HasModelLoaded(car) do
                  Wait(1)
                end
                vehicle =  CreateVehicle(car, Positions.spawnCamion.x, Positions.spawnCamion.y, Positions.spawnCamion.z , 0.0, true, false)
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
                SetEntityAsMissionEntity(vehicle, true, true)
                WashDecalsFromVehicle(vehicle, 1.0)
                SetVehicleDirtLevel(vehicle, 0.0)
                SetVehicleMod(vehicle, 11, 2)
                Wait(100)
                Citizen.Wait(1)
                camionSortie = true
				        onJobLegal = 1
			--else
			--	TriggerEvent("itinerance:notif", "~r~Vous n'êtes pas en service !")
			--end
            else
              TriggerEvent("itinerance:notif", "~r~Vous devez être un ambulancier !")
            end
          end
        else
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~ranger votre camion~w~.', 0)
          if IsControlJustPressed(1,38) then
          TriggerServerEvent("poleemploi:getjobs")
            Wait(100)
            if myjob == 13 then
              camionSortie = false
			           onJobLegal = 3
            end
          end
        end
      end
    end
end
end)
