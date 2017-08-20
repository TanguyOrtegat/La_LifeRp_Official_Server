local DrawMarkerShow = true

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if DrawMarkerShow then
     --DrawMarker(1, 132.51782226563, -730.66345214844, 41.152652740479, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
	  --DrawMarker(1, 123.65026092529, -741.50341796875, 32.133243560791, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, -1581.4678955078, -558.47100830078, 33.952938079834, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, -1581.2247314453, -561.26806640625, 107.52292633057, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
	  DrawMarker(1, -1566.0908203125, -575.78460693359, 107.52299499512, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
    DrawMarker(1, -1560.9461669922, -569.16857910156, 113.44841003418, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
    end
  end
end)

-- Citizen.CreateThread(function()
  -- while true do
    -- Citizen.Wait(0)
    -- local playerPos = GetEntityCoords(GetPlayerPed(-1))
    -- local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 132.51782226563, -730.66345214844, 41.152652740479, true)
    -- if not IsInVehicle() then
      -- if distance < 2 then
          -- ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller au garage~w~.', 0)
          -- if IsControlJustPressed(1,38) then
		    -- TriggerServerEvent("poleemploi:getjobs")
            -- Wait(200)
			-- if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 or myjob == 21 then
            -- Citizen.Wait(1)
			-- SetEntityCoords(GetPlayerPed(-1), 123.65026092529, -741.50341796875, 32.133243560791)
			-- SetEntityHeading(GetPlayerPed(-1), 339.01776123047)
			-- else
				-- TriggerEvent("itinerance:notif", "~r~Vous devez être au gouvernement !")
			-- end
          -- end
      -- end
    -- end
  -- end
-- end)

-- Citizen.CreateThread(function()
  -- while true do
    -- Citizen.Wait(0)
    -- local playerPos = GetEntityCoords(GetPlayerPed(-1))
    -- local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, 123.65026092529, -741.50341796875, 32.133243560791, true)
    -- if not IsInVehicle() then
    -- if distance < 2 then
		-- if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 or myjob == 21 then
          -- ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller au gouvernement~w~.', 0)
          -- if IsControlJustPressed(1,38) then
			-- TriggerServerEvent("poleemploi:getjobs")
            -- Wait(200)
			-- if myjob == 16 or myjob == 10 or myjob == 17 or myjob == 18 or myjob == 19 or myjob == 21 then
            -- Citizen.Wait(1)
			-- SetEntityCoords(GetPlayerPed(-1), 132.51782226563, -730.66345214844, 41.152652740479)
			-- SetEntityHeading(GetPlayerPed(-1), 66.044593811035)
			-- else
				-- TriggerEvent("itinerance:notif", "~r~Vous devez être au gouvernement !")
			-- end
          -- end
      -- end
    -- end
    -- end
-- end
-- end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPos = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1581.4678955078, -558.47100830078, 34.952938079834, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller à l\'étage du gouvernement~w~.', 0)
          if IsControlJustPressed(1,38) then
		    TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
			if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 then
            Citizen.Wait(1)
			SetEntityCoords(GetPlayerPed(-1), -1581.2247314453, -561.26806640625, 108.52292633057)
			SetEntityHeading(GetPlayerPed(-1), 170.0)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez être dans le gouvernement !")
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1581.2247314453, -561.26806640625, 108.52292633057, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller au rez-de-chaussée du gouvernement~w~.', 0)
          if IsControlJustPressed(1,38) then
			TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
			if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 then
            Citizen.Wait(1)
			SetEntityCoords(GetPlayerPed(-1), -1581.4678955078, -558.47100830078, 34.952938079834)
			SetEntityHeading(GetPlayerPed(-1), 170.0)
			else
				TriggerEvent("itinerance:notif", "~r~Vous devez être au gouvernement !")
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1566.0908203125, -575.78460693359, 108.52299499512, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller sur le toit du gouvernement~w~.', 0)
          if IsControlJustPressed(1,38) then
        TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
      if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 then
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -1560.9461669922, -569.16857910156, 114.44841003418)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
      else
        TriggerEvent("itinerance:notif", "~r~Vous devez être dans le gouvernement !")
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
    local distance = GetDistanceBetweenCoords(playerPos.x, playerPos.y, playerPos.z, -1560.9461669922, -569.16857910156, 114.44841003418, true)
    if not IsInVehicle() then
      if distance < 2 then
          ShowInfo('~w~Appuyez sur ~INPUT_CONTEXT~ pour ~b~aller à l\'étage du gouvernement~w~.', 0)
          if IsControlJustPressed(1,38) then
      TriggerServerEvent("poleemploi:getjobs")
            Wait(200)
      if myjob == 14 or myjob == 10 or myjob == 19 or myjob == 20 then
            Citizen.Wait(1)
      SetEntityCoords(GetPlayerPed(-1), -1566.0908203125, -575.78460693359, 108.52299499512)
      SetEntityHeading(GetPlayerPed(-1), 170.0)
      else
        TriggerEvent("itinerance:notif", "~r~Vous devez être au gouvernement !")
      end
          end
      end
    end
