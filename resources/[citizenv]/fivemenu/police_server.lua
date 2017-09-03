local civitems = {}

RegisterServerEvent('menupolice:getTargetN_s')

AddEventHandler('menupolice:getTargetN_s', function(netID)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if (user) then
            local name = user.nom
            local surname = user.prenom
            TriggerClientEvent("f_getTargetN", playerSource, {surname, name})
        else
            TriggerEvent("es:desyncMsg", 'menupolice:getTargetN_s')
        end
    end)
end)

RegisterServerEvent('menupolice:removepp_s')
AddEventHandler('menupolice:removepp_s', function(netID, amountp)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
  local tIdentifier = GetPlayerIdentifiers(netID)
  local identifier = tIdentifier[1]
  MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = tostring(identifier)}, function (result)
  pcheck = result[1].permis
  removep = pcheck-amountp
  if pcheck >= 0 then
    if pcheck >= amountp then
      MySQL.Sync.execute("UPDATE users SET permis=@value WHERE identifier = @identifier", {['@value'] = removep, ['@identifier'] = tostring(identifier)})
      TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
      TriggerClientEvent("itinerance:notif", netID, "~r~On vous a retiré ~r~" ..amountp.. " points sur votre permis.")
    else
      TriggerClientEvent("itinerance:notif", playerSource, "~r~Le nombre de points enlevé est supérieur au nombre de points de la personne !")
    end
  else
    TriggerClientEvent("itinerance:notif", playerSource, "~r~Cette personne n'a pas son permis !")
  end
  end)
  end)
end)

RegisterServerEvent('menupolice:removep_s')
AddEventHandler('menupolice:removep_s', function(netID)
local playerSource = source
  TriggerEvent('es:getPlayerFromId', netID, function(user)
  local tIdentifier = GetPlayerIdentifiers(netID)
  local identifier = tIdentifier[1]
  MySQL.Sync.execute("UPDATE users SET permis=@value WHERE identifier = @identifier", {['@value'] = 0, ['@identifier'] = tostring(identifier)})
    TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
  TriggerClientEvent("itinerance:notif", netID, "~r~Votre permis de conduire a été saisi.")
  end)
end)

RegisterServerEvent('menupolice:verifp_s')
AddEventHandler('menupolice:verifp_s', function(netID)
    local playerSource = source
    --print("dans verifp_s")
    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if user ~= nil then
            local player = user.identifier
              MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE user_id = @username",{['@username'] = player}, function(itemciv)
                for _, res in pairs(itemciv) do
                  --print(res.quantity)
                  civitems[tonumber(res.item_id)].valeur = res.quantity
                end
              end)
            MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @username",{['@username'] = player}, function(result)
              MySQL.Async.fetchAll("SELECT * FROM user_weapons WHERE identifier = @username",{['@username'] = player}, function(arme)
                if(arme[1]) then
                  TriggerClientEvent("menupolice:f_verifp", playerSource, tostring(user.prenom.. " " ..user.nom), tostring(user.telephone), tostring(user.job), tonumber(user.police), nil, tonumber(result[1].permis), tonumber(result[1].permisArme), tonumber(result[1].permisBateau), tonumber(result[1].permisPilote),"oui",civitems)
                else
                  TriggerClientEvent("menupolice:f_verifp", playerSource, tostring(user.prenom.. " " ..user.nom), tostring(user.telephone), tostring(user.job), tonumber(user.police), nil, tonumber(result[1].permis), tonumber(result[1].permisArme), tonumber(result[1].permisBateau), tonumber(result[1].permisPilote),"non",civitems)
                end
              end)
            end)
        end
    end)
end)

AddEventHandler('onMySQLReady', function ()
  MySQL.Async.fetchAll("SELECT * FROM items", {}, function (result)
    --if (result) then
--	print(result[1].name)
  --print(result[1].item_id)
    for _, res in pairs(result) do
      t = {["libelle"] = res.libelle, ["valeur"] = 0, ["item_id"] = res.id}
      table.insert(civitems, tonumber(res.id),t)
    end
  end)
end)

RegisterServerEvent('menupolice:seizecash_s')
AddEventHandler('menupolice:seizecash_s', function(netID)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if (user) then
            local curDCash = user.dirtymoney
            LaLife.Player.Manager.RemovePlayerDirtyMoney(user, curDCash)
            TriggerClientEvent("itinerance:notif", playerSource, "Vous avez saisi ".. tostring(curDCash))
        else
            TriggerEvent("es:desyncMsg", 'menupolice:seizecash_s')
        end
    end)
