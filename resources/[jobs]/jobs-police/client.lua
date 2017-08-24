---------------------------------- VAR ----------------------------------
------- MENU DANS FIVEMENU
local LockerPolice = {
  {name="Pole Emploi", colour=15, id=351, x=454.371, y=-993.277, z=30.689},
}

local Armory = {
  {name="Pole Emploi", colour=15, id=351, x=452.371, y=-980.028, z=30.689},
}

local Garage_police = {
  {name="Pole Emploi", colour=15, id=351, x=453.746, y=-1017.653, z=28.450},
}

local police = {
  {name="M4", id="WEAPON_CARBINERIFLE"},
  {name="Fusil à pompe", id="WEAPON_PUMPSHOTGUN"},
  {name="Pistolet", id="WEAPON_PISTOL"},
  {name="Matraque", id="WEAPON_NIGHTSTICK"},
}

local jobs = {
  {name="En Service", id=1},
  {name="Hors Service", id=0},
}

local garage = {
  {name="Voiture Banaliser", id="police4"},
}




---------------------------------- FUNCTIONS ----------------------------------

RegisterNetEvent("jobspolice:reloadSkin")
AddEventHandler("jobspolice:reloadSkin", function()
  TriggerServerEvent("vmenu:lastChar")
end)

RegisterNetEvent("jobspolice:giveArmory")
AddEventHandler("jobspolice:giveArmory", function(name, delayTime)
  if delayTime == nil then
    delayTime = 0
  end

  Citizen.CreateThread(function()
    Wait(delayTime)
    local hash = GetHashKey(name)
    GiveWeaponToPed(GetPlayerPed(-1), hash, 1000, 0, false)
  end)
end)

RegisterNetEvent("jobspolice:giveWeapon")
AddEventHandler("jobspolice:giveWeapon", function(name, delayTime)
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

RegisterNetEvent("jobspolice:changeSkin")
AddEventHandler("jobspolice:changeSkin", function(skinName, id)--skinName)
  Citizen.CreateThread(function()
    SetPedPropIndex(GetPlayerPed(-1),  0,  12,  0,  0)
    SetPedPropIndex(GetPlayerPed(-1),  1,  18,  2,  0)
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 5, 0, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 7, 15, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 2) --Dessus Armure / etc
    SetPedComponentVariation(GetPlayerPed(-1), 10, 7, 0, 2)
    SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 2)

    --SetPedComponentVariation(GetPlayerPed(-1), 2, id, 0, 2)
    --SetPedComponentVariation(GetPlayerPed(-1), id, 50, 0, 2)
    --SetPedComponentVariation(GetPlayerPed(-1), 2, 2, 0, 2)
  end)
end)