end
end)

local ServerParking = {0, false}
local ParkingGouv = {
  [1] = false
}

local spawningheli = false
local spawningcar = false

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    Wait(1000)
    if ServerParking[2] then
      Wait(20000)
      TriggerServerEvent("jobsmayor:SetParking", tonumber(ServerParking[1]), false)
      Wait(1000)
      if ServerParking[1] then
        ParkingGouv[1] = false
      ServerParking = {0, false}
      Wait(10)
      TriggerServerEvent("jobsmayor:CheckParking")
    end
    end
  end
end)

local car = nil
local plate = 0

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if spawningcar == true then
      RequestModel(car)
      while not HasModelLoaded(car) do
        Citizen.Wait(0)
      end
      local spawncar = true
      TriggerServerEvent("jobsmayor:CheckParking")
      Wait(100)
      if ServerParking[2] == false then
        if ParkingGouv[1] == false then
          veh = CreateVehicle(car, -1556.7576904297, -581.412109375, 25.707906723022, 137.83462524414, true, false)
          TriggerServerEvent("jobsmayor:SetParking", 1, true)
          TriggerServerEvent("jobsmayor:CheckParking")
          ServerParking = {1, true}
        else
          spawncar = false
        end
        if spawncar == true then
          SetVehicleNumberPlateText(veh, plate)
          SetVehicleOnGroundProperly(veh)
          SetVehicleHasBeenOwnedByPlayer(veh,true)
          local id = NetworkGetNetworkIdFromEntity(veh)
          SetNetworkIdCanMigrate(id, true)
          SetVehRadioStation(veh, "OFF")
          SetEntityInvincible(veh, false)
          SetVehicleEngineTorqueMultiplier( veh, 1.25 )
          SetVehicleEnginePowerMultiplier( veh, 1.25 )
          SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
          SetEntityAsMissionEntity(veh, true, true)
          TriggerEvent("wrapper:vehPersist", veh)
          drawNotification("~g~Véhicule sorti, bonne route !")
        else
          drawNotification("~r~Tous les zones sont encombrées !")
        end
      else
        drawNotification("~r~Attendez avant de redemander un véhicule !")
      end
      spawningcar = false
    end
    if spawningheli then
      RequestModel(car)
      while not HasModelLoaded(car) do
        Citizen.Wait(0)
      end
      veh = CreateVehicle(car, -1582.4896240234, -569.60083007813, 115.32845306396, 0.0, true, false)
      SetVehicleNumberPlateText(veh, plate)
      SetVehicleOnGroundProperly(veh)
      SetVehicleHasBeenOwnedByPlayer(veh,true)
      local id = NetworkGetNetworkIdFromEntity(veh)
      SetNetworkIdCanMigrate(id, true)
      SetVehRadioStation(veh, "OFF")
      SetEntityInvincible(veh, false)
      SetVehicleLivery(veh, 2)
      SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
      SetEntityAsMissionEntity(veh, true, true)
      drawNotification("Hélicoptère sorti.")
      spawningheli = false
    end
    end
end)

RegisterNetEvent("jobsmayor:f_CheckParking")
AddEventHandler('jobsmayor:f_CheckParking', function(param)
  ParkingGouv = param
end)