end)

RegisterServerEvent('menupolice:removeparme_s')
AddEventHandler('menupolice:removeparme_s', function(netID)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        local tIdentifier = GetPlayerIdentifiers(netID)
        local identifier = tIdentifier[1]
        MySQL.Sync.execute("UPDATE users SET permisArme=@value WHERE identifier = @identifier", {['@value'] = 0, ['@identifier'] = tostring(identifier)})
        TriggerClientEvent("itinerance:notif", playerSource, "~g~Action effectuée!")
        TriggerClientEvent("itinerance:notif", netID, "~r~Votre permis de port d'armes a été saisi.")
    end)
end)

RegisterServerEvent('menupolice:seizedrug_s')
AddEventHandler('menupolice:seizedrug_s', function(netID)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if (user) then
            local tIdentifier = GetPlayerIdentifiers(netID)
            local identifier = tIdentifier[1]
            MySQL.Async.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = @username", { ['@username'] = identifier }, function (result)
                if (result) then
                    for _, t in pairs(inv_array_illlegal) do
                        if result[t.id].quantity > 0 then
                            TriggerClientEvent("player:looseItem", netID, t.id, result[t.id].quantity)
                            TriggerClientEvent("itinerance:notif", netID, "Vous avez perdu ".. tostring(result[t.id].quantity) .." "..tostring(t.name))
                            TriggerClientEvent("itinerance:notif", playerSource, "Vous avez saisi ".. tostring(result[t.id].quantity) .." "..tostring(t.name))
                        end
                    end
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'menupolice:seizedrug_s')
        end
    end)
end)

RegisterServerEvent('menupolice:givecon_s')
AddEventHandler('menupolice:givecon_s', function(netID, amount)
    TriggerEvent('bank:remove', netID, amount)
    TriggerClientEvent("itinerance:notif", netID, "Vous avez reçu une contravention de ~r~".. amount.."$")
end)

