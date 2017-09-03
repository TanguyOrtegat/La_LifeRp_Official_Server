--[[Info]]--

--require "resources/mysql-async/lib/MySQL"



--[[Register]]--

RegisterServerEvent('ply_garages:CheckForSpawnVeh')
RegisterServerEvent('ply_garages:CheckForVeh')
RegisterServerEvent('ply_garages:SetVehOut')
RegisterServerEvent('ply_garages:PutVehInGarages')
RegisterServerEvent('ply_garages:CheckGarageForVeh')
RegisterServerEvent('ply_garages:CheckForSelVeh')
RegisterServerEvent('ply_garages:Lang')
RegisterServerEvent('ply_garages:UpdateVeh')



--[[Function]]--

function getPlayerID(source)
  return getIdentifiant(GetPlayerIdentifiers(source))
end

function getIdentifiant(id)
  for _, v in ipairs(id) do
    return v
  end
end

function vehiclePlate(plate)
local playerSource = source
  return MySQL.Sync.fetchScalar("SELECT vehicle_plate FROM user_vehicle WHERE identifier=@identifier AND vehicle_plate=@plate",{['@identifier'] = getPlayerID(playerSource), ['@plate'] = plate})
end

function vehiclePrice(plate,model)
  local playerSource = source
  return MySQL.Sync.fetchScalar("SELECT vehicle_price FROM user_vehicle WHERE identifier=@identifier AND vehicle_plate=@plate AND vehicle_model=@model",{['@identifier'] = getPlayerID(playerSource), ['@plate'] = plate, ['@model'] = model})
end



--[[Local/Global]]--

vehicles = {}



--[[Events]]--


--Langage
AddEventHandler('ply_garages:Lang', function(lang)
  if lang == "FR" then
    state_in = "Rentré"
    state_out = "Sorti"
  elseif lang =="EN" then
    state_in = "In"
    state_out = "Out"
  end
end)

--Garage
AddEventHandler('ply_garages:CheckForSpawnVeh', function(veh_id)
    local playerSource = source
    local veh_id = veh_id
    local user = getPlayerID(playerSource)
    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @identifier AND id = @id",{['@identifier'] = user, ['@id'] = veh_id}, function(data)
        TriggerClientEvent('ply_garages:SpawnVehicle',playerSource, data[1].vehicle_model,data[1].vehicule_damage, data[1].vehicle_plate, data[1].vehicle_state, data[1].vehicle_colorprimary, data[1].vehicle_colorsecondary, data[1].vehicle_pearlescentcolor, data[1].vehicle_wheelcolor, data[1].vehicle_plateindex, data[1].vehicle_neoncolor1, data[1].vehicle_neoncolor2, data[1].vehicle_neoncolor3, data[1].vehicle_windowtint, data[1].vehicle_wheeltype, data[1].vehicle_mods0, data[1].vehicle_mods1, data[1].vehicle_mods2, data[1].vehicle_mods3, data[1].vehicle_mods4, data[1].vehicle_mods5, data[1].vehicle_mods6, data[1].vehicle_mods7, data[1].vehicle_mods8, data[1].vehicle_mods9, data[1].vehicle_mods10, data[1].vehicle_mods11, data[1].vehicle_mods12, data[1].vehicle_mods13, data[1].vehicle_mods14, data[1].vehicle_mods15, data[1].vehicle_mods16, data[1].vehicle_turbo, data[1].vehicle_tiresmoke, data[1].vehicle_xenon, data[1].vehicle_mods23, data[1].vehicle_mods24, data[1].vehicle_neon0, data[1].vehicle_neon1, data[1].vehicle_neon2, data[1].vehicle_neon3, data[1].vehicle_bulletproof,data[1].vehicle_smokecolor1,data[1].vehicle_smokecolor2,data[1].vehicle_smokecolor3,data[1].vehicle_modvariation)
    end)
end)

AddEventHandler('ply_garages:CheckForVeh', function(plate,model,damage)
  local playerSource = source
  if vehiclePlate(plate) == plate then
    local plaque = plate
    local user = getPlayerID(playerSource)
    local state = "Rentré"
    MySQL.Sync.execute("UPDATE user_vehicle SET vehicle_state=@state, vehicule_damage=@damage WHERE identifier=@identifier AND vehicle_plate=@plate AND vehicle_model=@model",{['@identifier'] = user, ['@state'] = state, ['@plate'] = plate,["@model"]=model,["@damage"]=damage})
    TriggerClientEvent('ply_garages:StoreVehicleTrue', playerSource)
  else
    TriggerClientEvent('ply_garages:StoreVehicleFalse', playerSource)
  end
end)

