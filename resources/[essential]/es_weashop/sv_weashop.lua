local max_number_weapons = 6 --maximum number of weapons that the player can buy. Weapons given at spawn doesn't count.
local cost_ratio = 100 --Ratio for withdrawing the weapons. This is price/cost_ratio = cost.

RegisterServerEvent('CheckMoneyForWea')
AddEventHandler('CheckMoneyForWea', function(weapon,price)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function (result)
            if (user) then
                if (weapon ~= "WEAPON_FlareGun") and (weapon ~= "WEAPON_Crowbar") and (weapon ~= "WEAPON_Flashlight") and (weapon ~= "WEAPON_Machete") and (weapon ~= "WEAPON_KNUCKLE") and (weapon ~= "WEAPON_Hatchet") and (weapon ~= "WEAPON_Dagger") and (weapon ~= "WEAPON_Bat") and (weapon ~= "WEAPON_HAMMER") and (weapon ~= "WEAPON_Knife") then
                    if (tonumber(result[1].permisArme)) == 1 then
                        if (tonumber(user.money) >= tonumber(price)) then
                            local nb_weapon = 0
                            MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = player}, function (result)
                                if result then
                                    for k,v in ipairs(result) do
                                        nb_weapon = nb_weapon + 1
                                    end
                                end
                                if (tonumber(max_number_weapons) > tonumber(nb_weapon)) then
                                    -- Pay the shop (price)
                                    LaLife.Player.Manager.RemovePlayerMoney(user, price)
                                    MySQL.Async.execute("INSERT INTO user_weapons (identifier,weapon_model,withdraw_cost) VALUES (@username,@weapon,@cost)",
                                        {['@username'] = player, ['@weapon'] = weapon, ['@cost'] = (price)/cost_ratio})
                                    -- Trigger some client stuff
                                    TriggerClientEvent('FinishMoneyCheckForWea',playerSource)
                                    TriggerClientEvent("itinerance:notif", playerSource, "~g~Achat effectué !")
                                else
                                    TriggerClientEvent('ToManyWeapons', playerSource)
                                    TriggerClientEvent("itinerance:notif", playerSource, "~r~Tu as atteint le nombre maximum d'armes (" ..max_number_weapons.. " maximum) !")
                                end
                            end)
                        else
                            -- Inform the player that he needs more money
                            TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
                        end
                    else
                        TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas votre permis de port d'armes !")
                    end
                else
                    if (tonumber(user.money) >= tonumber(price)) then
                        local nb_weapon = 0
                        MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = player}, function (result)
                            if result then
                                for k,v in ipairs(result) do
                                    nb_weapon = nb_weapon + 1
                                end
                            end
                            if (tonumber(max_number_weapons) > tonumber(nb_weapon)) then
                                -- Pay the shop (price)
                                LaLife.Player.Manager.RemovePlayerMoney(user, price)
                                MySQL.Async.execute("INSERT INTO user_weapons (identifier,weapon_model,withdraw_cost) VALUES (@username,@weapon,@cost)",
                                    {['@username'] = player, ['@weapon'] = weapon, ['@cost'] = (price)/cost_ratio})
                                -- Trigger some client stuff
                                TriggerClientEvent('FinishMoneyCheckForWea',playerSource)
                                TriggerClientEvent("itinerance:notif", playerSource, "~g~Achat effectué !")
                            else
                                TriggerClientEvent('ToManyWeapons',playerSource)
                                TriggerClientEvent("itinerance:notif", playerSource, "~r~Tu as atteint le nombre maximum d'armes (" ..max_number_weapons.. " maximum) !")
                            end
                        end)
                    else
                        -- Inform the player that he needs more money
                        TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
                    end
                end
            else
                TriggerEvent("es:desyncMsg", 'CheckMoneyForWea')
            end
        end)
    end)
end)

RegisterServerEvent("weaponshop:playerSpawned")
AddEventHandler("weaponshop:playerSpawned", function(spawn)
    TriggerEvent('weaponshop:GiveWeaponsToPlayer', source)
end)

-- NOTE: Ajouter une fonction pour remove l arme à la mort du joueur in game et in db

RegisterServerEvent("weaponshop:GiveWeaponsToPlayer")
AddEventHandler("weaponshop:GiveWeaponsToPlayer", function(player)
    TriggerEvent('es:getPlayerFromId', player, function(user)
        if (user) then
            local playerID = user.identifier
            local delay = nil

            MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = playerID}, function (result)
                delay = 2000
                if(result)then
                    for k,v in ipairs(result) do
                        TriggerClientEvent("giveWeapon", player, v.weapon_model, delay)
                    end
                end
            end)
        else
            TriggerEvent("es:desyncMsg", "weaponshop:GiveWeaponsToPlayer")
        end
    end)
end)

RegisterServerEvent("weaponshop:GiveWeapons")
AddEventHandler("weaponshop:GiveWeapons", function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local playerID = user.identifier
            local delay = nil

            MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = playerID}, function (result)
                delay = 2000
                if(result)then
                    for k,v in ipairs(result) do
                        TriggerClientEvent("giveWeapon", playerSource, v.weapon_model, delay)
                    end
                end
            end)
        else
            TriggerEvent("es:desyncMsg", "weaponshop:GiveWeapons")
        end
    end)
end)

RegisterServerEvent('BuyWLicense')
AddEventHandler('BuyWLicense', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        local player = user.identifier
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function (result)
            if (tonumber(result[1].permisArme)) == 0 then
                if (tonumber(user.money)) >= 15000 then
                    LaLife.Player.Manager.RemovePlayerMoney(user, 15000)
                    MySQL.Async.execute("UPDATE users SET `permisArme`=@value WHERE identifier = @identifier", {['@value'] = (tonumber(1)), ['@identifier'] = player})
                    TriggerClientEvent("itinerance:notif", playerSource, "~g~Achat effectué !")
                else
                    TriggerClientEvent("itinerance:notif", playerSource, "~r~Vous n'avez pas assez d'argent !")
                end
            else
                TriggerClientEvent("itinerance:notif", playerSource, "~r~Tu as déjà le permis de port d'armes !")
            end
        end)
    end)
end)