---------------------------------- CITIZEN ----------------------------------
local ServerParking = {0, false}
local ParkingPolice = {
  [1] = false,
  [2] = false,
  [3] = false,
  [4] = false
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    Wait(1000)
    if ServerParking[2] then
      Wait(20000)
      TriggerServerEvent("jobspolice:SetParking", tonumber(ServerParking[1]), false)
      Wait(1000)
      if ServerParking[1] then
        ParkingPolice[1] = false
      elseif ServerParking[2] then
        ParkingPolice[2] = false
      elseif ServerParking[3] then
        ParkingPolice[3] = false
      elseif ServerParking[4] then
        ParkingPolice[4] = false
      end
      ServerParking = {0, false}
      Wait(10)
      TriggerServerEvent("jobspolice:CheckParking")
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
      TriggerServerEvent("jobspolice:CheckParking")
      Wait(100)
      if ServerParking[2] == false then
        if ParkingPolice[1] == false then
          veh = CreateVehicle(car, 452.443, -998.466, 25.742, 0.0, true, false)
          TriggerServerEvent("jobspolice:SetParking", 1, true)
          TriggerServerEvent("jobspolice:CheckParking")
          ServerParking = {1, true}
        elseif ParkingPolice[2] == false then
          veh = CreateVehicle(car, 447.09, -996.98, 25.76, 0.0, true, false)
          TriggerServerEvent("jobspolice:SetParking", 2, true)
          TriggerServerEvent("jobspolice:CheckParking")
          ServerParking = {2, true}
        elseif ParkingPolice[3] == false then
          veh = CreateVehicle(car, 436.455, -996.787, 25.767, 0.0, true, false)
          TriggerServerEvent("jobspolice:SetParking", 3, true)
          TriggerServerEvent("jobspolice:CheckParking")
          ServerParking = {3, true}
        elseif ParkingPolice[4] == false then
          veh = CreateVehicle(car, 431.480, -996.450, 25.772, 0.0, true, false)
          TriggerServerEvent("jobspolice:SetParking", 4, true)
          TriggerServerEvent("jobspolice:CheckParking")
          ServerParking = {4, true}
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
          drawNotification("Véhicule sorti, bonne route")
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
      veh = CreateVehicle(car, 449.87265014648, -981.50982666016, 43.69164276123, 0.0, true, false)
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
      drawNotification("Véhicule sorti, bonne route")
      spawningheli = false
    end
  if spawningboat then
      RequestModel(car)
      while not HasModelLoaded(car) do
        Citizen.Wait(0)
      end
      veh = CreateVehicle(car, -859.32885742188, -1327.5693359375, 0.61249089241028, 109.81607055664, true, false)
      SetVehicleNumberPlateText(veh, plate)
      SetVehicleOnGroundProperly(veh)
      SetVehicleHasBeenOwnedByPlayer(veh,true)
      local id = NetworkGetNetworkIdFromEntity(veh)
      SetNetworkIdCanMigrate(id, true)
      SetVehRadioStation(veh, "OFF")
      SetEntityInvincible(veh, false)
    SetVehicleEngineTorqueMultiplier( veh, 2 )
      SetVehicleEnginePowerMultiplier( veh, 2 )
      SetVehicleLivery(veh, 2)
      SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
      SetEntityAsMissionEntity(veh, true, true)
      drawNotification("Véhicule sorti, bonne route")
      spawningboat = false
    end
  end
end)

RegisterNetEvent("jobspolice:f_CheckParking")
AddEventHandler('jobspolice:f_CheckParking', function(param)
  ParkingPolice = param
end)

RegisterNetEvent("jobspolice:SpawnVehicle")
AddEventHandler('jobspolice:SpawnVehicle', function(vehicle, cplate, param, param2)
  if param then
    car = GetHashKey(vehicle)
    -- VOITURE PAR DÉFAUT
    plate = cplate
    spawningcar = true
  elseif param2 then
    car = GetHashKey(vehicle)
    -- VOITURE PAR DÉFAUT
    plate = cplate
    spawningheli = true
  else
  car = GetHashKey(vehicle)
    -- VOITURE PAR DÉFAUT
    plate = cplate
    spawningboat = true
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

RegisterNetEvent("jobspolice:DespawnVehicle")
AddEventHandler('jobspolice:DespawnVehicle', function(plateveh)
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
        drawNotification("~r~Ce véhicule ne vous appartient pas.")
      else
        -- local heading = GetEntityHeading(GetPlayerPed(-1))
        -- local unloadCoord = getUnloadCoord(heading)
        -- local ply = GetPlayerPed(-1)
        -- local plyCoords = GetEntityCoords(ply, 0)
        -- SetEntityCoords(GetPlayerPed(-1), plyCoords["x"] + unloadCoord[1], plyCoords["y"] + unloadCoord[2], plyCoords["z"] + 0.3)
        Wait(100)
        SetEntityAsMissionEntity( vehicle, true, true )
        Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )
        Citizen.InvokeNative( 0xB736A491E64A32CF, Citizen.PointerValueIntInitialized( vehicle ))
        drawNotification("~g~Véhicule rentré.")
      end
    else
      drawNotification("~r~Aucun véhicule devant vous !")
    end
  end)
