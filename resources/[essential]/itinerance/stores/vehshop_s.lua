RegisterServerEvent('CheckMoneyForVeh')
RegisterServerEvent('BuyForVeh')
RegisterServerEvent('vehshop:GetIdentifier')

AddEventHandler('CheckMoneyForVeh', function(name, vehicle, price)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local vehicle = vehicle
            local name = name
            local price = tonumber(price)

            MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE identifier = @username",{['@username'] = player}, function (result)
                if (result) then
                    count = 0
                    for _ in pairs(result) do
                        count = count + 1
                    end
                    if count == 10 then
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Garage plein!\n")
                    else
                        if (tonumber(user.money) >= tonumber(price)) then
                            LaLife.Player.Manager.RemovePlayerMoney(user, price)
                            TriggerClientEvent('FinishMoneyCheckForVeh', playerSource, name, vehicle, price)
                            TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
                        else
                            TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
                        end
                    end
                else
                    if (tonumber(user.money) >= tonumber(price)) then
                        LaLife.Player.Manager.RemovePlayerMoney(user, price)
                        TriggerClientEvent('FinishMoneyCheckForVeh', playerSource, name, vehicle, price)
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Bonne route!\n")
                    else
                        TriggerClientEvent("es_freeroam:notify", playerSource, "CHAR_SIMEON", 1, "Simeon", false, "Fonds insuffisants!\n")
                    end
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'CheckMoneyForVeh')
        end
    end)
end)

AddEventHandler('BuyForVeh', function(name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            local name = name
            local price = price
            local vehicle = vehicle

            TriggerEvent('LaLife:Player:Save', {
                identifier = user.identifier,
                vehicle = plate,
            })

            local state = "Sorti"
            local primarycolor = primarycolor
            local secondarycolor = secondarycolor
            local pearlescentcolor = pearlescentcolor
            local wheelcolor = wheelcolor
            MySQL.Async.execute("INSERT INTO user_vehicle (`identifier`, `vehicle_name`, `vehicle_model`, `vehicle_price`, `vehicle_plate`, `vehicle_state`, `vehicle_colorprimary`, `vehicle_colorsecondary`, `vehicle_pearlescentcolor`, `vehicle_wheelcolor`) VALUES (@username, @name, @vehicle, @price, @plate, @state, @primarycolor, @secondarycolor, @pearlescentcolor, @wheelcolor)",
                {['@username'] = player, ['@name'] = name, ['@vehicle'] = vehicle, ['@price'] = price, ['@plate'] = plate, ['@state'] = state, ['@primarycolor'] = primarycolor, ['@secondarycolor'] = secondarycolor, ['@pearlescentcolor'] = pearlescentcolor, ['@wheelcolor'] = wheelcolor})
        else
            TriggerEvent("es:desyncMsg", 'BuyForVeh')
        end
    end)
end)

AddEventHandler('vehshop:GetIdentifier', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local plate = string.upper("CTZN" .. string.sub(user.identifier, -4))

            TriggerClientEvent("vehshop:f_GetIdentifier", playerSource, plate)
        else
            TriggerEvent("es:desyncMsg", 'vehshop:GetIdentifier')
        end
    end)
end)