RegisterNetEvent("jobsmayor:SpawnVehicle")
AddEventHandler('jobsmayor:SpawnVehicle', function(vehicle, cplate, param)
  if param then
    car = GetHashKey(vehicle)
    plate = cplate
    spawningcar = true
  else
    car = GetHashKey(vehicle)
    -- VOITURE PAR DÉFAUT
    plate = cplate
    spawningheli = true
  end
end)

function GetVehicleInDirection( coordFrom, coordTo )
  local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
  local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
  return vehicle
end

function getUnloadCoord(param)
  if param >= 305 then
    return {-1.3,1.3}
  elseif param >= 260 then
    return {0,1.3}
  elseif param >= 225 then
    return {1.3,1.3}
  elseif param >= 180 then
    return {1.3,0}
  elseif param >= 135 then
    return {1.3,-1.3}
  elseif param >= 90 then
    return {0,-1.3}
  elseif param >= 45 then
    return {-1.3,-1.3}
  else
    return {-1.3,0}
  end
end

RegisterNetEvent("jobsmayor:DespawnVehicle")
AddEventHandler('jobsmayor:DespawnVehicle', function(plateveh)
  local plateveh = plateveh
  local plate = GetVehicleNumberPlateText(v)
  Citizen.CreateThread(function()
    Citizen.Wait(1500)
    local playerPos = GetEntityCoords( GetPlayerPed(-1), 1 )
    local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( GetPlayerPed(-1), 0.0, 10.000, 0.0 )
    local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )
    if ( DoesEntityExist( vehicle ) ) then
      local plate = GetVehicleNumberPlateText(vehicle)
      if plate ~= plateveh then
        drawNotification("~r~Ce véhicule ne vous appartient pas !")
      else
        Wait(100)
        SetEntityAsMissionEntity( vehicle, true, true )
        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )
        Citizen.InvokeNative( 0xB736A491E64A32CF, Citizen.PointerValueIntInitialized( vehicle ))
        drawNotification("~g~Véhicule rentré.")
      end
    else
      drawNotification("~r~Aucun véhicule devant vous.")
    end
  end)
end)

local Despawnpoint = {
  { ['x'] = -1537.0754394531, ['y'] = -577.78796386719, ['z'] = 25.707809448242 }
}

Citizen.CreateThread(function()
  while true do
  Citizen.Wait(50)
    local playerPed = GetPlayerPed(-1)
    local lastSpawnedVeh = GetVehiclePedIsUsing(playerPed)

    if IsNearPoints(Despawnpoint, 5.01) then
			DrawMarker(1, Despawnpoint.x, Despawnpoint.y, Despawnpoint.z, 0, 0, 0, 0, 0, 0, 3.001, 3.0001, 0.5001, 0, 155, 255, 200, 0, 0, 0, 0)
    end

    if IsNearPoints(Despawnpoint, 2.01) then

      if (lastSpawnedVeh ~= nil) then
        deleteCar(lastSpawnedVeh)
      end
    end
  end
end)

function deleteCar(car)
  SetEntityAsMissionEntity(car, true, true)
  Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( car ))
  Citizen.InvokeNative( 0xB736A491E64A32CF, Citizen.PointerValueIntInitialized( car ))
  Citizen.InvokeNative( 0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized( car ))
end

function IsNearPoints(area, dist)
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	for _, item in pairs(area) do
		local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
		if(distance <= dist) then
			return true
		end
	end
end

function drawNotification(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(false, false)
end

RegisterNetEvent("jobsmayor:giveArmory")
AddEventHandler("jobsmayor:giveArmory", function(name, delayTime)
  if delayTime == nil then
    delayTime = 0
  end

  Citizen.CreateThread(function()
    Wait(delayTime)
    local hash = GetHashKey(name)
    GiveWeaponToPed(GetPlayerPed(-1), hash, 1000, 0, false)
  end)
end)

RegisterNetEvent("jobsmayor:giveWeapon")
AddEventHandler("jobsmayor:giveWeapon", function(name, delayTime)
  if delayTime == nil then
    delayTime = 0
  end

  Citizen.CreateThread(function()
    Wait(delayTime)
    local hash = GetHashKey(name)
    GiveWeaponToPed(GetPlayerPed(-1), hash, 1000, 0, false)
    SetPlayerMaxArmour(PlayerId(),100)
  end)
end)