end)

local Despawnpoint = {
  { ['x'] = 462.76406860352, ['y'] = -1019.4964599609, ['z'] = 28.104484558105 }
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

RegisterNetEvent("ShowBlipsPolice")
AddEventHandler('ShowBlipsPolice', function()
  ShowBlipsPolice()
end)

RegisterNetEvent("RemoveBlipsPolice")
AddEventHandler('RemoveBlipsPolice', function()
  RemoveBlipsPolice()
end)

function ShowBlipsPolice()

  BlipGaragePolice = AddBlipForCoord(453.746, -1017.653, 28.450)

  SetBlipSprite(BlipGaragePolice, 357)
  SetBlipColour(BlipGaragePolice, 38)
  SetBlipAsShortRange(BlipGaragePolice, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Garage (police)')
  EndTextCommandSetBlipName(BlipGaragePolice)

  BlipGarageHelicoPolice = AddBlipForCoord(449.87265014648, -981.50982666016, 43.69164276123)

  SetBlipSprite(BlipGarageHelicoPolice, 360)
  SetBlipColour(BlipGarageHelicoPolice, 38)
  SetBlipAsShortRange(BlipGarageHelicoPolice, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Héliport (police)')
  EndTextCommandSetBlipName(BlipGarageHelicoPolice)

  BlipGarageBateauPolice = AddBlipForCoord(-862.38153076172, -1324.1118164063, 0.605167388916)

  SetBlipSprite(BlipGarageBateauPolice, 356)
  SetBlipColour(BlipGarageBateauPolice, 38)
  SetBlipAsShortRange(BlipGarageBateauPolice, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString('Port (police)')
  EndTextCommandSetBlipName(BlipGarageBateauPolice)

end

function RemoveBlipsPolice()
  RemoveBlip(BlipGaragePolice)
  RemoveBlip(BlipGarageHelicoPolice)
  RemoveBlip(BlipGarageBateauPolice)
end

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

RegisterNetEvent("jobspolice:notif")
AddEventHandler('jobspolice:notif', function(lestring)
  drawNotification("" .. lestring .. "")
end)

RegisterNetEvent("jobspolice:cadet")
AddEventHandler('jobspolice:cadet', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 59,  0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 4, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)

RegisterNetEvent("jobspolice:officier")
AddEventHandler('jobspolice:officier', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)
RegisterNetEvent("jobspolice:sergent")
AddEventHandler('jobspolice:sergent', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 1, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 1, 0)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)
RegisterNetEvent("jobspolice:lieutenant")
AddEventHandler('jobspolice:lieutenant', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 3, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 3, 0)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)
RegisterNetEvent("jobspolice:capitaine")
AddEventHandler('jobspolice:capitaine', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
      SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	  SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	  SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	  SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	  SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	  SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	  SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	  SetPedPropIndex(GetPlayerPed(-1), 1, 7, 0, 1)
	  SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)
RegisterNetEvent("jobspolice:commandant")
AddEventHandler('jobspolice:commandant', function()
  if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then -- Male
    SetPedComponentVariation(GetPlayerPed(-1), 3, 30, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 24, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 58, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 55, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 6, 3, 0, 1)
	SetPedPropIndex(GetPlayerPed(-1), 0, 46, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 5, 0, 1)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 9, 10, 1, 2)
  elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then -- Female
    SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 4, 34, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 6, 25, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 8, 35, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 11, 48, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 0, 45, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 1, 24, 0, 0)
	SetPedPropIndex(GetPlayerPed(-1), 2, 2, 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 8, 2, 0)
	SetPedComponentVariation(GetPlayerPed(-1), 9, 10, 1, 2)
  end
  AddArmourToPed(GetPlayerPed(-1),100)
end)