RegisterServerEvent('menupolice:searchciv_s')
AddEventHandler('menupolice:searchciv_s', function(netID)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', netID, function(user)
        if (user) then
            local tIdentifier = GetPlayerIdentifiers(netID)
            local identifier = tIdentifier[1]
            MySQL.Async.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_id` = `items`.`id` WHERE user_id = @username", { ['@username'] = identifier }, function (result)
                local civitems = {}
                if (result) then
                    for _, v in ipairs(result) do
                        t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle }
                        table.insert(civitems, tonumber(v.item_id), t)
                    end

                    TriggerClientEvent("menupolice:f_searchciv", playerSource, civitems, #civitems)
                end
            end)
        else
            TriggerEvent("es:desyncMsg", 'menupolice:searchciv_s')
        end
    end)
end)

RegisterServerEvent('menupolice:searchveh_s')
AddEventHandler('menupolice:searchveh_s', function(plate)
    local playerSource = source

    MySQL.Async.fetchAll("SELECT * FROM user_vehicle WHERE vehicle_plate = @name", {['@name'] = tostring(plate)}, function (result)
        if (#result > 0) then
            MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @name", {['@name'] = tostring(result[1].identifier)}, function (result1)
                if (#result1  > 0) then
                    local vehitems = {plate=result[1].vehicle_plate, model=result[1].vehicle_model , name=tostring(result1[1].prenom.." "..result1[1].nom)}

                    TriggerClientEvent("menupolice:f_searchveh", playerSource, vehitems)
                end
            end)
        else
            TriggerClientEvent("menupolice:f_searchveh", playerSource,{name="Véhicule volé"})
        end
    end)
end)

RegisterServerEvent('menupolice:cuff_s')
AddEventHandler('menupolice:cuff_s', function(netID)
    print(netID)
    TriggerClientEvent("menupolice:f_cuff", tostring(netID))
    TriggerClientEvent("menupolice:wf_cuff", tostring(netID))
end)

RegisterServerEvent('menupolice:escortcuff_s')
AddEventHandler('menupolice:escortcuff_s', function(netID, pname)
    local pname = pname
    TriggerClientEvent("menupolice:wf_escortcuff", tostring(netID), source, pname, true)
end)

RegisterServerEvent('menupolice:uncuff_s')
AddEventHandler('menupolice:uncuff_s', function(netID)
    TriggerClientEvent("menupolice:f_uncuff", tostring(netID))
    TriggerClientEvent("menupolice:wf_uncuff", tostring(netID))
end)

RegisterServerEvent('menupolice:civtocar_s')
AddEventHandler('menupolice:civtocar_s', function(t, v, e)
    TriggerClientEvent('menupolice:wf_civtocar', tostring(t), v, e)
end)

RegisterServerEvent('menupolice:civuncar_s')
AddEventHandler('menupolice:civuncar_s', function(t)
    TriggerClientEvent('menupolice:f_civuncar', tostring(t))
end)

RegisterServerEvent('menupolice:seizeillegalweapons_s')
AddEventHandler('menupolice:seizeillegalweapons_s', function(target)
    TriggerClientEvent("menupolice:f_seizeillegalweapons", tostring(target))
end)

RegisterServerEvent('menupolice:seizeweapons_s')
AddEventHandler('menupolice:seizeweapons_s', function(target)
    TriggerClientEvent("menupolice:f_seizeweapons", tostring(target))
end)

local jail1 = false
local jail2 = false
local jail3 = false

local prisoner = {
    [1] = {source = 0},
    [2] = {source = 0},
    [3] = {source = 0}
}

RegisterServerEvent('menupolice:jail_s')
AddEventHandler('menupolice:jail_s', function(t)
    -- print(jail1)
    -- print(jail2)
    -- print(jail3)
    if jail1 == false then
        TriggerClientEvent('menupolice:wf_jail', t, 1)
        prisoner[1].source = t
        jail1 = true
    elseif jail2 == false then
        TriggerClientEvent('menupolice:wf_jail', t, 2)
        prisoner[2].source = t
        jail2 = true
    elseif jail3 == false then
        TriggerClientEvent('menupolice:wf_jail', t, 3)
        prisoner[3].source = t
        jail3 = true
    else
        TriggerClientEvent("itinerance:notif", source, "Toutes les cellules sont occupées")
    end
    -- print(prisoner[1].source)
    -- print(prisoner[2].source)
    -- print(prisoner[3].source)
end)

RegisterServerEvent('menupolice:unjail_s')
AddEventHandler('menupolice:unjail_s', function(t, v)
    -- print(prisoner[1].source)
    -- print(prisoner[2].source)
    -- print(prisoner[3].source)
    if v == 1 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[1].source, v)
        prisoner[1].source = 0
        jail1 = false
    elseif v == 2 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[2].source, v)
        prisoner[1].source = 0
        jail2 = false
    elseif v == 3 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[3].source, v)
        prisoner[1].source = 0
        jail3 = false
    end
end)

RegisterServerEvent('menupolice:civunjail_s')
AddEventHandler('menupolice:civunjail_s', function(t, v)
    -- print(prisoner[1].source)
    -- print(prisoner[2].source)
    -- print(prisoner[3].source)
    if v == 1 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[1].source, v)
        TriggerEvent("menupolice:uncuff_s", prisoner[1].source)
        prisoner[1].source = 0
        jail1 = false
    elseif v == 2 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[2].source, v)
        TriggerEvent("menupolice:uncuff_s", prisoner[2].source)
        prisoner[1].source = 0
        jail2 = false
    elseif v == 3 then
        TriggerClientEvent("menupolice:wf_unjail", prisoner[3].source, v)
        TriggerEvent("menupolice:uncuff_s", prisoner[3].source)
        prisoner[1].source = 0
        jail3 = false
    end
end)

function stringsplit(self, delimiter)
    local a = self:Split(delimiter)
    local t = {}

    for i = 0, #a - 1 do
        table.insert(t, a[i])
    end

    return t
end

RegisterServerEvent('menupolice:delweapon')
AddEventHandler('menupolice:delweapon', function()
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            MySQL.Async.execute("DELETE from user_weapons WHERE identifier = @username", {['@username'] = player})
        else
            TriggerEvent("es:desyncMsg", 'menupolice:delweapon')
        end
    end)
end)

RegisterServerEvent('menupolice:delillegalweapon')
AddEventHandler('menupolice:delillegalweapon', function(gun)
    local playerSource = source

    TriggerEvent('es:getPlayerFromId', playerSource, function(user)
        if (user) then
            local player = user.identifier
            MySQL.Async.execute("DELETE from user_weapons WHERE `identifier` = @username and `weapon_model` = @gun" , {
                ['@username'] = player,
                ['@gun'] = gun
            })
        else
            TriggerEvent("es:desyncMsg", 'menupolice:delillegalweapon')
        end
    end)
end)