AddEventHandler('ply_garages:UpdateVeh', function(plate, plateindex, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, neoncolor1, neoncolor2, neoncolor3, windowtint, wheeltype, mods0, mods1, mods2, mods3, mods4, mods5, mods6, mods7, mods8, mods9, mods10, mods11, mods12, mods13, mods14, mods15, mods16, turbo, tiresmoke, xenon, mods23, mods24, neon0, neon1, neon2, neon3, bulletproof, smokecolor1, smokecolor2, smokecolor3, variation,model)
local playerSource = source
  if vehiclePlate(plate) == plate then
    MySQL.Sync.execute("UPDATE user_vehicle SET vehicle_plateindex=@plateindex, vehicle_colorprimary=@primarycolor, vehicle_colorsecondary=@secondarycolor, vehicle_pearlescentcolor=@pearlescentcolor, vehicle_wheelcolor=@wheelcolor, vehicle_neoncolor1=@neoncolor1, vehicle_neoncolor2=@neoncolor2, vehicle_neoncolor3=@neoncolor3, vehicle_windowtint=@windowtint, vehicle_wheeltype=@wheeltype, vehicle_mods0=@mods0, vehicle_mods1=@mods1, vehicle_mods2=@mods2, vehicle_mods3=@mods3, vehicle_mods4=@mods4, vehicle_mods5=@mods5, vehicle_mods6=@mods6, vehicle_mods7=@mods7, vehicle_mods8=@mods8, vehicle_mods9=@mods9, vehicle_mods10=@mods10, vehicle_mods11=@mods11, vehicle_mods12=@mods12, vehicle_mods13=@mods13, vehicle_mods14=@mods14, vehicle_mods15=@mods15, vehicle_mods16=@mods16, vehicle_turbo=@turbo, vehicle_tiresmoke=@tiresmoke, vehicle_xenon=@xenon, vehicle_mods23=@mods23, vehicle_mods24=@mods24, vehicle_neon0=@neon0, vehicle_neon1=@neon1, vehicle_neon2=@neon2, vehicle_neon3=@neon3, vehicle_bulletproof=@bulletproof, vehicle_smokecolor1=@smokecolor1, vehicle_smokecolor2=@smokecolor2, vehicle_smokecolor3=@smokecolor3, vehicle_modvariation=@variation WHERE identifier=@identifier AND vehicle_plate=@plate AND vehicle_model=@model",
      {['@identifier'] = getPlayerID(playerSource), ['@plateindex'] = plateindex, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor, ['@neoncolor1'] = neoncolor1 , ['@neoncolor2'] = neoncolor2, ['@neoncolor3'] = neoncolor3, ['@windowtint'] = windowtint, ['@wheeltype'] = wheeltype, ['@mods0'] = mods0, ['@mods1'] = mods1, ['@mods2'] = mods2, ['@mods3'] = mods3, ['@mods4'] = mods4,
      ["@mods5"] = mods5,
       ['@mods6'] = mods6, ['@mods7'] = mods7, ['@mods8'] = mods8, ['@mods9'] = mods9, ['@mods10'] = mods10, ['@mods11'] = mods11, ['@mods12'] = mods12, ['@mods13'] = mods13, ['@mods14'] = mods14, ['@mods15'] = mods15, ['@mods16'] = mods16, ['@turbo'] = turbo, ['@tiresmoke'] = tiresmoke, ['@xenon'] = xenon, ['@mods23'] = mods23, ['@mods24'] = mods24, ['@neon0'] = neon0,
        ['@neon1'] = neon1, ['@neon2'] = neon2, ['@neon3'] = neon3, ['@bulletproof'] = bulletproof, ['@plate'] = plate, ['@smokecolor1'] = smokecolor1, ['@smokecolor2'] = smokecolor2, ['@smokecolor3'] = smokecolor3, ['@variation'] = variation, ['@model'] = model})
    TriggerClientEvent('ply_garages:UpdateDone', playerSource)
  else
    TriggerClientEvent('ply_garages:StoreVehicleFalse', playerSource)
  end
end)

AddEventHandler('ply_garages:SetVehOut', function(vehicle, plate)
    MySQL.Sync.execute("UPDATE user_vehicle SET vehicle_state=@state WHERE identifier=@identifier AND vehicle_plate=@plate AND vehicle_model=@vehicle",
      {['@identifier'] = getPlayerID(source), ['@vehicle'] = vehicle, ['@state'] = state_out, ['@plate'] = plate})
end)

AddEventHandler('ply_garages:CheckForSelVeh', function(plate,model)
  local playerSource = source
  local model = model
        local prix = 2
  if vehiclePlate(plate) == plate then
    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
      local player = user.identifier
      MySQL.Async.fetchAll("SELECT * FROM user_vehicle ",{}, function (car)
        for _, vehicle in pairs(car) do
          if vehicle.identifier == player then
--            if vehicle.vehicle_state == "Sorti" then
              if vehicle.vehicle_model == model then
                prix = (vehicle.vehicle_price/2)
                LaLife.Player.Manager.AddPlayerMoney(user, prix)
                MySQL.Sync.execute("DELETE from user_vehicle WHERE identifier=@identifier AND vehicle_plate=@plate AND vehicle_model=@model",
                 {['@identifier'] = getPlayerID(playerSource), ['@plate'] = tostring(plate), ['@model'] = tostring(model)})
              end
--            end
          end
      end
      end)
    end)
    TriggerClientEvent('ply_garages:SelVehicleTrue', playerSource)
  else
    TriggerClientEvent('ply_garages:SelVehicleFalse', playerSource)
  end
end)


-- Base

AddEventHandler('ply_garages:CheckGarageForVeh', function()
    local playerSource = source
    local vehicles = {}
    local user = getPlayerID(playerSource)

    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = user}, function(data)
        for _, v in ipairs(data) do
            vehicles[tonumber(v.ID)] = { ["id"] = v.ID, ["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle_name, ["vehicle_state"] = v.vehicle_state}
        end
        TriggerClientEvent("ply_garages:getVehicles", playerSource, vehicles)
    end)
end)

AddEventHandler('onMySQLReady', function ()
  local state = "Rentré"
  MySQL.Async.execute("UPDATE user_vehicle SET vehicle_state=@state", {['@state'] = "Rentré"}, function(data)
  end)
end)


--[[AddEventHandler('playerSpawn', function()
    MySQL.Sync.execute("UPDATE users SET player_state=@player_state WHERE identifier=@identifier",{['@identifier'] = getPlayerID(source), ['@player_state'] = 1})
end)

AddEventHandler('playerDropped', function()
    MySQL.Sync.execute("UPDATE users SET player_state=@player_state WHERE identifier=@identifier",{['@identifier'] = getPlayerID(source), ['@player_state'] = 0})
end)]]
