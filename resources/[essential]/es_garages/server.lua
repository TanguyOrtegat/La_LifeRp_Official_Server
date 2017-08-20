--[[Register]]--

RegisterServerEvent('garages:CheckForSpawnVeh')
RegisterServerEvent('garages:CheckForVeh')
RegisterServerEvent('garages:SetVehOut')
RegisterServerEvent('garages:SetVehIn')
RegisterServerEvent('garages:PutVehInGarages')
RegisterServerEvent('garages:CheckGarageForVeh')
RegisterServerEvent('garages:CheckForSelVeh')
RegisterServerEvent('garages:SelVeh')



--[[Function]]--

function getPlayerID(source)
    local identifiers = GetPlayerIdentifiers(source)
    local player = getIdentifiant(identifiers)
    return player
end

function getIdentifiant(id)
    for _, v in ipairs(id) do
        return v
    end
end

function vehiclePlate(plate, playerSource)
    local plate = plate
    local user = getPlayerID(playerSource)
    return MySQL.Sync.fetchScalar("SELECT vehicle_plate FROM user_vehicle WHERE identifier=@identifier AND vehicle_plate=@plate",{['@identifier'] = user, ['@plate'] = plate})
end

function vehiclePrice(plate, playerSource)
    local plate = plate
    local user = getPlayerID(playerSource)
    return MySQL.Sync.fetchScalar("SELECT vehicle_price FROM user_vehicle WHERE identifier=@identifier AND vehicle_plate=@plate",{['@identifier'] = user, ['@plate'] = plate})
end



--[[Local/Global]]--

vehicles = {}



--[[Events]]--

AddEventHandler('es:playerLoaded', function(source, user)
    TriggerEvent("garages:CheckGarageForVehFirst", user)
end)


AddEventHandler('garages:CheckForSpawnVeh', function(veh_id)
    local playerSource = source
    local veh_id = veh_id
    local user = getPlayerID(playerSource)
    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @identifier AND id = @id",{['@identifier'] = user, ['@id'] = veh_id}, function(data)
        TriggerClientEvent('garages:SpawnVehicle', playerSource, data[1].vehicle_model, data[1].vehicle_plate, data[1].vehicle_state, data[1].vehicle_colorprimary, data[1].vehicle_colorsecondary, data[1].vehicle_pearlescentcolor, data[1].vehicle_wheelcolor)
    end)
end)

AddEventHandler('garages:CheckForVeh', function(plate)
    local playerSource = source
    local plate = plate
    local state = "Sorti"
    local user = getPlayerID(playerSource)
    local vehicle_plate = tostring(vehiclePlate(plate, playerSource))
    if vehicle_plate == plate then
        local state = "Rentré"
        MySQL.Sync.execute("UPDATE user_vehicle SET vehicle_state=@state WHERE identifier=@identifier AND vehicle_plate=@plate",{['@identifier'] = user, ['@state'] = state, ['@plate'] = plate})
        TriggerClientEvent('garages:StoreVehicleTrue', playerSource)
    else
        TriggerClientEvent('garages:StoreVehicleFalse', playerSource)
    end
end)

AddEventHandler('garages:SetVehOut', function(vehicle, plate, car)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local vehicle = vehicle
            local state = "Sorti"
            local plate = plate

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plate,
            })

            MySQL.Async.execute("UPDATE user_vehicle SET vehicle_state=@state WHERE identifier = @username AND vehicle_plate = @plate AND vehicle_model = @vehicle",
                {['@username'] = player, ['@vehicle'] = vehicle, ['@state'] = state, ['@plate'] = plate})
        else
            TriggerEvent("es:desyncMsg", 'garages:SetVehOut')
        end
    end)
end)

AddEventHandler('garages:SetVehIn', function(plate)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local plate = plate
            local state = "Rentré"
            MySQL.Async.execute("UPDATE user_vehicle SET vehicle_state=@state WHERE identifier = @username AND vehicle_plate = @plate",
                {['@username'] = player, ['@plate'] = plate, ['@state'] = state})
        else
            TriggerEvent("es:desyncMsg", 'garages:SetVehIn')
        end
    end)
end)

AddEventHandler('garages:PutVehInGarages', function(vehicle)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local state ="Rentré"

            MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = player}, function (result)
                local joueur

                if(result)then
                    for k,v in ipairs(result)do
                        joueur = v.identifier
                    end
                end

                if joueur ~= nil then
                    MySQL.Async.execute("UPDATE user_vehicle SET `vehicle_state`=@state WHERE identifier = @username",
                        {['@username'] = player, ['@state'] = state})
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'garages:PutVehInGarages')
        end
    end)
end)

AddEventHandler('garages:CheckGarageForVehFirst', function(user)
    local playerSource = source
    local vehicles = {}
    local player = user.identifier
    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = player}, function (result)
        if (result) then
            local i = 0
            for _, v in ipairs(result) do
                i = i + 1
                t = { ["id"] = v.ID, ["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle_name, ["vehicle_state"] = v.vehicle_state}
                table.insert(vehicles, tonumber(i), t)
            end
        end
        TriggerClientEvent('garages:getVehicles', playerSource, vehicles)
    end)
end)

AddEventHandler('garages:CheckGarageForVeh', function()
    local playerSource = source
    local vehicles = {}
    local user = getPlayerID(playerSource)

    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = user}, function(data)
        for _, v in ipairs(data) do
            vehicles[tonumber(v.ID)] = { ["id"] = v.ID, ["vehicle_model"] = v.vehicle_model, ["vehicle_name"] = v.vehicle_name, ["vehicle_state"] = v.vehicle_state}
        end
        TriggerClientEvent("garages:getVehicles", playerSource, vehicles)
    end)
end)

AddEventHandler('garages:CheckForSelVeh', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local state = "Sorti"
            local player = user.identifier
            MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username AND vehicle_state =@state",{['@username'] = player, ['@vehicle'] = vehicle, ['@state'] = state}, function (result)
                local vehicle
                local plate

                if(result)then
                    for k,v in ipairs(result)do
                        vehicle = v.vehicle_model
                        plate = v.vehicle_plate
                    end
                end
                TriggerClientEvent('garages:SelVehicle', playerSource, vehicle, plate)
            end)
        else
            TriggerEvent("es:desyncMsg", 'garages:CheckForSelVeh')
        end
    end)
end)


AddEventHandler('garages:SelVeh', function(plate, vehicle)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local plate = plate
            local vehicle = vehicle
            MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username AND vehicle_plate =@plate AND vehicle_model=@vehicle",{['@username'] = player, ['@vehicle'] = vehicle, ['@plate'] = plate}, function (result)
                if(result)then
                    for k,v in ipairs(result) do
                        LaLife.Player.Manager.AddPlayerMoney(user, v.vehicle_price / 2)
                    end
                end
                MySQL.Async.execute("DELETE from user_vehicle WHERE identifier = @username AND vehicle_plate = @plate AND vehicle_model=@vehicle",
                    {['@username'] = player, ['@plate'] = plate, ['@vehicle'] = vehicle})
                TriggerClientEvent("citizenv:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Véhicule vendu!\n")
            end)
        else
            TriggerEvent("es:desyncMsg", 'garages:SelVeh')
        end
    end)
end)
