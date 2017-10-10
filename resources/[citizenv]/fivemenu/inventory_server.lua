AddRegisteredUserEventHandler("inventory:getItems_s", function(playerSource, user)
    local items = {}
    local player = user.identifier
    MySQL.Async.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = @username", {
        ['@username'] = player
    }, function (result)
        for _, v in ipairs(result) do
            items[v.item_id] = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
        end
        TriggerClientEvent("inventory:getItems", playerSource, items)
    end)
end)

RegisterServerEvent("inventory:giveItem_s")
AddEventHandler("inventory:giveItem_s", function(netID, id, name, quantity, quantity_check)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if (user) then
            if quantity_check >= quantity then
                TriggerClientEvent("inventory:refresh", playerSource)
                TriggerClientEvent("player:looseItem", playerSource, id, quantity)
                TriggerClientEvent("inventory:giveItem_f", netID, id, quantity)
                TriggerClientEvent("itinerance:notif", playerSource, "Vous avez donné ~g~"..quantity.. " " ..name.. "~w~.")
                TriggerClientEvent("itinerance:notif", netID, "Vous avez reçu ~g~"..quantity.. " " ..name.. "~w~.")
            else
                TriggerClientEvent("itinerance:notif", playerSource, "~r~Une erreur s'est produite.")
            end
        end
    end)
end)

RegisterServerEvent("inventory:updateQuantity_s")
AddEventHandler("inventory:updateQuantity_s", function(qty, id, iprice, name)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        local rounded = tonumber(iprice)
        if(tonumber(rounded) <= tonumber(user.money)) then
            LaLife.Player.Manager.RemovePlayerMoney(user, rounded)
            MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username AND `item_id` = @id", {
                ['@username'] = player,
                ['@qty'] = tonumber(qty),
                ['@id'] = tonumber(id) }
            )
            TriggerClientEvent("citizenv:notify", playerSource, "CHAR_BANK_MAZE", 1, "Maze Bank", false, "Vous avez acheté : ~g~".. name)
            CancelEvent()
        else
            TriggerClientEvent('chatMessage', playerSource, "", {0, 0, 200}, "^1Pas assez d'argent!^0")
            CancelEvent()
        end
    end)
end)

RegisterServerEvent("inventory:updateQuantity_sf")
AddEventHandler("inventory:updateQuantity_sf", function(qty, id)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
        CancelEvent()
    end)
end)

RegisterServerEvent("inventory:checkMoney")
AddEventHandler("inventory:checkMoney", function(iprice)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local rounded = tonumber(iprice)
        if(tonumber(rounded) <= tonumber(user.money)) then
            TriggerClientEvent("inventory:MoneyOk", playerSource, true)
        else
            TriggerClientEvent("inventory:MoneyOk", playerSource, false)
            TriggerClientEvent('chatMessage', playerSource, "", {0, 0, 200}, "^1Pas assez d'argent!^0")
            CancelEvent()
        end
    end)
end)

RegisterServerEvent("inventory:checkMoneyDistrib")
AddEventHandler("inventory:checkMoneyDistrib", function(iprice)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local rounded = tonumber(iprice)
        if(tonumber(rounded) <= tonumber(user.money)) then
            TriggerClientEvent("inventory:MoneyOk", playerSource, true)
            LaLife.Player.Manager.RemovePlayerMoney(user, rounded)
        else
            TriggerClientEvent("inventory:MoneyOk", playerSource, false)
            TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
            CancelEvent()
        end
    end)
end)

RegisterServerEvent("inventory:sell_s")
AddEventHandler("inventory:sell_s", function(id, qty, iprice, name)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
        LaLife.Player.Manager.AddPlayerMoney(user, tonumber(iprice))
    end)
end)

RegisterServerEvent("inventory:sell_sf")
AddEventHandler("inventory:sell_sf", function(id, qty, iprice)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username AND `item_id` = @id", { ['@username'] = player, ['@qty'] = tonumber(qty), ['@id'] = tonumber(id) })
        --TriggerEvent('bank:addDcash', playerSource, iprice)
        LaLife.Player.Manager.AddPlayerDirtyMoney(user, tonumber(iprice))
    end)
end)

RegisterServerEvent("inventory:reset_s")
AddEventHandler("inventory:reset_s", function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.execute("UPDATE user_inventory SET `quantity` = @qty WHERE `user_id` = @username", { ['@username'] = player, ['@qty'] = 0 })
    end)
end)

RegisterServerEvent("inventory:addMoney")
AddEventHandler("inventory:addMoney", function(number, type)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if type == 1 then
            LaLife.Player.Manager.AddPlayerMoney(user, number)
        elseif type == 2 then
            LaLife.Player.Manager.AddPlayerDirtyMoney(user, number)
        elseif type == 3 then
            -- add event bank money
        end
    end)
end)

RegisterServerEvent("inventory:black")
AddEventHandler("inventory:black", function(netid)
    TriggerClientEvent("inventory:f_black",netid)
end)
