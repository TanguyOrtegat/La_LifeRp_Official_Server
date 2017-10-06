LaLife.Player.Manager = {}

---
-- Get player info for a given source
-- @param source
-- @param callback
--
LaLife.Player.Manager.GetPlayer = function(identifier, source, callback)
    MySQL.Async.fetchAll("SELECT u.*, c.x, c.y, c.z, o.skin FROM users u INNER JOIN coordinates c ON u.identifier = c.identifier INNER JOIN outfits o ON o.identifier = u.identifier WHERE u.identifier = @name", {['@name'] = identifier}, function (result)
        callback(LaLife.Player.New(
            source,
            result[1].permission_level,
            result[1].money,
            result[1].identifier,
            result[1].group,
            result[1].dirtymoney,
            result[1].job,
            result[1].police,
            result[1].nom,
            result[1].prenom,
            result[1].telephone,
            { x = result[1].x, y = result[1].y, z = result[1].z},
            result[1].skin,
            result[1].subjob
        ))
    end)
end

---
-- Set player money
-- @param player
-- @param newMoney
--
LaLife.Player.Manager.SetPlayerMoney = function(player, newMoney)
    local prevMoney = player.money
    player.money = newMoney

    if ((prevMoney - newMoney) < 0) then
        TriggerClientEvent("es:addedMoney", player.source, math.abs(prevMoney - newMoney))
    else
        TriggerClientEvent("es:removedMoney", player.source, math.abs(prevMoney - newMoney))
    end

    TriggerEvent('LaLife:Player:Save', {
        identifier = player.identifier,
        money = player.money,
    })
    TriggerClientEvent('es:activateMoney', player.source , player.money)

    MySQL.Async.execute("UPDATE users SET `money`=@value WHERE identifier = @identifier", {['@value'] = tonumber(newMoney), ['@identifier'] = tostring(player.identifier)})
end

LaLife.Player.Manager.AddPlayerMoney = function (player, addedMoney)
    LaLife.Player.Manager.SetPlayerMoney(player, player.money + addedMoney)
end

LaLife.Player.Manager.RemovePlayerMoney = function (player, removedMoney)
    LaLife.Player.Manager.SetPlayerMoney(player, player.money - removedMoney)
end

---
-- Set player dirty money
-- @param player
-- @param newMoney
--
LaLife.Player.Manager.SetPlayerDirtyMoney = function(player, newMoney)
    local prevMoney = player.dirtymoney
    player.dirtymoney = newMoney

    if ((prevMoney - newMoney) < 0) then
        TriggerClientEvent("banking:adddBalance", player.source, math.abs(prevMoney - newMoney))
    else
        TriggerClientEvent("banking:removedBalance", player.source, math.abs(prevMoney - newMoney))
    end

    TriggerEvent('LaLife:Player:Save', {
        identifier = player.identifier,
        dirtymoney = player.dirtymoney,
    })
    TriggerClientEvent('banking:updatedBalance', player.source , player.dirtymoney)

    MySQL.Async.execute("UPDATE users SET `dirtymoney`=@value WHERE identifier = @identifier", {['@value'] = tonumber(newMoney), ['@identifier'] = tostring(player.identifier)})
end

LaLife.Player.Manager.AddPlayerDirtyMoney = function (player, addedMoney)
    LaLife.Player.Manager.SetPlayerDirtyMoney(player, player.dirtymoney + addedMoney)
end

LaLife.Player.Manager.RemovePlayerDirtyMoney = function (player, removedMoney)
    LaLife.Player.Manager.SetPlayerDirtyMoney(player, player.dirtymoney - removedMoney)
end

LaLife.Player.Manager.SetPlayerJob = function (player, param,subjob)
    player.job = param
    player.subjob = subjob
	TriggerEvent('LaLife:Player:Save', {
        identifier = player.identifier,
        job = player.job,
        subjob = player.subjob,
    })
end
